package org.lanqiao.algo.lanqiaobei._03recursion_framework;
/*
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
public class huisu_02趣味算式填符号 {
  public static void main(String[] args) {
    int[] arr = {1,2,3,4,5,6,7,8,9};
    solution(arr,8,"",110);
  }

  /**
   *
   * @param arr 数据
   * @param k 待处理的下标
   * @param so 已生成的字符串
   * @param goal 期望凑成的数值
   */
  private static void solution(int[] arr, int k, String so, int goal) {
    if (k==0){
      if (arr[0]==goal) System.out.println(arr[0]+so);
      return;
    }
    solution(arr,k-1,"+"+arr[k]+so,goal-arr[k]);
    solution(arr,k-1,"-"+arr[k]+so,goal+arr[k]);

    int old = arr[k-1];
    arr[k-1] = Integer.parseInt(""+arr[k-1]+arr[k]);
    solution(arr,k-1,so,goal);
    arr[k-1]=old;//回溯
  }


}
