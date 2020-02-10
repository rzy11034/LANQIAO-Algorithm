package org.lanqiao.algo.lanqiaobei.programming;

import org.lanqiao.algo.util.Util;

//动态规划（三）暴力递归的优化之路——数字矩阵的最小路径和 - CSDN博客
//https://blog.csdn.net/zhengwei223/article/details/78763904
public class 数字矩阵的最小路径和 {
  /**
   * 暴力递归法
   * @param arr
   * @param x
   * @param y
   * @return
   */
  public static int minSum(int[][] arr, int x, int y) {
    int sum = 0;
    if (x == arr.length - 1) {//到达右下角只有一条路可走
      for (int i = y; i < arr[0].length; i++) {
        sum += arr[x][i];
      }
      return sum;
    }
    if (y == arr[0].length - 1) {//到达右下角只有一条路可走
      for (int i = x; i < arr.length; i++) {
        sum += arr[i][y];
      }
      return sum;
    }
    return arr[x][y] + Math.min(minSum(arr, x + 1, y), minSum(arr, x, y + 1));
  }

  /**
   * 记忆型递归
   * @param arr
   * @param x
   * @param y
   * @param map
   * @return
   */
  public static int minSumMemory(int[][] arr, int x, int y, int[][] map) {
    int sum = 0;
    if (x == arr.length - 1) {//到达右下角只有一条路可走
      for (int i = y; i < arr[0].length; i++) {
        sum += arr[x][i];
      }
      map[x][y] = sum; // 缓存
      return sum;
    }
    if (y == arr[0].length - 1) {//到达右下角只有一条路可走
      for (int i = x; i < arr.length; i++) {
        sum += arr[i][y];
      }
      map[x][y] = sum;//缓存
      return sum;
    }
    //=====判断缓存，没有值再递归，保证一个xy组合只计算一次=====
    int v1 = map[x + 1][y];
    if (v1 == 0)
      v1 = minSum(arr, x + 1, y);
    int v2 = map[x][y + 1];
    if (v2 == 0)
      v2 = minSum(arr, x, y + 1);

    sum = arr[x][y] + Math.min(v1, v2);
    map[x][y] = sum; // 缓存
    return sum;
  }

  /**
   * 动态规划法
   * @param arr
   * @return
   */
  public static int dp1(int[][] arr) {
    final int rows = arr.length;
    final int cols = arr[0].length;
    int[][] dp = new int[rows][cols];
    dp[rows - 1][cols - 1] = arr[rows - 1][cols - 1];
    //打表：最右一列
    for (int i = rows - 2; i >= 0; i--) {
      dp[i][cols - 1] = arr[i][cols - 1] + dp[i + 1][cols - 1];
    }
    //打表：最后一行
    for (int i = cols - 2; i >= 0; i--) {
      dp[rows - 1][i] = arr[rows - 1][i] + dp[rows - 1][i + 1];
    }
    for (int i = rows - 2; i >= 0; i--) {
      for (int j = cols - 2; j >= 0; j--) {
        dp[i][j] = arr[i][j] + Math.min(dp[i + 1][j], dp[i][j + 1]);
      }
    }
    return dp[0][0];
  }

  /**
   * 空间压缩优化
   * @param arr
   * @return
   */
  public static int dp2(int[][] arr) {
    final int rows = arr.length;
    final int cols = arr[0].length;
    int N = 0;
    if (rows >= cols) {
      N = cols;
    }
    int[] dp = new int[N];
    dp[N - 1] = arr[rows - 1][N - 1];
    //打表:第一次更新
    for (int i = N - 2; i >= 0; i--) {
      dp[i] = arr[rows - 1][i] + dp[i + 1];
    }
    // 行
    for (int i = rows - 2; i >= 0; i--) {
      dp[N - 1] = arr[i][N - 1] + dp[N - 1];
      for (int j = N - 2; j >= 0; j--) {
        dp[j] = arr[i][j] + Math.min(dp[j], dp[j + 1]);
      }
      // Util.print(dp);
    }
    return dp[0];
  }

  public static void main(String[] args) {
    final int[][] matrix = {
        {1, 3, 5, 9},
        {8, 1, 3, 4},
        {5, 0, 6, 1},
        {8, 8, 4, 0},
    };
    // System.out.println(minSum(matrix, 0, 0));
    // System.out.println(minSumMemory(matrix, 0, 0, new int[4][4]));
    //
    // System.out.println(dp1(matrix));
    System.out.println(dp2(matrix));
  }
}
