unit LQA.Case04_05_子数组最大累加和;

{ **
  * 求和最大的连续子数组,有可能不唯一，返回一个即可
  * }

interface

uses
  LQA.Utils;

procedure Main;

implementation

// 暴力法破解 O(n²)
function FindByForce(const arr: TArr_int): integer;
var
  maxSum, sum, MaxOfJ, i, j: integer;
begin
  maxSum := arr[0];

  for i := 0 to Length(arr) - 1 do
  begin
    sum := arr[i]; // 某个元素为子数组的第一个元素
    MaxOfJ := sum;

    for j := i + 1 to Length(arr) - 1 do
    begin
      sum := sum + arr[j]; // 累加后续元素

      if sum > MaxOfJ then
        MaxOfJ := sum;
    end;

    if (MaxOfJ > maxSum) then
      maxSum := MaxOfJ;
  end;

  Result := maxSum;
end;

// 递推法 Θ(n)
function FindByDp(arr: TArr_int): integer;
var
  sumJ, max, j: integer;
begin
  sumJ := arr[0]; // 前J个元素的最大贡献
  max := sumJ;

  for j := 1 to High(arr) do
  begin
    if sumJ >= 0 then
    begin // 左子表的最大和为正，继续向后累加
      sumJ := sumJ + arr[j];
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

procedure Main;
var
  arr: TArr_int;
  sum: integer;
begin
  arr := [1, -2, 3, 5, -2, 6, -1];
  sum := FindByForce(arr);
  WriteLn(sum);
  DrawLineBlockEnd;

  sum := FindByDp(arr);
  WriteLn(sum);
end;

end.
