package org.lanqiao.algo.lanqiaobei._2018;

import java.util.LinkedList;
import java.util.Queue;
import java.util.TreeSet;

/**
 *
 标题：第几个幸运数

 到x星球旅行的游客都被发给一个整数，作为游客编号。
 x星的国王有个怪癖，他只喜欢数字3,5和7。
 国王规定，游客的编号如果只含有因子：3,5,7,就可以获得一份奖品。

 我们来看前10个幸运数字是：
 3 5 7 9 15 21 25 27 35 45
 因而第11个幸运数字是：49

 小明领到了一个幸运数字 59084709587505，他去领奖的时候，人家要求他准确地说出这是第几个幸运数字，否则领不到奖品。

 请你帮小明计算一下，59084709587505是第几个幸运数字。

 需要提交的是一个整数，请不要填写任何多余内容。
 */
public class lq4 {
  public static void main(String[] args) {
    Queue<Long> q3 = new LinkedList<>();
    Queue<Long> q5 = new LinkedList<>();
    Queue<Long> q7 = new LinkedList<>();
    q3.add(3L);
    q5.add(5L);
    q7.add(7L);
    int count = 3;
    while (true) {
      //来自q3
      Long e3 = q3.peek();
      Long e5 = q5.peek();
      Long e7 = q7.peek();
      long min = Math.min(e3, Math.min(e5, e7));
      if (e3 == min) {
        long x = q3.poll();
        q3.add(x * 3);
        count++;
        if (x * 3 == 59084709587505L) {
          System.out.println(count);
          return;
        }
        q5.add(x * 5);
        count++;
        if (x * 5 == 59084709587505L) {
          System.out.println(count);
          return;
        }
        q7.add(x * 7);
        count++;
        if (x * 7 == 59084709587505L) {
          System.out.println(count);
          return;
        }

      }
      //来自q5
      if (e5 == min) {
        long x = q5.poll();
        q5.add(x * 5);
        count++;
        if (x * 5 == 59084709587505L) {
          System.out.println(count);
          return;
        }
        q7.add(x * 7);
        count++;
        if (x * 7 == 59084709587505L) {
          System.out.println(count);
          return;
        }

      }
      //来自q7
      if (e7 == min) {
        long x = q7.poll();
        q7.add(x * 7);
        count++;
        if (x * 7 == 59084709587505L) {
          System.out.println(count);
          return;
        }

      }
    }

  }
}
