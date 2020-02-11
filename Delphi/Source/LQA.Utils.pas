unit LQA.Utils;

interface

uses
  System.SysUtils,
  System.Classes;

type
  UChar = Char;
  UString = string;

  TUtils = class
  public
    class procedure DrawLine;
    class procedure Swap(var a, b: integer);
  end;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

{ TLAUtils }

class procedure TUtils.DrawLine;
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    Write('-');
  end;
  Writeln;
end;

end.
