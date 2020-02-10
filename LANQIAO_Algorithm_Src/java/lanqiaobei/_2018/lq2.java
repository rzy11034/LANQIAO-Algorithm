package org.lanqiao.algo.lanqiaobei._2018;

/*
*

标题：猴子分香蕉

5只猴子是好朋友，在海边的椰子树上睡着了。这期间，有商船把一大堆香蕉忘记在沙滩上离去。
第1只猴子醒来，把香蕉均分成5堆，还剩下1个，就吃掉并把自己的一份藏起来继续睡觉。
第2只猴子醒来，重新把香蕉均分成5堆，还剩下2个，就吃掉并把自己的一份藏起来继续睡觉。
第3只猴子醒来，重新把香蕉均分成5堆，还剩下3个，就吃掉并把自己的一份藏起来继续睡觉。
第4只猴子醒来，重新把香蕉均分成5堆，还剩下4个，就吃掉并把自己的一份藏起来继续睡觉。
第5只猴子醒来，重新把香蕉均分成5堆，哈哈，正好不剩！

请计算一开始最少有多少个香蕉。

需要提交的是一个整数，不要填写任何多余的内容。
*/
public class lq2 {
  public static void main(String[] args) {
    for (int i = 6; i < 10000; i++) {
      if (test(i)) {
        System.out.println(i);
        return;
      }
    }
  }

  static boolean test(int x) {
    int tmp = x;
    if ((tmp - 1) % 5 != 0 || tmp <= 0) return false;
    tmp = tmp - 1 - (tmp - 1) / 5;
    if ((tmp - 2) % 5 != 0 || tmp <= 0) return false;
    tmp = tmp - 2 - (tmp - 2) / 5;
    if ((tmp - 3) % 5 != 0 || tmp <= 0) return false;
    tmp = tmp - 3 - (tmp - 3) / 5;
    if ((tmp - 4) % 5 != 0 || tmp <= 0) return false;
    tmp = tmp - 4 - (tmp - 4) / 5;
    return tmp % 5 == 0 && tmp > 0;
  }

}
