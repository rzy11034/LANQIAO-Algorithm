package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.util.Scanner;

/**
 *
 密码脱落

 X星球的考古学家发现了一批古代留下来的密码。
 这些密码是由A、B、C、D 四种植物的种子串成的序列。
 仔细分析发现，这些密码串当初应该是前后对称的（也就是我们说的镜像串）。
 由于年代久远，其中许多种子脱落了，因而可能会失去镜像的特征。

 你的任务是：
 给定一个现在看到的密码串，计算一下从当初的状态，它要至少脱落多少个种子，才可能会变成现在的样子。

 输入一行，表示现在看到的密码串（长度不大于1000）
 要求输出一个正整数，表示至少脱落了多少个种子。

 例如，输入：
 ABCBA
 则程序应该输出：
 0

 再例如，输入：
 ABDCDCBABC
 则程序应该输出：
 3

 资源约定：
 峰值内存消耗（含虚拟机） < 256M
 CPU消耗  < 3000ms


 请严格按要求输出，不要画蛇添足地打印类似：“请您输入...” 的多余内容。

 所有代码放在同一个源文件中，调试通过后，拷贝提交该源码。
 注意：不要使用package语句。不要使用jdk1.7及以上版本的特性。
 注意：主类的名字必须是：Main，否则按无效代码处理。

 */
public class dati_7_10密码脱落 {
  public static void code(String s) {
    int i = 0, n = 0, ti, tj;
    int j = s.length() - 1;

    while (i <= j) {
      //第一种情况  如果前后相等，则像中间靠拢
      if (s.charAt(i) == s.charAt(j)) {
        i++;
        j--;
      }
      //如果不相等  则又分两种情况
      else {
        ti = i;
        tj = j;
        //以右边为标记  左边为游标  寻找相等的情况
        while (s.charAt(ti) != s.charAt(j) && ti < j) {
          ti++;
        }
        //以左边为标记  右边为游标  寻找相等的情况
        while (s.charAt(i) != s.charAt(tj) && i <= tj) {
          tj--;
        }
        //比较这个游标移动的距离，取小的距离
        if ((ti - i) < (j - tj)) {
          n += ti - i;
          i = ti;     //将i置为新的起点
        } else {
          n += j - tj;
          j = tj;     //将j置为新的终点
        }
      }
    }
    System.out.println(n);
    return;
  }

  public static void main(String[] args) {

    Scanner scanner = new Scanner(System.in);
    code(scanner.next());
  }
}
