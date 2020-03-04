unit LQA.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Run;

implementation

uses
  LQA.Case06_01_BalanceWeighing, LQA.Utils, LQA.DSA.Math;

procedure Run;
var
  s: UString = '';
begin
  s := TMath.DecToAny(3, 3);
  WriteLn(s);
  Main;
end;

end.