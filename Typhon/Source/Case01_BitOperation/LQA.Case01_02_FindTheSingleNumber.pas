unit LQA.Case01_02_FindTheSingleNumber;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure FindTheSingleNumber;
var
  arr: TArr_int;
  x, i: integer;
begin
  arr := [1, 2, 3, 4, 5, 1, 2, 3, 4];
  x := 0;

  for i := 0 to High(arr) do
    x := x xor arr[i];

  writeln(x);
end;

procedure Main;
begin
  FindTheSingleNumber;
end;

end.
