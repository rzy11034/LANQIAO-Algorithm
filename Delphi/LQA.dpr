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
  LQA.Case04_04_边界为1的最大子方阵 in 'Source\Case04_多维数组与矩阵\LQA.Case04_04_边界为1的最大子方阵.pas',
  LQA.Case04_05_子数组最大累加和 in 'Source\Case04_多维数组与矩阵\LQA.Case04_05_子数组最大累加和.pas',
  LQA.Case04_06_子矩阵最大累加和 in 'Source\Case04_多维数组与矩阵\LQA.Case04_06_子矩阵最大累加和.pas',
  LQA.Case04_07_矩阵计算 in 'Source\Case04_多维数组与矩阵\LQA.Case04_07_矩阵计算.pas',
  LQA.Case05_01_判断字符串有无重复字符 in 'Source\Case05_字符串问题\LQA.Case05_01_判断字符串有无重复字符.pas',
  LQA.Case05_02_翻转字符串 in 'Source\Case05_字符串问题\LQA.Case05_02_翻转字符串.pas',
  LQA.Case05_03_变形词 in 'Source\Case05_字符串问题\LQA.Case05_03_变形词.pas',
  LQA.Case05_04_替换字符串中的空格 in 'Source\Case05_字符串问题\LQA.Case05_04_替换字符串中的空格.pas',
  LQA.Case05_05_字符串压缩 in 'Source\Case05_字符串问题\LQA.Case05_05_字符串压缩.pas',
  LQA.Case05_06_判断两个字符串的字符集是否相同 in 'Source\Case05_字符串问题\LQA.Case05_06_判断两个字符串的字符集是否相同.pas',
  LQA.Case05_07_旋转词 in 'Source\Case05_字符串问题\LQA.Case05_07_旋转词.pas',
  LQA.Case05_08_将字符串按单词翻转 in 'Source\Case05_字符串问题\LQA.Case05_08_将字符串按单词翻转.pas',
  LQA.Case05_09_移除字符串中连续出现的K个0 in 'Source\Case05_字符串问题\LQA.Case05_09_移除字符串中连续出现的K个0.pas',
  LQA.Case05_10_神奇的回文串 in 'Source\Case05_字符串问题\LQA.Case05_10_神奇的回文串.pas',
  LQA.Case05_11_最短摘要的生成 in 'Source\Case05_字符串问题\LQA.Case05_11_最短摘要的生成.pas',
  LQA.DSA.Strings.RabinKarp in 'Source\DSA\Strings\LQA.DSA.Strings.RabinKarp.pas',
  LQA.DSA.Strings.KMP in 'Source\DSA\Strings\LQA.DSA.Strings.KMP.pas',
  LQA.Case06_01_天平称重 in 'Source\Case06_数学问题\LQA.Case06_01_天平称重.pas',
  LQA.DSA.Math in 'Source\DSA\Math\LQA.DSA.Math.pas',
  LQA.Case06_02_Nim游戏 in 'Source\Case06_数学问题\LQA.Case06_02_Nim游戏.pas',
  LQA.Case06_03_阶梯Nim博弈 in 'Source\Case06_数学问题\LQA.Case06_03_阶梯Nim博弈.pas',
  LQA.Case06_04_欧几里得算法 in 'Source\Case06_数学问题\LQA.Case06_04_欧几里得算法.pas',
  LQA.Case06_05_扩展欧几里得算法 in 'Source\Case06_数学问题\LQA.Case06_05_扩展欧几里得算法.pas',
  LQA.Case06_06_一步之遥 in 'Source\Case06_数学问题\LQA.Case06_06_一步之遥.pas',
  LQA.Case06_07_青蛙的约会 in 'Source\Case06_数学问题\LQA.Case06_07_青蛙的约会.pas',
  LQA.Case06_08_求逆元 in 'Source\Case06_数学问题\LQA.Case06_08_求逆元.pas',
  LQA.Case06_09_生理周期 in 'Source\Case06_数学问题\LQA.Case06_09_生理周期.pas',
  LQA.Case06_10_素数测试及质因数分解 in 'Source\Case06_数学问题\LQA.Case06_10_素数测试及质因数分解.pas';

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
