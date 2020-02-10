#include<cstdio>
#include<iostream>
#include<algorithm>
#include<cstring>
using namespace std;
int gcd(int a, int b) {
    if (b == 0) return a;
    int d = a % b;
    return gcd(b, d);
}
int main() {
    int count = 0;
    for (int i = 2; i <= 9900; i++) {
        for (int j = i+1; j <= 9900; j++) {
            int a = i, b = j;
            int sum1 = a*b, sum2 = a+b;
            int t = gcd(sum2, sum1);
            int a1 = sum1/t, a2 = sum2/t;
            if (a1 == 45 && a2 == 2) {
                printf("1/%d + 1/%d = 2/45\n", a, b);
                count++;
            }
        }
    }
    printf("%d\n", count);
    return 0;
}