unit LQA.Case08_05_区间覆盖问题;

(* *
 Farmer John is assigning some of his N (1 <= N <= 25,000) cows to do some cleaning chores around the barn.

 He always wants to have one cow working on cleaning things up and has divided the day into T shifts (1 <= T <= 1,000,000),

 the first being shift 1 and the last being shift T.

 Each cow is only available at some interval of times during the day for work on cleaning.

 Any cow that is selected for cleaning duty will work for the entirety of her interval.

 Your job is to help Farmer John assign some cows to shifts so that (i) every shift has at least one cow assigned to it,

 and (ii) as few cows as possible are involved in cleaning. If it is not possible to assign a cow to each shift, print -1.

 Input
 Line 1: Two space-separated integers: N and T

 Lines 2..N+1: Each line contains the start and end times of the interval during which a cow can work.

 A cow starts work at the start time and finishes after the end time.

 Output

 Line 1: The minimum number of cows Farmer John needs to hire or -1 if it is not possible to assign a cow to each shift.

 Sample Input
 3 10
 1 7
 3 6
 6 10

 Sample Output
 2

*)

interface

uses
  System.SysUtils,
  Math,
  LQA.Utils;

type
  TIntervalCoverageProblem = class(TObject)
  private type
    __TJob = class(TObject)
    private
      _S: integer;
      _T: integer;

    public
      constructor Create(s, t: integer);
      function Compare(const a, b: __TJob): integer;

      property S: integer read _S write _S;
      property T: integer read _T write _T;
    end;

    TArrayUtils_TJob =  TArrayUtils<__TJob>;

  var
    _jobs: array of __TJob;

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
  n := 4;
  arrs := [
    [3, 10],
    [1, 7],
    [3, 6],
    [6, 10]];

  with TIntervalCoverageProblem.Create(n, arrs) do
  begin
    WriteLn(Solution);
  end;
end;

{ TIntervalCoverageProblem }

constructor TIntervalCoverageProblem.Create(n: integer; arrs: TArr2D_int);
var
  i: integer;
begin
  SetLength(_jobs, n);
  for i := 0 to n - 1 do
    _jobs[i] := __TJob.Create(arrs[i, 0], arrs[i, 1]);
end;

destructor TIntervalCoverageProblem.Destroy;
var
  i: integer;
begin
  for i := 0 to High(_jobs) do
    _jobs[i].Free;

  inherited Destroy;
end;

function TIntervalCoverageProblem.Solution: integer;
var
  n, _T, start, ends, ans, s, t, i, res: integer;
begin
  TArrayUtils_TJob.Sort(_jobs, __TJob(nil).Compare);
  n := Length(_jobs);
  _T := _jobs[High(_jobs)].T;

  start := 1; //要覆盖的目标点，end覆盖该点的所有区间中右端点最右
  ends := 1;
  ans := 1;

  for i := 0 to n do
  begin

    s := _jobs[i].S;
    t := _jobs[i].T;

    if (i = 0) and (s > 1) then
      Break;

    if s <= start then //当前区间有可能覆盖start
    begin
      ends := max(t, ends); // 更新更右的端点
    end
    else // 开始下一个区间
    begin
      ans := ans+ 1; // 上一个目标覆盖已经达成，计数加1
      start := ends + 1; // 更新起点，设置一个新的覆盖目标
      if s <= start then
      begin
        ends := max(t, ends);
      end
      else
      begin
        Break;
      end;
    end;

    if ends >= _T then // 当前的end超越了线段的右侧
    begin
      Break;
    end;

  end;

  if ends < _T then
    res := -1
  else
    res := ans;

  Result := res;
end;

{ TIntervalCoverageProblem.__TJob }

constructor TIntervalCoverageProblem.__TJob.Create(s, t: integer);
begin
  Self.S := s;
  Self.T := t;
end;

function TIntervalCoverageProblem.__TJob.Compare(const a, b: __TJob): integer;
begin
  Result := a.S - b.S;

  if Result = 0 then
    Result := a.T - b.T;
end;

end.
