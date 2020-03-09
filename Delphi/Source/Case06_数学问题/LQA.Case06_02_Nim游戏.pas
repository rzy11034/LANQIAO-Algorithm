unit LQA.Case06_02_Nim游戏;

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Solution(arr: TArr_int): boolean;
var
  ret, i: integer;
begin
  ret := 0;

  for i := 0 to high(arr) do
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
