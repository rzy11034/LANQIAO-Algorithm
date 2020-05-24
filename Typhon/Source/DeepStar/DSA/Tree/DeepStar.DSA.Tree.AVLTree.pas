unit DeepStar.DSA.Tree.AVLTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BSTTree,
  DeepStar.DSA.Tree.BstNode,
  DeepStar.DSA.Interfaces,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Linear.Queue;

type
  generic TAVLtree<K, V> = class(specialize TBSTTree<K, V>)
  strict private type
    TBSTNode_K_V = specialize TBSTNode<K, V>;
    TImpl_K = specialize TImpl<K>;
    TImpl_V = specialize TImpl<V>;
    TList_node = specialize TArrayList<TBSTNode_K_V>;
    TQueue_node = specialize TQueue<TBSTNode_K_V>;
    TPtr_V = specialize TPtr_V<V>;

  private
    _a: TPtr_V;
    function __isBalanced(node: TBSTNode_K_V): boolean;

  public
    constructor Create;
    destructor Destroy; override;


    function Remove(key: K): V;
  end;


implementation

{ TAVLtree }

constructor TAVLtree.Create;
begin
  inherited Create;
end;

destructor TAVLtree.Destroy;
begin
  inherited Destroy;
end;

function TAVLtree.Remove(key: K): V;
begin

end;

function TAVLtree.__isBalanced(node: TBSTNode_K_V): boolean;
var
  a: TBSTNode_K_V;
begin

end;

end.
