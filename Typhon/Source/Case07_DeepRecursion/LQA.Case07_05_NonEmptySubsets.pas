unit LQA.Case07_05_NonEmptySubsets;

{**
  请编写一个方法，返回某集合的所有非空子集。

  给定一个 int 数组A和数组的大小 int n，请返回A的所有非空子集。
  保证A的元素个数小于等于 20，且元素互异。

  各子集内部从大到小排序,子集之间字典逆序排序
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Generics.Collections,
  LQA.Utils,
  DeepStar.DSA.Tree.HashSet,
  DeepStar.DSA.Math;

procedure Main;

implementation

type
  TSet_TSet_int = specialize THashSet<TSet_int>;
  TList_TList_int = specialize TList<TList_int>;


// 递归增量构造法
function GetSubsets1(const arr: TArr_int; const n: integer): TSet_TSet_int;
  function __getSubsets1(const arr: TArr_int; const n: integer; cur: integer): TSet_TSet_Int;
  var
    res, tmp: TSet_TSet_Int;
    null, _1st, t, clone: TSet_int;
  begin
    res := TSet_TSet_int.Create;

    // 处理第一个元素
    if cur = 0 then
    begin
      null := TSet_int.Create; // 空集
      _1st := TSet_int.Create; // 包含第一个元素的集合

      res.Add(null);
      _1st.Add(arr[cur]);
      res.Add(_1st);

      Result := res;
      Exit;
    end;

    tmp := __getSubsets1(arr, n, cur - 1);
    for t in tmp.ToArray do
    begin
      // 对于每个子集, 只有两种情况
      // 1、照原样加入
      // 2、将 arr[cur]加入到子集中

      // 1、照原样加入
      res.Add(t);

      // 2、将 arr[cur]加入到子集中
      clone := t.Clone;
      clone.Add(arr[cur]);
      res.Add(clone);
    end;

    Result := res;
  end;

begin
  if arr = nil then
    Exit(nil);

  Result := __getSubsets1(arr, n, n - 1);
end;

// 逐步生成迭代法
function GetSubsets2(const arr: TArr_int; const n: integer): TSet_TSet_int;
var
  res, tmp: TSet_TSet_int;
  e, clone: TSet_int;
  i: integer;
begin
  res := TSet_TSet_int.Create;
  res.Add(TSet_int.Create); // 初始化为空集

  //从第一个元素开始处理
  for i := 0 to n - 1 do
  begin
    // 新建一个大集合
    tmp := TSet_TSet_int.Create;
    // 把原来集合中的每个子集都加入到新集合中
    tmp.AddAll(res);

    // 遍历之前的集合, 全部克隆一遍
    for e in res.ToArray do
    begin
      clone := e.Clone;
      clone.Add(arr[i]); // 把当前元素加进去
      tmp.Add(clone); // 把克隆的子集加到大集合中
    end;

    res := tmp;
  end;

  Result := res;
end;

// 二进制法,迭代法,或者逐步生成法
function GetSubsets3(const arr: TArr_int; const n: integer): TList_TList_int;
var
  res: TList_TList_int;
  s: TList_int;
  tmpArr: TArr_int;
  i, j: integer;
begin
  tmpArr := Copy(arr);
  TArrayUtils_int.Sort(tmpArr);

  res := TList_TList_int.Create;
  for i := TMath.Power(2, n) - 1 downto 1 do
  begin
    s := TList_int.Create; // 对每个i建立一个集合

    // 检查哪个位上的二进制为1, 从高位开始检查,高位对应着数组靠后的元素
    for j := n - 1 downto 0 do
    begin
      if ((i shr j) and 1) = 1 then
        s.add(tmpArr[j]);
    end;

    res.AddRange(s);
  end;

  Result := res;
end;

procedure Main;
var
  arr, a: TArr_int;
  tmp1: TSet_TSet_int;
  tmp2: TList_TList_int;
  t1: TSet_int;
  t2: TList_int;
begin
  arr := [1, 2, 3];

  tmp1 := GetSubsets1(arr, Length(arr));
  for t1 in tmp1.ToArray do
  begin
    a := t1.ToArray;

    if not t1.IsEmpty then
    begin
      TArrayUtils_int.Sort(a);
      TArrayUtils_int.Print(a);
    end
    else
      writeln('[]');
  end;

  DrawLineBlockEnd;

  tmp1 := GetSubsets2(arr, Length(arr));
  for t1 in tmp1.ToArray do
  begin
    a := t1.ToArray;

    if not t1.IsEmpty then
    begin
      TArrayUtils_int.Sort(a);
      TArrayUtils_int.Print(a);
    end
    else
      writeln('[]');
  end;

  DrawLineBlockEnd;

  tmp2 := GetSubsets3(arr, Length(arr));
  for t2 in tmp2 do
  begin
    if t2.Count <> 0 then
      TArrayUtils_int.Print(t2.ToArray)
    else
      writeln('[]');
  end;
end;

end.