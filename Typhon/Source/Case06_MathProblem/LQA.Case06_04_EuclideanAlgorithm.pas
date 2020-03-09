unit LQA.Case06_04_EuclideanAlgorithm;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

// 最大公约数
function Gcd(m, n: integer): integer;
var
  ret: integer;
begin
  if n = 0 then
    ret := m
  else
    ret := Gcd(n, m mod n);

  Result := ret;
end;

// 最小公倍数 lowest common multiple (LCM)
function Lcm(m, n: integer): integer;
begin
  Result := m * n div Gcd(m, n);
end;

procedure Main;
begin
  WriteLn(Gcd(12, 24));
  WriteLn(Lcm(12, 24));
end;


end.