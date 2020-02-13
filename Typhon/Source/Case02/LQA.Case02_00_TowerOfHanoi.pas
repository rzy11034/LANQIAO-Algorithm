unit LQA.Case02_00_TowerOfHanoi;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

{**
   * 将N个盘子从source移动到target的路径的打印
   *
   * n:     初始的N个从小到达的盘子，N是最大编号
   * from:  原始柱子
   * to:    辅助的柱子
   * help:  目标柱子
   *}
procedure TowerOfHanoi(n: integer; from, to_, help: UChar);
begin
  if n = 1 then
  begin
    WriteLn('move ', n, ' from ', from, ' to ', to_);
    Exit;
  end;

  TowerOfHanoi(n - 1, from, help, to_);  // 先把前N-1个盘子挪到辅助空间上1个盘子挪到辅助空间上去
  WriteLn('move ', n, ' from ', from, ' to ' + to_);  // N可以顺利到达target
  TowerOfHanoi(n - 1, help, to_, from); // 让N-1从辅助空间回到源空间上去
end;

procedure Main;
begin
  TowerOfHanoi(5, 'A', 'B', 'C');
end;

end.
