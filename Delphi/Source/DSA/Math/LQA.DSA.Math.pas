unit LQA.DSA.Math;

interface

uses
  System.SysUtils,
  System.Math,
  LQA.Utils;

type
  TMath = class
  private
    class function __charToNum(c: UChar): integer;
    class function __numToChar(n: integer): UChar;
  public
    class function AnyToDec(numStr: UString; inType: integer): integer;
    class function DecToAny(numStr: integer; OutType: integer): UString;
  end;

implementation

{ TMath }

class function TMath.AnyToDec(numStr: UString; inType: integer): integer;
var
  tmp, i: integer;
  stack: TStack_chr;
begin
  tmp := 0;

  stack := TStack_chr.Create;
  try
    for i := Low(numStr) to High(numStr) do
      stack.Push(numStr[i]);

    i := 0;
    while stack.Count > 0 do
    begin
      tmp := tmp + __charToNum(stack.Pop) * Trunc(IntPower(inType, i));
      Inc(i);
    end;

    Result := tmp;
  finally
    stack.Free;
  end;
end;

class function TMath.DecToAny(numStr: integer; OutType: integer): UString;
var
  tmp: integer;
  stack: TStack_chr;
  sb: TStringBuilder;
begin
  stack := TStack_chr.Create;
  sb := TStringBuilder.Create;
  try
    tmp := numStr;

    while tmp > 0 do
    begin
      stack.Push(__numToChar(tmp mod OutType));
      tmp := tmp div OutType;
    end;

    while stack.Count > 0 do
      sb.Append(stack.Pop);

    Result := sb.ToString;
  finally
    sb.Free;
    stack.Free;
  end;
end;

class function TMath.__charToNum(c: UChar): integer;
var
  ret: integer;
  tmp: char;
begin
  ret := -1;
  tmp := UpCase(c);

  if (tmp >= '0') and (tmp <= '9') then
    ret := Ord(tmp) - Ord('0')
  else if (tmp >= 'A') and (tmp <= 'Z') then
    ret := Ord(tmp) - Ord('A') + 10;

  Result := ret;
end;

class function TMath.__numToChar(n: integer): UChar;
var
  ret: char;
begin
  ret := #0;

  if (n >= 0) and (n <= 9) then
    ret := chr(n + Ord('0'))
  else if (n >= 10) and (n <= 35) then
    ret := chr(n + Ord('A') - 10);

  Result := ret;
end;

end.
