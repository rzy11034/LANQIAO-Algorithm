package org.lanqiao.algo.lanqiaobei._02recursion;

public class _02翻转串 {

  public static void main(String[] args) {
    System.out.println(reverse("abcd"));

    // System.out.println(new StringBuilder("abcd").reverse().toString());
  }

  private static String reverse(String src) {
    if (src.length() == 1) return src;
    if (src.length() == 0) return src;

    return reverse(src.substring(1)) + src.charAt(0);  // 翻转一个字符串=翻转第1位后的子串+第0位的字符
  }
}
