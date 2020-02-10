package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 *
 标题: 猜年龄


 美国数学家维纳(N.Wiener)智力早熟，11岁就上了大学。他曾在1935~1936年应邀来中国清华大学讲学。

 一次，他参加某个重要会议，年轻的脸孔引人注目。于是有人询问他的年龄，他回答说：

 “我年龄的立方是个4位数。我年龄的4次方是个6位数。这10个数字正好包含了从0到9这10个数字，每个都恰好出现1次。”

 请你推算一下，他当时到底有多年轻。

 通过浏览器，直接提交他那时的年龄数字。
 注意：不要提交解答过程，或其它的说明文字。
 */
public class jieguo_4_1猜年龄 {
  public static void main(String[] args) {
    for (int i = 1; i < 50; i++) {
      int a = i * i * i;// (int)Math.pow(i,3)
      int b = a * i;
      if ((a + "").length() == 4 && (b + "").length() == 6) {
        System.out.println(i + " " + a + " " + b);
      }
    }
  }

}
