unit LQA.Case05_09_RemoveKZeros;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  uregexpr,
  LQA.Utils;

procedure Main;

implementation

function RemoveKZeros(src: UString; k: integer): UString;
var
  reg: TRegExpr;
begin
  reg := TRegExpr.Create('0{' + k.ToString + '}');
  Result := reg.Replace(src, '', false);
  reg.Free;
end;

procedure Main;
begin
  WriteLn(RemoveKZeros('a00000b', 3));
end;

end.
