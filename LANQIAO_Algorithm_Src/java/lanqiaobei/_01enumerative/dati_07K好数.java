package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 * K好数
 如果一个自然数N的K进制表示中任意的相邻的两位都不是相邻的数字，那么我们就说这个数是K好数。
 求L位K进制数中K好数的数目。例如K = 4，L = 2的时候，所有K好数为11、13、20、22、30、31、33 共7个。
 由于这个数目很大，请你输出它对1000000007取模后的值。

 输入格式
 输入包含两个正整数，K和L。

 输出格式
 输出一个整数，表示答案对1000000007取模后的值。
 样例输入
 4 2
 样例输出
 7
 数据规模与约定
 对于30%的数据，KL <= 106；

 对于50%的数据，K <= 16， L <= 10；

 对于100%的数据，1 <= K,L <= 100。
 */
public class dati_07K好数 {
  public static void main(String[] args) {
    System.out.println(Integer.parseInt(String.valueOf('1')));
    System.out.println(solution(4, 2));
    // System.out.println(Util.arrayToString(num2Arr(100123567829199872l)));
  }

  private static int solution(int jinzhi, int weishu) {
    int count = 0;
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < weishu; i++) {
      sb.insert(0, 1);
    }

    long num = Long.parseLong(sb.toString());
    while (String.valueOf(num).length() <= weishu) {
      int[] arr = num2Arr(num);
      if (test(arr)) {
        count++;
      }
      num++;
      int[] arr2 = num2Arr(num);
      num = jinwei(num, arr2, jinzhi);
    }
    return count % 1000000007;
  }

  private static long jinwei(long num, int[] arr, int jinzhi) {
    if (arr[0] != jinzhi)
      return num;
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == jinzhi) {
        arr[i] = 0;
        sb.append(arr[i]);
        try {
          arr[i + 1] += 1;
        } catch (Exception e) {
          // e.printStackTrace();
          sb.append(1);

        }
      } else
        sb.append(arr[i]);
    }
    return Long.parseLong(sb.reverse().toString());
  }

  /*
  * 任意相邻两位不是相邻数字
  * */
  private static boolean test(int[] arr) {

    for (int i = 0; i < arr.length - 1; i++) {
      if (Math.abs(arr[i] - arr[i + 1]) == 1)
        return false;
    }
    return true;
  }

  private static int[] num2Arr(long num) {
    int[] arr = new int[String.valueOf(num).length()];
    for (int i = 0; i < arr.length; i++) {
      arr[i] = (int) (num / (long) (Math.pow(10, i)) % 10);
    }
    return arr;
  }
}
