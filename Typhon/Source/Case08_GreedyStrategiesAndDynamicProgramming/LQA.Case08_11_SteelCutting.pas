unit LQA.Case08_11_SteelCutting;

(*
Serling公司购买长钢条，将其切割为短钢条出售。切割工序本身没有成本支出。
公司管理层希望知道最佳的切割方案。
假定我们知道Serling公司出售一段长为i英寸的钢条的价格为pi(i=1,2,…，单位为美元)。
钢条的长度均为整英寸。

长度i     | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |
          | - | - | - | - | - | - | - | - | - | - |
价格pi    | 1 | 5 | 8 |16 |10 |17 |17 |20 |24 |30 |

钢条切割问题是这样的：
给定一段长度为n英寸的钢条和一个价格表pi(i=1,2,…n)，求切割钢条方案，使得销售收益rn最大。
注意，如果长度为n英寸的钢条的价格pn足够大，最优解可能就是完全不需要切割。
*)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TSteelCutting = class(TObject)
  private
    _steelValues: TArr_int;
    _steelLen: integer;

  public
    constructor Create(steelValues: TArr_int; steelLen: integer);
    destructor Destroy; override;

    function Dfs: integer;
    function Dp: integer;
    function Memory: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  steelValues: TArr_int;
  steelLen: integer;
begin
  steelValues := [1, 5, 8, 16, 10, 17, 17, 20, 24, 30];
  steelLen := 10;

  with TSteelCutting.Create(steelValues, steelLen) do
  begin
    writeln('Dfs: ', Dfs);
    writeln('Memory: ', Memory);
    writeln('Dp: ', Dp);
  end;
end;

{ TSteelCutting }

constructor TSteelCutting.Create(steelValues: TArr_int; steelLen: integer);
begin
  _steelValues := steelValues;
  _steelLen := steelLen;
end;

destructor TSteelCutting.Destroy;
begin
  inherited Destroy;
end;

function TSteelCutting.Dfs: integer;
  function __dfs(n: integer): integer;
  var
    i, v, ans: integer;
  begin
    if n = 0 then
      Exit(0);

    ans := 0;
    for i := 1 to n do
    begin
      v := _steelValues[i - 1] + __dfs(n - i);
      ans := Max(ans, v);
    end;

    Result := ans;
  end;

begin
  Result := __dfs(_steelLen);
end;

function TSteelCutting.Dp: integer;
var
  rec: TArr_int;
  i, j: integer;
begin
  SetLength(rec, Length(_steelValues) + 1);

  rec[0] := 0;
  for i := 1 to High(rec) do
  begin
    for j := 1 to i do
    begin
      rec[i] := Max(_steelValues[j - 1] + rec[i - j], rec[i]);
    end;
  end;

  Result := rec[High(rec)];
end;

function TSteelCutting.Memory: integer;
var
  rec: TArr_int;

  function __memory(n: integer): integer;
  var
    ans, i, v: integer;
  begin
    if n = 0 then
      Exit(0);

    ans := 0;
    for i := 1 to n do
    begin
      if rec[n - i] = -1 then
        rec[n - i] := __memory(n - i);

      v := _steelValues[i - 1] + rec[n - i];
      ans := Max(v, ans);
    end;

    rec[n] := ans;
    Result := ans;
  end;

begin
  SetLength(rec, Length(_steelValues) + 1);
  TArrayUtils_int.FillArray(rec, -1);

  Result := __memory(_steelLen);
end;

end.