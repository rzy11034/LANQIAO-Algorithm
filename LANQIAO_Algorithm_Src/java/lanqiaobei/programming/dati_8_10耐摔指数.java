package org.lanqiao.algo.lanqiaobei.programming;

/**
 *
 标题：耐摔指数

 x星球的居民脾气不太好，但好在他们生气的时候唯一的异常举动是：摔手机。
 各大厂商也就纷纷推出各种耐摔型手机。x星球的质监局规定了手机必须经过耐摔测试，并且评定出一个耐摔指数来，之后才允许上市流通。

 x星球有很多高耸入云的高塔，刚好可以用来做耐摔测试。塔的每一层高度都是一样的，与地球上稍有不同的是，他们的第一层不是地面，而是相当于我们的2楼。

 如果手机从第7层扔下去没摔坏，但第8层摔坏了，则手机耐摔指数=7。
 特别地，如果手机从第1层扔下去就坏了，则耐摔指数=0。
 如果到了塔的最高层第n层扔没摔坏，则耐摔指数=n

 为了减少测试次数，从每个厂家抽样3部手机参加测试。

 如果已知了测试塔的高度，并且采用最佳策略，在最坏的运气下最多需要测试多少次才能确定手机的耐摔指数呢？

 输入数据，一个整数n（3<n<10000）,表示测试塔的高度。
 输出一个整数，表示最多测试多少次。

 例如：
 输入：
 3

 程序应该输出：
 2

 解释：
 手机a从2楼扔下去，坏了，就把b手机从1楼扔；否则a手机继续3层扔下

 再例如：
 输入：
 7

 程序应该输出：
 3

 解释：
 a手机从4层扔，坏了，则下面有3层，b,c 两部手机2次足可以测出指数；
 若是没坏，手机充足，上面5,6,7 三层2次也容易测出。


 资源约定：
 峰值内存消耗（含虚拟机） < 256M
 CPU消耗  < 1000ms


 请严格按要求输出，不要画蛇添足地打印类似：“请您输入...” 的多余内容。

 注意：
 main函数需要返回0;
 只使用ANSI C/ANSI C++ 标准;
 不要调用依赖于编译环境或操作系统的特殊函数。
 所有依赖的函数必须明确地在源文件中 #include <xxx>
 不能通过工程设置而省略常用头文件。

 提交程序时，注意选择所期望的语言类型和编译器类型。


 ---------------------------------
 笨笨有话说：
 我觉得3个手机太难了，要是2个手机还可以考虑一下。

 歪歪有话说：
 想什么呢，你！要是1部手机还用你编程啊？那样的话只好从下往上一层一层测。

 */
public class dati_8_10耐摔指数 {
  // 返回在拥有t部手机时要测出h层内的指数，需要多少次测试
  static int solution1(int h, int t) {
    //一层楼，只要有手机，只需一次测试
    if (h == 1 && t >= 1) return 1;
    //没有楼，返回0
    if (h == 0) return 0;
    // 没有手机了，返回0
    if (t == 0) return 0;
    //只有一部手机，只能一层一层地测，测试数=层数
    if (t == 1) return h;

    int min = Integer.MAX_VALUE;
    //尝试直接从某一层开摔
    for (int cengShu = 1; cengShu <= h; cengShu++) {
      //两种情况，一种情况：手机坏了，那么在下面的那些层里面找答案
      int a = 1 + solution1(cengShu - 1, t - 1);
      //第二种情况，没坏，用现在的手机数去测试上面的h-cengshu层
      int b = 1 + solution1(h - cengShu, t);
      int tmp = Math.max(a, b);
      if (tmp < min) {
        min = tmp;
      }
    }
    return min;
  }

  static int[][] state;

  /**
   *
   * @param h 楼层
   * @param t 手机数
   * @return
   */
  static int f(int h, int t) {
    //一层楼，只要有手机，只需一次测试
    if (h == 1 && t >= 1) return 1;
    //没有楼，返回0
    if (h == 0) return 0;
    // 没有手机了，返回0
    if (t == 0) return 0;
    //只有一部手机，只能一层一层地测，测试数=层数
    if (t == 1) return h;

    int min = Integer.MAX_VALUE;
    //尝试每一层
    for (int cengShu = 1; cengShu <= h; cengShu++) {
      //两种情况，一种情况：手机坏了，用更少的手机去测下面的h-1层
      if (state[cengShu - 1][t - 1] == -1)
        state[cengShu - 1][t - 1] = f(cengShu - 1, t - 1);
      //第二种情况，没坏，用现在的手机数去测试h-i层
      if (state[h - cengShu][t] == -1)
        state[h - cengShu][t] = f(h - cengShu, t);
      int tmp = Math.max(state[cengShu - 1][t - 1], state[h - cengShu][t]);
      if (tmp < min) {
        min = tmp + 1;
      }
    }
    state[h][t] = min;
    return min;
  }

  public static void main(String[] args) {
   /* int N = 1000;
    state = new int[N + 1][N + 1];
    for (int i = 0; i < state.length; i++) {
      for (int j = 0; j < state[i].length; j++) {
        state[i][j] = -1;
      }
    }
    // for(int i=1; i<101; i++){
    System.out.println(N + "楼===" + f(N, 3));
    // }

    m1();*/
    int res = solution1(100, 3);
    System.out.println(res);
  }

  private static void m1() {
    // Scanner scan = new Scanner(System.in);
    int n = 1000;/*Integer.parseInt(scan.nextLine().trim());*/

    int[] ff = new int[100];
    int[] gg = new int[100];

    ff[1] = 1;
    ff[2] = 3;
    for (int i = 3; i < 100; i++)
      ff[i] = ff[i - 1] + i;
    gg[1] = 1;
    for (int i = 2; i < 100; i++)
      gg[i] = ff[i - 1] + 1 + gg[i - 1];

    for (int i = 1; i < 100; i++) {
      if (gg[i] >= n) {
        //System.out.println(i + ": " + gg[i]);
        System.out.println(i);
        break;
      }
    }
  }
}