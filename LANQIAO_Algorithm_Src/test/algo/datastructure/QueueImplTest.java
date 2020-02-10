package org.lanqiao.algo.datastructure;

import static org.assertj.core.api.Assertions.*;
import org.junit.Test;
import org.lanqiao.algo.elementary.datastructure.IQueue;
import org.lanqiao.algo.elementary.datastructure.QueueImpl;

public class QueueImplTest {
	@Test
	public void testEnqueue() {
		IQueue queue = new QueueImpl();
		queue.enqueue(1);
		queue.enqueue(2);
		queue.enqueue(3);
		assertThat(queue.dequeue()).isEqualTo(1);
		assertThat(queue.dequeue()).isEqualTo(2);
		assertThat(queue.dequeue()).isEqualTo(3);
	}
}
