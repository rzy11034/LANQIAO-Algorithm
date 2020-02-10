package org.lanqiao.algo.lanqiaobei._03recursion_framework;

import java.util.ArrayList;
import java.util.List;

// 1 1 2 2 3
public class _030_可重集全排列 {
  public static void main(String[] args) {
    f("", 0);
    for (String s : list
        ) {
      System.out.println(s);
    }
  }

  static String src = "aabc";
  static List<String> list = new ArrayList<>();

  /**
   *
   * @param prefix 已排好的部分
   * @param k 待确定的位置
   */
  static void f(String prefix, int k) {
    if (k == src.length()) {
      String res = prefix;
      if (!list.contains(res)) {
        list.add(res);
      }

      return;
    }


    // 尝试把源字符串里面的每个字符填在k位
    for (int i = 0; i < src.length(); i++) {
      char zhunBeiTianRu = src.charAt(i);
      //准备填入的字符，填入之后不超过……
      boolean ok = check(zhunBeiTianRu, prefix);
      if (ok)
        f(prefix + zhunBeiTianRu, k + 1);
    }
  }

  private static boolean check(char zhunBeiTianRu, String prefix) {
    int yiYou = 0;
    int zongGong = 0;
    for (int i = 0; i < prefix.length(); i++) {
      if (zhunBeiTianRu == prefix.charAt(i))
        yiYou++;
    }
    for (int i = 0; i < src.length(); i++) {
      if (zhunBeiTianRu == src.charAt(i))
        zongGong++;
    }
    return yiYou < zongGong;
  }
}
