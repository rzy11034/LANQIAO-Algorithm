unit DeepStar.DSA.Tree.BinarySearchTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BinaryTree;

type

  generic TBinarySearchTree<K, V> = class(specialize TBinaryTree<K, V>)
  private
    procedure __remove(node: TNode_K_V);

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(key: K; Value: V); override;
    procedure Remove(key: K); override;
  end;

implementation

{ TBinarySearchTree }

constructor TBinarySearchTree.Create;
begin
  inherited Create;
end;

procedure TBinarySearchTree.Add(key: K; Value: V);
var
  parent, cur: TNode_K_V;
  cmp: integer;
begin
  parent := nil;
  cur := _root;
  cmp := 0;

  while cur <> nil do
  begin
    parent := cur;
    cmp := _cmp_K.Compare(key, cur.Key);

    if cmp < 0 then
      cur := cur.Left
    else if cmp > 0 then
      cur := cur.Right
    else
      Exit;
  end;

  cur := TBSTNode_K_V.Create(key, Value, parent);
  if parent = nil then
    _root := cur
  else if cmp < 0 then
    parent.LChild := cur
  else if cmp > 0 then
    parent.RChild := cur;

    _size += 1;
end;

destructor TBinarySearchTree.Destroy;
begin
  inherited Destroy;
end;

procedure TBinarySearchTree.Remove(key: K);
begin
  __remove(__getNode(_root, key));
end;

procedure TBinarySearchTree.__remove(node: TNode_K_V);
begin

end;

end.
