﻿unit LQA.Case06_04_EuclideanAlgorithm;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math;

procedure Main;

implementation

// 最大公约数
function Gcd(m, n: integer): integer;
begin
  Result := IfThen(n = 0, m, Gcd(n, m mod n));
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
