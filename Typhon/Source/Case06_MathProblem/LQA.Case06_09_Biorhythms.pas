unit LQA.Case06_09_Biorhythms;

{**
  input:
    0 0 0 0
    0 0 0 100
    5 20 34 325
    4 5 6 7
    283 102 23 320
    203 301 203 40
    -1 -1 -1 -1

  Output:
    Case 1: the next triple peak occurs in 21252 days.
    Case 2: the next triple peak occurs in 21152 days.
    Case 3: the next triple peak occurs in 19575 days.
    Case 4: the next triple peak occurs in 16994 days.
    Case 5: the next triple peak occurs in 8910 days.
    Case 6: the next triple peak occurs in 10789 days.
**}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

procedure Main;

implementation

type
  TExtendedEuclideanAlgorithm = class
  public
    class var X, Y: integer;

    /// <summary> 最大公约数  </summary>
    class function Gcd(m, n: integer): integer;
    /// <summary> 最小公倍数 lowest common multiple (LCM) </summary>
    class function Lcm(m, n: integer): integer;
    // 扩展欧几里得
    // 调用完成后xy是ax+by:=gcd(a,b)的解
    class function Ext_Gcd(a, b: integer): integer;
    // 线性方程
    // ax+by=m 当m时gcd(a,b)倍数时有解
    // 等价于ax = m mod b
    class function LinearEquation(a, b, m: integer): integer;
    // **
    // *  x = a1(%m1)
    // *    = a2(%m2)
    // *    = a3(%m3)
    // *  x = a1+m1y1 (1)
    // *  x = a2+m2y2
    // *  ==>m1y1-m2y2=a2-a1这是一个线性方程,可解出y1  linearEquation(m1,-m2,a2-a1)
    // *  带回(1),得特解x0 = a1+m1*y1 --> x =x0 + k*lcm(m1,m2) 得一个新方程 x = x0 (mod lcm(m1,m2))
    // **
    class function LinearEquationGroup(a, m: TArr_int): integer;
    // **
    // * 求逆元
    // * ax = 1 (% mo),gcd(a,mo)=1
    // * ax+mo*y=1
    // **
    class function InverseElement(a, mo: integer): integer;
  end;

procedure Main;
var
  t, d, res, i: integer;
  aList: TList_TArr_int;
  dList: TList_int;
  a, m: TArr_int;
begin
  t := 1;
  aList := TList_TArr_int.Create;
  dList := TList_int.Create;

  while True do
  begin
    SetLength(a, 3);
    ReadLn(a[0], a[1], a[2], d);

    if (a[0] = -1) and (a[1] = -1) and (a[2] = -1) and (d = -1) then
      Break
    else
    begin
      aList.AddLast(a);
      dList.AddLast(d);
    end;
  end;

  for i := 0 to aList.Count - 1 do
  begin
    a := aList[i];
    d := dList[i];
    m := [23, 28, 33];

    res := TExtendedEuclideanAlgorithm.LinearEquationGroup(a, m);
    while (res <= d) do
    begin
      res += 21252;
    end;

    WriteLn('Case ', t, ': the next triple peak occurs in ', res - d, ' days.');
    Inc(t);
  end;
end;

{ TExtendedEuclideanAlgorithm }

class function TExtendedEuclideanAlgorithm.Ext_Gcd(a, b: integer): integer;
var
  ret, x1: integer;
begin
  if (b = 0) then
  begin
    X := 1;
    Y := 0;
    Exit(a);
  end;

  ret := Ext_Gcd(b, a mod b);

  // x,y已经被下一层递归更新了,ppt中所说的x0和y0
  x1 := X; // 备份x
  X := Y; // 更新x
  Y := x1 - a div b * Y; // 更新y
  Result := ret;
end;

class function TExtendedEuclideanAlgorithm.Gcd(m, n: integer): integer;
begin
  Result := IfThen(n = 0, m, Gcd(n, m mod n));
end;

class function TExtendedEuclideanAlgorithm.InverseElement(a, mo: integer): integer;
var
  d: integer;
begin
  d := LinearEquation(a, mo, 1); // ax+mo*y=1
  X := (X mod mo + mo) mod mo; // 保证x>0
  Result := d;
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
  X := X * n;
  Y := Y * n;
  Result := d;
end;

class function TExtendedEuclideanAlgorithm.LinearEquationGroup(a, m: TArr_int): integer;
var
  len, i, x0, a2_a1, d, _lcm: integer;
begin
  len := Length(a);

  if (len = 0) and (a[0] = 0) then
  begin
    Result := m[0];
    Exit;
  end;

  for i := 1 to len - 1 do
  begin
    // 这里往前看是两个方程
    a2_a1 := a[i] - a[i - 1];
    d := LinearEquation(m[i - 1], -m[i], a2_a1);

    // 现在的x是y1,用y1求得一个特解
    x0 := a[i - 1] + m[i - 1] * X;
    _lcm := m[i - 1] * m[i] div d;
    a[i] := (x0 mod _lcm + _lcm) mod _lcm; // x0变成正数
    m[i] := _lcm;
  end;

  //合并完之后,只有一个方程 : x = a[len-1] (% m[len-1])
  Result := a[len - 1] mod m[len - 1];
end;

end.