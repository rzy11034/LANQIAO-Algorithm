unit DeepStar.DSA.Tree.MyTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  {%H-}Rtti,
  DeepStar.DSA.Linear.DoubleLinkedList,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils.UString;

type
  generic TMyTree<T> = class(TObject)

    TList_T = specialize TDoubleLinkedList<T>;
    TImpl_T = specialize TImpl<T>;

  public type
    TTreeNode = class(TObject)
    private type
      TList_TreeNode = specialize TDoubleLinkedList<TTreeNode>;

    public
      Key: T;
      Parent: TTreeNode;
      Children: TList_TreeNode;

      constructor Create(newKey: T; newParent: TTreeNode = nil);
      destructor Destroy; override;
    end;

  private
    _

  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TMyTree }

constructor TMyTree.Create;
begin

end;

destructor TMyTree.Destroy;
begin
  inherited Destroy;
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
