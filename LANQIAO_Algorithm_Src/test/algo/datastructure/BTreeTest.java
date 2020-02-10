package org.lanqiao.algo.datastructure;

import org.junit.Test;
import org.lanqiao.algo.elementary.datastructure.BTree;

public class BTreeTest {

	@Test
	public void testInsert() {
		BTree tree = new BTree();
		tree.insert("C");
		tree.insert("N");
		tree.insert("G");
		tree.insert("A");
		tree.insert("H");
		tree.insert("E");
		tree.insert("K");
		tree.insert("Q");
		tree.insert("M");
	}	

}
