package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.util.Scanner;

/**
 *
 标题：核桃的数量

 小张是软件项目经理，他带领3个开发组。工期紧，今天都在加班呢。为鼓舞士气，小张打算给每个组发一袋核桃（据传言能补脑）。他的要求是：

 1. 各组的核桃数量必须相同
 2. 各组内必须能平分核桃（当然是不能打碎的）
 3. 尽量提供满足1,2条件的最小数量（节约闹革命嘛）

 程序从标准输入读入：
 a b c
 a,b,c都是正整数，表示每个组正在加班的人数，用空格分开（a,b,c<30）

 程序输出：
 一个正整数，表示每袋核桃的数量。

 例如：
 用户输入：
 2 4 5

 程序输出：
 20

 再例如：
 用户输入：
 3 1 1

 程序输出：
 3



 资源约定：
 峰值内存消耗（含虚拟机） < 64M
 CPU消耗  < 1000ms


 请严格按要求输出，不要画蛇添足地打印类似：“请您输入...” 的多余内容。

 所有代码放在同一个源文件中，调试通过后，拷贝提交该源码。
 注意：不要使用package语句。不要使用jdk1.6及以上版本的特性。
 注意：主类的名字必须是：Main，否则按无效代码处理。


 */
public class dati_4_7核桃的数量 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int a = scanner.nextInt();
    int b = scanner.nextInt();
    int c = scanner.nextInt();
    // 求a,b,c的最小公倍数
    for (int i = 1; i <= a * b * c; i++) {
      if (i % a == 0 && i % b == 0 && i % c == 0) {
        System.out.println(i);
        break;
      }
    }
  }
}
