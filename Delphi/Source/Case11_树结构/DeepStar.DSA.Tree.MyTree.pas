unit DeepStar.DSA.Tree.MyTree;

interface

uses
  System.SysUtils,
  System.Math,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Linear.Queue,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils.UString;

type
  TMyTree<T> = class(TObject)
  type
  TTreeNode = class;
  private type

    TImpl_T = TImpl<T>;
    TList_TreeNode = TArrayList<TTreeNode>;
    TQueue_TreeNode = TQueue<TTreeNode>;

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
    procedure DeleteChild(Parent: TTreeNode; i: integer);
    procedure InsertChild(Parent, child: TTreeNode);

    property Comparer: TImpl_T.ICmp read _cmp write _cmp;
  end;

implementation

{ TMyTree }

constructor TMyTree<T>.Create(root: TTreeNode);
begin
  _size := 0;
  _cmp := TImpl_T.TCmp.Default;
  _root := root;
  _size := _size + 1;
end;

function TMyTree<T>.Count: cardinal;
begin
  Result := _size;
end;

procedure TMyTree<T>.DeleteChild(Parent: TTreeNode; i: integer);
begin
  if Parent.Children.Count = 0 then
    Exit;

  Parent.Children.Remove(i);
  _size := _size + 1;
end;

destructor TMyTree<T>.Destroy;
begin
  inherited Destroy;
end;

function TMyTree<T>.GetFirstChild(node: TTreeNode): TTreeNode;
begin
  Result := node.Children.GetFirst;
end;

function TMyTree<T>.GetHeight(node: TTreeNode): integer;
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

function TMyTree<T>.GetHeight: integer;
begin
  Result := GetHeight(_root);
end;

function TMyTree<T>.GetNextSibling(node: TTreeNode): TTreeNode;
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

function TMyTree<T>.GetParent(node: TTreeNode): TTreeNode;
begin
  Result := node.Parent;
end;

function TMyTree<T>.GetRoot: TTreeNode;
begin
  Result := _root;
end;

procedure TMyTree<T>.InsertChild(Parent, child: TTreeNode);
begin
  if Parent.Children = nil then
    Parent.Children := TList_TreeNode.Create;

  Parent.Children.AddLast(child);
  _size := _size + 1;
end;

function TMyTree<T>.LevelOrder(node: TTreeNode): TList_TreeNode;
var
  res: TList_TreeNode;
  Queue: TQueue_TreeNode;
  temp: TTreeNode;
  i: integer;
begin
  if node = nil then
    Exit(nil);

  res := TList_TreeNode.Create;
  Queue := TQueue_TreeNode.Create;

  try
    Queue.EnQueue(node);

    while not Queue.IsEmpty do
    begin
      temp := Queue.DeQueue;

      for i := 0 to temp.Children.Count - 1 do
      begin
        Queue.EnQueue(temp.Children[i]);
      end;

      res.AddLast(temp);
    end;

    Result := res;
  finally
    Queue.Free;
  end;
end;

function TMyTree<T>.LevelOrder: TList_TreeNode;
begin
  Result := LevelOrder(_root);
end;

function TMyTree<T>.PosCtOrder: TList_TreeNode;
begin
  Result := nil;
end;

function TMyTree<T>.PreOrder: TList_TreeNode;

begin
  Result := nil;
end;

{ TMyTree<T>.TTreeNode }

constructor TMyTree<T>.TTreeNode.Create(newKey: T; newParent: TTreeNode);
begin
  Key := newKey;
  Parent := newParent;
end;

destructor TMyTree<T>.TTreeNode.Destroy;
begin
  inherited Destroy;
end;

end.
