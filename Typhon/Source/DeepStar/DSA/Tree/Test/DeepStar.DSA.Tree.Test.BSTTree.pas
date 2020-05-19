unit DeepStar.DSA.Tree.Test.BSTTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BSTTree,
  LQA.Utils;

procedure Main;

implementation

type
  TBSTTree_int_int = specialize TBSTTree<integer, integer>;

procedure Main;
var
  tree: TBSTTree_int_int;
  arr: tarr
begin
  tree := TBSTTree_int_int.Create;

  tree.Add(1, 1);
  tree.Add(2, 2);
  tree.Add(3, 3);

  //tree.Clear;
  tree.Remove(3);

  TArrayUtils_int.Print(tree.Keys);
  TArrayUtils_int.Print(tree.Values);
  writeln('ContainKey(3): ', tree.ContainsKey(3));
  writeln('ContainKey(4): ', tree.ContainsKey(4));
  writeln('ContainsValue(3): ', tree.ContainsValue(3));
  writeln('ContainsValue(4): ', tree.ContainsValue(4));
  writeln('tree.GetItem(2): ', tree.GetItem(2));
  writeln('tree.Height: ', tree.Height);

  tree.Clear;

  DrawLineBlockEnd;


end;

end.
