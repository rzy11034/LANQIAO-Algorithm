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

  { TBSTTree }

  generic TBSTTree<K, V> = class(TInterfacedObject, specialize IMap<K, V>)
  private type
    TBSTNode_K_V = specialize TBSTNode<K, V>;
    TImpl_K = specialize TImpl<K>;
    TImpl_V = specialize TImpl<V>;
    TList_node = specialize TArrayList<TBSTNode_K_V>;
    TQueue_node = specialize TQueue<TBSTNode_K_V>;
    TPtr_V = specialize TPtr_V<V>;

  private
    _root: TBSTNode_K_V;
    _cmp: TImpl_K.ICmp;
    _size: integer;

    function __add(parent, cur: TBSTNode_K_V; key: K; Value: V): TBSTNode_K_V;
    function __getHeight(node: TBSTNode_K_V): integer;
    function __getNode(node: TBSTNode_K_V; Key: K): TBSTNode_K_V;
    function __maxNode(node: TBSTNode_K_V): TBSTNode_K_V;
    function __minNode(node: TBSTNode_K_V): TBSTNode_K_V;
    procedure __inOrder(node: TBSTNode_K_V; list: TList_node);
    procedure __levelOrder(node: TBSTNode_K_V; list: TList_node);

  public
    constructor Create;
    destructor Destroy; override;

    function ContainsKey(key: K): boolean;
    function ContainsValue(Value: V): boolean;
    function Count: integer;
    function GetItem(key: K): TPtr_V;
    function IsEmpty: boolean;
    function Keys: TImpl_K.TArr;
    function Remove(key: K): TPtr_V;
    function Values: TImpl_V.TArr;
    procedure Add(key: K; Value: V);
    procedure Clear;
    procedure SetItem(key: K; newValue: V);
  end;

implementation

{ TBSTTree }

constructor TBSTTree.Create;
begin
  _root := nil;
  _size := 0;
  _cmp := TImpl_K.TCmp.Default;
end;

procedure TBSTTree.Add(key: K; Value: V);
begin
  _root := __add(nil, _root, key, Value);
end;

procedure TBSTTree.Clear;
begin

end;

function TBSTTree.ContainsKey(key: K): boolean;
var
  cur: TBSTNode_K_V;
begin
  cur := _root;

  while cur <> nil do
  begin
    if _cmp.Compare(key, cur.Key) < 0 then
      cur := cur.LChild
    else if _cmp.Compare(key, cur.Key) > 0 then
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
  inherited Destroy;
end;

function TBSTTree.GetItem(key: K): TPtr_V;
var
  Value: TValue;
  temp: TBSTNode_K_V;
  res: TPtr_V;
begin
  TValue.Make(@key, TypeInfo(K), Value);
  if not (ContainsKey(key)) then
    raise Exception.Create('There is no ''' + Value.ToString + '''');

  temp := __getNode(_root, key);
  res.PValue := @temp.Value;

  Result := res;
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

function TBSTTree.Remove(key: K): TPtr_V;
begin
  //Result.PValue := @key;
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

function TBSTTree.__add(parent, cur: TBSTNode_K_V; key: K; Value: V): TBSTNode_K_V;
begin
  if cur = nil then
  begin
    _size += 1;
    Result := TBSTNode_K_V.Create(key, Value, parent);
    Exit;
  end;

  if _cmp.Compare(key, cur.key) < 0 then
  begin
    cur.LChild := __add(cur, cur.LChild, key, Value);
    cur.LChild.IsLeftChild := true;
  end
  else if _cmp.Compare(key, cur.key) > 0 then
  begin
    cur.RChild := __add(cur, cur.RChild, key, Value);
    cur.RChild.IsLeftChild := false;
  end
  else
  begin
    cur.Value := Value;
  end;

  cur.Height := 1 + Max(__getHeight(cur.LChild), __getHeight(cur.RChild));

  Result := cur;
end;

function TBSTTree.__getHeight(node: TBSTNode_K_V): integer;
begin
  if node = nil then
    Exit(0);

  node.Height := 1 + Max(__getHeight(node.LChild), __getHeight(node.RChild));
  Result := node.Height;
end;

function TBSTTree.__getNode(node: TBSTNode_K_V; Key: K): TBSTNode_K_V;
var
  cur: TBSTNode_K_V;
begin
  if node = nil then
    Exit(nil);

  cur := node;

  if _cmp.Compare(key, cur.Key) < 0 then
  begin
    cur := __getNode(cur.LChild, key);
  end
  else if _cmp.Compare(key, cur.Key) > 0 then
  begin
    cur := __getNode(cur.RChild, key);
  end
  else
  begin
    Exit(cur);
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

end.
