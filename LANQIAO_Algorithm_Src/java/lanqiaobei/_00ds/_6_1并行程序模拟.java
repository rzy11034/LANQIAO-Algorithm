package org.lanqiao.algo.lanqiaobei._00ds;

import java.util.*;

/**uva210
 题意：给定n个程序，每种程序有五种操作，
 分别为 var = constant(赋值)，print var (打印)， lock, unlock，end
 变量用小写字母表示，初始化为0，为程序所公有（一个程序里对某个变量修改可以会影响其他程序里的这个变量），
 常数小于100（也就是说最多两位数）。
 每个时刻都只能有一个程序处于运行状态，其他的都在等待，
 上述五种操作用时分别是t1, t2, t3, t4, t5单位时间。
 运行中的程序， 每次最多能运行q个时间，当q个时间被用完后，它会被放在等待队列的尾部，
 然后再从首部取出一个程序运行。
 初始等待队列按输入顺序，但是lock和unlock会改变顺序，它们总是成对出现，不会出现嵌套。
 如果某个程序已经执行了lock，
 其他程序一旦试图执行lock，就会马上被放到一个所谓的阻止队列的尾部（当然如果运行时间还没用完也就浪费了）。
 当unlock执行完成后，阻止队列中的第一个程序进入等待队列的首部。
 输入n,t1,t2,t3,t4,t5,q以及n个程序，按照时间顺序输出所有print语句的程序编号和结果
 输出格式是第几个程序加冒号加空格加结果，两个相连的数据用空行隔开。（详见白书第二版p139）
 输入示例：
 3 1 1 1 1 1 1
 a = 4
 print a
 lock
 b = 9
 print b
 unlock
 print b
 end
 a = 3
 print a
 lock
 b = 8
 print b
 unlock
 print b
 end
 b = 5
 a = 17
 print a
 print b
 lock
 b = 21
 print b
 unlock
 print b
 end
 输出示例：
 1: 3
 2: 3
 3: 17
 3: 9
 1: 9
 1: 9
 2: 8
 2: 8
 3: 21
 */
public class _6_1并行程序模拟 {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    //程序数目
    int n = scanner.nextInt();
    int t1 = scanner.nextInt();
    int t2 = scanner.nextInt();
    int t3 = scanner.nextInt();
    int t4 = scanner.nextInt();
    int t5 = scanner.nextInt();
    int q = scanner.nextInt();

    //计时
    int time = q;
    //锁定
    boolean locked = false;
    //等待队列
    Deque<String> waitQ = new LinkedList<>();
    //阻止队列
    Queue<String> blockQ = new LinkedList<>();
    //变量与值
    Map<String, Integer> var = new HashMap<>();

    int current = 1;
    scanner.nextLine();
    while (current <= n) {
      String cmd = scanner.nextLine();
      waitQ.add(current + cmd);
      if (cmd.equals("end"))
        current++;
    }

    while (!waitQ.isEmpty()) {
      //没有时间了，转移到下一个程序
      if (time == 0) {
        // moveToLast(waitQ);
        // 直到end，全部移入尾部
        while (true) {
          String cmd = waitQ.pop();
          if (cmd.contains("end")) {
            waitQ.add(cmd);
            break;
          } else {
            waitQ.add(cmd);
          }
        }
        time = q;
      }

      String command = waitQ.pop();
      if (command.contains("=")) {
        String[] x = command.split("=");
        String vname = x[0].trim().substring(1);
        Integer value = Integer.valueOf(x[1].trim());
        var.put(vname, value);
        time -= t1;
      } else if (command.contains("print")) {
        String vname = command.substring(7);
        System.out.println(command.substring(0, 1) + ": " + var.get(vname));
        time -= t2;
      } else if (command.contains("lock") && !command.contains("unlock")) {
        if (locked) {// 已经锁定，到end，全部移动到阻止队列
          blockQ.add(command);// TODO 这里lock语句是不是要加到阻止队列？
          while (true) {
            String cmd = waitQ.pop();
            if (cmd.contains("end")) {
              blockQ.add(cmd);
              break;
            } else {
              blockQ.add(cmd);
            }
          }
          //  时间恢复
          time = q;
        } else { // 进入锁定状态
          locked = true;
          time -= t3;
        }
      } else if (command.contains("unlock")) {
        time = q; // TODO ? 这里是不是要恢复时钟，让阻止队列的第一个程序进入？
        locked = false;
        // 把阻止队列的代码移入到等待队列的首部
        Stack<String> temp = new Stack<String>();
        while (true) {
          if (blockQ.isEmpty()) break;
          String cmd = blockQ.poll();
          if (cmd.contains("end")) {
            temp.push(cmd);
            break;
          } else {
            temp.push(cmd);
          }
        }
        while (!temp.isEmpty()) {
          waitQ.push(temp.pop());
        }

      } else { // end
        time -= t5;
      }
    }

  }

}

