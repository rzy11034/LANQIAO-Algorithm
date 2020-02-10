package org.lanqiao.algo.datastructure;

import static org.assertj.core.api.Assertions.*;
import org.junit.Test;
import org.lanqiao.algo.elementary.datastructure.IStack;
import org.lanqiao.algo.elementary.datastructure.StackImpl;

public class StackImplTest {

	@Test
	public void testPush() {
		IStack stack = new StackImpl();
		stack.push("e1");
		stack.push("e2");
		stack.push("e3");
		assertThat(stack.pop()).isEqualTo("e3");
		assertThat(stack.pop()).isEqualTo("e2");
		assertThat(stack.pop()).isEqualTo("e1");
		assertThat(stack.size()).isEqualTo(0);
	}
}
