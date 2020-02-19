unit LQA.Case03_08_Rearrange;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function FindSegment(arr: TArr_int; out ret: TArr_int): integer;
var
  l, r, min, max, len, i: integer;
begin
  len := Length(arr);
  l := -1;
  r := -1;
  min := arr[0];
  max := arr[len - 1];

  // 拓展右端点：更新历史最高，只要右侧出现比历史最高低的，就应该将右边界扩展到此处
  for i := 0 to len - 1 do
  begin
    if arr[i] > max then
      max := arr[i];

    //只要低于历史高峰，就要扩展需排序区间的右端点
    if arr[i] < max then
      r := i;
  end;

  // 找左端点：更新历史最低，只要左侧出现比历史最低高的，就应该将左边界扩展到此处
  for i := n-1 downto 0 do
  begin

  end;

  Result := 0;
end;


procedure Main;
begin

end;

end.