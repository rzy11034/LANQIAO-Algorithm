package org.lanqiao.algo.lanqiaobei._04math;

import java.util.Scanner;

/**
 * 高僧斗法

 古时丧葬活动中经常请高僧做法事。仪式结束后，有时会有“高僧斗法”的趣味节目，以舒缓压抑的气氛。

 节目大略步骤为：先用粮食（一般是稻米）在地上“画”出若干级台阶（表示N级浮屠）。又有若干小和尚随机地“站”在某个台阶上。最高一级台阶必须站人，其它任意。(如图1所示)

 两位参加游戏的法师分别指挥某个小和尚向上走任意多级的台阶，但会被站在高级台阶上的小和尚阻挡，不能越过。两个小和尚也不能站在同一台阶，也不能向低级台阶移动。

 两法师轮流发出指令，最后所有小和尚必然会都挤在高段台阶，再也不能向上移动。轮到哪个法师指挥时无法继续移动，则游戏结束，该法师认输。

 对于已知的台阶数和小和尚的分布位置，请你计算先发指令的法师该如何决策才能保证胜出。

 输入数据为一行用空格分开的N个整数，表示小和尚的位置。台阶序号从1算起，所以最后一个小和尚的位置即是台阶的总数。（N<100,
 台阶总数<1000）

 输出为一行用空格分开的两个整数: A B, 表示把A位置的小和尚移动到B位置。若有多个解，输出A值较小的解，若无解则输出-1。

 例如：

 用户输入：

 1 5 9

 则程序输出：

 1 4

 再如：

 用户输入：

 1 5 8 10

 则程序输出：

 1 3

 资源约定：

 峰值内存消耗 < 64M

 CPU消耗 < 1000ms

 请严格按要求输出，不要画蛇添足地打印类似：“请您输入…” 的多余内容。

 所有代码放在同一个源文件中，调试通过后，拷贝提交该源码。
 */
public class 高僧斗法 {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String[] ss = scanner.nextLine().split(" ");
    int[] x = new int[ss.length];
    //将小和尚的位置作为数组元素的值
    for (int i = 0; i < x.length; i++)
      x[i] = Integer.parseInt(ss[i]);
    if (!f1(x)) {
      System.out.println(-1);
    } else {
      System.out.println(a + " " + b);
    }
  }

  static int a;
  static int b;

  private static boolean f(int[] x) {
    for (int i = 0; i < x.length - 1; i++) {
      //i位置向后尝试每一个可走的位置
      for (int j = x[i] + 1; j < x[i + 1]; j++) {
        int old = x[i];//记录i位置的原始值
        x[i] = j; //该表i位置的值
        try {
          //生成新的局面，如果这个局面判定对方输，那我们就赢了
          if (!f(x)) {
            a = old;
            b = j;
            return true;
          }
        } finally {
          x[i] = old;// 回复i位置的值，进行下一次尝试
        }
      }
    }
    //for循环无法进行，或者整个for循环走完都没有一次变动能造成对方输，就返回false
    return false;
  }

  static boolean f1(int[] x) {
    int[] N = new int[x.length / 2];// 堆的大小
    for (int i = 0; i < N.length; i++) {
      N[i] = x[2 * i + 1] - x[2 * i] - 1;// 计算每个堆的数字
    }
    int k = N[0];
    for (int i = 1; i < N.length; i++) {
      k ^= N[i]; //连续做异或
    }
    // 现在异或不为0
    if (k != 0) {
      // 找到ni，其x位（k最高位）为1
      String kBinary = Integer.toBinaryString(k);
      for (int i = 0; i < N.length; i++) {
        //当前堆数字的二进制字符串
        String NiBinary = Integer.toBinaryString(N[i]);
        try {
          //右对齐后和k最高位在同一列的二进制为1
          if (NiBinary.charAt(NiBinary.length() - kBinary.length()) == '1') {
            a = x[2 * i];  // 首动位置找到了
            //现在Ni 变为Ni' 是的全体异或为0 只需把k所有为1的位对应的Ni上的位变换
            int Nii = N[i];
            for (int j = 0; j < kBinary.length(); j++) {
              if (kBinary.charAt(j) == '1')
                Nii ^= (1 << (kBinary.length() - j - 1));
            }

            // N[i]变为Nii肯定是缩小了，缩小的数就是a应该前进的数
            b = a + N[i] - Nii;
            break;
          }
        } catch (Exception e) {
          // 位数不够
        }
      }
      return true;
    }
    return false;
  }
}
