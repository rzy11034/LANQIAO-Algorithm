unit LQA.Case02_06_高效的求a的n次幂的算法;

interface

procedure Main;

implementation

function Pow_Iteration(a: integer; n: integer): integer;
var
  ret, i: integer;
begin
  ret := 1;

  for i := 0 to n - 1 do
    ret := ret * a;

  Result := ret;
end;

function Pow_Recursion(a: integer; n: integer): integer;
var
  ret, ex: integer;
begin
  if n = 0 then
    Exit(1);

  ret := a;
  ex := 1;

  //能翻
  while (ex shl 1) <= n do
  begin
    //翻
    ret := ret * ret;
    //指数
    ex := ex shl 1;
  end;

  //不能翻
  //差 n-ex 次方没有去乘到结果里面
  Result := ret * Pow_Recursion(a, n - ex);
end;

procedure Main;
var
  a, n: integer;
begin
  a := 30;
  n := 5;

  WriteLn(Pow_Iteration(a, n));
  WriteLn(Pow_Recursion(a, n));
end;

end.
