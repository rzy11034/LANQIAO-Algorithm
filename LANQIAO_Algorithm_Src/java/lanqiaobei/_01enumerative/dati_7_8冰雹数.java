package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.time.Instant;
import java.util.Scanner;

/**
 * dati_7_8冰雹数

 任意给定一个正整数N，
 如果是偶数，执行： N / 2
 如果是奇数，执行： N * 3 + 1

 生成的新的数字再执行同样的动作，循环往复。
 通过观察发现，这个数字会一会儿上升到很高，
 一会儿又降落下来。
 就这样起起落落的，但最终必会落到“1”
 这有点像小冰雹粒子在冰雹云中翻滚增长的样子。

 比如N=9
 9,28,14,7,22,11,34,17,52,26,13,40,20,10,5,16,8,4,2,1
 可以看到，N=9的时候，这个“小冰雹”最高冲到了52这个高度。

 输入格式：
 一个正整数N（N<1000000）
 输出格式：
 一个正整数，表示不大于N的数字，经过冰雹数变换过程中，最高冲到了多少。

 例如，输入：
 10
 程序应该输出：
 52

 再例如，输入：
 100
 程序应该输出：
 9232



 看到网上说该题容易理解错，确实是这样，给一个n的值，题目的原意是在n之内求出最大的，
 不理解的还以为就是求n这个数；

 思路：将n到1穷举n中的每一个数，判断每个数是奇数还是偶数，对其进行操作，
 每个数得出的结果放入数组中，循环结束后就是找数组最大值了
 *
 * 迭代法
 */
public class dati_7_8冰雹数 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    // cache = new long[3000000 + 1];
    while (scanner.hasNext()) {
      long max = 0;
      int N = scanner.nextInt();
      Instant now = Instant.now();

      for (int i = 1; i <= N; i++) {
        long temp = i;
        // long maxOfI = i;
        while (temp != 1) {
          // if (t < cache.length && cache[(int) t] != 0 && cache[(int) t] > max) {
          //   max = cache[(int) t];
          //   break;
          // }
          if (temp % 2 == 0) {
            temp = temp / 2;
          } else {
            temp = temp * 3 + 1;
          }
          if (temp > max) max = temp;
        }
        // System.out.println(count);
        // cache[i] = max;
        // if (maxOfI > max) max = maxOfI;
      }
      System.out.println("时间消耗，毫秒：" + (Instant.now().toEpochMilli() - now.toEpochMilli()));
      System.out.println(max);
    }
  }

  // static long[] cache;
}
