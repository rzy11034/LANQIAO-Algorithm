package org.lanqiao.algo.elementary._06_math;

import org.junit.Test;

public class Case05_ExtGcdTest {
  @Test
  public void inverseElement() {
    // 13x==1(%5)
    // 12x==1(%2)
    try {
      Case05_ExtGcd.inverseElement(12, 2);
      System.out.println(Case05_ExtGcd.x);
    } catch (Exception e) {
      System.out.println("无解");
    }
  }

  @Test
  public void linearEquation() {
    try {
      Case05_ExtGcd.linearEquation(12, 42, 5);
      System.out.println(Case05_ExtGcd.x + " " + Case05_ExtGcd.y);
    } catch (Exception e) {
      System.out.println("无解");
    }

  }

  @Test
  public void linearEquationGroup() throws Exception {
    long[] a = {2, 3, 2};//余数的数组 5 20 34 325
    a = new long[]{5, 20, 34};
    long[] m = {3, 5, 7};//模的数组 23 28 33
    m = new long[]{23, 28, 33};
    long res = Case05_ExtGcd.linearEquationGroup(a, m);
    System.out.println(res - 325);
  }

}