package org.lanqiao.algo.lanqiaobei.programming;

import java.awt.*;
import java.time.Duration;
import java.time.Instant;

/**
 * 数字三角形(POJ1163)<br>
 *
 * 在数字三角形中寻找一条从顶部到底边的路径，使得路径上所经过的数字之和最大。<br>
 * 路径上的每一步都只能往左下或 右下走。只需要求出这个最大和即可，不必给出具体路径。<br>
 * 三角形的行数大于1小于等于100，数字为 0 - 99<br>
 * 输入格式：<br>
 * 5 //表示三角形的行数 接下来输入三角形<br>
 *      7<br>
 *     3 8<br>
 *    8 1 0<br>
 *   2 7 4 4<br>
 *  4 5 2 6 5<br>
 * 要求输出最大和<br>
 *
 * @author zhengwei
 *
 */
public class POJ1163_Triangle {
  public static void main(String[] args) {
    int[][] triangle = {
        {7},
        {3, 8},
        {8, 1, 0},
        {2, 7, 4, 4},
        {4, 5, 2, 6, 5},
        {4, 5, 2, 6, 5, 7},
        {4, 13, 12, 88, 6, 6, 5},
        {3, 8, 7, 11, 9, 22, 66, 3},
    };
    Instant now = Instant.now();
    System.out.println(maxSumUsingRecursive(triangle, 0, 0));
    System.out.println("持续时间为：" + Duration.ofMillis(Instant.now().toEpochMilli() - now.toEpochMilli()).getSeconds());
    now = Instant.now();
    System.out.println(maxSumUsingMemory(triangle, 0, 0, new int[8][8]));
    System.out.println("持续时间为：" + Duration.ofMillis(Instant.now().toEpochMilli() - now.toEpochMilli()).getSeconds());

    System.out.println(maxSumUsingDp(triangle, 0, 0));
  }

  /**
   *
   * @param triangle
   *          数字三角形
   * @param i
   *          起点行号
   * @param j
   *          起点列号
   * @return 计算出的最大和
   */
  public static int maxSumUsingRecursive(int[][] triangle, int i, int j) {
    int rowIndex = triangle.length;
    if (i == rowIndex - 1) {
      return triangle[i][j];
    } else {
      return triangle[i][j]
          + Math.max(maxSumUsingRecursive(triangle, i + 1, j),
          maxSumUsingRecursive(triangle, i + 1, j + 1));
    }
  }

  /**
   * 记忆型递归
   * @param triangle
   * @param i
   * @param j
   * @return
   */
  public static int maxSumUsingMemory(int[][] triangle, int i, int j, int[][] map) {
    int rowIndex = triangle.length;
    int value = triangle[i][j];
    if (i == rowIndex - 1) {
    } else {
      //缓存有值，便不递归
      int v1 = map[i + 1][j];
      if (v1 == 0) {
        v1 = maxSumUsingMemory(triangle, i + 1, j, map);
      }
      //缓存有值，便不递归
      int v2 = map[i + 1][j + 1];
      if (v2 == 0) {
        v2 = maxSumUsingMemory(triangle, i + 1, j + 1, map);
      }
      value = value
          + Math.max(v1, v2);
    }
    //放入缓存
    map[i][j] = value;
    return value;
  }

  public static int maxSumUsingDp(int[][] triangle, int i, int j) {
    int rowCount = triangle.length;
    int columnCount = triangle[rowCount - 1].length;
    int[] states = new int[columnCount];
    for (int k = 0; k < columnCount; k++) {
      states[k] = triangle[rowCount - 1][k];
    }
    for (int row = rowCount - 2; row >= 0; row--) {
      for (int col = 0; col < triangle[row].length; col++) {
        states[col] = triangle[row][col] + Math.max(states[col], states[col + 1]);
      }
    }
    return states[0];
  }

}
