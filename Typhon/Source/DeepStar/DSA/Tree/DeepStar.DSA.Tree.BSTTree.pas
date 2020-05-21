unit DeepStar.DSA.Tree.BSTTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  {%H-}Rtti,
  DeepStar.DSA.Tree.BstNode,
  DeepStar.DSA.Interfaces,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Linear.Queue;

type
  generic TBSTTree<K, V> = class(TInterfacedObject, specialize IMap<K, V>)
  protected type
    TBSTNode_K_V = specialize TBSTNode<K, V>;
    TImpl_K = specialize TImpl<K>;
    TImpl_V = specialize TImpl<V>;
    TList_node = specialize TArrayList<TBSTNode_K_V>;
    TQueue_node = specialize TQueue<TBSTNode_K_V>;
    TPtr_V = specialize TPtr_V<V>;

  protected
    _root: TBSTNode_K_V;
    _cmp_K: TImpl_K.ICmp;
    _cmp_V: TImpl_V.ICmp;
    _size: integer;

    function __getHeight(node: TBSTNode_K_V): integer;
    function __getNode(node: TBSTNode_K_V; Key: K): TBSTNode_K_V;
    function __maxNode(node: TBSTNode_K_V): TBSTNode_K_V;
    function __minNode(node: TBSTNode_K_V): TBSTNode_K_V;
    function __getPredecessor(key: K): TBSTNode_K_V;
    function __removeNode(parent, node: TBSTNode_K_V; key: K): TBSTNode_K_V;
    function __getSuccessor(key: K): TBSTNode_K_V;
    procedure __inOrder(node: TBSTNode_K_V; list: TList_node);
    procedure __levelOrder(node: TBSTNode_K_V; list: TList_node);
    procedure __updataHeight(node: TBSTNode_K_V);

  public
    constructor Create;
    destructor Destroy; override;

    function ContainsKey(key: K): boolean;
    function ContainsValue(Value: V): boolean;
    function Count: integer;
    function GetItem(key: K): V;
    function Height: integer;
    function IsEmpty: boolean;
    function Keys: TImpl_K.TArr;
    function Predecessor(key: K): K;
    function Remove(key: K): V;
    function Successor(key: K): K;
    function Values: TImpl_V.TArr;
    procedure Add(key: K; Value: V);
    procedure Clear;
    procedure SetItem(key: K; newValue: V);

    property Comparer_K: TImpl_K.ICmp read _cmp_K write _cmp_K;
    property Comparer_V: TImpl_V.ICmp read _cmp_V write _cmp_V;
    property Item[key: K]: V read GetItem write SetItem; default;
  end;

implementation

{ TBSTTree }

constructor TBSTTree.Create;
begin
  _root := nil;
  _size := 0;
  _cmp_K := TImpl_K.TCmp.Default;
  _cmp_V := TImpl_V.TCmp.Default;
end;

procedure TBSTTree.Add(key: K; Value: V);
var
  parent, cur: TBSTNode_K_V;
begin
  parent := nil;
  cur := _root;

  while cur <> nil do
  begin
    parent := cur;
    if _cmp_K.Compare(key, cur.Key) < 0 then
    begin
      cur := cur.LChild;
    end
    else if _cmp_K.Compare(key, cur.Key) > 0 then
    begin
      cur := cur.RChild;
    end
    else
    begin
      cur.Value := Value;
      Exit;
    end;
  end;

  cur := TBSTNode_K_V.Create(key, Value, parent);
  if parent = nil then
  begin
    _root := cur;
  end
  else if _cmp_K.Compare(key, parent.Key) < 0 then
  begin
    parent.LChild := cur;
    cur.IsLeftChild := true;
  end
  else if _cmp_K.Compare(key, parent.Key) > 0 then
  begin
    parent.RChild := cur;
    cur.IsLeftChild := false;
  end;

  _size += 1;
  __updataHeight(cur);
end;

procedure TBSTTree.Clear;
var
  key: K;
begin
  for key in Keys do
  begin
    Remove(key);
  end;
end;

function TBSTTree.ContainsKey(key: K): boolean;
var
  cur: TBSTNode_K_V;
begin
  cur := _root;

  while cur <> nil do
  begin
    if _cmp_K.Compare(key, cur.Key) < 0 then
      cur := cur.LChild
    else if _cmp_K.Compare(key, cur.Key) > 0 then
      cur := cur.RChild
    else
      Exit(true);
  end;

  Result := false;
end;

function TBSTTree.ContainsValue(Value: V): boolean;
var
  list: TList_node;
  _cmpV: TImpl_V.ICmp;
  i: integer;
begin
  _cmpV := TImpl_V.TCmp.Default;

  list := TList_node.Create;
  try
    __levelOrder(_root, list);

    for i := 0 to list.Count - 1 do
    begin
      if _cmpV.Compare(Value, list[i].Value) = 0 then
      begin
        Exit(true);
      end;
    end;

    Result := false;
  finally
    list.Free;
  end;
end;

function TBSTTree.Count: integer;
begin
  Result := _size;
end;

destructor TBSTTree.Destroy;
begin
  _root.Free;
  inherited Destroy;
end;

function TBSTTree.GetItem(key: K): V;
var
  Value: TValue;
  temp: TBSTNode_K_V;
begin
  TValue.Make(@key, TypeInfo(K), Value);
  if not (ContainsKey(key)) then
    raise Exception.Create('There is no ''' + Value.ToString + '''');

  temp := __getNode(_root, key);
  Result := temp.Value;
end;

function TBSTTree.Height: integer;
begin
  Result := __getHeight(_root);
end;

function TBSTTree.Predecessor(key: K): K;
var
  cur: TBSTNode_K_V;
  Value: TValue;
begin
  cur := __getPredecessor(key);

  if cur = nil then
  begin
    TValue.Make(@key, TypeInfo(K), Value);
    raise Exception.Create('There is no ''' + Value.ToString + ''' Predecessor');
  end;

  Result := cur.Key;
end;

function TBSTTree.Successor(key: K): K;
var
  cur: TBSTNode_K_V;
  Value: TValue;
begin
  cur := __getSuccessor(key);

  if cur = nil then
  begin
    TValue.Make(@key, TypeInfo(K), Value);
    raise Exception.Create('There is no ''' + Value.ToString + ''' Successor');
  end;

  Result := cur.Key;
end;

function TBSTTree.IsEmpty: boolean;
begin
  Result := _size = 0;
end;

function TBSTTree.Keys: TImpl_K.TArr;
var
  list: TList_node;
  res: TImpl_K.TArr;
  i: integer;
begin
  list := TList_node.Create;
  try
    __inOrder(_root, list);
    SetLength(res, list.Count);

    for i := 0 to list.Count - 1 do
    begin
      res[i] := list[i].Key;
    end;

    Result := res;
  finally
    list.Free;
  end;
end;

function TBSTTree.Remove(key: K): V;
var
  Value: TValue;
  temp: TBSTNode_K_V;
  res: V;
begin
  temp := __getNode(_root, key);

  if temp = nil then
  begin
    TValue.Make(@key, TypeInfo(K), Value);
    if not (ContainsKey(key)) then
      raise Exception.Create('There is no ''' + Value.ToString + '''');
  end;

  res := temp.Value;
  _root := __removeNode(nil, _root, key);
  __getHeight(_root);
  Result := res;
end;

procedure TBSTTree.SetItem(key: K; newValue: V);
var
  Value: TValue;
  temp: TBSTNode_K_V;
begin
  TValue.Make(@key, TypeInfo(K), Value);
  if not (ContainsKey(key)) then
    raise Exception.Create('There is no ''' + Value.ToString + '''');

  temp := __getNode(_root, key);
  temp.Value := newValue;
end;

function TBSTTree.Values: TImpl_V.TArr;
var
  list: TList_node;
  res: TImpl_V.TArr;
  i: integer;
begin
  list := TList_node.Create;
  try
    __inOrder(_root, list);

    SetLength(res, list.Count);

    for i := 0 to list.Count - 1 do
    begin
      res[i] := list[i].Value;
    end;

    Result := res;
  finally
    list.Free;
  end;
end;

function TBSTTree.__getHeight(node: TBSTNode_K_V): integer;
begin
  if node = nil then
    Exit(0);

  node.Height := 1 + Max(__getHeight(node.LChild), __getHeight(node.RChild));
  Result := node.Height;
end;

function TBSTTree.__getNode(node: TBSTNode_K_V; Key: K): TBSTNode_K_V;
begin
  if node = nil then
    Exit(nil);

  if _cmp_K.Compare(key, node.Key) < 0 then
  begin
    Result := __getNode(node.LChild, key);
  end
  else if _cmp_K.Compare(key, node.Key) > 0 then
  begin
    Result := __getNode(node.RChild, key);
  end
  else
  begin
    Result := node;
  end;
end;

procedure TBSTTree.__inOrder(node: TBSTNode_K_V; list: TList_node);
begin
  if node = nil then
    Exit;

  __inOrder(node.LChild, list);
  list.AddLast(node);
  __inOrder(node.RChild, list);
end;

procedure TBSTTree.__levelOrder(node: TBSTNode_K_V; list: TList_node);
var
  queue: TQueue_node;
  cur, temp: TBSTNode_K_V;
begin
  if node = nil then
    Exit;

  cur := node;
  queue := TQueue_node.Create;

  queue.EnQueue(cur);

  while not queue.IsEmpty do
  begin
    temp := queue.DeQueue;

    if temp.LChild <> nil then
      queue.EnQueue(temp.LChild);
    if temp.RChild <> nil then
      queue.EnQueue(temp.RChild);

    list.AddLast(temp);
  end;
end;

function TBSTTree.__maxNode(node: TBSTNode_K_V): TBSTNode_K_V;
var
  cur: TBSTNode_K_V;
begin
  if node = nil then
    Exit(nil);

  cur := node;

  while cur.RChild <> nil do
  begin
    cur := cur.RChild;
  end;

  Result := cur;
end;

function TBSTTree.__minNode(node: TBSTNode_K_V): TBSTNode_K_V;
var
  cur: TBSTNode_K_V;
begin
  if node = nil then
    Exit(nil);

  cur := node;

  while cur.LChild <> nil do
  begin
    cur := cur.LChild;
  end;

  Result := cur;
end;

function TBSTTree.__removeNode(parent, node: TBSTNode_K_V; key: K): TBSTNode_K_V;
var
  res, temp, min, succesor: TBSTNode_K_V;
begin
  if node = nil then
  begin
    Result := nil;
    Exit;
  end;

  if _cmp_K.Compare(key, node.Key) < 0 then
  begin
    node.LChild := __removeNode(node, node.LChild, key);
    res := node;
  end
  else if _cmp_K.Compare(key, node.Key) > 0 then
  begin
    node.RChild := __removeNode(node, node.RChild, key);
    res := node;
  end
  else
  begin
    if node.LChild = nil then
    begin
      temp := node.RChild;
      FreeAndNil(node);
      _size -= 1;

      if temp <> nil then
        temp.Parent := parent;

      res := temp;
    end
    else if node.RChild = nil then
    begin
      temp := node.LChild;
      FreeAndNil(node);
      _size -= 1;

      if temp <> nil then
        temp.Parent := parent;

      res := temp;
    end
    else
    begin
      // 待删除节点左右子树均不空的情况
      // 找到比待删除节点大的最小节点，即待删除节点右子树的最小节点
      // 用这个节点顶替待删除节点的位置
      min := __minNode(node.RChild);
      succesor := TBSTNode_K_V.Create(min.key, min.Value, parent);
      succesor.RChild := __removeNode(succesor, node.RChild, succesor.Key);
      succesor.LChild := node.LChild;
      succesor.IsLeftChild := node.IsLeftChild;
      FreeAndNil(node);
      res := succesor;
    end;
  end;

  Result := res;
end;

procedure TBSTTree.__updataHeight(node: TBSTNode_K_V);
begin
  if node.Parent = nil then
    Exit;

  node.Parent.Height := node.Height + 1;
  __updataHeight(node.Parent);
end;

function TBSTTree.__getSuccessor(key: K): TBSTNode_K_V;
var
  cur, parent: TBSTNode_K_V;
begin
  cur := __getNode(_root, key);

  if cur = nil then
  begin
    Result := nil;
    Exit;
  end;

  if cur.RChild <> nil then
  begin
    Result := __minNode(cur.RChild);
    Exit;
  end;

  parent := cur.Parent;
  while (Parent <> nil) and (parent.RChild = cur) do
  begin
    cur := cur.Parent;
    parent := cur.Parent;
  end;

  Result := parent;
end;

function TBSTTree.__getPredecessor(key: K): TBSTNode_K_V;
var
  cur, parent: TBSTNode_K_V;
begin
  cur := __getNode(_root, key);

  if cur = nil then
  begin
    Result := nil;
    Exit;
  end;

  if cur.LChild <> nil then
  begin
    Result := __maxNode(cur.LChild);
    Exit;
  end;

  parent := cur.Parent;
  while (parent <> nil) and (parent.LChild = cur) do
  begin
    cur := cur.Parent;
    parent := cur.Parent;
  end;

  Result := parent;
end;

end.
