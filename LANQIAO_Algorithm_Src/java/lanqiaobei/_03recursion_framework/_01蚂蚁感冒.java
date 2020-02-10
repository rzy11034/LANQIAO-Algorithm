package org.lanqiao.algo.lanqiaobei._03recursion_framework;

import java.util.Scanner;

/**
 * 14年第五届蓝桥杯第七题_蚂蚁感冒_(思维)
 长100厘米的细长直杆子上有n只蚂蚁。它们的头有的朝左，有的朝右。
 每只蚂蚁都只能沿着杆子向前爬，速度是1厘米/秒。 当两只蚂蚁碰面时，它们会同时掉头往相反的方向爬行。
 这些蚂蚁中，有1只蚂蚁感冒了。并且在和其它蚂蚁碰面时，会把感冒传染给碰到的蚂蚁。
 请你计算，当所有蚂蚁都爬离杆子时，有多少只蚂蚁患上了感冒。
 【数据格式】

 第一行输入一个整数n (1 < n < 50), 表示蚂蚁的总数。

 接着的一行是n个用空格分开的整数 Xi (-100 < Xi < 100), Xi的绝对值，表示蚂蚁离开杆子左边端点的距离。
 正值表示头朝右，负值表示头朝左，数据中不会出现0值，也不会出现两只蚂蚁占用同一位置。
 其中，第一个数据代表的蚂蚁感冒了。

 要求输出1个整数，表示最后感冒蚂蚁的数目。

 例如，输入：

 3

 5 -2 8

 程序应输出：

 1

 再例如，输入：

 5

 -10 8 -20 12 25

 程序应输出：

 3

 资源约定：

 峰值内存消耗 < 256M

 CPU消耗 < 1000ms
 */
public class _01蚂蚁感冒 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int N = scanner.nextInt();
    int[] arr = new int[N];
    for (int i = 0; i < N; i++) {
      arr[i] = scanner.nextInt();
    }

    int res = solution(arr, N, 0);
    System.out.println(res);
  }

  private static int solution(int[] arr, int n, int index) {
    int count = 1;
    int l = 0;
    int r = 0;
    //头朝左
    if (arr[index] < 0) {
      //先看左边有没有向右的，把数量计算出来
      for (int i = 0; i < n; i++) {
        if (arr[i] * arr[index] < 0 && arr[i] < -arr[index]) {
          l++;
        }
      }
      //如果有碰面的，就要考虑右边
      if (l > 0) {
        for (int i = 0; i < n; i++) {
          if (arr[i] * arr[index] > 0 && -arr[i] > -arr[index]) {
            r++;
          }
        }
      }
    } else {
      //先看you边有没有向左的，把数量计算出来
      for (int i = 0; i < n; i++) {
        if (arr[i] * arr[index] < 0 && -arr[i] > arr[index]) {
          r++;
        }
      }
      //如果有碰面的，就要考虑右边
      if (r > 0) {
        for (int i = 0; i < n; i++) {
          if (arr[i] * arr[index] > 0 && arr[i] < arr[index]) {
            l++;
          }
        }
      }
    }


    return count + l + r;
  }
}
