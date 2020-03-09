unit LQA.Case06_05_ExtendedEuclideanAlgorithm;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  TExtendedEuclideanAlgorithm = class
  public
    class var X, Y: integer;

    // 最大公约数
    class function Gcd(m, n: integer): integer;
    // 最小公倍数 lowest common multiple (LCM)
    class function Lcm(m, n: integer): integer;
    // 扩展欧几里得
    // 调用完成后xy是ax+by:=gcd(a,b)的解
    class function Ext_Gcd(a, b: integer): integer;
    // 线性方程
    // ax+by=m 当m时gcd(a,b)倍数时有解
    // 等价于ax = m mod b
    class function LinearEquation(a, b, m: integer): integer;
    {**
     *  x = a1(%m1)
     *    = a2(%m2)
     *    = a3(%m3)
     *  x = a1+m1y1 (1)
     *  x = a2+m2y2
     *  ==>m1y1-m2y2=a2-a1这是一个线性方程,可解出y1  linearEquation(m1,-m2,a2-a1)
     *  带回(1),得特解x0 = a1+m1*y1 --> x =x0 + k*lcm(m1,m2) 得一个新方程 x = x0 (mod lcm(m1,m2))
     * *}
    class function LinearEquationGroup(a, m: array of integer): integer
  end;

procedure Main;

implementation

procedure Main;
begin

end;

{ TExtendedEuclideanAlgorithm }

class function TExtendedEuclideanAlgorithm.Ext_Gcd(a, b: integer): integer;
var
  ret, x1: integer;
begin
  if (b = 0) then
  begin
    a := 1;
    b := 0;
    Exit(a);
  end;

  ret := ext_gcd(b, a mod b);

  // x,y已经被下一层递归更新了,ppt中所说的x0和y0
  x1 := x; // 备份x
  x := y; // 更新x
  y := x1 - a div b * y; // 更新y
  Result := ret;
end;

class function TExtendedEuclideanAlgorithm.Gcd(m, n: integer): integer;
var
  ret: integer;
begin
  if n = 0 then
    ret := m
  else
    ret := Gcd(n, m mod n);

  Result := ret;
end;

class function TExtendedEuclideanAlgorithm.Lcm(m, n: integer): integer;
begin
  Result := m * n div Gcd(m, n);
end;

class function TExtendedEuclideanAlgorithm.LinearEquation(a, b, m: integer): integer;
var
  d, n: integer;
begin
  d := Ext_Gcd(a, b);

  // m不是gcd(a,b)的倍数,这个方程无解
  if m mod d <> 0 then
    raise Exception.Create('无解');

  n := m div d; // 约一下,考虑m是d的倍数
  X *= n;
  Y *= n;
  Result := d;
end;

class function TExtendedEuclideanAlgorithm.LinearEquationGroup(a, m: array of integer): integer;
var
  len, i, x0, a2_a1, d, lcm: integer;
begin
  len := Length(a);

  if (len = 0) and (a[0] = 0) then
  begin
    Result := m[0];
    Exit;
  end;

  for i := 1 to len - 1 do
  begin
    //这里往前看是两个方程
    a2_a1 := a[i] - a[i - 1];
    d := linearEquation(m[i - 1], -m[i], a2_a1);

    //现在的x是y1,用y1求得一个特解
    x0 := a[i - 1] + m[i - 1] * x;
    lcm := m[i - 1] * m[i] div d;
    a[i] := (x0 mod lcm + lcm) mod lcm;//x0变成正数
    m[i] := lcm;
  end;

  //合并完之后,只有一个方程 : x = a[len-1] (% m[len-1])
  Result := a[len - 1] mod m[len - 1];
end;

end.