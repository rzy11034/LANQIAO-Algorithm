package org.lanqiao.algo.lanqiaobei._00ds;

//最简单的链表
public class LinkedNode {
  public static void main(String[] args) {
    Node node = new Node(1);
    node.append(2);
    node.append(3);
    node.append(4);
    node.append(5);

    Node p = node;
    while (p != null) {
      System.out.println(p.data);
      p = p.next;
    }
  }
}

class Node {
  Node next;
  int data;

  Node(int data) {
    this.data = data;
  }

  void append(int data) {
    // 首先新建一个节点
    Node newNode = new Node(data);
    Node p = this;
    while (p.next != null) {
      p = p.next;
    }
    // p指向了最末尾的元素
    p.next = newNode;
  }
}
