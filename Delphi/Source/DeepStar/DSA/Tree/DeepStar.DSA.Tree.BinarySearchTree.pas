unit DeepStar.DSA.Tree.BinarySearchTree;

interface

uses
  System.SysUtils,
  DeepStar.DSA.Tree.BinaryTree;

type
  TBinarySearchTree<K, V> = class(TBinaryTree<K, V>)
  private type
    TNode_K_V = TNode<K, V>;

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

constructor TBinarySearchTree<K, V>.Create;
begin
  inherited Create;
end;

procedure TBinarySearchTree<K, V>.Add(key: K; Value: V);
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

  cur := TNode_K_V.Create(key, Value, parent);
  if parent = nil then
    _root := cur
  else if cmp < 0 then
    parent.Left := cur
  else if cmp > 0 then
    parent.Right := cur;

  _size := _size + 1;
end;

destructor TBinarySearchTree<K, V>.Destroy;
var
  a: TNode_K_V;
begin
  inherited Destroy;
end;

procedure TBinarySearchTree<K, V>.Remove(key: K);
begin
  __remove(__getNode(_root, key));
end;

procedure TBinarySearchTree<K, V>.__remove(node: TNode_K_V);
var
  min, replace: TNode_K_V;
begin
  if node = nil then
    Exit;

  if node.HasTwoChildren then // 度为2的节点
  begin
    // 找到后继节点
    min := __getSuccessor(node.Key);

    // 用后继节点的值覆盖度为2的节点的值
    node.Key := min.Key;
    node.Value := min.Value;

    // 删除后继节点
    node := min;
  end;

  if node.Left <> nil then
    replace := node.Left
  else
    replace := node.Right;

  if replace <> nil then // node是度为1的节点
  begin

    // 更改parent
    replace.parent := node.parent;

    // 更改parent的left、right的指向
    if node.parent = nil then
    begin // node是度为1的节点并且是根节点
      _root := replace;
    end
    else if node.IsLeftChild then
    begin
      node.parent.left := replace;
    end
    else
    begin // node = node.parent.right
      node.parent.right := replace;
    end;
  end
  else if node.parent = nil then // node是叶子节点并且是根节点
  begin
    _root := nil;
  end
  else // node是叶子节点，但不是根节点
  begin
    if node.IsLeftChild then
    begin
      node.parent.left := nil;
    end
    else // node = node.parent.right
    begin
      node.parent.right := nil;
    end;
  end;

  _size := _size - 1;
  FreeAndNil(node);
end;

end.
