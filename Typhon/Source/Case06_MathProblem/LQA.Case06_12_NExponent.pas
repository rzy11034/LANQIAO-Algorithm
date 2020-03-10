unit LQA.Case06_12_NExponent;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

// 以最快速度求a的n次方 ===> O(lgn)
function NExponent(a, n: integer): integer;
var
  temp, res, exponent: integer;
begin
  if (n = 0) then
    Exit(1);
  if (n = 1) then
    Exit(a);

  temp := a; // a 的 1 次方
  res := 1;
  exponent := 1;
  while exponent shl 1 < n do
  begin
    temp := temp * temp;
    exponent := exponent shl 1;
  end;

  res := res * NExponent(a, n - exponent);

  Result := res * temp;
end;

// 巧算  m:=1010
function NExponentEX(a, n: integer): integer;
var
  tmp, ret: integer;
begin
  if a = 0 then
    Exit(1);

  tmp := a; //a 的 1 次方
  ret := 1;

  while n <> 0 do
  begin
    //遇1累乘现在的幂
    if n and 1 = 1 then
      ret := ret * tmp;

    //每移位一次，幂累乘方一次
    tmp := tmp * tmp;

    //右移一位
    n := n shr 1;
  end;

  Result := ret;
end;

procedure Main;
begin
  WriteLn(NExponent(2, 9));
  WriteLn(NExponentEX(2, 9));
end;

end.
