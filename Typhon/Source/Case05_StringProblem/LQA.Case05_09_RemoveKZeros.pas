unit LQA.Case05_09_RemoveKZeros;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Regex,
  LQA.Utils;

procedure Main;

implementation

function RemoveKZeros(src: UString): UString;

begin
  Result := '';
end;

procedure Main;
var
  reg: TRegExpr;
begin
  reg := TRegExpr.Create;
  reg.Expression
end;

end.