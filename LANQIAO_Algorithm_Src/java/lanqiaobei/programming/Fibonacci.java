package org.lanqiao.algo.lanqiaobei.programming;

import org.lanqiao.algo.util.Util;

import java.util.*;

// 菲波那切数列求第n项
public class Fibonacci {
  // 普通递归解法
  public static int get(int n) {
    if (n == 1) return 1;
    if (n == 2) return 1;
    return get(n - 1) + get(n - 2);
  }

  // 循环解法
  public static int getByLoop(int n) {
    int p1 = 0, p2 = 1;

    if (n == 0) {
      return 0;
    }
    if (n == 1) {
      return 1;
    }
    for (int i = 2; i <= n; i++) {
      int sum = p1 + p2;
      p1 = p2;
      p2 = sum;
    }
    return p2;
  }

  static long[] arr;

  // 记录已有项，避免重复计算
  /*
  * 1、递归前，查表，有，直接返回
  * 2、没有，递归计算，算完后，填表
  * */
  public static long 记忆型递归(int n) {
    if (arr[n] != 0) {
      return arr[n];
    } else {
      long res = 记忆型递归(n - 1) + 记忆型递归(n - 2);
      arr[n] = res;
      return res;
    }
  }

  public static long fib(int n) {
    long[][] state = {
        {1, 1},
        {1, 0}
    };
    long[][] res = Util.matrixPower(state, n - 2);
    return res[0][0] + res[1][0];
  }

  public static void main(String[] args) {
    final int n = new Scanner(System.in).nextInt();
    arr = new long[n + 1];
    arr[1] = 1;
    arr[2] = 1;

    long now = System.currentTimeMillis();
    System.out.println(记忆型递归(n));
    System.out.println(System.currentTimeMillis() - now);

    now = System.currentTimeMillis();
    System.out.println(get(n));
    System.out.println(System.currentTimeMillis() - now);
  }
}