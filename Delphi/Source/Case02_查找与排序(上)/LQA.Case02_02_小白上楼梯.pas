unit LQA.Case02_02_小白上楼梯;

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Func(n: integer): integer;
begin
  if n = 0 then
    Exit(1);
  if n = 1 then
    Exit(1);
  if n = 2 then
    Exit(2);

  Result := Func(n - 1) + Func(n - 2) + Func(n - 3);
end;

procedure Main;
var
  n: integer;
begin
  while True do
  begin
    Write('输入阶梯数：');
    ReadLn(n);
    WriteLn('共有', Func(n), '种走法。');
    DrawLineBlockEnd;
  end;
end;

end.
