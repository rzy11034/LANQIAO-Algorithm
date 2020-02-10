package org.lanqiao.algo.lanqiaobei._03recursion_framework;

public class _030_可重集的排列 {

  private static int count;

  public static void main(String[] args) {
    int[] arr = {1, 1, 2, 2, 3,};
    solution(arr, 0, new int[arr.length]);
    System.out.println("===" + count);
  }

  /**
   *
   * @param arr
   * @param k 当前处理到第k位
   * @param vis
   */
  private static void solution(int[] arr, int k, int[] vis) {
    if (k == arr.length) {
      for (int i = 0; i < vis.length; i++) {
        System.out.print(vis[i]);
      }
      System.out.println();
      count++;
    }

    //依次尝试把某个数填入排列的当前位置
    for (int i = 0; i < arr.length; i++) {
      final int zhunBeiTianRu = arr[i];
      if (i == 0 || zhunBeiTianRu != arr[i - 1]) { // 正在处理第一位，


        if (check(k, zhunBeiTianRu, vis, arr)) {
          vis[k] = zhunBeiTianRu;
          solution(arr, k + 1, vis);
        }
      }
    }
  }

  static boolean check(int k, int zhunBeiTianRu, int[] vis, int[] arr) {
    int c1 = 0;//准备填入的这个元素在前缀中出现的次数
    int c2 = 0;//计数，准备填入的这个元素整个串中出现的总次数

    //在已排好的串中这个字符出现的次数
    for (int j = 0; j < k; j++) {
      if (zhunBeiTianRu == vis[j]) c1++;
    }

    //累计总次数
    for (int j = 0; j < arr.length; j++) {
      if (zhunBeiTianRu == arr[j]) c2++;
    }
    return c1 < c2;
  }
}
