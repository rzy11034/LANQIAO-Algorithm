﻿unit DeepStar.DSA.Tree.AVLTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.DSA.Tree.BinarySearchTree;

type
  generic TAVLTree<K, V> = class(specialize TBinarySearchTree<K, V>)
  protected type
    TAVLNode = class(TNode)
    private
      procedure __getAllChildHeight(out leftHeight, rightHeight: integer);

    public
      Height: integer;

      constructor Create(newKey: K; newValue: V; newParent: TAVLNode);
      // 获取该节点平衡因子
      function BalanceFactor: integer;
      // 比较高的子节点
      function TallerChild: TAVLNode;
      // 更新高度
      procedure UpdateHeight;
    end;

  protected
    function __CreateNode(newKey: K; newValue: V; newParent: TNode): TNode; override;
    // 判断传入节点是否平衡（平衡因子的绝对值 <= 1）
    function __isBalanced(node: TAVLNode): boolean;
    procedure __afterAdd(node: TNode); override;
    procedure __afterRemove(node: TNode); override;
    // 恢复平衡:  grand--高度最低的那个不平衡节点
    procedure __rebalance(grand: TAVLNode);
    procedure __updataHeight(node: TAVLNode);

  public
    constructor Create;
    destructor Destroy; override;
    function Height: integer;
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

function TAVLTree.Height: integer;
begin
  Result := (_root as TAVLNode).Height;
end;

procedure TAVLTree.__afterAdd(node: TNode);
begin
  node := node.Parent;

  while node <> nil do
  begin
    if __isBalanced(node as TAVLNode) then // 如果平衡
    begin
      (node as TAVLNode).UpdateHeight;
    end
    else // 如果不平衡, 恢复平衡
    begin
      __rebalance(node as TAVLNode);
      Break;
    end;

    node := node.Parent;
  end;
end;

procedure TAVLTree.__afterRemove(node: TNode);
begin
  node := node.Parent;

  while node <> nil do
  begin
    if __isBalanced(node as TAVLNode) then // 如果平衡
    begin
      (node as TAVLNode).UpdateHeight;
    end
    else // 如果不平衡, 恢复平衡
    begin
      __rebalance(node as TAVLNode);
    end;

    node := node.Parent;
  end;
end;

function TAVLTree.__CreateNode(newKey: K; newValue: V; newParent: TNode): TNode;
begin
  Result := TAVLNode.Create(newKey, newValue, newParent as TAVLNode);
end;

function TAVLTree.__isBalanced(node: TAVLNode): boolean;
begin
  Result := Abs(node.BalanceFactor) <= 1;
end;

procedure TAVLTree.__rebalance(grand: TAVLNode);
begin

end;

procedure TAVLTree.__updataHeight(node: TAVLNode);
begin
  node.UpdateHeight;
end;

{ TAVLTree.TAVLNode }

constructor TAVLTree.TAVLNode.Create(newKey: K; newValue: V; newParent: TAVLNode);
begin
  inherited Create(newKey, newValue, newParent);
  Height := 1;
end;

function TAVLTree.TAVLNode.BalanceFactor: integer;
var
  leftHeight, rightHeight: integer;
begin
  __getAllChildHeight(leftHeight, rightHeight);

  Result := leftHeight - rightHeight;
end;

function TAVLTree.TAVLNode.TallerChild: TAVLNode;
var
  leftHeight, rightHeight: integer;
  res: TAVLNode;
begin
  __getAllChildHeight(leftHeight, rightHeight);

  if leftHeight > rightHeight then
    res := Left as TAVLNode
  else if leftHeight < rightHeight then
    res := Right as TAVLNode
  else
  begin
    if IsLeftChild then
      res := left as TAVLNode
    else
      res := Right as TAVLNode;
  end;

  Result := res;
end;

procedure TAVLTree.TAVLNode.UpdateHeight;
var
  leftHeight, rightHeight: integer;
begin
  __getAllChildHeight(leftHeight, rightHeight);

  Height := 1 + Max(leftHeight, rightHeight);
end;

procedure TAVLTree.TAVLNode.__getAllChildHeight(out leftHeight, rightHeight: integer);
begin
  if Left = nil then
    leftHeight := 0
  else
    leftHeight := (Left as TAVLNode).Height;

  if Right = nil then
    rightHeight := 0
  else
    rightHeight := (Right as TAVLNode).Height;
end;

end.
