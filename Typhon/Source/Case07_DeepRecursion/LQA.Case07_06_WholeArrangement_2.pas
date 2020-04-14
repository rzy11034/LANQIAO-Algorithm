unit LQA.Case07_06_WholeArrangement_2;

{**
 *编写一个方法，确定某字符串的所有排列组合。

  给定一个string A和一个int n,代表字符串和其长度，请返回所有该字符串字符的排列，
  保证字符串长度小于等于11且字符串中字符均为大写英文字符，

  排列中的字符串按字典序从大到小排序。(不合并重复字符串)
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 回溯法
function Solution(const str: UString): TList_str;
var
  res: TList_str;

  procedure __solution(var arr: TArr_chr; k: integer);
  var
    i: integer;
  begin
    // 排好了一种情况,递归的支路走到底了
    if k = Length(arr) then
    begin
      res.AddLast(UString.Create(arr));
      Exit;
    end;

    // 从k位开始的每个字符, 都尝试放在新排列的k这个位置
    for i := k to Length(arr) - 1 do
    begin
      // 把后面每个字符换到 k 位
      TUtils_chr.Swap(arr[i], arr[k]);
      __solution(arr, k + 1);
      TUtils_chr.Swap(arr[i], arr[k]);
    end;
  end;

var
  chrArr: TArr_chr;
begin
  chrArr := str.ToCharArray;
  res := TList_str.Create;
  __solution(chrArr, 0);
  Result := res;
end;

procedure Main;
var
  s: UString;
  tmp: TList_str;
begin
  s := 'ABC';
  tmp := Solution(s);
  WriteLn(tmp.Count);
  TArrayUtils_str.Print(tmp.ToArray);
end;

end.