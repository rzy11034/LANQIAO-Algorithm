package org.lanqiao.algo.lanqiaobei._02recursion;
/*
* 第五届蓝桥杯决赛 第二题 出栈次序（catalan数）
* 出栈次序

X星球特别讲究秩序，所有道路都是单行线。一个甲壳虫车队，共16辆车，按照编号先后发车，夹在其它车流中，缓缓前行。
路边有个死胡同，只能容一辆车通过，是临时的检查站，如图【p1.png】所示。
X星球太死板，要求每辆路过的车必须进入检查站，也可能不检查就放行，也可能仔细检查。
如果车辆进入检查站和离开的次序可以任意交错。那么，该车队再次上路后，可能的次序有多少种？
为了方便起见，假设检查站可容纳任意数量的汽车。
显然，如果车队只有1辆车，可能次序1种；2辆车可能次序2种；3辆车可能次序5种。
现在足足有16辆车啊，亲！需要你计算出可能次序的数目。*/


public class _04出栈顺序 {
  public static void main(String[] args) {
    System.out.println(solution(16,0));
    System.out.println(f(16, 0));
  }

  static int f(int x, int y) {
    if (x == 0) return 1;
    if (y == 16) return 1;

    if (y == 0) return f(x - 1, y + 1);

    // 进去一个，不动
    // 进去一个，立即走
    // 不进去，弹一个
    // 第二步等于第一步+第三部
    return f(x - 1, y + 1) +/*f(x-1,y)+*/f(x, y - 1);
  }



  private static int solution(int zhanwai, int zhannei) {
    if (zhanwai==0)return 1;
    if (zhannei==0)
      return solution(zhanwai-1,1);
    else
      return solution(zhanwai-1,zhannei+1)+solution(zhanwai,zhannei-1);
  }
}
