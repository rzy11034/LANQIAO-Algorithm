package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.util.*;

/**
 *
 *
 第四届蓝桥杯，结果填空题
 标题: 马虎的算式


 小明是个急性子，上小学的时候经常把老师写在黑板上的题目抄错了。

 有一次，老师出的题目是：36 x 495 = ?

 他却给抄成了：396 x 45 = ?

 但结果却很戏剧性，他的答案竟然是对的！！

 因为 36 * 495 = 396 * 45 = 17820

 类似这样的巧合情况可能还有很多，比如：27 * 594 = 297 * 54

 假设 a b c d e 代表1~9不同的5个数字（注意是各不相同的数字，且不含0）

 能满足形如： ab * cde = adb * ce 这样的算式一共有多少种呢？


 请你利用计算机的优势寻找所有的可能，并回答不同算式的种类数。

 满足乘法交换律的算式计为不同的种类，所以答案肯定是个偶数。


 答案直接通过浏览器提交。
 注意：只提交一个表示最终统计种类数的数字，不要提交解答过程或其它多余的内容。

 */
public class jieguo_4_3马虎的算式 {
  public static void main(String[] args) {
    int count = 0;
    for (int a = 1; a < 10; a++) {
      for (int b = 1; b < 10; b++) {
        for (int c = 1; c < 10; c++) {
          for (int d = 1; d < 10; d++) {
            for (int e = 1; e < 10; e++) {
              //判断这五个数字有没有重复的

              int[] arr = new int[]{a, b, c, d, e};
              if (isOk2(arr) && (a * 10 + b) * (c * 100 + d * 10 + e) == (a * 100 + d * 10 + b) * (c * 10 + e)) {
                System.out.println((a * 10 + b) + "*" + (c * 100 + d * 10 + e) + "==" + (a * 100 + d * 10 + b) + "*" + (c * 10 + e));
                count++;
              }
            }
          }
        }
      }
    }
    System.out.println(count);
  }

  /**
   * 判断这个数组是否含有重复元素
   * 如果没有，返回true
   * 有的话，返回false
   * @param arr
   * @return
   */
  private static boolean isOk(int[] arr) {
    //对arr进行原址排序
    Arrays.sort(arr);
    for (int i = 1; i < arr.length; i++) {
      if (arr[i] == arr[i - 1])
        return false;
    }
    return true;
  }

  private static boolean isOk2(int[] arr) {
    Set<Integer> set = new HashSet<Integer>();
    for (int i = 0; i < arr.length; i++) {
      set.add(arr[i]);
    }
    return set.size() == arr.length;
  }

}
