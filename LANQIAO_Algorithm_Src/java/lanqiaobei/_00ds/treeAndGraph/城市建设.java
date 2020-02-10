package org.lanqiao.algo.lanqiaobei._00ds.treeAndGraph;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class 城市建设 {
  public static int n, m;
  public static int[] id;
  public static ArrayList<Edge> list = new ArrayList<Edge>();
  public static int result = Integer.MAX_VALUE;

  static class Edge {
    public int a;
    public int b;
    public int value;

    public Edge(int a, int b, int value) {
      this.a = a;
      this.b = b;
      this.value = value;
    }
  }

  class MyComparator implements Comparator<Edge> {
    public int compare(Edge o1, Edge o2) {
      if (o1.value > o2.value)
        return 1;
      else if (o1.value < o2.value)
        return -1;
      return 0;
    }
  }

  public int find(int a) {
    int root = a;
    while (id[root] >= 0) {
      root = id[root];
    }
    int i = 0, k = a;
    while (k != root) {
      i = id[k];
      id[k] = root;
      k = i;
    }
    return root;
  }

  public void union(int a, int b) {
    int rootA = find(a);
    int rootB = find(b);
    if (rootA == rootB)
      return;
    int num = id[rootA] + id[rootB];
    if (id[rootA] < id[rootB]) {
      id[rootB] = rootA;
      id[rootA] = num;
    } else {
      id[rootA] = rootB;
      id[rootB] = num;
    }
  }

  public void kruskal() {
    //排序
    Collections.sort(list, new MyComparator());
    //成本，权重和
    int temp = 0;
    int count = 0;
    int count1 = 0;//计算加入状态顶点0时，包含的边数目,若包含状态顶点0，则只是包含两条边

    for (int i = 0; i < list.size(); i++) {
      //权重最小的边
      Edge p = list.get(i);
      int a = p.a;
      int b = p.b;
      //a，b联通后没有回路
      if (find(a) != find(b) && count < n - 1) {
        temp += p.value;
        union(a, b);
        count++;
        //联通河道的码头
        if (a == 0 || b == 0)
          count1++;
      } else if (p.value < 0)  //此时，修这条路是一定赚钱的,所以必修
        temp += p.value;
      else if (count == n - 1 && p.value > 0)
        break;
    }
    if (count == n - 1 && (count1 == 0 || count1 > 1))
      result = Math.min(result, temp);
  }

  public static void main(String[] args) {
    城市建设 test = new 城市建设();
    Scanner in = new Scanner(System.in);
    n = in.nextInt();
    m = in.nextInt();
    id = new int[n + 1];
    for (int i = 0; i <= n; i++)
      id[i] = -1;
    for (int i = 0; i < m; i++) {
      int a = in.nextInt();
      int b = in.nextInt();
      int c = in.nextInt();
      list.add(new Edge(a, b, c));
    }
    test.kruskal();  //此处用于寻找不含码头的最后生成树得出的结果
    for (int i = 0; i <= n; i++)
      id[i] = -1;
    int[] point = new int[n];  //使用码头连通
    for (int i = 0; i < n; i++)
      point[i] = in.nextInt();
    for (int i = 0; i < n; i++) {
      if (point[i] == -1) // 不能修
        continue;
      list.add(new Edge(0, i + 1, point[i]));  //添加一个顶点0状态地点,所有码头均可到
    }
    n = n + 1;   //此处是因为增加了一个状态顶点0，所以n要加1
    test.kruskal();   //此处用于寻找包含码头的最小生成树的出的结果
    System.out.println(result);
  }
}