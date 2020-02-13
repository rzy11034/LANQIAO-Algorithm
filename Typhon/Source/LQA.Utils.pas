unit LQA.Utils;

{$mode objfpc}{$H+}
{$modeswitch typehelpers}

interface

uses
  Classes,
  SysUtils;

type
  UChar = UnicodeChar;
  UString = UnicodeString;

  TArr_int = array of integer;
  TArr2D_int = array of array of integer;

  generic TUtils<T> = class
  private type
    TArr_T = array of T;
  public
    class procedure DrawLine(c: UChar; times: integer = 70);
    class procedure Swap(var a, b: T);
    class procedure PrintArray(arr: TArr_T);
  end;

  TUtils_Obj = specialize TUtils<TObject>;
  TUtils_Int = specialize TUtils<integer>;

  TUnicodeStringHelper = type Helper for UnicodeString
  private
    function __getChar(index: integer): UnicodeChar;
    function __getLength: integer;
  public
    function ToUnicodeCharArray: TUnicodeCharArray;
    property Chars[index: integer]: UnicodeChar read __getChar;
    property Length: integer read __getLength;
  end;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

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

class procedure TUtils.DrawLine(c: UChar; times: integer = 70);
var
  i: integer;
begin
  for i := 0 to times do
  begin
    Write(c);
  end;
  Writeln;
end;

class procedure TUtils.PrintArray(arr: TArr_T);
var
  i: integer;
begin
  Write('[');
  for i := 0 to High(arr) do
  begin
    if i <> High(arr) then
      Write(arr[i].ToString, ', ')
    else
      Write(arr[i].ToString);
  end;
  Write(']');
end;

class procedure TUtils.Swap(var a, b: T);
var
  tmp: T;
begin
  tmp := a;
  a := b;
  b := tmp;
end;

end.