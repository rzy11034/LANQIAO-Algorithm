unit DeepStar.DSA.Tree.BSTTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BstNode,
  DeepStar.DSA.Interfaces,
  DeepStar.DSA.Linear.ArrayList;

type
  generic TBSTTree<K, V> = class(TInterfacedObject, specialize IMap<K, V>)
  private type
    TBSTTree_K_V = specialize TBSTTree<K, V>;
    TImpl_K = specialize TImpl<K>;
    TImpl_V = specialize TImpl<V>;
    TList_K = specialize TArrayList<K>;
    TPtr_V = specialize TPtr_V<V>;

  private
    _root: TBSTTree_K_V;
    _cmp: TImpl_K;
    _size: integer;

    procedure __updataHeight(node: TBSTTree_K_V);

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

constructor TBSTTree.Create;
begin
  _root := nil;
  _size := 0;
  _cmp := TImpl_K.TCmp.Default;
end;

procedure TBSTTree.Add(key: K; Value: V);
var
  parent, cur: TBSTTree_K_V;
begin
  parent := nil;
end;

procedure TBSTTree.Clear;
begin

end;

function TBSTTree.ContainsKey(key: K): boolean;
begin

end;

function TBSTTree.ContainsValue(Value: V): boolean;
begin

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
begin

end;

function TBSTTree.IsEmpty: boolean;
begin
  Result := _size = 0;
end;

function TBSTTree.Keys: TImpl_K.TArr;
begin

end;

function TBSTTree.Remove(key: K): TPtr_V;
begin

end;

procedure TBSTTree.SetItem(key: K; Value: V);
begin

end;

function TBSTTree.Values: TImpl_V.TArr;
begin

end;

procedure TBSTTree.__updataHeight(node: TBSTTree_K_V);
begin

end;

end.