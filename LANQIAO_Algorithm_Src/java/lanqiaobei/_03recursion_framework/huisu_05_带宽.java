package org.lanqiao.algo.lanqiaobei._03recursion_framework;

/**
 * 给出一个n（n≤8）个结点的图G和一个结点的排列，定义结点i的带宽b(i)为i和相邻结点
 在排列中的最远距离，而所有b(i)的最大值就是整个图的带宽。 给定图G，求出让带宽最小
 的结点排列，如图7-7所示
 */
public class huisu_05_带宽 {

  private static int[][] getG() {
    return new int[][]{
        {1, 5},
        {0, 2, 6},
        {1, 3},
        {2, 4, 6},
        {3, 7},
        {0, 6, 7},
        {1, 3, 5},
        {4, 5}
    };
  }

  public static int[] getNeibor(int c) {
    return G[c];
  }

  private static int[][] G = getG();


  private static void print_neibor(int[] neibor) {
    for (int i = 0; i < neibor.length; i++) {
      System.out.print((char) ('A' + neibor[i]));
    }
    System.out.println();
  }

  /**
   * 图的带宽
   * @param arr
   * @return
   */
  private static int getBandwidthOfG(int[] arr) {
    //最大的距离
    int width = 0;
    int[] indexes = getIndexes(arr);
    //每个节点的带宽
    for (int i = 0; i < arr.length; i++) {
      int[] neibor = getNeibor(arr[i]);//邻居
      /*=======优化的地方=======*/
      //我的邻居太多，就算全部排在我边上，我的带宽也会超出现在的最小带宽
      if (neibor.length >= min)
        return neibor.length;
      //记录和邻居的最大距离
      int widthOfI = 0;
      //和每个邻居在当前排列中的距离
      for (int j = 0; j < neibor.length; j++) {
        int w = Math.abs(indexes[neibor[j]] - i);
        /*=======优化的地方=======*/
        //如果和某个邻居的距离已经大于现存的最小带宽，则不用再遍历下去了
        if (w >= min)
          return w;
        if (w > widthOfI) {
          widthOfI = w;
        }
      }
      // System.out.println(widthOfI);
      if (widthOfI > width) {
        width = widthOfI;
      }
    }
    return width;
  }

  private static int[] getIndexes(int[] arr) {
    int[] res = new int[arr.length];
    for (int i = 0; i < arr.length; i++) {
      res[arr[i]] = i;
    }
    return res;
  }

  private static int indexOf(int e, int[] arr) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == e)
        return i;
    }
    return -1;
  }

  private static int[] s2arr(String s) {
    final char[] chars = s.toCharArray();
    int[] res = new int[s.length()];
    for (int i = 0; i < chars.length; i++) {
      res[i] = chars[i] - 'A';
    }
    return res;
  }

  static int min = Integer.MAX_VALUE;
  static String res;

  private static void permutation(String prefix, char[] arr) {
    if (prefix.length() == arr.length) {
      int width = getBandwidthOfG(s2arr(prefix));
      if (width < min) {
        min = width;
        res = prefix;
      }
    }
    for (int i = 0; i < arr.length; i++) {
      //这个字符可用
      if (prefix.indexOf(arr[i]) == -1) {
        permutation(prefix + arr[i], arr);
      }
    }
  }

  public static void main(String[] args) {
    // System.out.println(getBandwidthOfG(s2arr("ABCDGFHE")));
    permutation("", "ABCDEFGH".toCharArray());
    System.out.println(min);
    System.out.println(res);
  }
}
