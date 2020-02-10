package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 * jieguo_7_3平方怪圈

 如果把一个正整数的每一位都平方后再求和，得到一个新的正整数。
 对新产生的正整数再做同样的处理。

 如此一来，你会发现，不管开始取的是什么数字，
 最终如果不是落入1，就是落入同一个循环圈。

 请写出这个循环圈中最大的那个数字。

 请填写该最大数字。
 注意：你提交的应该是一个整数，不要填写任何多余的内容或说明性文字。

 注：此题主要考虑分离各位上的数字
 */
public class jieguo_7_3平方怪圈 {
  public static void main(String[] args) {
    String i = "9";
    int[] res = getNum(i);
    int max = 0;
    for (int k = 0; k < 10000; k++) {
      int pingfanghe = 0;
      for (int j = 0; j < res.length; j++) {
        pingfanghe += res[j] * res[j];
      }
      // System.out.println(pingfanghe);
      if (pingfanghe > max)
        max = pingfanghe;
      res = getNum(pingfanghe + "");
    }
    System.out.println(max);
  }


  /**
   * 给定1234
   * 模运算可以去高位
   * 除运算可保留高位
   * @param s
   * @return 1, 2, 3, 4
   */
  static int[] getNum(String s) {
    int len = s.length();
    int[] res = new int[len];
    //字符串转换为int
    int number = Integer.parseInt(s);
    for (int i = 0; i < len; i++) {
      res[i] = number / (int) Math.pow(10, len - i - 1);
      number = number % (int) Math.pow(10, len - i - 1);
    }
    return res;
  }

}
