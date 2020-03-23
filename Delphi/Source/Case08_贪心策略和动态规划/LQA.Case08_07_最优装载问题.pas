unit LQA.Case08_07_最优装载问题;

(* *
 * 给出n个物体，第i个物体重量为wi。选择尽量多的物体，使得总重量不超过C。
 *)

interface

uses
  System.SysUtils,
  LQA.Utils;

type
  TOptimalLoadingProblem = class(TObject)
  public
    function Solution(weight: integer; goods: TArr_int): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  weight: integer;
  goods: TArr_int;
begin
  weight := 15;
  goods := [5, 4, 3, 2, 1];

  with TOptimalLoadingProblem.Create do
  begin
    writeln(Solution(weight, goods));
  end;
end;

{ TOptimalLoadingProblem }

function TOptimalLoadingProblem.Solution(weight: integer; goods: TArr_int): integer;
var
  residueWeight, i, cnt: integer;
begin
  TArrayUtils_int.Sort(goods);
  residueWeight := weight;
  cnt := 0;

  for i := 0 to high(goods) do
  begin
    if goods[i] <= residueWeight then
    begin
      residueWeight := residueWeight - goods[i];
      cnt := cnt + 1;
    end
    else
      Break;
  end;

  Result := cnt;
end;

end.
