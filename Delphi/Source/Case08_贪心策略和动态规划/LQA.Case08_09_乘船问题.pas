unit LQA.Case08_09_乘船问题;

(* *
 有n个人，第i个人重量为wi。每艘船的最大载重量均为C，且最多只能乘两个人。用最少的船装载所有人。

 贪心策略：考虑最轻的人i，如果每个人都无法和他一起坐船（重量和超过C），则唯一的方案是每个人坐一艘
 否则，他应该选择能和他一起坐船的人中最重的一个j

 求需要船的数量
 *)

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure Main;
var
  w: TArr_int;
  n, c, cntPerson, cntBoat, l, r: integer;
begin
  w := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  n := Length(w);
  c := 10;

  TArrayUtils_int.Sort(w);

  cntPerson := n;
  cntBoat := 0;
  l := 0;
  r := n - 1;
  while cntPerson > 0 do
  begin
    if w[l] + w[r] > c then
    begin
      r := r - 1;
      cntPerson := cntPerson - 1;
      cntBoat := cntBoat + 1;
    end
    else
    begin
      l := l + 1;
      r := r - 1;
      cntPerson := cntPerson - 2;
      cntBoat := cntBoat + 1;
    end;
  end;

  writeln(cntBoat);
end;

end.
