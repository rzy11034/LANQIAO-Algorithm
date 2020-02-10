package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 *
 蓝桥杯第五届第六题
 标题：李白打酒

 话说大诗人李白，一生好饮。幸好他从不开车。

 一天，他提着酒壶，从家里出来，酒壶中有酒2斗。他边走边唱：

 无事街上走，提壶去打酒。
 逢店加一倍，遇花喝一斗。

 这一路上，他一共遇到店5次，遇到花10次，已知最后一次遇到的是花，他正好把酒喝光了。

 请你计算李白遇到店和花的次序，可以把遇店记为a，遇花记为b。则：babaabbabbabbbb 就是合理的次序。
 像这样的答案一共有多少呢？请你计算出所有可能方案的个数（包含题目给出的）。

 注意：通过浏览器提交答案。答案是个整数。不要书写任何多余的内容。

 */
public class jieguo_5_6李白打酒 {
  public static void main(String[] args) {
    // m1();
    f(2, 10, 5);
    System.out.println(count);
  }

  private static void m1() {
    //模拟14次遭遇的数组
    char[] data = new char[14];
    int count = 0;

    //  14 选 5 个位置填a
    //  第1个a的位置
    for (int i = 0; i < 14; i++) {
      //  第2个a的位置
      for (int j = i + 1; j < 14; j++) {
        //  第3个a的位置
        for (int k = j + 1; k < 14; k++) {
          //  第4个a的位置
          for (int l = k + 1; l < 14; l++) {
            //  第5个a的位置
            for (int m = l + 1; m < 14; m++) {
              init(data);
              data[i] = 'a';
              data[j] = 'a';
              data[k] = 'a';
              data[l] = 'a';
              data[m] = 'a';
              if (check(data))
                count++;
            }
          }
        }
      }
    }
    System.out.println(count);
  }


  //检查是否满足要求
  private static boolean check(char[] data) {
    int x = 2;
    for (int i = 0; i < data.length; i++) {
      if (data[i] == 'a')
        x = x * 2;
      else
        x = x - 1;
    }
    if (x - 1 == 0) {
      //可以不打印
      for (int i = 0; i < data.length; i++) {
        System.out.print(data[i]);
      }
      System.out.println('b');
      return true;
    }
    return false;
  }

  // 所有位置填 b
  private static void init(char[] data) {
    for (int i = 0; i < data.length; i++) {
      data[i] = 'b';
    }

  }

  static int count;

  static void f(int jiu, int hua, int dian) {
    if (hua == 1 && dian == 0) {
      if (jiu == 1) {
        count++;
      }
      return;
    }

    if (dian > 0)
      f(jiu * 2, hua, dian - 1);
    if (hua > 0)
      f(jiu - 1, hua - 1, dian);

  }
}
