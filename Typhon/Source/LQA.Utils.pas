unit LQA.Utils;

{$mode objfpc}{$H+}
{$modeswitch typehelpers}

interface

uses
  Classes,
  SysUtils,
  Generics.Collections,
  Generics.Defaults;

type
  UChar = UnicodeChar;
  UString = UnicodeString;

  TArr_int = array of integer;
  TArr2D_int = array of array of integer;
  TArr_str = array of UString;

  generic TUtils<T> = class
  public
    class procedure Swap(var a, b: T);
  end;

  TUtils_Obj = specialize TUtils<TObject>;
  TUtils_Int = specialize TUtils<integer>;

  generic TArrayUtils<T> = class
  private type
    TArr_T = array of T;
    TArrayHelper_T = specialize TArrayHelper<T>;
    ICmp_T = specialize IComparer<T>;
    TCmp_T = specialize TComparer<T>;
    TOnComparison_T = specialize TOnComparison<T>;
    TComparisonFunc_T = specialize TComparisonFunc<T>;

  public
    // 快速排序
    class procedure Sort(var arr: array of T);
    class procedure Sort(var arr: array of T; const cmp: TComparisonFunc_T);
    class procedure Sort(var arr: array of T; const cmp: TOnComparison_T);
    // 返回元素e的下标，元素不存在则返回 -1
    class function IndexOf(const arr: array of T; e: T): integer;
    // 输出一维数组
    class procedure Print(arr: TArr_T);
  end;

  TArrayUtils_int = specialize TArrayUtils<integer>;

  TUnicodeStringHelper = type Helper for UnicodeString
  private
    function __getChar(index: integer): UnicodeChar;
    function __getLength: integer;
  public
    function ToUnicodeCharArray: TUnicodeCharArray;
    property Chars[index: integer]: UnicodeChar read __getChar;
    property Length: integer read __getLength;
  end;

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
    Write('-');
  end;
  Writeln;
end;

procedure DrawLineProgramEnd;
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    Write('=');
  end;
  Writeln;
end;

{ TArrayUtils }

class function TArrayUtils.IndexOf(const arr: array of T; e: T): integer;
var
  i: integer;
begin
  Result := -1;

  for i := 0 to High(arr) do
  begin
    if arr[i] = e then
      Result := i;
  end;
end;

class procedure TArrayUtils.Print(arr: TArr_T);
var
  i: integer;
begin
  if arr = nil then
  begin
    WriteLn('Cannot print an empty array!');
    Exit;
  end;

  Write('[');
  for i := 0 to High(arr) do
  begin
    if i <> High(arr) then
      Write(arr[i].ToString, ', ')
    else
      Write(arr[i].ToString);
  end;
  Write(']'#10);
end;

class procedure TArrayUtils.Sort(var arr: array of T);
begin
  TArrayHelper_T.Sort(arr);
end;

class procedure TArrayUtils.Sort(var arr: array of T; const cmp: TComparisonFunc_T);
var
  tmpCmp: ICmp_T;
begin
  tmpCmp := TCmp_T.Construct(cmp);
  TArrayHelper_T.Sort(arr, tmpCmp);
end;

class procedure TArrayUtils.Sort(var arr: array of T; const cmp: TOnComparison_T);
var
  tmpCmp: ICmp_T;
begin
  tmpCmp := TCmp_T.Construct(cmp);
  TArrayHelper_T.Sort(arr, tmpCmp);
end;

{ TUnicodeStringHelper }

function TUnicodeStringHelper.ToUnicodeCharArray: TUnicodeCharArray;
var
  chrArr: TUnicodeCharArray;
  c: UnicodeChar;
  i: integer;
begin
  SetLength(chrArr, Self.Length);

  i := 0;
  for c in Self do
  begin
    chrArr[i] := c;
    i += 1;
  end;

  Result := chrArr;
end;

function TUnicodeStringHelper.__getChar(index: integer): UnicodeChar;
begin
  Result := Self[index + 1];
end;

function TUnicodeStringHelper.__getLength: integer;
begin
  Result := System.Length(Self);
end;

{ TLAUtils }

class procedure TUtils.Swap(var a, b: T);
var
  tmp: T;
begin
  tmp := a;
  a := b;
  b := tmp;
end;

end.