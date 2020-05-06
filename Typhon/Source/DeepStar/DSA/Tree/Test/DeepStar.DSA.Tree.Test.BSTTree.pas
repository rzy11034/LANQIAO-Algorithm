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
begin
  tree := TBSTTree_int_int.Create;

  tree.Add(2, 1);
  tree.Add(1, 3);
  tree.Add(3, 2);

  tree.SetItem(1, 5);

  TArrayUtils_int.Print(tree.Keys);
  TArrayUtils_int.Print(tree.Values);
  writeln('ContainKey(3): ', tree.ContainsKey(3));
  writeln('ContainKey(4): ', tree.ContainsKey(4));
  writeln('ContainsValue(3): ', tree.ContainsValue(3));
  writeln('ContainsValue(4): ', tree.ContainsValue(4));
  writeln('tree.GetItem(1).PValue^: ', tree.GetItem(1).PValue^);
end;

end.
