package org.lanqiao.algo.lanqiaobei._03recursion_framework;

/**
 * jieguo_7_6全排列应用_凑算式
 * A+B/C+DEF/GHI=10
 *这个算式中A~I代表1~9的数字，不同的字母代表不同的数字。
 * 比如：
 6+8/3+952/714 就是一种解法，
 5+3/1+972/486 是另一种解法。
 这个算式一共有多少种解法？

 注意：你提交应该是个整数，不要填写任何多余的内容或说明性文字。
 * */
public class jieguo_7_6全排列应用_凑算式 {

  static int res;

  public static void main(String[] args) {
    System.out.println(6 + 8.0 / 3 + 952.0 / 714);
    String s = "123456789";
    // _021全排列
    permutation("", s.toCharArray());
    System.out.println(res);
  }

  private static void permutation(String prefix, char[] arr) {
    if (prefix.length() == arr.length) {
      //是否正确的解
      if (test(prefix)) {
        res++;
        System.out.println(prefix.charAt(0) + "+" + prefix.charAt(1) + "/" + prefix.charAt(2) + "+" + prefix.charAt(3) + prefix.charAt(4) + prefix.charAt(5) + "/" + prefix.charAt(6) + prefix.charAt(7) + prefix.charAt(8));
      }
    }
    for (int i = 0; i < arr.length; i++) {
      //这个字符可用
      if (prefix.indexOf(arr[i]) == -1) {
        permutation(prefix + arr[i], arr);
      }
    }
  }

  private static boolean test(String prefix) {
    char[] arr = prefix.toCharArray();
    int[] numArr = new int[arr.length];
    for (int i = 0; i < arr.length; i++) {
      numArr[i] = arr[i] - '0';
    }
    return numArr[0] + Double.valueOf(numArr[1]) / numArr[2] +
        (Double.valueOf(numArr[3]) * 100 + numArr[4] * 10 + numArr[5]) / (numArr[6] * 100 + numArr[7] * 10 + numArr[8]) == 10;
  }
}
