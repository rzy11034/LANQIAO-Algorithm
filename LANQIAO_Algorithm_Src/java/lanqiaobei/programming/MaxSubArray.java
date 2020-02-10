package org.lanqiao.algo.lanqiaobei.programming;
import java.util.*;

import org.lanqiao.algo.util.Util;
/**
* 求和最大的连续子数组,不唯一，返回一个即可
*/
public class MaxSubArray{
  // 暴力法破解 Θ(n²)
  static void findByForce(int[] arr){
    int sum = 0;
    int maxSum = arr[0];
    
    for (int j = 0; j< arr.length ; j++) {
      sum = arr[j];// 某个元素
      int maxOfJ=sum;
      
      for (int i=j+1;i<arr.length;i++ ) {
        sum+=arr[i];// 累加后续元素
        if (sum > maxOfJ) {
          maxOfJ = sum;
        }
      }
      if (maxOfJ>maxSum) {
        maxSum = maxOfJ;
      }
    }
    System.out.println(maxSum);
  }

  // 递归-分治法 Θ(nlgn)
  static void findByRecursive(int[] arr){
    int max = findMaxSub(arr,0,arr.length-1);
    System.out.println("max==="+max);
  }
  private static int findMaxSub(int[]arr,int left,int right){
    if(left==right){
      return arr[left];
    }
    int mid = (left+right)/2;
    int leftSum = findMaxSub(arr,left,mid);
    int rightSum = findMaxSub(arr,mid+1,right);
    int crossSum = findMaxCrossingSum(arr,left,mid,right);

    if (leftSum>=rightSum&&leftSum>=crossSum) {
      return leftSum;
    }else if(rightSum>=leftSum&&rightSum>=crossSum){
      return rightSum;
    }else{
      return crossSum;
    }
  }
  private static int findMaxCrossingSum(int[] arr,int left,int mid,int right){
    int infinite = -9999;
    int left_sum = infinite;//左侧最大和
    int right_sum = infinite;//右侧最大和

    int max_left = -1,max_right = -1;// 记录下标
    int sum = 0;//临时变量

    for (int i = mid;i>=left;i--) {
      sum+=arr[i];
      if (sum>left_sum) {
        left_sum = sum;//更新左侧最大和
        max_left = i;
      }
    }
    sum = 0;
    for (int i = mid+1;i<=right;i++) {
      sum+=arr[i];
      if (sum>right_sum) {
        right_sum = sum;//更新右侧侧最大和
        max_right = i;
      }
    }
    return left_sum + right_sum;
  }
  // 递推法 Θ(n)
  static void findByDp(int[] arr){
    int sumJ=arr[0];  // 前J个元素的最大贡献
    int max = sumJ;
    int left = 0,right = 0;
    for (int j = 1; j< arr.length ; j++) {
      if (sumJ>=0) {  // 左子表的最大和为正，继续向后累加
        sumJ += arr[j];
      }else{
        sumJ = arr[j];
        left=j;
      }

      if (sumJ > max) {
        max = sumJ;
        right = j;
      }
    }
    System.out.println(max+",left="+left+",right:"+right);
  }

  static int findByDp(int[] arr,int j){
    // 终止条件
    if (j == 0) {
      return arr[0];
    }
    // 分解，递归
    int dpj_1 = findByDp(arr,j-1);  
    int dpj;  
    // 合并
    // return max(sumj+state[j+1],state[j+1])
    if (dpj_1>0) {
      dpj =  dpj_1 + arr[j];
    }else{
      dpj =  arr[j];
    }
    if (dpj>dpj_1) {
      return dpj;
    }else{
      return dpj_1;
    }

  }
  
  public static void main(String[] args) {
    int[] arr = Util.getRandomArr(10,-100,100);
    System.out.println("数组："+Arrays.toString(arr));
    long now = new Date().getTime();
    findByForce(arr);
    long next1 = new Date().getTime();
    System.out.println("暴力法，时间消耗："+(next1-now));
    findByDp(arr);
    long next2 = new Date().getTime();
    System.out.println("递推法，时间消耗："+(next2-next1));
    findByRecursive(arr);
    long next3 = new Date().getTime();
    System.out.println("递归分治法，时间消耗："+(next3-next2));
    int maxSum = findByDp(arr,arr.length-1);
    System.out.println("动规结果"+maxSum);
    long next4 = new Date().getTime();
    System.out.println("动规法，时间消耗："+(next4-next3));
  }
}