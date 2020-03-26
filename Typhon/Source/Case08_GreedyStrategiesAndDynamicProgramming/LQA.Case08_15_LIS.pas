unit LQA.Case08_15_LIS;

(**
 * 最长递增子序列的长度
 *输入 4 2 3 1 5 6
 *输出 3 （因为 2 3 5组成了最长递增子序列）
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TLis = class(TObject)
  private
    _data: TArr_int;

  public
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    function Dp_Simplicity: integer;
    function Simplicity: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  s: TArr_int;
begin
  s := [4, 2, 3, 1, 5, 6];

  with TLis.Create(s) do
  begin
    WriteLn('Solution_Simplicity: ', Simplicity);
    writeln('Dp_Simplicity: ', Dp_Simplicity);
  end;
end;

{ TLis }

constructor TLis.Create(arr: TArr_int);
begin
  _data := arr;
end;

destructor TLis.Destroy;
begin
  inherited Destroy;
end;

function TLis.Dp_Simplicity: integer;
var
  dp, tmp: TArr_int;
  i, j: integer;
begin
  SetLength(dp, Length(_data));
  dp[0] := 1;

  for i := 1 to High(_data) do
  begin
    for j := i downto 0 do
    begin
      SetLength(tmp, i + 1);

      if _data[i] > _data[j] then
      begin
        tmp[j] := dp[j] + 1;
      end
      else
      begin
        tmp[j] := dp[j];
      end;
    end;

    dp[i] := MaxIntValue(tmp);
  end;

  Result := dp[High(dp)];
end;

function TLis.Simplicity: integer;
var
  cnt, maxCnt, i, j: integer;
begin
  maxCnt := 0;

  for i := 0 to High(_data) do
  begin
    cnt := 1;
    for j := i to High(_data) - 1 do
    begin
      if _data[j] < _data[j + 1] then
        cnt += 1;
    end;

    maxCnt := Max(maxCnt, cnt);
  end;

  Result := maxCnt;
end;

end.
