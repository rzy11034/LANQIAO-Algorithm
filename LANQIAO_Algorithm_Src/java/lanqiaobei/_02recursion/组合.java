package org.lanqiao.algo.lanqiaobei._02recursion;

/**
 * 求组合数，如C5_3
 */
public class 组合 {

  private static int count1;

  public static void main(String[] args) {
    // System.out.println(f(M,0));
    f1();
    System.out.println(count1);
  }

  static int M = 5;
  static int N = 3;

  static int f(int m, int n) {
    if (n == N) return 1;
    if (m == 0 && n < N) return 0;
    return f(m - 1, n) + f(m - 1, n + 1);
  }

  static void f1() {
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 2; k++) {
          for (int l = 0; l < 2; l++) {
            for (int m = 0; m < 2; m++) {
              if (i + j + k + l + m == 3) {
                count1++;
              }
            }
          }
        }
      }
    }
  }
}
