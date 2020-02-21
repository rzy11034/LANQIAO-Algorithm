unit LQA.Case03_03_MoreThanHalf;

// 数组中出现次数超过半数的元素
// 解法1：排序后返回arr[N/2],NLg(N)
// 解法2：hash统计
// 解法3：顺序统计,O(N)，限制：需要改动数组的内容
// 解法4：不同的数，进行消除

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

uses
  LQA.Utils;

//解法1：排序后返回arr[N/2], NLg(N)
procedure Solve1(arr: TArr_int);
begin
  TArrayUtils_int.Sort(arr);
  WriteLn(arr[Length(arr) div 2]);
end;

// 解法2：hash统计
procedure Solve2(arr: TArr_int);
begin
  // 用 hash 表计行统计
end;

// 解法3：顺序统计,O(N)，限制：需要改动数组的内容
procedure Solve3(arr: TArr_int);

// 双路 Partition
  function __partition(var arr: TArr_int; l, r: integer): integer;
  var
    i, j, e: integer;
  begin
    TUtils_Int.Swap(arr[l], arr[l + (r - l) div 2]);
    e := arr[l];

    i := l + 1;
    j := r;
    while True do
    begin
      while (i <= r) and (arr[i] < e) do
        Inc(i);
      while (j >= l + 1) and (arr[j] > e) do
        Dec(j);

      if i > j then
        Break;

      TUtils_Int.Swap(arr[i], arr[j]);
      Inc(i);
      Dec(j);
    end;

    TUtils_Int.Swap(arr[l], arr[j]);
    Result := j;
  end;

  //**
  // * 期望O(n)，最差O(n²)
  // *
  // * arr: 数组
  // * p: 开始下标
  // * r: 结束小标
  // * k: 求第k小元素（递增第k个元素）
  // *
  function __selectK(var arr: TArr_int; p, r, k: integer): integer;
  var
    q, qk, ret: integer;
  begin
    q := __partition(arr, p, r);
    qK := q - p + 1;

    if qK = k then
      ret := arr[q]
    else
    if qK > k then
      ret := __selectK(arr, p, q - 1, k)
    else
      ret := __selectK(arr, q + 1, r, k - qK);

    Result := ret;
  end;

var
  ret: integer;
begin
  ret := __selectK(arr, 0, Length(arr) - 1, arr[Length(arr) div 2]);
  WriteLn(ret);
end;

// 不同的数，进行消除，O(N)
procedure Solve4(arr: TArr_int);
var
  candidate, nTimes, i: integer;
begin
  //候选数，先定位第一个元素
  candidate := arr[0];
  //出现的次数
  nTimes := 1;

  //扫描数组
  for i := 1 to Length(arr) - 1 do
  begin
    //两两消减为 0，应该把现在的元素作为候选值
    if (nTimes = 0) then
    begin
      candidate := arr[i];
      nTimes := 1;
      Continue;
    end;

    //遇到和候选值相同的，次数加1
    if arr[i] = candidate then
      Inc(nTimes)
    //不同的数，进行消减
    else
      Dec(nTimes);
  end;

  WriteLn(candidate);
end;

//变化，出现次数恰好为个数的一半，求出这个数
// 关于加强版水王的题我有个想法可以扫描一遍数组就解决问题：
// 水王占总数的一半，说明总数必为偶数；
// 不失一般性，假设隔一个数就是水王的id，两两不同最后一定会消减为0
// 水王可能是最后一个元素，每次扫描的时候，多一个动作，和最后一个元素做比较，单独计数，计数恰好等于一半
// 如果不是，计数不足一半，那么去掉最后一个元素，水王就是留下的那个candidate*/
procedure Solve5(arr: TArr_int);
var
  candidate, nTimes, i, countOfLast, n: integer;
begin
  candidate := arr[0];
  //出现的次数
  nTimes := 1;
  countOfLast := 0; // 统计最后这个元素出现的次数
  n := Length(arr);


  //扫描数组
  for i := 0 to Length(arr) - 1 do
  begin
    //增加和最后一个元素比较的步骤
    if arr[i] = arr[n - 1] then
      Inc(countOfLast);

    //两两消减为 0，应该把现在的元素作为候选值
    if (nTimes = 0) then
    begin
      candidate := arr[i];
      nTimes := 1;
      Continue;
    end;

    //遇到和候选值相同的，次数加1
    if arr[i] = candidate then
      Inc(nTimes)
    //不同的数，进行消减
    else
      Dec(nTimes);
  end;

  //最后一个元素出现次数是 n/2
  if countOfLast = n div 2 then
    WriteLn(arr[n - 1])
  else
    WriteLn(candidate);
end;


procedure Main;
var
  arr: TArr_int;
begin
  arr := [0, 1, 2, 1, 1];

  Solve1(copy(arr));
  DrawLineBlockEnd;

  Solve3(copy(arr));
  DrawLineBlockEnd;

  Solve4(copy(arr));
  DrawLineBlockEnd;

  Solve5(copy(arr));
end;

end.