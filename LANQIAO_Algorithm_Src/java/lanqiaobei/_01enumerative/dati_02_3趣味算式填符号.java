package org.lanqiao.algo.lanqiaobei._01enumerative;

/*02-3编程题：趣味算式填符号【※※中等难度】
* 匪警请拨110,即使手机欠费也可拨通！

    为了保障社会秩序，保护人民群众生命财产安全，警察叔叔需要与罪犯斗智斗勇，因而需要经常性地进行体力训练和智力训练！

    某批警察叔叔正在进行智力训练：

    1 2 3 4 5 6 7 8 9 = 110;

    请看上边的算式，为了使等式成立，需要在数字间填入加号或者减号（可以不填，但不能填入其它符号）。之间没有填入符号的数字组合成一个数，例如：12+34+56+7-8+9 就是一种合格的填法；123+4+5+67-89 是另一个可能的答案。

    请你利用计算机的优势，帮助警察叔叔快速找到所有答案。

    每个答案占一行。形如：

12+34+56+7-8+9
123+4+5+67-89
......

    已知的两个答案可以输出，但不计分。

    各个答案的前后顺序不重要。

   注意：

    请仔细调试！您的程序只有能运行出正确结果的时候才有机会得分！

    请把所有类写在同一个文件中，调试好后，存入与【考生文件夹】下对应题号的“解答.txt”中即可。

    相关的工程文件不要拷入。

    请不要使用package语句。

    源程序中只能出现JDK1.5中允许的语法或调用。不能使用1.6或更高版本。


*/
public class dati_02_3趣味算式填符号 {
  public static void main(String[] args) {
    solution();
  }

  private static void solution() {
    String[] ops = {"+", "-", ""};
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          for (int l = 0; l < 3; l++) {
            for (int m = 0; m < 3; m++) {
              for (int n = 0; n < 3; n++) {
                for (int o = 0; o < 3; o++) {
                  for (int p = 0; p < 3; p++) {
                    String s = 1 + ops[i] + 2 + ops[j] + 3 + ops[k] + 4 + ops[l] + 5 + ops[m] + 6 + ops[n] + 7 + ops[o] + 8 + ops[p] + 9;
                    if (test(s)) {
                      System.out.println(s);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  /**/
  private static boolean test(String s) {
    String[] numStr = s.split("[+-]");
    int temp = 0;
    int index = 0;
    for (int i = 0; i < numStr.length; i++) {
      int num = Integer.parseInt(numStr[i]);
      if (i == 0)
        temp += num;
      else {
        if (s.charAt(index) == '+')
          temp += num;
        else
          temp -= num;

        index++;
      }
      index += numStr[i].length();

    }
    return temp == 110;
  }

}

/*
* 多重循环暴力破解*/