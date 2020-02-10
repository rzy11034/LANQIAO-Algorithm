package org.lanqiao.algo.lanqiaobei.programming;

//n种大小不同的数字ai，每种各mi个，判断是否可以从这些数字中选出若干使它们的和恰好为K
//限制条件
//1<=n<=100
//1<=ai,mi<=100000
//1<=K<=100000
public class 多重部分和 {
  static int n = 3;
  static int K = 17;
  static int[] a = {0, 3, 5, 8};
  static int[] m = {0, 3, 2, 2};

  public static void main(String[] args) {
    solve();
  }

  static void solve() {
    int[][] dp = new int[n + 1][K + 1];
    dp[0][0] = 1;
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= K; j++) {
        // 判断前i个数能都凑出j，判断这个表达式：dp[i-1][j-k*a[i]]为真，即前i-1个数能凑出某数x，而K-x恰好是a[i]的倍数
        for (int k = 0; k <= m[i] && k * a[i] <= j; k++) {
          if (dp[i - 1][j - k * a[i]] == 1) {
            dp[i][j] = 1;
            break;
          }
        }
      }
    }
    System.out.println(dp[n][K]);
  }
}
