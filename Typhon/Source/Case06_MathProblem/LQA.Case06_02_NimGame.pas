unit LQA.Case06_02_NimGame;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Solution(arr: TArr_int): boolean;
var
  ret, i: integer;
begin
  ret := 0;

  for i := 0 to High(arr) do
    ret := ret xor arr[i];

  Result := ret <> 0;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [3, 10, 15];
  WriteLn(Solution(arr));
end;

end.
