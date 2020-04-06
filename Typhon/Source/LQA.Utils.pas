unit LQA.Utils;

{$mode objfpc}{$H+}
{$modeswitch typehelpers}

interface

uses
  Classes,
  SysUtils,
  {%H-}Rtti,
  Generics.Collections,
  Generics.Defaults,
  DeepStar.DSA.Tree.HashSet;

type
  UChar = type UnicodeChar;
  UString = type UnicodeString;

  TArr_int = array of integer;
  TArr_int64 = array of int64;
  TArr2D_int = array of array of integer;
  TArr3D_int = array of array of array of integer;
  TArr_chr = array of UChar;
  TArr2D_chr = array of array of UChar;
  TArr_str = array of UString;
  TArr_bool = array of boolean;

  TStringBuilder = TUnicodeStringBuilder;

  generic TUtils<T> = class
  public
    class procedure Swap(var a, b: T); inline;
  end;

  TUtils_int = specialize TUtils<integer>;
  TUtils_str = specialize TUtils<UString>;
  TUtils_chr = specialize TUtils<UChar>;

  generic TArrayUtils<T> = class
  private type
    TArr_T = array of T;
    TArr2D_T = array of array of T;
    TArr3D_T = array of array of array of T;
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
    // 二分查找法
    class function BinarySearch(const arr: TArr_T; const e: T): integer;
    class function BinarySearch(const arr: TArr_T; const e: T; const cmp: TComparisonFunc_T): integer;
    class function BinarySearch(const arr: TArr_T; const e: T; const cmp: TOnComparison_T): integer;
    // 顺序查找，返回元素e的下标，元素不存在则返回 -1
    class function IndexOf(const arr: array of T; e: T): integer;
    // 输出一维数组
    class procedure Print(arr: TArr_T);
    // 输出二维数组
    class procedure Print2D(arr: TArr2D_T; formated: boolean = true);
    // 输出三维数组
    class procedure Print3D(arr: TArr3D_T);
    // 复制一维数组
    class function CopyArray(arr: TArr_T): TArr_T;
    // 复制二维数组
    class function CopyArray2D(arr2D: TArr2D_T): TArr2D_T;
    // 填充数组
    class procedure FillArray(var arr: TArr_T; e: T);
  end;

  TArrayUtils_int = specialize TArrayUtils<integer>;
  TArrayUtils_str = specialize TArrayUtils<UString>;
  TArrayUtils_chr = specialize TArrayUtils<UChar>;

  TUStringHelper = type Helper for UString
  private
    function __getChar(index: integer): UChar;
    function __getLength: integer;
  public
    class function Create(const chrArr: TArr_chr): UString; static;
    class function Create(const chrArr: TArr_chr; startIndex, len: integer): UString; static;

    function ToCharArray: TArr_chr;
    function Split(const Separators: TCharArray): TArr_str;
    function ReverseString: UString;
    function Substring(index: integer): UString;
    function Substring(index: integer; len: integer): UString;

    property Chars[index: integer]: UChar read __getChar;
    property Length: integer read __getLength;
  end;

type // 容器类
  TList_int = specialize TList<integer>;
  TList_str = specialize TList<UString>;
  TList_chr = specialize TList<UChar>;
  TList_TArr_int = specialize TList<TArr_int>;
  TStack_int = specialize TStack<integer>;
  TStack_chr = specialize TStack<UChar>;
  TMap_int_int = specialize THashMap<integer, integer>;
  TMap_str_int = specialize THashMap<UString, integer>;
  TSet_str = specialize THashSet<UString>;
  TSet_int = specialize THashSet<integer>;

procedure DrawLineBlockEnd;
procedure DrawLineProgramEnd;
procedure NeedInput;
function Chr(i: cardinal): UChar;

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

procedure NeedInput;
begin
  writeln('Need input data: ');
end;

function Chr(i: cardinal): UChar;
begin
  Result := UChar(i);
end;

{ TArrayUtils }

class function TArrayUtils.BinarySearch(const arr: TArr_T; const e: T): integer;
var
  ret: integer;
begin
  Result := -1;

  if TArrayHelper_T.BinarySearch(arr, e, ret) then
    Result := ret;
end;

class function TArrayUtils.BinarySearch(const arr: TArr_T; const e: T;
  const cmp: TComparisonFunc_T): integer;
var
  tmpCmp: ICmp_T;
  ret: integer;
begin
  Result := -1;
  tmpCmp := TCmp_T.Construct(cmp);

  if TArrayHelper_T.BinarySearch(arr, e, ret, tmpCmp) then
    Result := ret;
end;

class function TArrayUtils.BinarySearch(const arr: TArr_T; const e: T;
  const cmp: TOnComparison_T): integer;
var
  tmpCmp: ICmp_T;
  ret: integer;
begin
  Result := -1;
  tmpCmp := TCmp_T.Construct(cmp);

  if TArrayHelper_T.BinarySearch(arr, e, ret, tmpCmp) then
    Result := ret;
end;

class function TArrayUtils.CopyArray(arr: TArr_T): TArr_T;
begin
  Result := Copy(arr);
end;

class function TArrayUtils.CopyArray2D(arr2D: TArr2D_T): TArr2D_T;
var
  i: integer;
  res: TArr2D_T;
begin
  SetLength(res, Length(arr2D));

  for i := 0 to Length(arr2D) - 1 do
    res[i] := Copy(arr2D[i]);

  Result := res;
end;

class procedure TArrayUtils.FillArray(var arr: TArr_T; e: T);
var
  i: integer;
begin
  for i := 0 to High(arr) do
    arr[i] := e;
end;

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
  Value: TValue;
begin
  if arr = nil then
  begin
    WriteLn('[]');
    Exit;
  end;

  Write('[');
  for i := 0 to High(arr) do
  begin
    TValue.Make(@arr[i], TypeInfo(T), Value);
    Write(Value.ToString);

    if i <> High(arr) then
      Write(', ');
  end;
  Write(']'#10);
end;

class procedure TArrayUtils.Print2D(arr: TArr2D_T; formated: boolean);
var
  i, j: integer;
  Value: TValue;
  tmp: T;
begin
  if arr = nil then
  begin
    WriteLn('[]');
    Exit;
  end;

  case formated of
    true:
    begin
      for i := 0 to High(arr) do
      begin
        Write('[');
        for j := 0 to High(arr[i]) do
        begin
          tmp := arr[i, j];
          TValue.Make(@tmp, system.TypeInfo(T), Value);
          Write(Value.ToString);

          if j <> High(arr[i]) then
            Write(', '#9);
        end;
        Write(']'#10);
      end;
    end;

    false:
    begin
      for i := 0 to High(arr) do
      begin
        Write('[');
        for j := 0 to High(arr[i]) do
        begin
          tmp := arr[i, j];
          TValue.Make(@tmp, TypeInfo(T), Value);
          Write(Value.ToString);

          if j <> High(arr[i]) then
            Write(', ');
        end;
        Write(']'#10);
      end;
    end;
  end;
end;

class procedure TArrayUtils.Print3D(arr: TArr3D_T);
var
  i, j, k: integer;
  Value: TValue;
  tmp: T;
begin
  if arr = nil then
  begin
    WriteLn('[]');
    Exit;
  end;

  for i := 0 to High(arr) do
  begin
    Write('[');
    for j := 0 to High(arr[i]) do
    begin
      Write('(');
      for k := 0 to High(arr[i, j]) do
      begin
        tmp := arr[i, j, k];
        TValue.Make(@tmp, TypeInfo(T), Value);
        Write(Value.ToString);

        if k <> High(arr[i, j]) then
          Write(',');
      end;
      Write(')');

      if j <> High(arr[i]) then
        Write(', ');
    end;
    Write(']'#10);
  end;
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

{ TUStringHelper }

class function TUStringHelper.Create(const chrArr: TArr_chr): UString;
begin
  Result := Create(chrArr, 0, System.Length(chrArr));
end;

class function TUStringHelper.Create(const chrArr: TArr_chr;
  startIndex, len: integer): UString;
begin
  SetLength(Result, Len);
  Move(chrArr[StartIndex], PChar(PChar(Result))^, Len * SizeOf(UChar));
end;

function TUStringHelper.ReverseString: UString;
var
  i, j: integer;
begin
  setlength(Result, Self.Length);

  i := 1;
  j := Self.Length;
  while (i <= j) do
  begin
    Result[i] := Self[j - i + 1];
    Inc(i);
  end;
end;

function TUStringHelper.Split(const Separators: TCharArray): TArr_str;
var
  ret: TArr_str;
  tmp: TStringArray;
  i: integer;
begin
  tmp := string(Self).Split(Separators);
  SetLength(ret, System.Length(tmp));

  for i := 0 to High(tmp) do
  begin
    ret[i] := UString(tmp[i]);
  end;

  Result := ret;
end;

function TUStringHelper.Substring(index: integer): UString;
begin
  Result := System.Copy(Self, index + 1, Self.Length - index);
end;

function TUStringHelper.Substring(index: integer; len: integer): UString;
begin
  Result := System.Copy(Self, index + 1, len);
end;

function TUStringHelper.ToCharArray: TArr_chr;
var
  chrArr: TArr_chr;
  c: UChar;
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

function TUStringHelper.__getChar(index: integer): UChar;
begin
  Result := Self[index + 1];
end;

function TUStringHelper.__getLength: integer;
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