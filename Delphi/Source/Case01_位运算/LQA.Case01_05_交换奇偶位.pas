unit LQA.Case01_05_交换奇偶位;

interface

procedure Main;

implementation

procedure SwapTheParityBits(n: integer);
var
  ou, ji, tmp: integer;
begin
  ou := n and $AAAAAAAA; // 和 1010 1010 1010 。。做与运算取出偶数位
  ji := n and $55555555; // 和 0101 0101 0101.。。做与运算取出奇数位
  tmp := (ou shr 1) xor (ji shl 1);
  WriteLn(tmp);
end;

procedure Main;
begin
  SwapTheParityBits(1073741824);
end;

end.
