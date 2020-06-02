unit DeepStar.DSA.Tree.Test.AVLTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.AVLTree,
  LQA.Utils;

procedure Main;

implementation

type
  TAVL_int_int = specialize TAVLTree<integer, integer>;

procedure Main;
var
  tree: TAVL_int_int;
  arr: TArr_int;
  i: integer;
begin
  tree := TAVL_int_int.Create;

  tree.Add(1, 1);
  WriteLn(tree.Height);
  tree.Add(2, 2);
  TArrayUtils_int.Print(tree.Keys);
  TArrayUtils_int.Print(tree.Values);
end;

end.
