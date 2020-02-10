package org.lanqiao.algo.lanqiaobei.programming;

import java.time.Instant;

/**
 * 给定一个长度为n英寸的钢条和一个价格表pi(i=1,2,3,...n)表示不同长度的钢条的售价,
 * 求能够使销售收益rn最大的切割方案。<br>
 * 
 * 
 * @author zhengwei lastmodified 2017年4月6日
 *
 */
public class CutRod {
	/**
	 * 递归型，求所有切割方案中售价最高的
	 *
   * @param values
   *          售价数组，下标为钢条长度，元素为售价
	 * @param n
	 *          钢条总长度
	 * @return
	 */
  public static int r1(int values[], int n) {
    if (n == 0) {
			return 0;
		}
		int q = -1000;// 保证程序的顺利启动
		for (int i = 1; i <= n; i++) {
      int value1 = values[i - 1];// 从i处切开，values[i - 1]即长度为i的钢条的价值
      int qq = value1 + r1(values, n - i);//递归求解剩余部分的价值，求和
      //这个价值高于以前的切割方案形成的价值，进行记录
      if (q < qq) {
				q = qq;
			}
		}
		return q;
	}

  static int[] state;

  public static int r_m(int values[], int n) {
    if (n == 0) {
      return 0;
    }
    int q = -1000;// 保证程序的顺利启动
    for (int i = 1; i <= n; i++) {
      int value1 = values[i - 1];// 从i处切开，values[i - 1]即长度为i的钢条的价值
      if (state[n - i] == 0)
        state[n - i] = r_m(values, n - i);//递归求解剩余部分的价值，求和
      int qq = value1 + state[n - i];
      //这个价值高于以前的切割方案形成的价值，进行记录
      if (q < qq) {
        q = qq;
      }
    }
    state[n] = q;
    return q;
  }

  /**
	 * 递推法：求所有切割方案中售价最高的
	 *
   * @param values
   *          售价数组，下标为钢条长度，元素为售价
	 * @param n
	 *          钢条总长度
	 * @return
	 */
  public static int dp(int values[], int n) {
    int r[] = new int[n + 1]; // 保存每种长度的最佳切割售价
		r[0] = 0;
		for (int i = 1; i <= n; i++)// 遍历所有可能的问题规模数
		{
			int q = -100;
			for (int j = 1; j <= i; j++) {
        if ((values[j - 1] + r[i - j]) > q) {
          /* 因为从小规模开始求解，规模扩大后的子问题的状态解都已经存在了，可以直接使用 */
          q = values[j - 1] + r[i - j];
        }
			}
			r[i] = q;
		}
		return r[n];
	}

	public static void main(String[] args) {
    int a[] = {3, 5, 8, 9, 10, 12, 14, 15, 16, 17,
        17, 20, 22, 24, 25, 27, 30, 33, 34, 36,
        7, 39, 41, 44, 45, 47, 50, 51, 53, 55,
                /*356, 57, 59, 60 */};// 钢条分割的价格数组
    state = new int[a.length + 1];
    Instant now = Instant.now();
		System.out.println("切割最大价值为："+r1(a, a.length));
		System.out.println("r1持续时间(毫秒)：" + (Instant.now().toEpochMilli() - now.toEpochMilli()));
    //
    now = Instant.now();
		System.out.println("切割最大价值为："+r_m(a, a.length));
		System.out.println("r_m持续时间(毫秒)：" + (Instant.now().toEpochMilli() - now.toEpochMilli()));

    // now = Instant.now();
    // System.out.println("切割最大价值为："+dp(a, a.length));
    // System.out.println("dp持续时间(毫秒)：" + (Instant.now().toEpochMilli() - now.toEpochMilli()));
  }
}
