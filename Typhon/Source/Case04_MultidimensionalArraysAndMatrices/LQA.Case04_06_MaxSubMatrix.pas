unit LQA.Case04_06_MaxSubMatrix;

{**
 * 假定只有一行，那就和求最大和子数组一样
 * 如果限定两行，可以把两行按列求和，同上
 * ……
 * 所有我们从把第一行当做起点，依次累加后面的每一行后，都求一个最大子数组和
 * 以第二行作为起点，依次累加后面的每一行后，都求一个最大子数组和
 *
 * 每次求出来的和与历史最大值比较，如果更大，则更新
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// O(N³) ----时间复杂度
function MaxSum(const matrix: TArr2D_int): integer;
  // 递推法 Θ(n)
  function __findByDp(arr: TArr_int): integer;
  var
    sumJ, max, j: integer;
  begin
    sumJ := arr[0];  // 前J个元素的最大贡献
    max := sumJ;

    for j := 1 to High(arr) do
    begin
      if sumJ >= 0 then
      begin  // 左子表的最大和为正，继续向后累加
        sumJ += arr[j];
      end
      else
      begin
        sumJ := arr[j];
      end;

      if sumJ > max then
      begin
        max := sumJ;
      end;
    end;

    Result := max;
  end;

var
  beginRow, r, c, t, max, i, j: integer;
  sums: TArr_int;
begin
  beginRow := 0; // 以它为起始行

  r := Length(matrix);
  c := Length(matrix[0]);

  SetLength(sums, c); // 按列求和

  max := 0; // 历史最大的子矩阵和

  while beginRow < r do // 起始行
  begin
    for i := beginRow to r - 1 do  // 从起始行到第i行
    begin
      //按列累加
      for j := 0 to c - 1 do
      begin
        sums[j] += matrix[i][j];
      end;
      //  累加完成
      //  求出sums的最大和子数组 O(n)
      t := __findByDp(sums);
      if t > max then
        max := t;
    end;

    //另起一行作为起始行.把sums清零
    for i := 0 to High(sums) do
      sums[i] := 0;

    beginRow += 1;
  end;

  Result := max;
end;

procedure Main;
var
  arr: TArr2D_int;
  ret: integer;
begin
  arr := [
    [-90, 48, 78],
    [64, -40, 64],
    [-81, -7, 66]];

  ret := MaxSum(arr);
  WriteLn(ret);
end;

end.