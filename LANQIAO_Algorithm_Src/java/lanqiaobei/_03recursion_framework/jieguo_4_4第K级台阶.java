package org.lanqiao.algo.lanqiaobei._03recursion_framework;

import java.util.Scanner;

/*
*
标题: 第K级台阶

小明刚刚看完电影《第K级台阶》，离开电影院的时候，他数了数礼堂前的台阶数，恰好是K级!

站在台阶前，他突然又想着一个问题：

如果我每一步只能迈上1个或2个台阶。先迈左脚，然后左右交替，最后一步是迈右脚，

也就是说一共要走偶数步。那么，上完K级台阶，有多少种不同的上法呢？

请你利用计算机的优势，帮助小明寻找答案。

*/
public class jieguo_4_4第K级台阶 {

  static int count;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    solution(sc.nextInt(), 0);
    System.out.println(count);
  }

  /**
   *
   * @param k 剩余的台阶数
   * @param step 步数
   */
  private static void solution(int k, int step) {
    if (k<0) return;
    //走完了
    if (k==0&&step%2==0){
      count++;
      return;
    }
    solution(k-1,step+1);
    solution(k-2,step+1);
  }
}
