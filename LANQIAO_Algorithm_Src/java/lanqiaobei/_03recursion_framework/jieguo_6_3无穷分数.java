package org.lanqiao.algo.lanqiaobei._03recursion_framework;

/**
 *
 无穷分数

 无穷的分数，有时会趋向于固定的数字。
 请计算【图1.jpg】所示的无穷分数，要求四舍五入，精确到小数点后5位，小数位不足的补0。

 请填写该浮点数，不能填写任何多余的内容。
 */


public class jieguo_6_3无穷分数 {
  public static void main(String[] args) {
    double d = solution(1, 1000);
    System.out.println(d);
    // d = solution(0, 1, 999);
    // System.out.println(d);
    f();
  }

  private static double res;

  /**
   *
   * @param i 现在局面下的分子
   * @param n 现在是第几层
   * @return
   */
  private static double solution(int i, int n) {
    if (i == n) return i / (i + 1);
    return i / (i + solution(i + 1, n));
  }


  static void f() {
    int N = 2000;
    double fenmu = N + 1;
    for (double i = N; i > 0; i--) {
      fenmu = (i - 1) + i / fenmu;
    }
    System.out.println(fenmu);
  }


}
