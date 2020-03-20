unit LQA.Case08_02_快速渡河;

(*
  A group of N people wishes to go across a river with only one boat,
  which can at most carry two persons.
  Therefore some sort of shuttle arrangement must be arranged in order to row
  the boat back and forth so that all people may cross.
  Each person has a different rowing speed; the speed of a couple is determined by the speed of the slower one.
  Your job is to determine a strategy that minimizes the time for these people to get across.

  Input

  The first line of the input contains a single integer T (1 <= T <= 20), the number of test cases.
  Then T cases follow.
  The first line of each case contains N,
  and the second line contains N integers giving the time for each people to cross the river.
  Each case is preceded by a blank line.
  There won't be more than 1000 people and nobody takes more than 100 seconds to cross.

  Output

  For each test case,
  print a line containing the total number of seconds required for all the N people to cross the river.

  Sample Input
  1
  4
  1 2 5 10
  Sample Output
  17
 *)

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TQuickCrossingRiver = class(TObject)
  public
    procedure Solution(n: integer; speed: TArr_int);
  end;

procedure Main;

implementation

procedure Main;
begin
  with TQuickCrossingRiver.Create do
  begin
    Solution(4, [1, 2, 5, 10]);
  end;
end;

{ TQuickCrossingRiver }

procedure TQuickCrossingRiver.Solution(n: integer; speed: TArr_int);
var
  left, ans, s1, s2: integer;
begin
  left := n;
  ans := 0;
  while (left > 0) do
  begin
    if (left = 1) then // 只有1人
    begin
      ans := ans + speed[0];
      Break;
    end
    else if (left = 2) then //只有两人
    begin
      ans := ans + speed[1];
      Break;
    end
    else if (left = 3) then //有三人
    begin
      ans := ans + speed[2] + speed[0] + speed[1];
      Break;
    end
    else
    begin
      //1，2出发，1返回，最后两名出发，2返回
      s1 := speed[1] + speed[0] + speed[left - 1] + speed[1];
      //1，3出发，1返回，1，4出发，1返回，1，2过河
      s2 := speed[left - 1] + speed[left - 2] + 2 * speed[0];
      ans := ans + Min(s1, s2);
      left := left - 2; //左侧是渡河的起点，left代表左侧的剩余人数
    end;
  end;

  WriteLn(ans);
end;

end.
