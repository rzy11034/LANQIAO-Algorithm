package org.lanqiao.algo.lanqiaobei._01enumerative;

/*

骰子游戏

    我们来玩一个游戏。
    同时掷出3个普通骰子（6个面上的数字分别是1~6）。
    如果其中一个骰子上的数字等于另外两个的和，你就赢了。

    下面的程序计算出你能获胜的精确概率（以既约分数表示）

*/

public class tiankong_7_4骰子游戏 {
  public static int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
  }

  public static void main(String[] args) {
    int n = 0;
    for (int i = 0; i < 6; i++)
      for (int j = 0; j < 6; j++)
        for (int k = 0; k < 6; k++) {
          // if(________________________________) n++;   //填空位置
          if ((i + 1) == (j + k + 2) || (j + 1) == (i + k + 2) || (k + 1) == (j + i + 2)) {
            System.out.println(i + 1 + " " + (j + 1) + " " + (k + 1));
            n++;   //填空位置
          }
        }

    int m = gcd(n, 6 * 6 * 6);
    System.out.println(n / m + "/" + 6 * 6 * 6 / m);
  }
}


// 仔细阅读代码，填写划线部分缺少的内容。
//
//     注意：不要填写任何已有内容或说明性文字。
