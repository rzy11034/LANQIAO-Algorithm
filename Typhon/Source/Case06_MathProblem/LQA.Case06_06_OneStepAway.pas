unit LQA.Case06_06_OneStepAway;

{**
  * 从昏迷中醒来，小明发现自己被关在X星球的废矿车里。
  矿车停在平直的废弃的轨道上。
  他的面前是两个按钮，分别写着“F”和“B”。

  小明突然记起来，这两个按钮可以控制矿车在轨道上前进和后退。
  按F，会前进97米。按B会后退127米。
  透过昏暗的灯光，小明看到自己前方1米远正好有个监控探头。
  他必须设法使得矿车正好停在摄像头的下方，才有机会争取同伴的援助。
  或许，通过多次操作F和B可以办到。

  矿车上的动力已经不太足，黄色的警示灯在默默闪烁...
  每次进行 F 或 B 操作都会消耗一定的能量。
  小明飞快地计算，至少要多少次操作，才能把矿车准确地停在前方1米远的地方。

  请填写为了达成目标，最少需要操作的次数。

  97x-127y=1
  ax+by=m
 *}

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
begin
  with TExtendedEuclideanAlgorithm do
  begin
    try
      linearEquation(97, -127, 1);
      WriteLn(Abs(X) + Abs(Y));
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
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

  ret := ext_gcd(b, a mod b);

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
  X := (x mod mo + mo) mod mo; // 保证x>0
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
  X *= n;
  Y *= n;
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
    d := linearEquation(m[i - 1], -m[i], a2_a1);

    // 现在的x是y1,用y1求得一个特解
    x0 := a[i - 1] + m[i - 1] * x;
    _lcm := m[i - 1] * m[i] div d;
    a[i] := (x0 mod _lcm + _lcm) mod _lcm; // x0变成正数
    m[i] := _lcm;
  end;

  //合并完之后,只有一个方程 : x = a[len-1] (% m[len-1])
  Result := a[len - 1] mod m[len - 1];
end;

end.