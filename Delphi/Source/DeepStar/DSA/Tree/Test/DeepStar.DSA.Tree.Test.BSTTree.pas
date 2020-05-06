unit DeepStar.DSA.Tree.Test.BSTTree;

interface

uses
  System.SysUtils,
  DeepStar.DSA.Tree.BSTTree,
  LQA.Utils;

procedure Main;

implementation

type
  TBSTTree_int_int = TBSTTree<integer, integer>;

procedure Main;
var
  Tree: TBSTTree_int_int;
  n:integer;
begin
  Tree := TBSTTree_int_int.Create;

  Tree.Add(2, 1);
  Tree.Add(1, 3);
  Tree.Add(3, 2);

  tree.SetItem(1, 5);

  TArrayUtils_int.Print(Tree.Keys);
  TArrayUtils_int.Print(Tree.Values);
  writeln('ContainKey(3): ', Tree.ContainsKey(3));
  writeln('ContainKey(4): ', Tree.ContainsKey(4));
  writeln('ContainsValue(3): ', Tree.ContainsValue(3));
  writeln('ContainsValue(4): ', Tree.ContainsValue(4));
  writeln('tree.GetItem(1).PValue^: ', tree.GetItem(1).PValue^);
  
end;

end.
