package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 *
 第四届蓝桥杯，结果填空题
 标题: 组素数

 素数就是不能再进行等分的数。比如：2 3 5 7 11 等。
 9 = 3 * 3 说明它可以3等分，因而不是素数。

 我们国家在1949年建国。如果只给你 1 9 4 9 这4个数字卡片，可以随意摆放它们的先后顺序
 （但卡片不能倒着摆放啊，我们不是在脑筋急转弯！），那么，你能组成多少个4位的素数呢？

 比如：1949，4919 都符合要求。


 请你提交：能组成的4位素数的个数，不要罗列这些素数!!

 注意：不要提交解答过程，或其它的辅助说明文字。
 */

import java.util.*;
public class jieguo_4_2组素数 {
  public static void main(String[] args) {
    int[] arr = {1, 9, 4, 9};
    int count = 0;
    //这是一个集合，而且是一个不允许重复的集合
    //遇到重复的元素，只保留一个
    Set<Integer> set = new HashSet<>();
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (j == i) continue;
        for (int k = 0; k < 4; k++) {
          if (k == j || k == i) continue;
          for (int l = 0; l < 4; l++) {
            if (l == k || l == j || l == i) continue;
            int x = arr[i] * 1000 + arr[j] * 100 + arr[k] * 10 + arr[l];
            if (isP(x)) {
              // count++;
              // System.out.print(x + "    ");
              // System.out.println("是素数");
              set.add(x);
            }
            // System.out.println();
          }
        }
      }
    }
    System.out.println(set.size());
  }

  private static boolean isP(int x) {
    for (int i = 2; i <= x / 2; i++) {
      if (x % i == 0) {
        return false;
      }
    }
    return true;
  }
}
