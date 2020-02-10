package org.lanqiao.algo.lanqiaobei._00ds;

import java.util.HashSet;
import java.util.Set;

public class SetDemo {
  public static void main(String[] args) {
    //Integer--int
    //Double -- double
    //Float -- float
    // Short -- short
    //Boolean -- boolean
    // Byte -- byte
    // Long -- long
    //Character -- char

    Set<Character> set = new HashSet<Character>();
    String s = "aebcdceda";
    for (int i = 0; i < s.length(); i++) {
      set.add(s.charAt(i));
    }
    StringBuilder sb = new StringBuilder();
    for (Character c : set) {
      sb.append(c);
    }
    System.out.println("去重后的字符串" + sb.toString());
    // System.out.println(s.length() == set.size());
    //
    // boolean flag = true;
    // for (int i = 0; i < s.length(); i++) {
    //   char c = s.charAt(i);
    //   if (s.indexOf(c, i + 1) != -1) {
    //     flag = false;
    //     break;
    //   }
    // }
    // System.out.println(flag);
  }
}
