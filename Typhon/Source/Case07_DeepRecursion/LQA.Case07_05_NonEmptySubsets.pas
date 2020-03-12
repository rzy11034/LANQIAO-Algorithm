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
  LQA.Utils,
  LQA.DSA.Tree.HashSet;

procedure Main;

implementation

type
  TSubSets = specialize THashSet<TSet_int>;

// 递归增量构造法
function GetSubsets1(const arr: TArr_int; const n: integer): TSubSets;
  function __getSubsets1(const arr: TArr_int; const n: integer; cur: integer): TSubSets;
  var
    res, tmp: TSubSets;
    null, _1st, t, clone: TSet_int;
  begin
    res := TSubSets.Create;

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

procedure Main;
var
  arr: TArr_int;
  tmp: TSubSets;
  t: TSet_int;
begin
  arr := [1, 2];

  tmp := GetSubsets1(arr, Length(arr));

  for t in tmp.ToArray do
  begin
    arr := t.ToArray;

    if not t.IsEmpty then
    begin
      TArrayUtils_int.Sort(arr);
      TArrayUtils_int.Print(arr);
    end
    else
      writeln('[]');
  end;
end;

end.