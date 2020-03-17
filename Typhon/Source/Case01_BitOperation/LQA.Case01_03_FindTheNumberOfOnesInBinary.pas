unit LQA.Case01_03_FindTheNumberOfOnesInBinary;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

uses
  LQA.Utils;

procedure FindTheNumberOfOnesInBinary;
var
  n, x, i, Count: integer;
begin
  n := 123456789;

  // 1
  Count := 0;
  for i := 0 to 31 do
  begin
    x := ((1 shl i) and n) shr i;

    if x = 1 then
      Inc(Count);
  end;
  WriteLn(Count);
  DrawLineBlockEnd;

  // 2
  Count := 0;
  for i := 0 to 31 do
  begin
    if ((1 shl i) and n) = (1 shl i) then
      Inc(Count);
  end;
  WriteLn(Count);
  DrawLineBlockEnd;

  // 3
  Count := 0;
  while n <> 0 do
  begin
    n := (n - 1) and n;
    Inc(Count);
  end;
  WriteLn(Count);
end;

procedure Main;
begin
  FindTheNumberOfOnesInBinary;
end;

end.
