package org.lanqiao.algo.lanqiaobei._02recursion;
/*
* 用递归打印i-j
* */
public class _01打印 {
  public static void main(String[] args) {
    f(5, 10);
  }

  private static void f(int i, int k) {
    if (k == i) {
      System.out.println(i);
      return;
    }
    f(i, k - 1);  // 打印i-k = 打印i-(k-1)  然后  打印 k
    System.out.println(k);
  }

  private static int fibnaci(int n) {
    if (n == 1) return 1;
    if (n == 2) return 1;
    return fibnaci(n - 1) + fibnaci(n - 2);
  }
}
