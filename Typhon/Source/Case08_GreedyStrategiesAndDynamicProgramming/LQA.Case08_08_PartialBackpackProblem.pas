unit LQA.Case08_08_PartialBackpackProblem;

(**
 有n个物体，第i个物体的重量为wi，价值为vi。在总重量不超过C的情况下让总价值尽量高。

 每一个物体都可以只取走一部分，价值和重量按比例计算。

 求最大总价值

 注意：每个物体可以只拿一部分，因此一定可以让总重量恰好为C。
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TPartialBackpackProblem = class(TObject)
  private type
    TGoods = class(TObject)
    private
      _weight: double;
      _value: double;
      function __getPrice: double;

    public
      constructor Create(weight: double; Value: double);
      function Compare(constref a, b: TGoods): integer;

      property Weight: double read _weight write _weight;
      property Value: double read _value write _value;
      property Price: double read __getPrice;
    end;

    TArrayUtils_TGoods = specialize TArrayUtils<TGoods>;

  var
    _goods: array of TGoods;
    _max: double;

  public
    constructor Create(w, v: TArr_int; m: double);
    destructor Destroy; override;

    function Solution: double;
  end;

procedure Main;

implementation

procedure Main;
var
  w, v: TArr_int;
  max: double;
begin
  max := 10.0;
  w := [1, 2, 3, 4, 5];
  v := [3, 4, 3, 1, 4];

  with TPartialBackpackProblem.Create(w, v, max) do
  begin
    writeln(Solution: 3: 2);
  end;
end;

{ TPartialBackpackProblem.TGoods }

constructor TPartialBackpackProblem.TGoods.Create(weight: double; Value: double);
begin
  _weight := weight;
  _value := Value;
end;

function TPartialBackpackProblem.TGoods.Compare(constref a, b: TGoods): integer;
begin
  Result := 0;

  if a.Price > b.Price then
    Result := 1
  else if a.Price < b.Price then
    Result := -1;
end;

function TPartialBackpackProblem.TGoods.__getPrice: double;
begin
  Result := _value / _weight;
end;

{ TPartialBackpackProblem }

constructor TPartialBackpackProblem.Create(w, v: TArr_int; m: double);
var
  i: integer;
begin
  _max := m;

  SetLength(_goods, Length(w));
  for i := 0 to High(_goods) do
    _goods[i] := TGoods.Create(w[i], v[i]);
end;

destructor TPartialBackpackProblem.Destroy;
var
  i: integer;
begin
  for i := 0 to High(_goods) do
    _goods[i].Free;

  inherited Destroy;
end;

function TPartialBackpackProblem.Solution: double;
var
  MaxValue, m: double;
  i: integer;
begin
  TArrayUtils_TGoods.Sort(_goods, @TGoods(nil).Compare);
  m := _max;
  MaxValue := 0.0;

  for i := High(_goods) downto 0 do
  begin
    if _goods[i].Weight <= m then
    begin
      MaxValue += _goods[i].Value;
      m -= _goods[i].Weight;
    end
    else
    begin
      MaxValue += _goods[i].Price * m;
      Break;
    end;
  end;

  Result := MaxValue;
end;

end.