package org.lanqiao.algo.lanqiaobei.juesai;

import static org.lanqiao.algo.lanqiaobei._01enumerative.tiankong_7_4骰子游戏.gcd;

/**
 *
 */
public class 埃及分数 {
  private static int count;

  public static void main(String[] args) {
    for (int a = 2; a < 1000; a++) {
      for (int b = 2; b != a && b < 1000; b++) {
        int x = a + b;
        int y = a * b;
        int gcd = gcd(x, y);
        x = x / gcd;
        y = y / gcd;
        if (x == 2 && y == 45) {
          count++;
          System.out.println("1/" + a + "+1/" + b);
        }
      }
    }
    System.out.println(count);
  }
}
