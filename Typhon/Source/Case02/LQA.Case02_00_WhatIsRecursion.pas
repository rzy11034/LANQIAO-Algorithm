unit LQA.Case02_00_WhatIsRecursion;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

//注意死循环
procedure F(n: integer);
begin
  if n = 0 then
    Exit;
  //调用自身
  F(n - 1);
end;

{**
   * f1(n):求n的阶乘-->f1(n-1)求n-1的阶乘
   * 找重复：n*(n-1)的阶乘,求n-1的阶乘是原问题的重复（规模更小）——子问题
   * 找变化：变化的量应该作为参数
   * 找边界：出口
}
function F1(n: integer): integer;
begin
  if n = 1 then
  begin
    Result := 1;
    Exit;
  end;

  Result := n * F1(n - 1);
end;

{**
   * 打印i到j
   * 找重复：
   * 找变化：变化的量应该作为参数
   * 找边界：出口*}
procedure F2(i, j: integer);
begin
  if i > j then
    Exit;

  Write(i, '  ');
  F2(i + 1, j);
end;

{**
   * 对arr的所有元素求和
   * 找重复：
   * 找变化：变化的量应该作为参数
   * 找边界：出口
   *}
function F3(arr: TArr_int; start: integer): integer;
begin
  if start = Length(arr) - 1 then
  begin
    Result := arr[start];
    Exit;
  end;

  Result := arr[start] + F3(arr, start + 1);
end;

// 翻转字符串
function Reverse(src: UString): UString;

  function __reverse(var src: UString; finish: integer): UString;
  begin
    if (finish = 0) then
    begin
      Result := '' + src.Chars[0];
      Exit;
    end;

    Result := src.Chars[finish] + __reverse(src, finish - 1);
  end;

begin
  Result := __reverse(src, src.Length - 1);
end;

// 斐波那契数列 O(2^n)
function Fib(n: integer): integer;
begin
  if (n = 1) or (n = 2) then
  begin
    Result := 1;
    Exit;
  end;

  Result := Fib(n - 1) + Fib(n - 2);
end;

// 最大公约数
function Gcd(m, n: integer): integer;
begin
  if n = 0 then
  begin
    Result := m;
    Exit;
  end;

  Result := Gcd(n, m mod n);
end;

// 插入排序改递归
procedure InsertSort(var arr: TArr_int);
  procedure __insertSort(var arr: TArr_int; k: integer);
  var
    x, index: integer;
  begin
    if k = 0 then
      Exit;

    //对前k-1个元素排序
    __insertSort(arr, k - 1);

    //把位置k的元素插入到前面的部分
    x := arr[k];
    index := k - 1;
    while (index > -1) and (x < arr[index]) do
    begin
      arr[index + 1] := arr[index];
      Dec(index);
    end;

    arr[index + 1] := x;
  end;

begin
  __insertSort(arr, Length(arr) - 1);
end;

procedure Main;
var
  tmpArr: TArr_int;
begin
  WriteLn('求5的阶乘: ', F1(5));
  DrawLineBlockEnd;

  Write('打印i到j: ');
  F2(8, 10);
  WriteLn;
  DrawLineBlockEnd;

  WriteLn('对[1, 2, 3, 4, 5]的所有元素求和: ', F3([1, 2, 3, 4, 5], 0));
  DrawLineBlockEnd;

  WriteLn('翻转字符串''abcd'': ', reverse('abcd'));
  DrawLineBlockEnd;

  WriteLn('10的斐波那契数列: ', Fib(10));
  DrawLineBlockEnd;

  WriteLn('16 12 的最大公约数:', Gcd(16, 12));
  DrawLineBlockEnd;

  WriteLn('插入排序改递归: ');
  tmpArr := [2, 3, 1, 5, 4];
  InsertSort(tmpArr);
  TUtils_Int.PrintArray(tmpArr);
  WriteLn;
end;

end.