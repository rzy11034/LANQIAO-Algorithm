package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 *
 煤球数目

 有一堆煤球，堆成三角棱锥形。具体：
 第一层放1个，
 第二层3个（排列成三角形），
 第三层6个（排列成三角形），
 第四层10个（排列成三角形），
 ....
 如果一共有100层，共有多少个煤球？

 请填表示煤球总数目的数字。
 注意：你提交的应该是一个整数，不要填写任何多余的内容或说明性文字。

 */
public class jieguo_7_2煤球数目 {
  //  excel就可以解决问题
  public static void main(String[] args) {
    int sum = 0;
    int temp = 0;
    for (int i = 1; i <= 100; i++) {
      temp = temp + i;
      sum += temp;
    }
    System.out.println(sum);
  }
}

