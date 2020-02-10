package org.lanqiao.algo.lanqiaobei._2018;

/**
 * 标题：书号验证

 2004年起，国际ISBN中心出版了《13位国际标准书号指南》。
 原有10位书号前加978作为商品分类标识；校验规则也改变。
 校验位的加权算法与10位ISBN的算法不同，具体算法是：
 用1分别乘ISBN的前12位中的奇数位（从左边开始数起），用3乘以偶数位，乘积之和以10为模，
 10与模值的差值再对10取模（即取个位的数字）即可得到校验位的值，其值范围应该为0~9。

 下面的程序实现了该算法，请仔细阅读源码，填写缺失的部分。

 */
public class lq5 {
  static boolean f(String s) {
    int k = 1;
    int sum = 0;
    for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if (c == '-' || c == ' ') continue;
      // sum += ______________________________;  //填空
      sum += k % 2 == 0 ? 3 * Integer.valueOf("" + c) : Integer.valueOf("" + c);
      k++;
      if (k > 12) break;
    }

    return s.charAt(s.length() - 1) - '0' == (10 - sum % 10) % 10;
  }

  public static void main(String[] args) {
    System.out.println(f("978-7-301-04815-3"));
    System.out.println(f("978-7-115-38821-6"));
  }
}
