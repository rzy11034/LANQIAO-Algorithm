package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.util.Scanner;

/**
 *
 四平方和

 四平方和定理，又称为拉格朗日定理：
 每个正整数都可以表示为至多4个正整数的平方和。
 如果把0包括进去，就正好可以表示为4个数的平方和。

 比如：
 5 = 0^2 + 0^2 + 1^2 + 2^2
 7 = 1^2 + 1^2 + 1^2 + 2^2
 （^符号表示乘方的意思）

 对于一个给定的正整数，可能存在多种平方和的表示法。
 要求你对4个数排序：
 0 <= a <= b <= c <= d
 并对所有的可能表示法按 a,b,c,d 为联合主键升序排列，最后输出第一个表示法


 程序输入为一个正整数N (N<5000000)
 要求输出4个非负整数，按从小到大排序，中间用空格分开

 例如，输入：
 5
 则程序应该输出：
 0 0 1 2

 再例如，输入：
 12
 则程序应该输出：
 0 2 2 2

 再例如，输入：
 773535
 则程序应该输出：
 1 1 267 838

 资源约定：
 峰值内存消耗（含虚拟机） < 256M
 CPU消耗  < 3000ms


 请严格按要求输出，不要画蛇添足地打印类似：“请您输入...” 的多余内容。

 所有代码放在同一个源文件中，调试通过后，拷贝提交该源码。
 注意：不要使用package语句。不要使用jdk1.7及以上版本的特性。
 注意：主类的名字必须是：Main，否则按无效代码处理。

 */
public class dati_7_9四平方和2 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int N = scanner.nextInt();
    long now = System.currentTimeMillis();
    int[] data = new int[N + 1];
    for (int i = 0; i < data.length; i++) {
      data[i] = -1;
    }
    for (int c = 0; c <= (int) Math.sqrt(N / 2); c++) {
      for (int d = 0; d <= (int) Math.sqrt(N); d++) {
        if (d < c) continue;
        if (c * c + d * d > N) continue;
        data[c * c + d * d] = c;

      }
    }

    for (int a = 0; a < 1119; a++) {
      for (int b = 0; b < 1291; b++) {
        if (b < a) continue;
        int A = a * a + b * b;
        int R = N - A;
        if (R < 0)
          continue;
        int c = data[R];
        if (c != -1) {
          System.out.println(a + " " + b + " " + c + " " + (int) (Math.sqrt(R - c * c)));
          System.out.println("时间消耗：" + (System.currentTimeMillis() - now));
          return;
        }
      }
    }

  }
}
