package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.time.Instant;
import java.util.Scanner;

/**
 * 迭代法
 */
public class 冰雹数2 {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    while (scanner.hasNext()) {
      int N = scanner.nextInt();
      Instant now = Instant.now();
      long res = 0;

      for (int i = 1; i <= N; i++) {
        long max = getMax(i);
        if (max > res)
          res = max;
      }
      System.out.println("时间消耗，毫秒：" + (Instant.now().toEpochMilli() - now.toEpochMilli()));
      System.out.println(res);
    }
  }

  private static long getMax(int i) {
    long max = i;
    while (i != 1) {
      if ((i & 1) == 0) {
        i = i >> 1;
      } else {
        i = i * 3 + 1;
      }
      if (i > max) max = i;
    }
    return max;
  }
}
