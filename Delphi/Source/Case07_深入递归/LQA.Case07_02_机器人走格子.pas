unit LQA.Case07_02_机器人走格子;

{ **
  有一个X*Y的网格，一个机器人只能走格点且只能向右或向下走，要从左上角走到右下角。
  请设计一个算法，计算机器人有多少种走法。
  给定两个正整数int x,int y，请返回机器人的走法数目。保证x＋y小于等于12。
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 递归形式
function Solution1(x, y: integer): integer;
begin
  if (x = 1) or (y = 1) then
    Exit(1);

  Result := Solution1(x - 1, y) + Solution1(x, y - 1);
end;

// 迭代形式
function Solution2(m, n: integer): integer;
var
  state: TArr2D_int;
  j, i: integer;
begin
  SetLength(state, m + 1, n + 1);

  for j := 1 to m do
    state[1, j] := 1;

  for i := 1 to n do
    state[i, 1] := 1;

  for i := 2 to m do
    for j := 2 to n do
      state[i, j] := state[i, j - 1] + state[i - 1, j];

  Result := state[m, n];
end;

procedure Main;
begin
  WriteLn(Solution1(11, 11));
  WriteLn(Solution2(11, 11));
end;

end.
