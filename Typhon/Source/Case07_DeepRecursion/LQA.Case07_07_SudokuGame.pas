unit LQA.Case07_07_SudokuGame;

{*
  你一定听说过“数独”游戏。
  如下图所示，玩家需要根据9×9盘面上的已知数字，推理出所有剩余空格的数字，
  并满足每一行、每一列、每一个同色九宫内的数字均含1-9，不重复。
  数独的答案都是唯一的，所以，多个解也称为无解。
  本图的数字据说是芬兰数学家花了3个月的时间设计出来的较难的题目。
  但对会使用计算机编程的你来说，恐怕易如反掌了。
  本题的要求就是输入数独题目，程序输出数独的唯一解。
  我们保证所有已知数据的格式都是合法的，并且题目有唯一的解。
  格式要求，输入9行，每行9个数字，0代表未知，其它数字为已知。
  输出9行，每行9个数字表示数独的解。
  输入：

  005300000
  800000020
  070010500
  400005300
  010070006
  003200080
  060500009
  004000030
  000009700

  程序应该输出：

  145327698
  839654127
  672918543
  496185372
  218473956
  753296481
  367542819
  984761235
  521839764

  再例如，输入：

  800000000
  003600000
  070090200
  050007000
  000045700
  000100030
  001000068
  008500010
  090000400

  程序应该输出：

  812753649
  943682175
  675491283
  154237896
  369845721
  287169534
  521974368
  438526917
  796318452
*}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  ClassName = class(TObject)
  private

  public
    procedure aa(arr: TArr2D_T; formated: boolean = True);
  end;

procedure Main;
var
  arr: TArr2D_chr;
  i, j: integer;
begin
  SetLength(arr, 9, 9);
  for i := 0 to 8 do
  begin
    for j := 0 to 8 do
    begin
      Read(arr[i, j]);
    end;
    ReadLn;
  end;
  ReadLn;


  TArrayUtils_chr.Print2D(arr, False);
end;

{ ClassName }

procedure ClassName.aa(arr: TArr2D_T; formated: boolean);
begin

end;

end.
