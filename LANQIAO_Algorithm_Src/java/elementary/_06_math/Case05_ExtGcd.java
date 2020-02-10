package org.lanqiao.algo.elementary._06_math;

/**
 * 扩展欧几里得算法
 * x=y1
 * y=x1-a/b*y1
 */
public class Case05_ExtGcd {
  static long x;
  static long y;

  public static long gcd(long m, long n) {
    return n == 0 ? m : gcd(n, m % n);
  }

  /**
   * 最小公倍数lowest common multiple (LCM)
   * @param a
   * @param b
   * @return
   */
  public static long lcm(long a, long b) {
    return a * b / gcd(a, b);
  }

  /**
   * 扩展欧几里得
   * 调用完成后xy是ax+by=gcd(a,b)的解*/
  public static long ext_gcd(long a, long b) {

    if (b == 0) {
      x = 1;
      y = 0;
      return a;
    }
    long res = ext_gcd(b, a % b);
    //x,y已经被下一层递归更新了,ppt中所说的x0和y0
    long x1 = x;//备份x
    x = y;//更新x
    y = x1 - a / b * y;//更新y
    return res;
  }

  /**
   * 线性方程
   * ax+by=m 当m时gcd(a,b)倍数时有解
   * 等价于ax = m mod b*/
  public static long linearEquation(long a, long b, long m) throws Exception {
    long d = ext_gcd(a, b);
    //m不是gcd(a,b)的倍数,这个方程无解
    if (m % d != 0) {
      throw new Exception(m + " % " + "gcd(" + a + "," + b + ")" + " != 0~~无解");
    }
    long n = m / d;//约一下,考虑m是d的倍数
    x *= n;
    y *= n;
    return d;
  }

  /**
   * x = a1(%m1)
   *   = a2(%m2)
   *   = a3(%m3)
   *  x = a1+m1y1 (1)
   *  x = a2+m2y2
   *  ==>m1y1-m2y2=a2-a1这是一个线性方程,可解出y1  linearEquation(m1,-m2,a2-a1)
   *  带回(1),得特解x0 = a1+m1*y1 --> x =x0 + k*lcm(m1,m2) 得一个新方程 x = x0 (mod lcm(m1,m2))
   *  */
  public static long linearEquationGroup(long[] a, long[] m) throws Exception {
    int len = a.length;
    if (len == 0 && a[0] == 0) return m[0];

    for (int i = 1; i < len; i++) {
      //这里往前看是两个方程
      long a2_a1 = a[i] - a[i - 1];
      long d = linearEquation(m[i - 1], -m[i], a2_a1);
      //现在的x是y1,用y1求得一个特解
      long x0 = a[i - 1] + m[i - 1] * x;
      long lcm = m[i - 1] * m[i] / d;
      a[i] = (x0 % lcm + lcm) % lcm;//x0变成正数
      m[i] = lcm;
    }
    //合并完之后,只有一个方程 : x = a[len-1] (% m[len-1])
    return a[len - 1] % m[len - 1];
  }

  /**
   * 求逆元
   * ax = 1 (% mo),gcd(a,mo)=1
   * ax+mo*y=1
   * */
  public static long inverseElement(long a, long mo) throws Exception {

    long d = linearEquation(a, mo, 1);//ax+mo*y=1
    x = (x % mo + mo) % mo;//保证x>0
    return d;
  }

  public static void main(String[] args) {
    long d = ext_gcd(7, 11);
    System.out.println(x + " " + y);
    long a = 14;
    long b = 22;
    long m = -10;
    try {
      d = linearEquation(a, b, m);
      System.out.println("解1:" + x + " " + y);
      //x和y是一组解,下面也是一组解
      x += b / d;
      y -= a / d;
      System.out.println("解2:" + x + " " + y);
      while (x > 0) {
        x += b / d > 0 ? -b / d : b / d;//使x减小
        y += a / d > 0 ? a / d : -a / d;//使y增加减小
      }
      System.out.println("解2:" + x + " " + y);
      // b=b/d;
      // a = a/d;
      // x = (x%b+b)%b;//第一个大于0的解
      // y = (y%a+a)%a;
      // System.out.println("保证x大于等于0:" + x + " " + y);

    } catch (Exception e) {
      System.out.println("无解");
    }


  }
}
