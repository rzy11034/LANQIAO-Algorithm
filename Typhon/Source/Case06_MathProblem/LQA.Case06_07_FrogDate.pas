unit LQA.Case06_07_FrogDate;

{ **
  两只青蛙在网上相识了，它们聊得很开心，于是觉得很有必要见一面。它们很高兴地发现它
  们住在同一条纬度线上，于是它们约定各自朝西跳，直到碰面为止。可是它们出发之前忘记
  了一件很重要的事情，既没有问清楚对方的特征，也没有约定见面的具体位置。不过青蛙们
  都是很乐观的，它们觉得只要一直朝着某个方向跳下去，总能碰到对方的。但是除非这两只
  青蛙在同一时间跳到同一点上，不然是永远都不可能碰面的。为了帮助这两只乐观的青蛙，
  你被要求写一个程序来判断这两只青蛙是否能够碰面，会在什么时候碰面。

  我们把这两只青蛙分别叫做青蛙A和青蛙B，并且规定纬度线上东经0度处为原点，由东往西
  为正方向，单位长度1米，这样我们就得到了一条首尾相接的数轴。设青蛙A的出发点坐标是x
  ，青蛙B的出发点坐标是y。青蛙A一次能跳m米，青蛙B一次能跳n米，两只青蛙跳一次所花费
  的时间相同。纬度线总长L米。现在要你求出它们跳了几次以后才会碰面
  。
  Input
    输入只包括一行5个整数x，y，m，n，L，
    其中x≠y < 2000000000，0 < m、n < 2000000000，0 < L < 2100000000。
  Output
    输出碰面所需要的跳跃次数，如果永远不可能碰面则输出一行"Impossible"
  Sample Input
    1 2 3 4 5
  Sample Output
    4
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
  x: integer; //坐标
  y: integer; //坐标
  m: integer; //A一次跳
  n: integer; //B一次跳
  l: integer; //维度总线
  a, b, d, x0: integer;
begin
  x := 1;
  y := 2;
  m := 3;
  n := 4;
  l := 5;

  a := m - n;
  b := l;
  m := y - x;

  try
    //x+m*k = y+n*k mod l
    //(m-n)*k = y-x mod l
    //(m-n)*xx + L*yy =  y-x

    d := TExtendedEuclideanAlgorithm.LinearEquation(a, b, m);//求解线性方程
    x0 := TExtendedEuclideanAlgorithm.X; // 可能小于0
    b := b div d; // 约一下
    b := Abs(b);

    //*============这里是AC的关键==============*/
    x0 := (x0 mod b + b) mod b;//要求大于0的第一个解
    WriteLn(x0);
  except
    WriteLn('Impossible');
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
