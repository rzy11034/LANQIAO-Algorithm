unit LQA.Case07_03_硬币表示_经典;

{ **
  * 假设我们有8种不同面值的硬币｛1，2，5，10，20，50，100，200｝，
  * 用这些硬币组合构成一个给定的数值n。
  * 例如n=200，那么一种可能的组合方式为 200 = 3 * 1 + 1＊2 + 1＊5 + 2＊20 + 1 * 50 + 1 * 100.
  * 问总共有多少种可能的组合方式？ (这道题目来自著名编程网站ProjectEuler) 类似的题目还有：

  [华为面试题] 1分2分5分的硬币三种，组合成1角，共有多少种组合
  1*x + 2*y + 5*z=10
  [创新工厂笔试题] 有1分，2分，5分，10分四种硬币，每种硬币数量无限，给定n分钱，有多少组合可以组成n分钱

  1 5 10 25 分 n,多少种组合方法.
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

const
  COINS: array [0 .. 3] of integer = (1, 5, 10, 25);

  // 递推解法
function CountWays1(n: integer): integer;
var
  dp: TArr2D_int;
  i, j, k: integer;
begin
  SetLength(dp, 4, n + 1); // 前i种面值,组合出面值j

  for i := 0 to 3 do
    dp[i][0] := 1; // 凑出面值0,只有一种可能,第一列初始化为1

  for j := 0 to n do
    dp[0][j] := 1; // 用1来凑任何面值都只有一种凑法,第一行初始化为1

  for i := 1 to 3 do
  begin
    for j := 1 to n do
    begin
      k := 0;
      while k <= j / COINS[i] do
      begin
        dp[i][j] := dp[i][j] + dp[i - 1][j - k * COINS[i]];
        Inc(k);
      end;
    end;
  end;

  Result := dp[3][n];
end;

// 递推解法
function CountWays2(n: integer): integer;
var
  dp: TArr_int;
  i, j: integer;
begin
  SetLength(dp, n + 1);

  dp[0] := 1;
  for i := 0 to 3 do
  begin
    for j := COINS[i] to n do
    begin
      dp[j] := (dp[j] + dp[j - COINS[i]]) mod 1000000007;
    end;
  end;

  Result := dp[n];
end;

// 递归形式
function CountWays3(n: integer): integer;
  function __countWay3(n, cur: integer): integer;
  var
    ret, i, tmp: integer;
  begin
    if cur = 0 then
      Exit(1);

    ret := 0;

    // 不选 coins[cur]
    // 要一个
    // 要两个 ......
    i := 0;
    while i * COINS[cur] <= n do
    begin
      tmp := n - i * COINS[cur];
      ret := ret + __countWay3(tmp, cur - 1);

      Inc(i);
    end;

    Result := ret;
  end;

begin
  if n <= 0 then
    Exit(0);

  Result := __countWay3(n, 3);
end;

procedure Main;
var
  n: integer;
begin
  n := 1000;

  writeln('CountWays1: ', CountWays1(n));
  writeln('CountWays2: ', CountWays2(n));
  writeln('CountWays3: ', CountWays3(n));
end;

end.
