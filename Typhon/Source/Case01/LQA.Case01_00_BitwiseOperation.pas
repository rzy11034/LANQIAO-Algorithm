unit LQA.Case01_00_BitwiseOperation;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

// 位移
procedure BitwiseShift;
var
  i: integer = 1;
begin
  WriteLn(i shl 35);
  WriteLn(i shl 3);
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

procedure Main;
var
  a, b: integer;
begin
  //BitwiseShift;
  //WriteLn(IsOdd(1));

  WriteLn(IsOneOrZero(99, 6));

  a := 1;
  b := 99;
  SwapInt(a, b);
  WriteLn;
end;

end.
