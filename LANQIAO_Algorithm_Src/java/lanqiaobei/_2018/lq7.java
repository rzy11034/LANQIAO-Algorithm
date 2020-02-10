package org.lanqiao.algo.lanqiaobei._2018;

import org.lanqiao.algo.util.Util;

/*
标题：缩位求和

在电子计算机普及以前，人们经常用一个粗略的方法来验算四则运算是否正确。
比如：248 * 15 = 3720
把乘数和被乘数分别逐位求和，如果是多位数再逐位求和，直到是1位数，得
2 + 4 + 8 = 14 ==> 1 + 4 = 5;
1 + 5 = 6
5 * 6
而结果逐位求和为 3
5 * 6 的结果逐位求和与3符合，说明正确的可能性很大！！（不能排除错误）

请你写一个计算机程序，对给定的字符串逐位求和：
输入为一个由数字组成的串，表示n位数(n<1000);
输出为一位数，表示反复逐位求和的结果。

例如：
输入：
35379

程序应该输出：
9

再例如：
输入：
7583676109608471656473500295825

程序应该输出：
1


资源约定：
峰值内存消耗（含虚拟机） < 256M
CPU消耗  < 1000ms


请严格按要求输出，不要画蛇添足地打印类似：“请您输入...” 的多余内容。

所有代码放在同一个源文件中，调试通过后，拷贝提交该源码。
不要使用package语句。不要使用jdk1.7及以上版本的特性。
主类的名字必须是：Main，否则按无效代码处理。
*/
public class lq7 {
  public static void main(String[] args) {
    int res = solution("35379");  // solution("7583676109608471656473500295825");
    System.out.println(res);
  }

  static int[] str2IntArr(String src) {
    char[] a = src.toCharArray();
    int[] arr = new int[a.length];
    for (int i = 0; i < a.length; i++) {
      arr[i] = a[i] - '0';
    }
    return arr;
  }

  static int solution(String src) {
    int[] arr = str2IntArr(src);
    // Util.print(arr);
    int res = sum(arr);
    while (res > 9) {
      res = sum(str2IntArr("" + res));
    }
    return res;
  }

  private static int sum(int[] arr) {
    int sum = 0;
    for (int a :
        arr) {
      sum += a;
    }
    return sum;
  }
}
