unit LQA.Utils;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  UChar = widechar;
  UString = UnicodeString;

  TArr_int = array of integer;
  TArr2D_int = array of array of integer;

  generic TUtils<T> = class
  public
    class procedure DrawLine(c: UChar; times: integer = 70);
    class procedure Swap(var a, b: T);
  end;

  TUtils_Obj = specialize TUtils<TObject>;
  TUtils_Int = specialize TUtils<integer>;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

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

class procedure TUtils.Swap(var a, b: T);
var
  tmp: T;
begin
  tmp := a;
  a := b;
  b := tmp;
end;

end.