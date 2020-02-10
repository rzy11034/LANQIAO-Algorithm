package org.lanqiao.algo.lanqiaobei.programming;

/**
 有一个XxY的网格，一个机器人只能走格点且只能向右或向下走，要从左上角走到右下角。
 请设计一个算法，计算机器人有多少种走法。注意这次的网格中有些障碍点是不能走的。

 给定一个int[][] map(C++ 中为vector >),表示网格图，若map[i][j]为1则说明该点不是障碍点，
 否则则为障碍。
 另外给定int x,int y，表示网格的大小。请返回机器人从(0,0)走到(x - 1,y - 1)的走法数，
 为了防止溢出，请将结果Mod 1000000007。保证x和y均小于等于50 */
public class _9_2机器人走格子II {
  public static void main(String[] args) {
    int[][] map = {
        {1, 1, 0},
        {1, 1, 1},
        {1, 0, 1},
    };
    System.out.println(countWays(map, 0, 0));
  }

  public static int countWays(int[][] map, int x, int y) {
    if (map[x][y] != 1) return 0;
    if ((x == map.length - 1 && y == map[0].length - 1)) return 1;
    if (x == map.length - 1) return countWays(map, x, y + 1) % 1000000007;
    if (map[0].length - 1 == y) return countWays(map, x + 1, y) % 1000000007;
    return (countWays(map, x + 1, y) % 1000000007 + countWays(map, x, y + 1) % 1000000007) % 1000000007;
  }
}
