package org.lanqiao.algo.lanqiaobei._01enumerative;

/*
* 英国数学家德摩根出生于19世纪初叶（即18xx年）。 他年少时便很有才华。
* 一次有人问他的年龄，他回答说： “到了x的平方那年，我刚好是x岁”。

请你计算一下，德摩根到底出生在哪一年。 题中的年龄指的是周岁。

请填写表示他出生年份的四位数字，不要填写任何多余内容。

分析
到了x的平方那一年，我刚好是x岁。
设x^2-nian=x岁，变换 x^2-x=nian

(y+x)=x^2
1820

for chushengnian  1800..1899
  for sui 1..30
    if(chushengnian+sui==sui*sui)
      syso(chushengnian)
*/

public class jieguo_001数学家出生年 {
  public static void main(String[] args) {
    for (int i = 1; i < 50; i++) {
      if (i * i - i >= 1800 && i * i - i < 1900) {
        System.out.println(i + " " + (i * i - i));
      }
    }
  }
}
