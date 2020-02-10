package org.lanqiao.algo.lanqiaobei._03recursion_framework;

import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

/***
 * 输入仅一行，为N个不重复字符（字母或阿拉伯数字，没有空白字符）组成的字符串
 * 请按字典序输出这个字符集的全部子集
 */
public class _040_子集 {
  static char[] arr;

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    arr = scanner.nextLine().toCharArray();
    sub("", 0);
    System.out.println(set2);
  }

  static Set<String> set2 = new TreeSet<>();

  /*增量构造法*/
  static void sub(String pre, int cur) {
    if (cur == arr.length) {
      if (pre.length() > 0)
        set2.add(pre);
      return;
    }
    //1.这个字符加进来
    sub(pre + arr[cur], cur + 1);
    //  2.这个字符不加进来
    sub(pre, cur + 1);
  }


  /*二进制法*/
  static Set<String> set = new HashSet<>();

  private static void f(char[] arr) {
    int len = 1 << arr.length;// 10000-1=1111
    for (int i = 1; i < len; i++) {
      // 比对i的二进制，位上为1，代表选择了字符串的那一位
      String s = get(i, arr);
      set.add(s);
    }
    System.out.println(set);
  }

  private static String get(int i, char[] arr) {
    StringBuilder sb = new StringBuilder();
    //询问每一个元素，这个元素选还是不选，取决于i在该位上的二进制是否为1
    for (int j = 0; j < arr.length; j++) {
      int wei = arr.length - j - 1;
      if (((i >> wei) & 1) == 1) {
        sb.append(arr[j]);
      }
    }
    return sb.toString();
  }


}
