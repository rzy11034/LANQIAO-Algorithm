unit LQA.Case08_04_IntervalChoicePointProblem_1;

// 数轴上有n个闭区间[ai,bi]。取尽量少的点，使得每个区间内都至少有一个点（不同区间内含的点可以是同一个）。
(*
Intervals
You are given n closed, integer intervals [ai, bi] and n integers c1, ..., cn.
Write a program that:
reads the number of intervals, their end points and integers c1, ..., cn from the standard input,
computes the minimal size of a set Z of integers which has at least ci common elements with interval [ai, bi], for each i=1,2,...,n,
writes the answer to the standard output.

Input
The first line of the input contains an integer n (1 <= n <= 50000) -- the number of intervals.
The following n lines describe the intervals. The (i+1)-th line of the input contains three integers ai,
bi and ci separated by single spaces and such that 0 <= ai <= bi <= 50000 and 1 <= ci <= bi - ai+1.

Output
The output contains exactly one integer equal to the minimal size of set Z
sharing at least ci elements with interval [ai, bi], for each i=1,2,...,n.
Sample Input
5
3 7 3
8 10 3
6 8 1
1 3 1
10 11 1
Sample Output
6
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TIntervalChoicePointProblem_1 = class(TObject)
  private type
    TInterval = class(TObject)
    private
      _S: integer;
      _T: integer;
      _C: integer;

    public
      constructor Create(s, t, c: integer);
      function Compare(constref a, b: TInterval): integer;

      property S: integer read _S write _S;
      property T: integer read _T write _T;
      property C: integer read _C write _C;
    end;

    TArrayUtils_TInterval = specialize TArrayUtils<TInterval>;

  var
    _intervals: array of TInterval;
    _axis: TArr_int;

    // 统计数轴axis上s-t区间已经有多少个点被选中
    function __sum(s, t: integer): integer;

  public
    constructor Create(n: integer; arrs: TArr2D_int);
    destructor Destroy; override;

    function Solution: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  arrs: TArr2D_int;
  n: integer;
begin
  n := 5;
  arrs := [
    [3, 7, 3],
    [8, 10, 3],
    [6, 8, 1],
    [1, 3, 1],
    [10, 11, 1]];

  with TIntervalChoicePointProblem_1.Create(n, arrs) do
  begin
    WriteLn(Solution);
  end;
end;

{ TIntervalChoicePointProblem_1 }

constructor TIntervalChoicePointProblem_1.Create(n: integer; arrs: TArr2D_int);
var
  i: integer;
begin
  SetLength(_intervals, n);

  for i := 0 to High(arrs) do
  begin
    _intervals[i] := TInterval.Create(arrs[i, 0], arrs[i, 1], arrs[i, 2]);
  end;
end;

destructor TIntervalChoicePointProblem_1.Destroy;
var
  i: integer;
begin
  for i := 0 to High(_intervals) do
  begin
    _intervals[i].Free;
  end;
  inherited Destroy;
end;

function TIntervalChoicePointProblem_1.Solution: integer;
var
  s, t, cnt, max, i, n: integer;
begin
  TArrayUtils_TInterval.Sort(_intervals, @TInterval(nil).Compare); // 按区间右端点排序
  n := Length(_intervals);
  max := _intervals[n - 1].T; // 右端最大值
  SetLength(_axis, max + 1); // 标记数轴上的点是否已经被选中

  for i := 0 to n - 1 do
  begin
    //1.查阅区间中有多少个点
    s := _intervals[i].S; // 起点
    t := _intervals[i].T; // 终点
    cnt := __sum(s, t); // 找到这个区间已经选点的数量，sums[t] - sums[s - 1]; 效率低
    //  2.如果不够，从区间右端开始标记，遇标记过的就跳过
    _intervals[i].C := _intervals[i].C - cnt; // 需要新增的点的数量

    while (_intervals[i].C > 0) do
    begin
      if (_axis[t] = 0) then // 从区间终点开始选点
      begin
        _axis[t] := 1;
        _intervals[i].C := _intervals[i].C - 1;  // 进一步减少需要新增的点的数量
        t -= 1;
      end
      else
      begin  // 这个点已经被选过了
        t -= 1;
      end;
    end;

  end;

  Result := __sum(0, max);
end;

function TIntervalChoicePointProblem_1.__sum(s, t: integer): integer;
var
  i: integer;
begin
  Result := 0;

  for i := s to t do
  begin
    Result := Result + _axis[i];
  end;
end;

{ TIntervalChoicePointProblem_1.TInterval }

constructor TIntervalChoicePointProblem_1.TInterval.Create(s, t, c: integer);
begin
  _S := s;
  _C := c;
  _T := t;
end;

function TIntervalChoicePointProblem_1.TInterval.Compare(constref a, b: TInterval): integer;
var
  x: integer;
begin
  x := a.T - b.T;

  if x = 0 then
    Exit(a.S - b.S);

  Result := x;
end;

end.