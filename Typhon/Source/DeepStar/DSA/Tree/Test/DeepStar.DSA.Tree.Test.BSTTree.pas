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

  tree.Add(2, 2);
  tree.Add(1, 1);
  tree.Add(3, 3);
end;

end.