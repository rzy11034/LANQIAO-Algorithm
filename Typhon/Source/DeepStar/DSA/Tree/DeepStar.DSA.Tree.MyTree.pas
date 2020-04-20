unit DeepStar.DSA.Tree.MyTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  {%H-}Rtti,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils.UString;

type
  generic TMyTree<T> = class(TObject)
  private type
    TList_T = specialize TArrayList<T>;
    TImpl_T = specialize TImpl<T>;

  public type
    TTreeNode = class(TObject)
    private type
      TList_TreeNode = specialize TArrayList<TTreeNode>;
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
    constructor Create;
    destructor Destroy; override;

    function Count: cardinal;
    function GetChildren: TTreeNode.TList_TreeNode;
    function GetFirstChild(node: TTreeNode): TTreeNode;
    function GetHeight(node: TTreeNode): integer; overload;
    function GetHeight: integer; overload;
    function GetNextSibling(node: TTreeNode): TTreeNode;
    function GetRoot: TTreeNode;
    function LevelOrder(node: TTreeNode): TTreeNode.TList_TreeNode; overload;
    function LevelOrder: TTreeNode.TList_TreeNode; overload;
    function PostOrder: TTreeNode.TList_TreeNode;
    function PreOrder: TTreeNode.TList_TreeNode;
    procedure InsertChild(parent, child: TTreeNode);
    procedure DeleteChild(parent: TTreeNode; i: integer);
  end;

implementation

{ TMyTree }

constructor TMyTree.Create;
begin
  _root := nil;
  _size := 0;
  _cmp := TImpl_T.TCmp.Default;
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

function TMyTree.GetChildren: TTreeNode.TList_TreeNode;
begin

end;

function TMyTree.GetFirstChild(node: TTreeNode): TTreeNode;
begin

end;

function TMyTree.GetHeight(node: TTreeNode): integer;
begin

end;

function TMyTree.GetHeight: integer;
begin

end;

function TMyTree.GetNextSibling(node: TTreeNode): TTreeNode;
begin

end;

function TMyTree.GetRoot: TTreeNode;
begin

end;

procedure TMyTree.Insert(key: T; parent: TTreeNode);
begin

end;

procedure TMyTree.InsertChild(parent, child: TTreeNode);
begin

end;

function TMyTree.LevelOrder(node: TTreeNode): TTreeNode.TList_TreeNode;
begin

end;

function TMyTree.LevelOrder: TTreeNode.TList_TreeNode;
begin

end;

function TMyTree.PostOrder: TTreeNode.TList_TreeNode;
begin

end;

function TMyTree.PreOrder: TTreeNode.TList_TreeNode;
begin

end;

procedure TMyTree.Remove(key: T);
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