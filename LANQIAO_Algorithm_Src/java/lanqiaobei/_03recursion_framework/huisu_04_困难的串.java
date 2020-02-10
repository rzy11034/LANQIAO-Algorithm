package org.lanqiao.algo.lanqiaobei._03recursion_framework;

/**
 * 问题描述:如果一个字符串包含两个相邻的重复子串，则称它为容易的串，其他串称为困难的串,
 * 如:BB，ABCDACABCAB,ABCDABCD都是容易的，D,DC,ABDAB,CBABCBA都是困难的。

 输入正整数n,L，输出由前L个字符组成的，字典序第n小的困难的串。
 例如，当L=3时，前7个困难的串分别为:
 A,AB,ABA,ABAC,ABACA,ABACAB,ABACABA
 */
public class huisu_04_困难的串 {
  public static void main(String[] args) {
    int n = 10;
    int l = 4;
    solution(l, n, "");
    // isHard("0123020120",1);
  }

  static int count;

  private static void solution(int l, int n, String prefix) {

    //尝试在prefix后追加一个字符
    for (int i = 0; i < l; i++) {
      if (isHard(prefix, i)) {
        String x = prefix + i;
        printRes(x);
        count++;
        if (count == n)
          System.exit(0);
        solution(l, n, x);
      }
    }
  }

  private static void printRes(String x) {
    char[] arr = x.toCharArray();
    for (int i = 0; i < arr.length; i++) {
      System.out.print((char) ('A' + (arr[i] - '0')));
    }
    System.out.println();
  }

  private static boolean isHard(String prefix, int i) {
    //0123020120
    int count = 0;
    for (int j = prefix.length() - 1; j >= 0; j -= 2) {
      final String s1 = prefix.substring(j, j + count + 1);
      final String s2 = prefix.substring(j + count + 1) + i;
      if (s1.equals(s2))
        return false;
      count++;
    }
    return true;
  }
}
