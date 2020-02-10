package org.lanqiao.algo.lanqiaobei._00ds;

import java.util.ArrayList;
import java.util.List;

public class ArrayListDemo {
  public static void main(String[] args) {
    /*集合之列表，可动态扩容，作用：可以存放任意多个元素*/
    List<String> list = new ArrayList<String>();
    list.add("1");
    list.add("2");
    list.add("3");
    list.add("3");
    list.add("4");
    //注意size() 容器中元素的个数
    for (int i = 0; i < list.size(); i++) {
      String s = list.get(i);  //
      System.out.println(s);
    }
    /*任何集合都提供增删改查的操作*/
    // list.remove(3);  //


    list.set(3, "5");
    for (int i = 0; i < list.size(); i++) {
      String s = list.get(i);  //
      System.out.println(s);
    }

    int index = list.indexOf("5");
    System.out.println("5的下标是" + index);
    index = list.indexOf("9");
    System.out.println("9的下标是：" + index);
  }
}
