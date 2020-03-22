unit LQA.Case08_04_区间选点问题II;

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

interface

uses
  System.SysUtils,
  LQA.Utils;

type
  TIntervalChoicePointProblem_2 = class(TObject)
  private type
    __TInterval = class(TObject)
    private
      _S: integer;
      _T: integer;
      _C: integer;

    public
      constructor Create(s, t, c: integer);
      function Compare(const a, b: __TInterval): integer;

      property S: integer read _S write _S;
      property T: integer read _T write _T;
      property C: integer read _C write _C;
    end;

    TArrayUtils_TInterval = TArrayUtils<__TInterval>;

  var
    _intervals: array of __TInterval;
    _axis: TArr_int;

    // 前i项和，注意：i不是下标
    function __sum(i: integer; c: TArr_int; n: integer): integer;
    // 它通过公式来得出k，其中k就是该值从末尾开始1的位置。
    // 然后将其得出的结果加上x自身就可以得出当前节点的父亲节点的位置
    // 或者是x减去其结果就可以得出上一个父亲节点的位置。
    // 比如当前是6，二进制就是0110，k为2，那么6+2=8，C(8)则是C(6)的父亲节点的位置；
    // 相反，6-2=4，则是C(6)的上一个父亲节点的位置。
    function __lowbit(x: integer): integer;

    // 更新树状数组c，注意i是项数，不是下标，而是下标+1
    procedure __update(i, delta: integer; c: TArr_int; n: integer);

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

  with TIntervalChoicePointProblem_2.Create(n, arrs) do
  begin
    WriteLn(Solution);
  end;
end;

{ TIntervalChoicePointProblem_2 }

constructor TIntervalChoicePointProblem_2.Create(n: integer; arrs: TArr2D_int);
var
  i: integer;
begin
  SetLength(_intervals, n);
  for i := 0 to High(arrs) do
  begin
    _intervals[i] := __TInterval.Create(arrs[i, 0], arrs[i, 1], arrs[i, 2]);
  end;
end;

destructor TIntervalChoicePointProblem_2.Destroy;
var
  i: integer;
begin
  for i := 0 to High(_intervals) do
  begin
    _intervals[i].Free;
  end;
  inherited Destroy;
end;

function TIntervalChoicePointProblem_2.Solution: integer;
var
  max, n, i, s, t, cnt: integer;
  c: TArr_int;
begin
  TArrayUtils_TInterval.Sort(_intervals, __TInterval(nil).Compare); // 按区间右端点排序
  n := Length(_intervals);
  max := _intervals[n - 1].T; // 右端最大值
  SetLength(_axis, max + 1);
  SetLength(c, max + 2);

  for i := 0 to n - 1 do
  begin
    // 1.查阅区间中有多少个点
    s := _intervals[i].S; // 起点
    t := _intervals[i].T; // 终点
    cnt := __sum(t + 1, c, max + 1) - __sum(s, c, max + 1);
    // sum(axis,s,t);//sums[t] - sums[s - 1];//效率低

    // 2.如果不够，从区间右端开始标记，遇标记过的就跳过
    _intervals[i].C := _intervals[i].C - cnt;
    while _intervals[i].C > 0 do
    begin
      if _axis[t] = 0 then
      begin
        _axis[t] := 1;
        __update(t + 1, 1, c, max + 1);
        _intervals[i].C := _intervals[i].C - 1;
        t := t - 1;
      end
      else
      begin
        t := t - 1;
      end;
    end;
  end;

  Result := __sum(max + 2, c, max + 1);
end;

function TIntervalChoicePointProblem_2.__lowbit(x: integer): integer;
begin
  Result := x - (x and (x - 1));
end;

function TIntervalChoicePointProblem_2.__sum(i: integer; c: TArr_int; n: integer): integer;
var
  sum: integer;
begin
  sum := 0;
  if (i > n) then
    i := n;

  while i > 0 do
  begin
    sum := sum + c[i];
    i := i - __lowbit(i);
  end;

  Result := sum;
end;

procedure TIntervalChoicePointProblem_2.__update(i, delta: integer; c: TArr_int; n: integer);
begin
  while i <= n do
  begin
    c[i] := c[i] + delta;

    i := i + __lowbit(i);
  end;
end;

{ TIntervalChoicePointProblem_2.__TInterval }

constructor TIntervalChoicePointProblem_2.__TInterval.Create(s, t, c: integer);
begin
  _S := s;
  _C := c;
  _T := t;
end;

function TIntervalChoicePointProblem_2.__TInterval.Compare(const a, b: __TInterval): integer;
var
  x: integer;
begin
  x := a.T - b.T;

  if x = 0 then
    Exit(a.S - b.S);

  Result := x;
end;

end.
