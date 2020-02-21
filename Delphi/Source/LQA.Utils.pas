unit LQA.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti,
  System.Generics.Collections,
  System.Generics.Defaults;

type
  UChar = Char;
  UString = string;

  TArr_int = TArray<integer>;
  TArr2D_int = TArray<TArray<integer>>;
  TArr_str = TArray<UString>;

  TArrayUtils<T> = class
  private type
    TArr_T = array of T;
  public
    /// <summary> 快速排序 </summary>
    class procedure Sort(var arr: array of T); overload;
    class procedure Sort(var arr: array of T; const cmp: TComparison<T>); overload;
    /// <summary> 返回元素e的下标，元素不存在则返回 -1 </summary>
    class function IndexOf(const arr: array of T; e: T): integer;
    /// <summary>  输出一维数组 </summary>
    class procedure Print(arr: TArr_T);
  end;

  TArrayUtils_int = TArrayUtils<integer>;

  TUtils<T> = class
  public
    class procedure Swap(var a, b: T);
  end;

  TUtils_Obj = TUtils<TObject>;
  TUtils_Int = TUtils<integer>;

procedure DrawLineBlockEnd;
procedure DrawLineProgramEnd;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

procedure DrawLineBlockEnd;
var
  i: integer;
begin
  for i := 0 to 10 do
  begin
    write('-');
  end;
  Writeln;
end;

procedure DrawLineProgramEnd;
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    write('=');
  end;
  Writeln;
end;

{ TLAUtils }

class procedure TUtils<T>.Swap(var a, b: T);
var
  tmp: T;
begin
  tmp := a;
  a := b;
  b := tmp;
end;

{ TArrayHelper<T> }

class function TArrayUtils<T>.IndexOf(const arr: array of T; e: T): integer;
var
  cmp: IComparer<T>;
  i: integer;
begin
  Result := -1;
  cmp := TComparer<T>.Default;

  for i := 0 to Length(arr) - 1 do
  begin
    if cmp.Compare(arr[i], e) = 0 then
      Result := i;
  end;
end;

class procedure TArrayUtils<T>.Print(arr: TArr_T);
var
  i: integer;
begin
  if arr = nil then
  begin
    Writeln('Cannot print an empty array!');
    Exit;
  end;

  write('[');
  for i := 0 to high(arr) do
  begin
    if i <> high(arr) then
      write(TValue.From<T>(arr[i]).ToString, ', ')
    else
      write(TValue.From<T>(arr[i]).ToString);
  end;
  write(']'#10);
end;

class procedure TArrayUtils<T>.Sort(var arr: array of T; const cmp: TComparison<T>);
var
  tmpCmp: IComparer<T>;
begin
  tmpCmp := TComparer<T>.Construct(cmp);
  TArray.Sort<T>(arr, tmpCmp);
end;

class procedure TArrayUtils<T>.Sort(var arr: array of T);
begin
  TArray.Sort<T>(arr);
end;

end.
