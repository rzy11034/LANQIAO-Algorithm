unit LQA.Case07_11_素数环;

(**
 * 输入正整数n，对1-n进行排列，使得相邻两个数之和均为素数，
 * 输出时从整数1开始，逆时针排列。同一个环应恰好输出一次。
 * n<=16
 *
 * 如输入：6
 * 输出：
 * 1 4 3 2 5 6
 * 1 6 5 2 3 4
 *)

interface

uses
System.  SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  TPrimeRing = class(TObject)
  private
    _rec: TArr_int;
    _max: integer;

    function __isPrime(n: integer): boolean;
    function __check(k, cur: integer): boolean;
  public
    constructor Create(n: integer);
    destructor Destroy; override;

    procedure Solution;
  end;

procedure Main;
var
  i: integer;
begin
  for i := 1 to 9 do
    with TPrimeRing.Create(i) do
    begin
      WriteLn('n: ', i);
      Solution;
      DrawLineBlockEnd;
    end;
end;

{ TPrimeRing }

constructor TPrimeRing.Create(n: integer);
begin
  _max := n;
  SetLength(_rec, n);
end;

destructor TPrimeRing.Destroy;
begin
  inherited Destroy;
end;

procedure TPrimeRing.Solution;
  procedure __dfs(cur: integer);
  var
    i: integer;
  begin
    if (cur = _max) and (__isPrime(_rec[0] + _rec[cur - 1])) then
    begin
      TArrayUtils_int.Print(_rec);
      Exit;
    end;

    for i := 2 to _max do
    begin
      if __check(i, cur) then
      begin
        _rec[cur] := i;
        __dfs(cur + 1);
        _rec[cur] := 0;
      end;
    end;
  end;

begin
  _rec[0] := 1;
  __dfs(1);
end;

function TPrimeRing.__check(k, cur: integer): boolean;
var
  i: integer;
begin
  Result := true;

  for i := 0 to cur - 1 do
  begin
    if (k = _rec[i]) or (not __isPrime(_rec[cur - 1] + k)) then
      Exit(false);
  end;
end;

function TPrimeRing.__isPrime(n: integer): boolean;
var
  i: integer;
begin
  Result := true;

  for i := 2 to Trunc(Sqrt(n)) do
    if n mod i = 0 then
      Exit(false);
end;

end.
