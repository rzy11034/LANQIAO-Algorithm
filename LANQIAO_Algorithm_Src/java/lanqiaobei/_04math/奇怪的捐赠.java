package org.lanqiao.algo.lanqiaobei._04math;

import java.util.Scanner;

/**
 地产大亨Q先生临终的遗愿是：拿出100万元给X社区的居民抽奖，以稍慰藉心中愧疚。
 麻烦的是，他有个很奇怪的要求：
 1. 100万元必须被正好分成若干份（不能剩余）。
 每份必须是7的若干次方元。
 比如：1元, 7元，49元，343元，...

 2. 相同金额的份数不能超过5份。

 3. 在满足上述要求的情况下，分成的份数越多越好！

 请你帮忙计算一下，最多可以分为多少份？
 */
//进制问题
public class 奇怪的捐赠 {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    //一个数字的7进制表示
    String s = Integer.toString(sc.nextInt(), 7);
    int count = 0;
    for (int i = 0; i < s.length(); i++) {
      count += s.charAt(i) - '0';
    }
    System.out.println(count);
  }

}
