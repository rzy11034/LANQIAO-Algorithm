package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.util.Scanner;

/*
* 九宫幻方
* 题目描述
小明最近在教邻居家的小朋友小学奥数，而最近正好讲述到了三阶幻方这个部分。

三阶幻方指的是将1~9不重复的填入一个3*3的矩阵当中，使得每一行、每一列和每一条对角线的和都是相同的。
三阶幻方又被称作九宫格，在小学奥数里有一句非常有名的口诀： “二四为肩，六八为足，左三右七，戴九履一，五居其中”，
通过这样的一句口诀就能够非常完美的构造出一个九宫格来。

4  9  2
3  5  7
8  1  6
有意思的是，所有的三阶幻方，都可以通过这样一个九宫格进行若干镜像和旋转操作之后得到。
现在小明准备将一个三阶幻（不一定是上图中的那个）中的一些数抹掉，交给邻居家的小朋友来进行还原，
并且希望她能够判断出究竟是不是只有一个解。
而你呢，也被小明交付了同样的任务，但是不同的是，你需要写一个程序~

输入格式： 输入仅包含单组测试数据。 每组测试数据为一个3*3的矩阵，其中为0的部分表示被小明抹去的部分。
对于100%的数据，满足给出的矩阵至少能还原出一组可行的三阶幻方。
输出格式： 如果仅能还原出一组可行的三阶幻方，则将其输出，否则输出“Too Many”（不包含引号）。
样例输入

0  7  2
0  5  0
0  3  0
 样例输出
6  7  2
1  5  9
8  3  4
*/
public class dati_04九宫幻方 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < 9; i++) {
      sb.append(scanner.nextInt());
    }
    String input = sb.toString();
    /*4  9  2
      3  5  7
      8  1  6*/
    String[] ss = {
        "492357816",
        "294753618",
        "276951438",
        "672159834",
        "816357492",
        "618753294",
        "438951276",
        "834159672"};

    int index = 0;
    index = test(ss, input);
    if (index == -1)
      System.out.println("Too Many");
    else
      print(ss[index]);
  }

  private static int test(String[] ss, String input) {
    int count = 0;
    int index = -1;
    for (int j = 0; j < ss.length; j++) {
      //拿一个串出来
      String s = ss[j];
      boolean flag = true;
      for (int i = 0; i < input.length(); i++) {
        if (input.charAt(i) == '0')
          continue;
        if (input.charAt(i) != s.charAt(i)) {
          //当前这个串无法匹配
          flag = false;
          break;
        }
      }
      //匹配，计数
      if (flag) {
        count++;
        //记录匹配的串的下标
        index = j;
      }
    }
    if (count > 1)
      return -1;
    return index;
  }

  private static void print(String s) {
    System.out.println(s.charAt(0) + "  " + s.charAt(1) + "  " + s.charAt(2));
    System.out.println(s.charAt(3) + "  " + s.charAt(4) + "  " + s.charAt(5));
    System.out.println(s.charAt(6) + "  " + s.charAt(7) + "  " + s.charAt(8));
  }
}
