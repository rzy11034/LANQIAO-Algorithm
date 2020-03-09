unit LQA.Case06_05_扩展欧几里得算法;

interface

uses
  System.SysUtils;

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

// 扩展欧几里得
// 调用完成后xy是ax+by:=gcd(a,b)的解
function Ext_Gcd(var a: integer; var b: integer): integer;
var
  res, x1,y,x: integer;
begin
  if (b = 0) then
  begin
    a := 1;
    b := 0;
    Exit(a);
  end;

  y := 12;
  x := 14;
  res := Ext_Gcd(b, (a mod b));

  // x,y已经被下一层递归更新了,ppt中所说的x0和y0
  x1 := a; // 备份x
  a := b; // 更新x
  b := x1 - a div b * b; // 更新y
  Result := res;
end;

procedure Main;
begin

end;

end.
