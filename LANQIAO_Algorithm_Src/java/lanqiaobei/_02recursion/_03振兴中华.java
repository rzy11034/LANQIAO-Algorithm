package org.lanqiao.algo.lanqiaobei._02recursion;
/*
* 【题目】

标题: 振兴中华


    小明参加了学校的趣味运动会，其中的一个项目是：跳格子。
    地上画着一些格子，每个格子里写一个字，如下所示：（也可参见p1.jpg）

从我做起振
我做起振兴
做起振兴中
起振兴中华

    比赛时，先站在左上角的写着“从”字的格子里，可以横向或纵向跳到相邻的格子里，但不能跳到对角的格子或其它位置。一直要跳到“华”字结束。

    要求跳过的路线刚好构成“从我做起振兴中华”这句话。

    请你帮助小明算一算他一共有多少种可能的跳跃路线呢？

答案是一个整数，请通过浏览器直接提交该数字。
注意：不要提交解答过程，或其它辅助说明类的内容。

*/

public class _03振兴中华 {
  static int count;

  static void f(int x, int y) {
    if (x == 4 || y == 3) {
      count++;
      return;
    }
    f(x + 1, y);
    f(x, y + 1);  // 走法=右边位置的走法数+下边位置的走法数
  }
  public static void main(String[] args) {
    f(0, 0);

    System.out.println("------" + count);
  }
}
