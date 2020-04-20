unit DeepStar.DSA.Tree.MyTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils.UString;

type
  generic TMyTree<T> = class(TObject)
  private type
    TTreeNode = class;
    TImpl_T = specialize TImpl<T>;
    TList_TreeNode = specialize TArrayList<TTreeNode>;

  public type
    TTreeNode = class(TObject)
    public
      Key: T;
      Parent: TTreeNode;
      Children: TList_TreeNode;

      constructor Create(newKey: T; newParent: TTreeNode = nil);
      destructor Destroy; override;
    end;

  private
    _size: cardinal;
    _cmp: TImpl_T.ICmp;
    _root: TTreeNode;

  public
    constructor Create(root: TTreeNode);
    destructor Destroy; override;

    function Count: cardinal;
    function GetFirstChild(node: TTreeNode): TTreeNode;
    function GetHeight(node: TTreeNode): integer; overload;
    function GetHeight: integer; overload;
    function GetNextSibling(node: TTreeNode): TTreeNode;
    function GetParent(node: TTreeNode): TTreeNode;
    function GetRoot: TTreeNode;
    function LevelOrder(node: TTreeNode): TList_TreeNode; overload;
    function LevelOrder: TList_TreeNode; overload;
    function PosCtOrder: TList_TreeNode;
    function PreOrder: TList_TreeNode;
    procedure DeleteChild(parent: TTreeNode; i: integer);
    procedure InsertChild(parent, child: TTreeNode);

    property Comparer: TImpl_T.ICmp read _cmp write _cmp;
  end;

implementation

{ TMyTree }

constructor TMyTree.Create(root: TTreeNode);
begin
  _size := 0;
  _cmp := TImpl_T.TCmp.Default;
  _root := root;
  _size += 1;
end;

function TMyTree.Count: cardinal;
begin
  Result := _size;
end;

procedure TMyTree.DeleteChild(parent: TTreeNode; i: integer);
begin

end;

destructor TMyTree.Destroy;
begin
  inherited Destroy;
end;

function TMyTree.GetFirstChild(node: TTreeNode): TTreeNode;
begin
  Result := node.Children.GetFirst;
end;

function TMyTree.GetHeight(node: TTreeNode): integer;
var
  h, i: integer;
begin
  if node.Children = nil then
    Exit(0);

  h := 0;
  for i := 0 to node.Children.Count - 1 do
  begin
    h := Max(h, GetHeight(node.Children[i]));
  end;

  Result := h + 1;
end;

function TMyTree.GetHeight: integer;
begin
  Result := GetHeight(_root);
end;

function TMyTree.GetNextSibling(node: TTreeNode): TTreeNode;
var
  list: TList_TreeNode;
  i: integer;
begin
  list := node.Parent.Children;
  i := list.IndexOf(node);

  if i = list.Count - 1 then
    Exit(nil);

  Result := list.Items[i + 1];
end;

function TMyTree.GetParent(node: TTreeNode): TTreeNode;
begin
  Result := node.Parent;
end;

function TMyTree.GetRoot: TTreeNode;
begin
  Result := _root;
end;

procedure TMyTree.InsertChild(parent, child: TTreeNode);
begin

end;

function TMyTree.LevelOrder(node: TTreeNode): TList_TreeNode;
begin

end;

function TMyTree.LevelOrder: TList_TreeNode;
begin

end;

function TMyTree.PosCtOrder: TList_TreeNode;
begin

end;

function TMyTree.PreOrder: TList_TreeNode;
begin

end;

{ TMyTree.TTreeNode }

constructor TMyTree.TTreeNode.Create(newKey: T; newParent: TTreeNode);
begin
  Key := newKey;
  Parent := newParent;
end;

destructor TMyTree.TTreeNode.Destroy;
begin
  inherited Destroy;
end;

end.