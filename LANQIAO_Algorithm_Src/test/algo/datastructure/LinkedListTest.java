package org.lanqiao.algo.datastructure;

import static org.assertj.core.api.Assertions.*;

import org.junit.Test;
import org.lanqiao.algo.elementary.datastructure.IList;
import org.lanqiao.algo.elementary.datastructure.LinkedList;

public class LinkedListTest {

	@Test
	public void test() {
		IList list = new LinkedList();
		list.add("a");
		list.add("b");
		list.add("c");
		list.add("d");
		list.add("e");
		list.add("f");
		System.out.println(list);
		assertThat(list.size()).isEqualTo(6);
		assertThat(list.indexOf("e")).isEqualTo(4);
		assertThat(list.get(6)).isEqualTo(null);
		assertThat(list.get(5)).isEqualTo("f");
		assertThat(list.search("a")).isEqualTo("a");
		assertThat(list.isEmpty()).isFalse();
		list.remove("f");
		assertThat(list.size()).isEqualTo(5);
		assertThat(list.contains("f")).isFalse();
		assertThat(list.indexOf("f")).isEqualTo(-1);
		System.out.println(list);
		list.add("m", 0);
		System.out.println(list);
		assertThat(list.toString()).isEqualTo("[m,a,b,c,d,e]");
		list.delete(0);
		assertThat(list.toString()).isEqualTo("[a,b,c,d,e]");
		list.delete(10);
		list.delete(2);
		assertThat(list.toString()).isEqualTo("[a,b,d,e]");
		System.out.println(list);

	}
	@Test
	public void test1() {
		IList list = new LinkedList();
    list.add("a");
    System.out.println(list);
		list.remove("a");
		System.out.println(list);
		assertThat(list.toString()).isEqualTo("[]");
	}
}
