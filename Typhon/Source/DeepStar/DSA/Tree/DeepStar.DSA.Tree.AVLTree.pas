unit DeepStar.DSA.Tree.AVLTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BinaryTree,
  DeepStar.DSA.Tree.BinarySearchTree;

type
  generic TAVLTree<K, V> = class(specialize TBinarySearchTree<K, V>)
  private type
    TAVLNode = class(TNode)
    public
      Height: integer;
      constructor Create(newKey: K; newValue: V; newParent: TAVLNode);
    end;

    //TNode = TAVLNode;

  protected

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TAVLTree }

constructor TAVLTree.Create;
begin
  inherited Create;
end;

destructor TAVLTree.Destroy;
begin
  inherited Destroy;
end;

{ TAVLTree.TAVLNode }

constructor TAVLTree.TAVLNode.Create(newKey: K; newValue: V; newParent: TAVLNode);
begin
  inherited Create(newKey, newValue, newParent);
  Height := 0;
end;

end.
