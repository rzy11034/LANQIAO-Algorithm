unit DeepStar.DSA.Tree.BSTTree;

interface

uses
  System.SysUtils,
  System.Math,
  DeepStar.DSA.Tree.BstNode,
  DeepStar.DSA.Interfaces,
  DeepStar.DSA.Linear.ArrayList;

type
  TBSTTree<K, V> = class(TInterfacedObject, IMap<K, V>)
  private type
    TBSTNode_K_V = TBSTNode<K, V>;
    TImpl_K = TImpl<K>;
    TImpl_V = TImpl<V>;
    TList_K = TArrayList<K>;
    TList_V = TArrayList<V>;
    TPtr_V = TPtr_V<V>;

  private
    _root: TBSTNode_K_V;
    _cmp: TImpl_K.ICmp;
    _size: integer;

    function __add(parent, cur: TBSTNode_K_V; key: K; Value: V): TBSTNode_K_V;
    function __getHeight(node: TBSTNode_K_V): integer;

    procedure __inOrder(node: TBSTNode_K_V; list: TList_K); overload;
    procedure __inOrder(node: TBSTNode_K_V; list: TList_V); overload;

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
    procedure SetItem(key: K; Value: V);
  end;

implementation

{ TBSTTree }

constructor TBSTTree<K, V>.Create;
begin
  _root := nil;
  _size := 0;
  _cmp := TImpl_K.TCmp.Default;
end;

procedure TBSTTree<K, V>.Add(key: K; Value: V);
begin
  _root := __add(nil, _root, key, Value);
end;

procedure TBSTTree<K, V>.Clear;
begin

end;

function TBSTTree<K, V>.ContainsKey(key: K): boolean;
begin

end;

function TBSTTree<K, V>.ContainsValue(Value: V): boolean;
begin

end;

function TBSTTree<K, V>.Count: integer;
begin
  Result := _size;
end;

destructor TBSTTree<K, V>.Destroy;
begin
  inherited Destroy;
end;

function TBSTTree<K, V>.GetItem(key: K): TPtr_V;
begin

end;

function TBSTTree<K, V>.IsEmpty: boolean;
begin
  Result := _size = 0;
end;

function TBSTTree<K, V>.Keys: TImpl_K.TArr;
var
  list: TList_K;
begin
  list := TList_K.Create;
  try
    __inOrder(_root, list);
    Result := list.ToArray;
  finally
    list.Free;
  end;
end;

function TBSTTree<K, V>.Remove(key: K): TPtr_V;
begin

end;

procedure TBSTTree<K, V>.SetItem(key: K; Value: V);
begin

end;

function TBSTTree<K, V>.Values: TImpl_V.TArr;
var
  list: TList_V;
begin
  list := TList_V.Create;
  try
    __inOrder(_root, list);
    Result := list.ToArray;
  finally
    list.Free;
  end;
end;

function TBSTTree<K, V>.__add(parent, cur: TBSTNode_K_V; key: K; Value: V): TBSTNode_K_V;
begin
  if cur = nil then
  begin
    _size := _size + 1;
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

function TBSTTree<K, V>.__getHeight(node: TBSTNode_K_V): integer;
begin
  if node = nil then
    Exit(0);

  node.Height := 1 + Max(__getHeight(node.LChild), __getHeight(node.RChild));
  Result := node.Height;
end;

procedure TBSTTree<K, V>.__inOrder(node: TBSTNode_K_V; list: TList_V);
begin

end;

procedure TBSTTree<K, V>.__inOrder(node: TBSTNode_K_V; list: TList_K);
begin

end;

end.
