package org.lanqiao.algo.lanqiaobei.programming;

import org.lanqiao.algo.util.Util;

/**
 * 背包01问题
 *
 * 题目：给定N个项目的权重和价值（利润），将这些项目放入最大容量W的背包中，以获得背包中的最大总值（利润）。 让我们简化问题陈述

 假设我是一个小偷，到达某个地方抢劫，并且没有人在家。

 我为了放置物品而拿的麻袋最多可以承重5公斤。我要偷东西最大利润是多少？(PS纯属虚构)



 输入：

 int knapsackMaxWeight = 5;

 int profit []= {200,240,140,​​150}; //价值

 int weight []= {1，3，2，5}; // 重量



 输出：

 通过选择权重为1和3的项目，我们得到的最大利润是440。
 *
 * @author zhengwei
 */
public class Bag01 {

  static int[] values = {100, 80, 60, 300, 200};
  static int[] weights = {2, 3, 1, 5, 7};
  static int total = 10;

  public static void main(String[] args) {
    // weights = Util.getRandomArr(100, 1, 50);
    // Util.print(weights);
    // values = Util.getRandomArr(100, 1, 30);
    // Util.print(values);
    // total = 100;
    // for (int i = 0; i < state.length; i++) {
    //   for (int j = 0; j < state[i].length; j++) {
    //     state[i][j]=-1;
    //   }
    // }
    // int x = f_m(total, weights.length - 1);
    // System.out.println(x);
    dp();
  }

  /**
   *
   * @param value 现在选择的物品的总价值
   * @param weight 剩余的承重
   * @param index 正在处理的下标，倒着数
   */
  static int f(int value, int weight, int index) {
    if (index == -1 || weight == 0) {
      return value;
    }

    // 当前物品不能放入
    if (weight < weights[index]) {
      return f(value, weight, index - 1);
    } else {
      //能放入，试着放入
      int a = f(value + values[index], weight - weights[index], index - 1);
      //不放入
      int b = f(value, weight, index - 1);
      return Math.max(a, b);
    }
  }

  static int[][] state = new int[100 + 1][100 + 1];//不同的物品范围下不同的容量能装出来的最大价值

  /**
   *
   * @param weight 容量
   * @param index 索引
   * @return
   */
  static int f_m(int weight, int index) {
    if (weight == 0) {
      return 0;
    }

    //单独处理第一个物品
    if (index == 0) {
      if (weight > weights[0]) {
        return weights[0];
      } else {
        return 0;
      }
    }

    // 当前物品不能放入
    int w = weights[index];
    if (weight < w) {
      if (state[index - 1][weight] == -1) {
        state[index - 1][weight] = f_m(weight, index - 1);
      }
      return state[index - 1][weight];
    } else {
      //能放入，试着放入
      if (state[index - 1][weight - w] == -1) {
        state[index - 1][weight - w] = f_m(weight - w, index - 1);
      }
      //不放入
      if (state[index - 1][weight] == -1) {
        state[index - 1][weight] = f_m(weight, index - 1);
      }
      return Math.max(values[index] + state[index - 1][weight - w], // 选
          state[index - 1][weight]);  // 不选
    }
  }


  /***
   * 递推
   */
  static void dp() {
    int[][] state = new int[weights.length][total + 1];
    // row 行号
    int row = weights.length - 1;
    //物品序号，先处理第一个物品
    int index = 0;
    //v是容量
    int v = 1;
    int w = weights[index];
    for (; v < total + 1; v++) {
      if (v >= w) { // 要的起，格子里面填写当前物品的价值
        state[row][v] = values[index];
      } else {
        state[row][v] = 0;
      }
    }

    for (int r = row - 1; r >= 0; r--) {
      //当前物品的序号
      index = weights.length - 1 - r;
      w = weights[index];
      //r 当前处理的行
      for (int c = 1; c < total + 1; c++) {
        //c 当前处理的容量
        //能抓
        if (c >= w) {
          //  要抓
          int v1 = values[index] + state[r + 1][c - w];
          // 不抓
          int v2 = state[r + 1][c];
          state[r][c] = Math.max(v1, v2);
        } else { // 不能抓
          state[r][c] = state[r + 1][c];
        }
      }
    }
    System.out.println(state[0][total]);

  }
}
