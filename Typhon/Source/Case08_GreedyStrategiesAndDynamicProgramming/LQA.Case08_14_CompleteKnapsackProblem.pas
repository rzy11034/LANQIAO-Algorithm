unit LQA.Case08_14_CompleteKnapsackProblem;

(**
 * 物品数量无限
 * 完全背包问题
 * 首先在初始化最后一行的时候有所不同：初始化时，当只考虑一件物品a时，
 * state[row][j] = values[row]*j/weight[row]
 * 然后在递推的时候有些不同：
 * state[row][j] = max{state[row+1][j],state[row][j-weight[row]]+values[row]}，
 * 即不抓时用现在的容量去匹配下面行
 * 要抓的时候，先抓到这个物品的价值，然后用剩下的容量去匹配同一行，为什么匹配同一行，
 * 这是因为剩下的容量可以重复抓当前物品（不限数量）
 *
 * 同时必须理解，抓一个之后用剩余的容量重新考虑当前可选的所有物品其实包含了抓2个甚至更多的情况！！！
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TCompleteKnapsackProblem = class(TObject)
  private type
    TGoods = class(TObject)
    private
      _weight: integer;
      _value: integer;
      function __getValue: integer;
      function __getWeight: integer;
      procedure __setValue(const newValue: integer);
      procedure __setweight(const newWeight: integer);

    public
      constructor Create(weight: integer; Value: integer);
      function Compare(constref a, b: TGoods): integer;

      property Weight: integer read __getWeight write __setweight;
      property Value: integer read __getValue write __setValue;
    end;

    TArrayUtils_TGoods = specialize TArrayUtils<TGoods>;

  var
    _goods: array of TGoods;
    _maxWeight: integer;

  public
    constructor Create(w, v: TArr_int; maxWeight: integer);
    destructor Destroy; override;

    function Solution: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  values, weights: TArr_int;
  total: integer;
begin
  weights := [7, 4, 3, 2];
  values := [9, 5, 3, 1];
  total := 10;

  with TCompleteKnapsackProblem.Create(weights, values, total) do
  begin
    writeln(Solution);
  end;
end;

{ TCompleteKnapsackProblem.TGoods }

constructor TCompleteKnapsackProblem.TGoods.Create(weight: integer; Value: integer);
begin
  _weight := weight;
  _value := Value;
end;

function TCompleteKnapsackProblem.TGoods.Compare(constref a, b: TGoods): integer;
begin
  Result := 0;

  if a.Weight > b.Weight then
    Result := 1
  else if a.Weight < b.Weight then
    Result := -1;
end;

function TCompleteKnapsackProblem.TGoods.__getValue: integer;
begin
  Result := _value;
end;

function TCompleteKnapsackProblem.TGoods.__getWeight: integer;
begin
  Result := _weight;
end;

procedure TCompleteKnapsackProblem.TGoods.__setValue(const newValue: integer);
begin
  _value := newValue;
end;

procedure TCompleteKnapsackProblem.TGoods.__setweight(const newWeight: integer);
begin
  _weight := newWeight;
end;

{ TCompleteKnapsackProblem }

constructor TCompleteKnapsackProblem.Create(w, v: TArr_int; maxWeight: integer);
var
  i: integer;
begin
  _maxWeight := maxWeight;

  SetLength(_goods, Length(w));
  for i := 0 to High(_goods) do
    _goods[i] := TGoods.Create(w[i], v[i]);
end;

destructor TCompleteKnapsackProblem.Destroy;
begin
  inherited Destroy;
end;

function TCompleteKnapsackProblem.Solution: integer;
var
  rec: TArr2D_int;
  i, j, w: integer;
begin
  TArrayUtils_TGoods.Sort(_goods, @TGoods(nil).Compare);
  SetLength(rec, Length(_goods), _maxWeight + 1);

  for i := 0 to High(rec[0]) do
    rec[0, i] := i div _goods[0].Weight * _goods[0].Value;

  for i := 1 to High(rec) do
  begin
    for j := 0 to High(rec[i]) do
    begin
      if j >= _goods[i].Weight then
      begin
        w := j - _goods[i].Weight;
        rec[i, j] := Max(rec[i - 1, j], _goods[i].Value + rec[i, w]);
      end
      else
      begin
        rec[i, j] := rec[i - 1, j];
      end;
    end;
  end;

  Result := rec[High(rec), High(rec[0])];
end;

end.
