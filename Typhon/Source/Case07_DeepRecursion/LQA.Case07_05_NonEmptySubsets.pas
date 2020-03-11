unit LQA.Case07_05_NonEmptySubsets;

{**
  请编写一个方法，返回某集合的所有非空子集。

  给定一个int数组A和数组的大小int n，请返回A的所有非空子集。
  保证A的元素个数小于等于20，且元素互异。

  各子集内部从大到小排序,子集之间字典逆序排序
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure Main;
var
  a, b: TSet_str;
  s:UString;
begin
  a := TSet_str.Create;
  a.Add('()');
  a.Add('[]');

  b := a.Clone;
  b.Add('{}');

  for s in a.ToArray do
    Write(s, ' ');
  WriteLn;

  for s in b.ToArray do
    Write(s, ' ');
  WriteLn;
end;

end.
