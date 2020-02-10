package org.lanqiao.algo.lanqiaobei.programming;

/**
 * 有1、3、5元三种硬币
 * 输入一个金额，输出凑出这个金额最少的硬币数
 */
public class 贪心凑硬币 {
  static int a;
  static int b;
  static int c;

  static void f(int n) {
    if (n >= 5) {
      a++;
      f(n - 5);
    } else if (n >= 3) {
      b++;
      f(n - 3);
    } else if (n >= 1) {
      c++;
      f(n - 1);
    } else {
      return;
    }
  }

  public static void main(String[] args) {
    f(6);
    System.out.println(a + " " + b + " " + c);
  }
}
