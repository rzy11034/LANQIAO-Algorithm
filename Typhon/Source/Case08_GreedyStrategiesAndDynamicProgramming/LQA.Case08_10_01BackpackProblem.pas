unit LQA.Case08_10_01BackpackProblem;

(*
有n个重量和价值分别为wi，vi的物品，从这些物品中挑选出总重量不超过W的物品，求所有挑选方案中价值总和的最大值。

    1≤n≤100

    1≤wi，vi≤100

    1≤W≤10000

输入：

    n=4
    (w,v)={(2,3),(1,2),(3,4),(2,2)}
    W=5

输出：

    7（选择第0，1，3号物品）

因为对每个物品只有选和不选两种情况，所以这个问题称为01背包。

 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  T01BackpackProblem = class(TObject)
  private type
    TGoods = class(TObject)
    private
      _weight: integer;
      _value: integer;

      function __getValue: integer;
      function __getWeight: integer;
      procedure __setValue(const newValue: integer);
      procedure __setWeight(const newWeight: integer);

    public
      constructor Create(w, v: integer);

      property Weight: integer read __getWeight write __setWeight;
      property Value: integer read __getValue write __setValue;
    end;

    //TArrayUtils_TGoods = specialize TArrayUtils<TGoods>;

  var
    _goods: array of TGoods;
    _maxWeight: integer;

  public
    constructor Create(weights, values: TArr_int; maxWeight: integer);
    destructor Destroy; override;

    // 2^n的复杂度
    function Dfs: integer;
    // 记忆型递归
    function Memory: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  weights, values: TArr_int;
  weight: integer;
begin
  weights := [2, 1, 3, 2]; // 重量表
  values := [3, 2, 4, 2]; // 价值表
  weight := 5; // 背包的承重极限

  with T01BackpackProblem.Create(weights, values, weight) do
  begin
    writeln('Dfs: ', Dfs);
    Free;
  end;
  DrawLineBlockEnd;

  with T01BackpackProblem.Create(weights, values, weight) do
  begin
    writeln('Memory: ', Memory);
    Free;
  end;
  DrawLineBlockEnd;
end;

{ T01BackpackProblem.TGoods }

constructor T01BackpackProblem.TGoods.Create(w, v: integer);
begin
  Weight := w;
  Value := v;
end;

function T01BackpackProblem.TGoods.__getValue: integer;
begin
  Result := _value;
end;

function T01BackpackProblem.TGoods.__getWeight: integer;
begin
  Result := _weight;
end;

procedure T01BackpackProblem.TGoods.__setValue(const newValue: integer);
begin
  _value := newValue;
end;

procedure T01BackpackProblem.TGoods.__setWeight(const newWeight: integer);
begin
  _weight := newWeight;
end;

{ T01BackpackProblem }

constructor T01BackpackProblem.Create(weights, values: TArr_int; maxWeight: integer);
var
  i: integer;
begin
  _maxWeight := maxWeight;

  SetLength(_goods, Length(weights));
  for i := 0 to High(_goods) do
  begin
    _goods[i] := TGoods.Create(weights[i], values[i]);
  end;
end;

destructor T01BackpackProblem.Destroy;
var
  i: integer;
begin
  for i := 0 to High(_goods) do
  begin
    _goods[i].Free;
  end;

  inherited Destroy;
end;

function T01BackpackProblem.Dfs: integer;
  function __dfs(cur, w: integer): integer;
  var
    v1, v2, res: integer;
  begin
    if w <= 0 then // 装不进去
      Exit(0);
    if cur = Length(_goods) then // 没东西可选了
      Exit(0);

    v1 := __dfs(cur + 1, w); // 不选择当前物品
    if w >= _goods[cur].Weight then
    begin
      v2 := _goods[cur].Value + __dfs(cur + 1, w - _goods[cur].Weight); // 选择当前物品
      res := Max(v1, v2);
    end
    else
    begin
      res := v1;
    end;

    Result := res;
  end;

begin
  Result := __dfs(0, _maxWeight);
end;

function T01BackpackProblem.Memory: integer;
var
  rec: TArr2D_int;

  function __memory(cur, w: integer): integer;
  var
    v1, v2, res: integer;
  begin
    if w <= 0 then // 装不进去
      Exit(0);
    if cur = Length(_goods) then // 没东西可选了
      Exit(0);

    if rec[cur, w] > -1 then
      Exit(rec[cur, w]);

    v1 := __memory(cur + 1, w); // 不选择当前物品
    if w >= _goods[cur].Weight then
    begin
      v2 := _goods[cur].Value + __memory(cur + 1, w - _goods[cur].Weight); // 选择当前物品
      res := Max(v1, v2);
    end
    else
    begin
      res := v1;
    end;

    rec[cur, w] := res;
    Result := res;
  end;

var
  i: integer;
begin
  SetLength(rec, Length(_goods), _maxWeight + 1);
  for i := 0 to High(rec) do
    TArrayUtils_int.FillArray(rec[i], -1);

  Result := __memory(0, _maxWeight);
end;

end.