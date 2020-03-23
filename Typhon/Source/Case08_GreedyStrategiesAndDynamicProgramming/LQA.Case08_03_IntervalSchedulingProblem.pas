unit LQA.Case08_03_IntervalSchedulingProblem;

(*
有n项工作,每项工作分别在si时间开始,在ti时间结束.

对于每项工作,你都可以选择参与与否.如果选择了参与,那么自始至终都必须全程参与.

此外,参与工作的时间段不能重复(即使是开始的瞬间和结束的瞬间的重叠也是不允许的).

你的目标是参与尽可能多的工作,那么最多能参与多少项工作呢?

1≤n≤100000

1≤si≤ti≤10^9

输入:

第一行:n
第二行:n个整数空格隔开,代表n个工作的开始时间
第三行:n个整数空格隔开,代表n个工作的结束时间

样例输入:

5
1 3 1 6 8
3 5 2 9 10

样例输出:

3

说明:选取工作1,3,5
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TIntervalSchedulingProblem = class(TObject)
  private type
    TJob = class(TObject)
    public
      BeginTime: integer;
      EndTime: integer;

      constructor Create(newBeginTime, newEndTime: integer);
    end;

    TArrayUtils_TJob = specialize TArrayUtils<TJob>;

  var
    _jobs: array of TJob;

  public
    constructor Create(n: integer; BeginTimes, EndTimes: TArr_int);
    destructor Destroy; override;

    function Solution: integer;

    function ComparerJob(constref a, b: TJob): integer;
  end;

procedure Main;

implementation

procedure Main;
var
  s, t: TArr_int;
  n: integer;
begin
  s := [1, 3, 1, 6, 8];
  t := [3, 5, 2, 9, 10];
  n := 5;

  with TIntervalSchedulingProblem.Create(n, s, t) do
  begin
    WriteLn(Solution);
  end;
end;

{ TIntervalSchedulingProblem.TJob }

constructor TIntervalSchedulingProblem.TJob.Create(newBeginTime, newEndTime: integer);
begin
  BeginTime := newBeginTime;
  EndTime := newEndTime;
end;

{ TIntervalSchedulingProblem }

constructor TIntervalSchedulingProblem.Create(n: integer; BeginTimes,
  EndTimes: TArr_int);
var
  i: integer;
begin
  SetLength(_jobs, n);
  for i := 0 to n - 1 do
    _jobs[i] := TJob.Create(BeginTimes[i], EndTimes[i]);
end;

function TIntervalSchedulingProblem.ComparerJob(constref a, b: TJob): integer;
var
  res: integer;
begin
  res := a.EndTime - b.EndTime;

  if res = 0 then
    Exit(a.BeginTime - b.BeginTime);

  Result := res;
end;

destructor TIntervalSchedulingProblem.Destroy;
var
  i: integer;
begin
  for i := 0 to Length(_jobs) - 1 do
    _jobs[i].Free;

  _jobs := nil;

  inherited Destroy;
end;

function TIntervalSchedulingProblem.Solution: integer;
var
  i, cnt, y: integer;
begin
  TArrayUtils_TJob.Sort(_jobs, @ComparerJob);

  cnt := 1;
  y := _jobs[0].EndTime;

  for i := 1 to High(_jobs) do
  begin
    if _jobs[i].BeginTime > y then
    begin
      Inc(cnt);
      y := _jobs[i].EndTime;
    end;
  end;

  Result := cnt;
end;

end.