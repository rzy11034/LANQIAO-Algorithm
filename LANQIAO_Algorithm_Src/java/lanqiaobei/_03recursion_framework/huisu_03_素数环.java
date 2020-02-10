package org.lanqiao.algo.lanqiaobei._03recursion_framework;

/**
 * 输入正整数n，对1-n进行排列，使得相邻两个数之和均为素数，
 * 输出时从整数1开始，逆时针排列。同一个环应恰好输出一次。
 * n<=16
 *
 * 如输入：6
 * 输出：
 * 1 4 3 2 5 6
 * 1 6 5 2 3 4
 */
public class huisu_03_素数环 {
  public static void main(String[] args) {
    int n = 16;
    final int[] vis = new int[n];
    vis[0] = 1;
    solution(n, 1, vis);
  }

  private static void solution(int n, int cur, int[] vis) {
    if (cur == n && isP(vis[0] + vis[n - 1])) {
      print_res(vis);
    }
    for (int i = 2; i <= n; i++) {
      //判断是不是选择过了
      boolean ok = true;
      for (int j = 0; j < cur; j++) {
        //已经选择过了
        if (vis[j] == i) {
          ok = false;
          break;
        }
      }
      //可选，并且满足素数要求
      if (ok && isP(vis[cur - 1] + i)) {
        //填入当前关注的位置，继续解下一个位置
        vis[cur] = i;
        solution(n, cur + 1, vis);
      }
    }
  }

  private static void print_res(int[] vis) {
    for (int i = 0; i < vis.length; i++) {
      System.out.print(vis[i] + " ");
    }
    System.out.println();
  }

  private static boolean isP(int k) {
    for (int i = 2; i * i <= k; i++) {
      if (k % i == 0) return false;
    }
    return true;
  }
}
