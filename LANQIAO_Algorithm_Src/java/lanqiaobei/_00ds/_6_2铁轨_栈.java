package org.lanqiao.algo.lanqiaobei._00ds;

import java.util.Stack;

/**
 * UVa514 Rails（铁轨） - CSDN博客
 https://blog.csdn.net/to_xidianhph_youth/article/details/38355561*/
public class _6_2铁轨_栈 {
  static int[] in = {1, 2, 3, 4, 5};
  static int[] out = {1, 2, 3, 4, 5};
  static int right = 0;

  public static void main(String[] args) {
    Stack<Integer> stack = new Stack<>();
    for (int i = 0; i < out.length; i++) {
      //如果站内有内容且弹出的元素吻合，则继续检查下一个
      if (!stack.isEmpty() && stack.pop() == out[i]) {
        if (i == out.length - 1) {
          System.out.println(true);
        }
        continue;
      }
      //如果站内有内容，但是弹出元素和目标不吻合，且没有新元素可以入栈，这时判定失败
      if (!stack.isEmpty() && stack.pop() != out[i] && right >= in.length) {
        System.out.println(false);
        break;
      }
      // else:
      for (int j = right; j < in.length; j++) {
        stack.push(in[j]);
        right++;
        //新入栈元素和要求弹出的吻合了，就停止入栈
        if (in[j] == out[i]) {
          i--;
          break;
        }
      }
    }

  }


}
