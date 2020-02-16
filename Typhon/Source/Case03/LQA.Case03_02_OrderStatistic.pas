unit LQA.Case03_02_OrderStatistic;

{**
 * 求顺序统计位的元素，如第一小元素，最大元素，第二小元素，
 * 或在顺序统计中任意位置的数
 *
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

//**
// * 期望O(n)，最差O(n²)
// *
// * arr: 数组
// * p: 开始下标
// * r: 结束小标
// * k: 求第k小元素（递增第k个元素）
// *
function SelectK(arr: TArr_int; p, r, k: integer): integer;
begin

end;

procedure Main;
begin

end;

end.