package org.lanqiao.algo.lanqiaobei._2018;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;
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
public class lq4_1 {
  public static void main(String[] args) {
    Set<Long> set = new TreeSet<>();
    set.add(3l);
    set.add(5l);
    set.add(7l);
    while (true) {
      Long[] arr = new Long[set.size()];
      set.toArray(arr);

      for (int i = 0; i < arr.length; i++) {
        long cheng3 = arr[i] * 3;
        boolean add3 = set.add(cheng3);
        if (add3 && cheng3 == 59084709587505l) {
          System.out.println(set.size());
          return;
        }
        long cheng5 = arr[i] * 5;
        boolean add5 = set.add(cheng5);
        if (add5 && cheng5 == 59084709587505l) {
          System.out.println(set.size());
          return;
        }
        long cheng7 = arr[i] * 7;
        boolean add7 = set.add(cheng7);
        if (add7 && cheng7 == 59084709587505l) {
          System.out.println(set.size());
          return;
        }
      }
    }

  }
}
