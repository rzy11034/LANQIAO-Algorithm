unit DeepStar.DSA.Tree.RBTree;

(**
 * 红黑树
 * 1)每个节点要么是红色要么是黑色
 * 2)根节点是黑色的
 * 3)每个叶子节点(NIL)是黑色
 * 4)红色节点的的子节点都是黑色的
 * 5)对每个节点，从该节点到其后代叶子节点的简单路径上，均包含数目相同的黑色节点
 *
 * 通常我们认为树末梢的节点还有两个为空的节点，这些空节点是黑色的，所以不必检测第三条
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Interfaces,
  DeepStar.DSA.Tree.BstNode,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Linear.Queue;

type
  TRBTree = class(TInterfacedObject, specialize IMap<integer, TObject>)
  private type
    TBSTNode_K_V = specialize TBSTNode<integer, TObject>;
    TImpl_K = specialize TImpl<integer>;
    TImpl_V = specialize TImpl<TObject>;
    TList_node = specialize TArrayList<TBSTNode_K_V>;
    TQueue_node = specialize TQueue<TBSTNode_K_V>;
    TPtr_V = specialize TPtr_V<TObject>;

  private
    _root: TBSTNode_K_V;
    _cmp_K: TImpl_K.ICmp;
    _cmp_V: TImpl_V.ICmp;
    _size: integer;

  public
    constructor Create;
    destructor Destroy; override;

    function ContainsKey(key: integer): boolean;
    function ContainsValue(Value: TObject): boolean;
    function Count: integer;
    function GetItem(key: integer): TObject;
    function IsEmpty: boolean;
    function Keys: TImpl_K.TArr;
    function Remove(key: integer): TObject;
    function Values: TImpl_V.TArr;
    procedure Add(key: integer; Value: TObject);
    procedure Clear;
    procedure SetItem(key: integer; Value: TObject);

    property Comparer_K: TImpl_K.ICmp read _cmp_K write _cmp_K;
    property Comparer_V: TImpl_V.ICmp read _cmp_V write _cmp_V;
    property Item[key: K]: V read GetItem write SetItem; default;
  end;

implementation

{ TRBTree }

constructor TRBTree.Create;
begin
  _root := nil;
  _size := 0;
  _cmp_K := TImpl_K.TCmp.Default;
  _cmp_V := TImpl_V.TCmp.Default;
end;

procedure TRBTree.Add(key: integer; Value: TObject);
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


end;

procedure TRBTree.Clear;
begin

end;

function TRBTree.ContainsKey(key: integer): boolean;
begin

end;

function TRBTree.ContainsValue(Value: TObject): boolean;
begin

end;

function TRBTree.Count: integer;
begin

end;

destructor TRBTree.Destroy;
begin
  inherited Destroy;
end;

function TRBTree.GetItem(key: integer): TObject;
begin

end;

function TRBTree.IsEmpty: boolean;
begin

end;

function TRBTree.Keys: TImpl_K.TArr;
begin

end;

function TRBTree.Remove(key: integer): TObject;
begin

end;

procedure TRBTree.SetItem(key: integer; Value: TObject);
begin

end;

function TRBTree.Values: TImpl_V.TArr;
begin

end;

end.
