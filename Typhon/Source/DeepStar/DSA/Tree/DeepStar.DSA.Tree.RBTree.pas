unit DeepStar.DSA.Tree.RBTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BalanceBinarySearchTree;

type
  generic TRBTree<K, V> = class(specialize TBalanceBinarySearchTree<K, V>)
  private const
    RED = False;
    BLACK = True;

  private type
    TRBNode = class(TNode)
    public
      Color: boolean;

      constructor Create(newKey: K; newValue: V; newParent: TRBNode);
    end;

  private
    function __isBlack(node: TNode): boolean;
    function __isRed(node: TNode): boolean;
    function __ColorOf(node: TNode; newColor: boolean): TNode;
    function __Red(node: TNode): TNode;
    function __Black(node: TNode): TNode;

  protected
    procedure __afterAdd(node: TNode); override;
    procedure __afterRemove(node: TNode); override;
    function __CreateNode(newKey: K; newValue: V; newParent: TNode): TNode; override;

  public
    constructor Create;
    destructor Destroy; override;

    function keyToArray: TImpl_K.TArr;
  end;

implementation

{ TRBTree.TRBNode }

constructor TRBTree.TRBNode.Create(newKey: K; newValue: V; newParent: TRBNode);
begin
  inherited Create(newKey, newValue, newParent);
  Color := RED;
end;

{ TRBTree }

constructor TRBTree.Create;
begin
  inherited Create;
end;

destructor TRBTree.Destroy;
begin
  inherited Destroy;
end;

function TRBTree.keyToArray: TImpl_K.TArr;
var
  list: TList_node;
  cur: TRBNode;
  i: integer;
  s: string;
begin
  list := TList_node.Create;
  Self.__levelOrder(_root, list);

  for i := 0 to list.Count - 1 do
  begin
    cur := list[i] as TRBNode;

    if __isRed(cur) then
      s := 'R(' + cur.Key.ToString + ') '
    else
      s := 'B(' + cur.Key.ToString + ') ';

    Write(s);
  end;
end;

procedure TRBTree.__afterAdd(node: TNode);
var
  parent, uncle, grand: TNode;
begin
  parent := node.Parent;

  // 添加的是根节点 或者 上溢到达了根节点
  if parent = nil then
  begin
    __black(node);
    Exit;
  end;

  // 如果父节点是黑色，直接返回
  if __isBlack(parent) then
    Exit;

  // 叔父节点
  uncle := parent.Sibling;

  // 祖父节点
  grand := __Red(parent.parent);
  if __isRed(uncle) then // 叔父节点是红色【B树节点上溢】
  begin
    __Black(parent);
    __Black(uncle);
    // 把祖父节点当做是新添加的节点
    __afterAdd(grand);
    Exit;
  end;

  // 叔父节点不是红色
  if parent.IsLeftChild then  // L
  begin
    if node.IsLeftChild then // LL
    begin
      __Black(parent);
      __rotateRight(grand);
    end
    else // LR
    begin
      __Black(node);
      __rotateLeft(parent);
      __rotateRight(grand);
    end;
  end
  else // R
  begin
    if node.IsLeftChild then // RL
    begin
      __Black(node);
      __rotateRight(parent);
    end
    else // RR
    begin
      __Black(parent);
    end;

    __rotateLeft(grand);
  end;
end;

procedure TRBTree.__afterRemove(node: TNode);
begin

end;

function TRBTree.__Black(node: TNode): TNode;
begin
  Result := __ColorOf(node, BLACK);
end;

function TRBTree.__isBlack(node: TNode): boolean;
var
  res: boolean;
begin
  if node = nil then
    res := BLACK
  else
    res := (node as TRBNode).Color = BLACK;

  Result := res;
end;

function TRBTree.__isRed(node: TNode): boolean;
begin
  Result := not __isBlack(node);
end;

function TRBTree.__Red(node: TNode): TNode;
begin
  Result := __ColorOf(node, RED);
end;

function TRBTree.__ColorOf(node: TNode; newColor: boolean): TNode;
begin
  if node = nil then
    Exit(node);

  (node as TRBNode).Color := newColor;
  Result := node;
end;

function TRBTree.__CreateNode(newKey: K; newValue: V; newParent: TNode): TNode;
begin
  Result := TRBNode.Create(newKey, newValue, newParent as TRBNode);
end;

end.
