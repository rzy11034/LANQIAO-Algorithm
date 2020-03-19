unit LQA.Case08_01_CoinPaymentProblem;

(*
硬币问题

有1元,5元,10元,50元,100元,500元的硬币各c1,c5,c10,c50,c100,c500枚.

现在要用这些硬币来支付A元,最少需要多少枚硬币?

假定本题至少存在一种支付方案.

0≤ci≤10^9

0≤A≤10^9

输入:

第一行有六个数字,分别代表从小到大6种面值的硬币的个数

第二行为A,代表需支付的A元

样例:

输入

3 2 1 3 0 2
620

输出

6
*)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TCoinPaymentProblem = class(TObject)
  private const
    _COIN_VALUE: TArr_int = (1, 5, 10, 50, 100, 500);

  var
    _coinCount: TArr_int;

  public
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    function Solution(money: integer): integer;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TCoinPaymentProblem.Create([3, 2, 1, 3, 0, 2]) do
  begin
    WriteLn(Solution(54));
  end;
end;

{ TCoinPaymentProblem }

constructor TCoinPaymentProblem.Create(arr: TArr_int);
begin
  _coinCount := TArrayUtils_int.CopyArray(arr);
end;

destructor TCoinPaymentProblem.Destroy;
begin
  inherited Destroy;
end;

function TCoinPaymentProblem.Solution(money: integer): integer;
  function __dp(money, cur: integer): integer;
  var
    coinValue, cnt, x, t: integer;
  begin
    if money <= 0 then
      Exit(0);

    if (cur < 0) and (money > 0) then
      Exit(integer.MinValue);

    coinValue := _COIN_VALUE[cur];
    cnt := _coinCount[cur]; // 当前面值的硬币有cnt个
    x := money div coinValue; // 金额有多少个coinValue
    t := Min(x, cnt);
    Result := t + __dp(money - t * coinValue, cur - 1);
  end;

begin
  Result := __dp(money, High(_coinCount));
end;

end.