package org.lanqiao.algo.lanqiaobei._01enumerative;

/**
 * 【dati_06信用卡号的验证】 当你输入信用卡号码的时候，有没有担心输错了而造成损失呢？
 * 其实可以不必这么担心，因为并不是一个随便的信用卡号码都是合法的，它必须通过Luhn算法来验证通过。
 * 该校验的过程：
 * 1、从卡号最后一位数字开始，逆向将奇数位(1、3、5等等)相加。
 * 2、从卡号最后一位数字开始，逆向将偶数位数字，先乘以2（如果乘积为两位数，则将其减去9），再求和。
 * 3、将奇数位总和加上偶数位总和，结果应该可以被10整除。
 *
 * 例如，卡号是：5432123456788881 则，奇数位和=35 偶数位乘以2（有些要减去9）的结果：1 6 2 6 1 5 7 7，求和=35。
 *
 * 最后35+35=70 可以被10整除，认定校验通过。
 * 请编写一个程序，从键盘输入卡号，然后判断是否校验通过。
 * 通过显示：“成功”，否则显示“失败”。 比如，
 * 用户输入：356827027232780 程序输出：成功
 * 【参考测试用例】
 * 356406010024817 成功
 * 358973017867744 成功
 * 356827027232781 失败
 * 306406010024817 失败
 * 358973017867754 失败
 */
public class dati_06信用卡号的验证 {
  public static void main(String[] args) {
    String s = "358973017867754";
    System.out.println(test(s));
  }

  private static String test(String num) {
    String[] nums = new StringBuilder(num).reverse().toString().split("");
    long sum1 = 0;
    long sum2 = 0;
    for (int i = 1; i <= nums.length; i++) {
      if (i % 2 != 0)//奇数
        sum1 += Integer.parseInt(nums[i - 1]);
      else {
        int temp = Integer.parseInt(nums[i - 1]) * 2;
        if (temp > 9)
          temp -= 9;
        sum2 += temp;
      }
    }
    final long sum = sum1 + sum2;

    System.out.println(sum);
    return sum % 10 == 0 ? "成功" : "失败";
  }
}
