package org.lanqiao.algo.datastructure;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.lanqiao.algo.elementary.datastructure.ArrayList;
import org.lanqiao.algo.elementary.datastructure.ICollection;
import org.lanqiao.algo.elementary.datastructure.IList;

public class ArrayListTest {

	@Test
	public void testAdd() {
		IList list = new ArrayList();
		list.add("a");
		list.add("b");
		list.add("c");
		assertThat(list.contains("a")).isTrue();
		assertThat(list.indexOf("a")).isEqualTo(0);
		assertThat(list.get(1)).isEqualTo("b");
		list.add("d",1);
		assertThat(list.get(2)).isEqualTo("c");//adcb
		list.delete(2);
		assertThat(list.get(2)).isEqualTo("b");//ad_b  //这里将出现问题
		System.out.println(list);
	}

	@Test
	public void testAddComplexObject() {
		class Student {
			String name;
			int age;

			Student(String name, int age) {
				this.name = name;
				this.age = age;
			}
		}
		// ---为什么需要重写equals？？---
		ICollection collection = new ArrayList();
		collection.add(new Student("xiao3", 18));
		collection.add(new Student("xiao4", 18));
		collection.add(new Student("xiao5", 18));

		assertThat(collection.contains(new Student("xiao4", 20))).isTrue();
		System.out.println(collection);
	}

	@Test
	public void testAddComplexObject2() {
		class Student {
			String name;
			int age;

			Student(String name, int age) {
				this.name = name;
				this.age = age;
			}

			public boolean equals(Object other) {
				if (other == null)
					return false;
				if (!(other instanceof Student))
					return false;
				Student o = (Student) other;
				return this.name.equals(o.name);
			}

			public String toString() {
				return "{name=" + name + ",age=" + age + "}";
			}
		}
		// ---为什么需要重写equals？？---
		ICollection collection = new ArrayList();
		collection.add(new Student("xiao3", 18));
		collection.add(new Student("xiao4", 18));
		collection.add(new Student("xiao5", 18));

		assertThat(collection.contains(new Student("xiao4", 20))).isTrue();
		System.out.println(collection);
	}
}
