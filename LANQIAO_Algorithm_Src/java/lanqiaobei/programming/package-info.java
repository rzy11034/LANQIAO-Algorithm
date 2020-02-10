
/**
 * 背包问题
 * 不停地装东西，不重不漏地考虑各种情况
 * 1、背包中的东西在变多，承重量在减少
 * 2、可选物品在变少
 * 3、价值在增多——返回值
 * int f(int v,int index){
 *
 *    [容量][范围]->价值
 *   a=f(v-vs[index],index-1)
 *   b=f(v,index-1)
 *   return max(value[index]+a,b)
 *
 * }
 *
 *
 * 动态规划法:
 * <br>
 * 避免子问题被重复求解，可以采用传统递归模式，但是要记录子问题的解，
 * 使得递归过程中可以直接利用已解决的子问题的解<br>
 * 或者自底向上求解，由小规模问题的解构建大规模问题的解
 * @author zhengwei lastmodified 2017年4月5日
 *
 */
package org.lanqiao.algo.lanqiaobei.programming;