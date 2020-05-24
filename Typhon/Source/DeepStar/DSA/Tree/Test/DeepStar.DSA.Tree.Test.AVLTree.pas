unit DeepStar.DSA.Tree.Test.AVLTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.AVLTree;

procedure Main;

implementation

type
  TAVLTree_int_int = specialize TAVLtree<integer, integer>;

procedure Main;
var
  avl: TAVLTree_int_int;
begin
  avl := TAVLTree_int_int.Create;
  avl.Add(1, 1);
end;

end.
