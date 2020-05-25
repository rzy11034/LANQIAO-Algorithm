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
  private type
    TArr_TBSNode = array of TBSTNode_K_V;

  private
    function __firstUnbalance(n: TBSTNode_K_V): TArr_TBSNode;
    procedure __leftRotate(p, q: TBSTNode_K_V);
    procedure __rightRotate(p, q: TBSTNode_K_V);
    function __unBalance(g: TBSTNode_K_V): boolean;
    procedure __reBalance(pqs: TArr_TBSNode);
    procedure __reBalance(node: TBSTNode_K_V);

  public
    constructor Create;
    destructor Destroy; override;

    function IsBalance: boolean;
    procedure Remove(key: K);
    procedure Add(key: K; Value: V);
  end;


implementation

{ TAVLtree }

constructor TAVLtree.Create;
begin
  inherited Create;
end;

procedure TAVLtree.Add(key: K; Value: V);
var
  nnode: TBSTNode_K_V;
  pqs: TArr_TBSNode;
begin
  // 先按bst的方式来插入，再调整
  nnode := __add(key, Value);

  // 向上找到第一个不平衡的祖先p
  pqs := __firstUnbalance(nnode);

  if pqs <> nil then
  begin
    //不平衡
    __reBalance(pqs);
  end;
end;

destructor TAVLtree.Destroy;
begin
  inherited Destroy;
end;

function TAVLtree.IsBalance: boolean;
begin
  Result := not __unBalance(_root);
end;

procedure TAVLtree.Remove(key: K);
var
  node, parent, LChild, RChild: TBSTNode_K_V;
  _predecessor, parentOfPredecessor, _successor, parentOfSuccessor: TBSTNode_K_V;
begin
  node := __getNode(_root, key);

  if (node = nil) then
    exit;

  parent := node.parent;
  LChild := node.LChild;
  RChild := node.RChild;

  if (LChild = nil) and (RChild = nil) then
  begin //leaf node
    __removeNode(node.Parent, node, node.Key);
    __reBalance(parent);
  end
  else if RChild = nil then
  begin //has only LChild child.左孩子替换自身
    _predecessor := __maxNode(LChild);
    parentOfPredecessor := _predecessor.parent;
    __removeNode(parentOfPredecessor, _predecessor, _predecessor.Key);
    node.key := _predecessor.key;
    node.Value := _predecessor.Value;
    __reBalance(parentOfPredecessor);
  end
  else
  begin //有右孩子,找到右子树的最小
    _successor := __minNode(RChild);
    parentOfSuccessor := _successor.parent;
    //  minNode must be leaf node
    __removeNode(parentOfSuccessor, _successor, _successor.Key);
    node.key := _successor.key;
    __reBalance(parentOfSuccessor);
  end;
end;

function TAVLtree.__firstUnbalance(n: TBSTNode_K_V): TArr_TBSNode;
var
  s, p, g: TBSTNode_K_V;
  res: TArr_TBSNode;
begin
  if (n = nil) then
  begin
    Result := nil;
    exit;
  end;

  s := n;
  p := n.parent;
  if p = nil then
  begin
    Result := nil;
    exit;
  end;

  g := p.parent;
  if g = nil then
  begin
    Result := nil;
    exit;
  end;

  if __unBalance(g) then
  begin
    //不平衡了
    res := [g, p, s];
  end
  else
  begin
    res := __firstUnbalance(p);
  end;

  Result := res;
end;

procedure TAVLtree.__leftRotate(p, q: TBSTNode_K_V);
var
  pIsLeft: boolean;
  pp, B: TBSTNode_K_V;
begin
  pIsLeft := p.IsLeftChild;
  pp := p.parent;
  //p和q的左子——B的关系
  B := q.LChild;
  p.RChild := B;
  if B <> nil then
  begin
    B.parent := p;
    B.isLeftChild := False;
  end;

  // p，q的关系
  q.LChild := p;
  p.parent := q;
  p.isLeftChild := True;

  // p 和 pp 的关系
  q.parent := pp;
  //p是根节点
  if pp = nil then
  begin
    _root := q;
    exit;
  end;

  if pIsLeft then
  begin
    pp.LChild := q;
    q.isLeftChild := True;
  end
  else
  begin
    pp.RChild := q;
    q.isLeftChild := False;
  end;
end;

procedure TAVLtree.__reBalance(pqs: TArr_TBSNode);
var
  p, q, s: TBSTNode_K_V;
begin
  if (pqs = nil) then exit;
  p := pqs[0];//不平衡的那个祖先
  q := pqs[1];//p的子节点
  s := pqs[2];//q的子节点

  if q.IsRight and s.isRight then
  begin // 右右型，以p为中心逆时针旋转
    __leftRotate(p, q);
  end
  else if q.isLeft and s.isLeft then
  begin //左左型，以p为中心顺时针旋转
    __rightRotate(p, q);
  end
  else if q.isLeft and s.isRight then
  begin //左右型
    __leftRotate(q, s);//q，s左旋，变为左左型
    __rightRotate(p, s);
  end
  else
  begin //右左型
    __rightRotate(q, s);
    __leftRotate(p, s);
  end;
end;

procedure TAVLtree.__reBalance(node: TBSTNode_K_V);
var
  LChild, RChild: TBSTNode_K_V;
  hOfRight, hOfleft: integer;
begin
  if node = nil then exit;

  RChild := node.RChild;
  LChild := node.LChild;
  hOfRight := __getHeight(RChild);
  hOfleft := __getHeight(LChild);

  if hOfRight - hOfleft >= 2 then
  begin //右侧高
    __leftRotate(node, RChild);//左旋
    __reBalance(RChild);
  end
  else if hOfRight - hOfleft <= -2 then
  begin
    __rightRotate(node, LChild);
    __reBalance(LChild);
  end
  else
  begin
    __reBalance(node.parent);
  end;
end;

procedure TAVLtree.__rightRotate(p, q: TBSTNode_K_V);
var
  pIsLeft: boolean;
  pp, x: TBSTNode_K_V;
begin
  pIsLeft := p.IsLeftChild;
  pp := p.parent;

  x := q.RChild;
  p.LChild := x;
  if x <> nil then
  begin
    x.parent := p;
    x.isLeftChild := True;
  end;

  q.RChild := p;
  p.parent := q;
  p.isLeftChild := False;


  //设定 p和 gg 的关系
  q.parent := pp;
  if pp = nil then
  begin
    _root := q;
    exit;
  end;

  if pIsLeft then
  begin
    pp.LChild := q;
    q.isLeftChild := True;
  end
  else
  begin
    pp.RChild := q;
    q.IsLeftChild := False;
  end;
end;

function TAVLtree.__unBalance(g: TBSTNode_K_V): boolean;
var
  minus: integer;
begin
  if g = nil then
    exit(False);

  minus := __getHeight(g.LChild) - __getHeight(g.RChild);
  Result := (Abs(minus) > 1) or (__unBalance(g.RChild)) or (__unBalance(g.LChild));
end;

end.
