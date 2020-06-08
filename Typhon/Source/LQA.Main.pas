unit LQA.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  {%H-}LQA.Utils,
  DeepStar.DSA.Interfaces;

procedure Run;

implementation

uses
  DeepStar.DSA.Hash.Test.HashMap;

type
  TPtr = specialize TPtr_V<integer>;

procedure Run;
VAR
  i:integer;
  p: TPtr;
begin
  i := 98;
  p.PValue := @i;
  WriteLn(p.PValue^);
  Main;
end;

end.
