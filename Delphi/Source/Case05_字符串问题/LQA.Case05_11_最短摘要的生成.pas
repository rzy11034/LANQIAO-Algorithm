unit LQA.Case05_11_最短摘要的生成;

{ *
  Alibaba笔试题：给定一段产品的英文描述，包含M个英文字母，每个英文单词以空格分隔，
  无其他标点符号；再给定N个英文单词关键字，请说明思路并编程实现方法

  String extractSummary(String description,String[] key words)

  目标是找出此产品描述中包含N个关键字（每个关键词至少出现一次）的长度最短的子串，
  作为产品简介输出。

  * }

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  LQA.Utils;

procedure Main;

implementation

type
  TShortestAbstract = class
  public
    class function ContainsAll(keyWords, w: TArr_str; i, j: integer): boolean;
    class procedure print(arr: TArr_str; l, r: integer);
    class procedure solution(w, q: TArr_str);
  end;

procedure Main;
var
  a, b: TArr_str;
begin
  a := ['a', 'b', 'c', 'seed', 'h', 'e', 'f', 'c', 'c', 'seed', 'e', 'f', 'seed', 'c'];
  b := ['c', 'e'];

  TShortestAbstract.solution(a, b);
end;

{ TShortestAbstract }

class function TShortestAbstract.ContainsAll(keyWords, w: TArr_str; i, j: integer): boolean;
var
  k: integer;
  map, map2: TMap_str_int;
  key: UString;
  e: TPair<UString, integer>;
begin
  map := TMap_str_int.Create;

  for k := 0 to Length(keyWords) - 1 do
  begin
    key := keyWords[k];
    if map.ContainsKey(key) = False then
      map.Add(key, 1)
    else
      map.AddOrSetValue(key, map[key] + 1);
  end;

  map2 := TMap_str_int.Create;

  for k := i to j do
  begin
    key := w[k];
    if map2.ContainsKey(key) = False then
      map2.Add(key, 1)
    else
      map2.AddOrSetValue(key, map2[key] + 1);
  end;

  for e in map.ToArray do
  begin
    if (map2.ContainsKey(e.key) = False) or (map2[e.key] < e.Value) then
    begin
      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

class procedure TShortestAbstract.print(arr: TArr_str; l, r: integer);
var
  i: integer;
begin
  WriteLn(l, ' ', r);
  for i := l to r do
  begin
    Write(arr[i], ' ');
  end;
  WriteLn;
end;

class procedure TShortestAbstract.solution(w, q: TArr_str);
var
  len, l, r, i, j: integer;
begin
  len := integer.MaxValue;
  l := -1;
  r := -1;
  for i := 0 to Length(w) - 1 do
  begin
    //求以i开头包含所有关键字的序列
    for j := i + 1 to Length(w) - 1 do
    begin
      //如果全部关键词已经在seq中
      if ContainsAll(q, w, i, j) then
      begin
        //  判断当前这个序列是不是较短的序列
        if j - i + 1 < len then
        begin
          len := j - i + 1;
          l := i;
          r := j;
        end;

        Break;
      end;
    end;
  end;
  print(w, l, r);
end;

end.
