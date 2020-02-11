﻿unit LQA.Utils;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  UChar = char;
  UString = string;

  TLAUtils = class
  public
    class procedure DrawLine;
  end;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

{ TLAUtils }

class procedure TLAUtils.DrawLine;
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