unit LQA.Case01_00_位运算;

interface

uses
  System.SysUtils;

procedure Main;

implementation

// 位移
procedure BitwiseShift;
begin
  WriteLn(1 shl 35);
  WriteLn(1 shl 3);
end;

// 判断奇偶数
function IsOdd(n: integer): boolean;
begin
  Result := True;

  if (n and 1) = 0 then
    Result := False;
end;

// 获取二进制数是 1 还是 0 （两种解决方案）
function IsOneOrZero(n: integer; bit: byte): integer;
var
  i: integer;
begin
  i := 1;
  i := n and (i shl (bit - 1));
  i := i shr (bit - 1);

  Result := i;
end;

// 交换两个整数变量的值
procedure SwapInt(var a, b: integer);
begin
  a := a xor b;
  b := a xor b;
  a := b xor a;
end;

// 不用判断语句，求数值的绝对值
function IntAbs(x: integer): integer;
var
  y: integer;
begin
  y := -(x shr 31);
  Result := (x xor y) - y;
end;

procedure Main;
var
  i, x: integer;
begin
  x := -12;
  i := x shr 31;
  WriteLn(i);
end;

end.
