package org.lanqiao.algo.lanqiaobei._01enumerative;

import java.util.*;

public class jieguo_十位平方数 {
  public static void main(String[] args) {
    // System.out.println(test2(1026753849));
    for (long i = 9876543210L; i >= 1026753849; i--) {
      //是否不重复
      if (!test1(i)) continue;
      //是否完全平方数
      if (!test2(i)) continue;
      System.out.println(i);
      break;
    }
  }

  private static boolean test2(long i) {
    long x = (long) Math.sqrt(i);
    return x * x == i;
  }

  private static boolean test1(long i) {
    char[] x = ("" + i).toCharArray();
    Set set = new HashSet();
    for (int j = 0; j < x.length; j++) {
      set.add(x[j]);
    }
    return set.size() == 10;
  }
}
