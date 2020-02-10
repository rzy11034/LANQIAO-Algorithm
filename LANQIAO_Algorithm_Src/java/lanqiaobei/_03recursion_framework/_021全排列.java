package org.lanqiao.algo.lanqiaobei._03recursion_framework;

public class _021全排列 {
  public static void main(String[] args) {
    String s = "123";
    // permutation("", s.toCharArray());
    permutation2(s.toCharArray(), 0);
  }

  /**
   *
   * @param prefix
   * @param arr
   */
  private static void permutation(String prefix, char[] arr) {
    if (prefix.length() == arr.length) {
      System.out.println(prefix);
      return;
    }
    for (int i = 0; i < arr.length; i++) {
      final char zhunBeiTianRu = arr[i];
      if (!prefix.contains(zhunBeiTianRu + ""))
        permutation(prefix + zhunBeiTianRu, arr);
    }
  }

  private static void permutation2(char[] arr, int k) {
    if (k == arr.length) {
      System.out.println(String.valueOf(arr));
    }
    // 尝试把k后面的每个字符都调到k位上
    for (int i = k; i < arr.length; i++) {
      char tmp = arr[k];
      arr[k] = arr[i];
      arr[i] = tmp;// 形成了新状态
      permutation2(arr, k + 1);// 往下走
      tmp = arr[k];
      arr[k] = arr[i];
      arr[i] = tmp;// 往下一个选择走之前，应该恢复上一层的状态

    }

  }
}
