program LQA;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  LQA.Main in 'Source\LQA.Main.pas',
  LQA.Utils in 'Source\LQA.Utils.pas',
  LQA.Case01_00_位运算 in 'Source\Case01_位运算\LQA.Case01_00_位运算.pas',
  LQA.Case01_01_唯一成对的数 in 'Source\Case01_位运算\LQA.Case01_01_唯一成对的数.pas',
  LQA.Case01_02_找出落单的那个数 in 'Source\Case01_位运算\LQA.Case01_02_找出落单的那个数.pas',
  LQA.Case01_03_二进制中1的个数 in 'Source\Case01_位运算\LQA.Case01_03_二进制中1的个数.pas',
  LQA.Case01_04_用一条语句判断一个整数是不是2的整数次方 in 'Source\Case01_位运算\LQA.Case01_04_用一条语句判断一个整数是不是2的整数次方.pas',
  LQA.Case01_05_交换奇偶位 in 'Source\Case01_位运算\LQA.Case01_05_交换奇偶位.pas',
  LQA.Case01_06_二进制小数 in 'Source\Case01_位运算\LQA.Case01_06_二进制小数.pas',
  LQA.Case02_00_什么是递归 in 'Source\Case02_查找与排序(上)\LQA.Case02_00_什么是递归.pas',
  LQA.Case02_01_汉诺塔 in 'Source\Case02_查找与排序(上)\LQA.Case02_01_汉诺塔.pas',
  LQA.Case02_02_小白上楼梯 in 'Source\Case02_查找与排序(上)\LQA.Case02_02_小白上楼梯.pas',
  LQA.Case02_03_旋转数组的最小数字 in 'Source\Case02_查找与排序(上)\LQA.Case02_03_旋转数组的最小数字.pas',
  LQA.Case02_04_特殊有序数组中查找 in 'Source\Case02_查找与排序(上)\LQA.Case02_04_特殊有序数组中查找.pas',
  LQA.Case02_05_最长连续递增子序列 in 'Source\Case02_查找与排序(上)\LQA.Case02_05_最长连续递增子序列.pas',
  LQA.Case02_06_高效的求a的n次幂的算法 in 'Source\Case02_查找与排序(上)\LQA.Case02_06_高效的求a的n次幂的算法.pas',
  LQA.Case03_01_调整数组顺序使奇数位于偶数前面 in 'Source\Case03_查找与排序(下)\LQA.Case03_01_调整数组顺序使奇数位于偶数前面.pas',
  LQA.Case03_02_第K个元素 in 'Source\Case03_查找与排序(下)\LQA.Case03_02_第K个元素.pas',
  LQA.Case03_03_超过一半的数字 in 'Source\Case03_查找与排序(下)\LQA.Case03_03_超过一半的数字.pas',
  LQA.Case03_04_最小可用ID in 'Source\Case03_查找与排序(下)\LQA.Case03_04_最小可用ID.pas',
  LQA.Case03_05_合并有序数组 in 'Source\Case03_查找与排序(下)\LQA.Case03_05_合并有序数组.pas',
  LQA.Case03_06_逆序对个数 in 'Source\Case03_查找与排序(下)\LQA.Case03_06_逆序对个数.pas',
  LQA.Case03_07_排序数组中找和的因子 in 'Source\Case03_查找与排序(下)\LQA.Case03_07_排序数组中找和的因子.pas',
  LQA.Case03_08_需要排序的子数组 in 'Source\Case03_查找与排序(下)\LQA.Case03_08_需要排序的子数组.pas',
  LQA.Case03_09_前K个数 in 'Source\Case03_查找与排序(下)\LQA.Case03_09_前K个数.pas',
  LQA.Case03_10_所有员工年龄排序 in 'Source\Case03_查找与排序(下)\LQA.Case03_10_所有员工年龄排序.pas',
  LQA.Case03_11_数组能排成的最小数 in 'Source\Case03_查找与排序(下)\LQA.Case03_11_数组能排成的最小数.pas',
  LQA.Case03_12_字符串的包含 in 'Source\Case03_查找与排序(下)\LQA.Case03_12_字符串的包含.pas',
  LQA.Case04_01_顺时针打印二维数组 in 'Source\Case04_多维数组与矩阵\LQA.Case04_01_顺时针打印二维数组.pas',
  LQA.Case04_02_0所在的行列清零 in 'Source\Case04_多维数组与矩阵\LQA.Case04_02_0所在的行列清零.pas',
  LQA.Case04_03_Z字形打印矩阵 in 'Source\Case04_多维数组与矩阵\LQA.Case04_03_Z字形打印矩阵.pas',
  LQA.Case04_04_边界为1的最大子方阵 in 'Source\Case04_多维数组与矩阵\LQA.Case04_04_边界为1的最大子方阵.pas';

begin
  try
    Run;
    DrawLineProgramEnd;
    Writeln(END_OF_PROGRAM_EN);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
