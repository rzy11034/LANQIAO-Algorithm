unit DeepStar.DSA.Tree.AVLTree;

interface

uses
  System.SysUtils,
  System.Math,
  DeepStar.DSA.Tree.BinarySearchTree;

type
  TAVLTree<K, V> = class(TBinarySearchTree<K, V>)
  private type
    TNode = TBinarySearchTree<K, V>.TNode;

    TAVLNode = class(TNode)
    public
      Height: integer;
      constructor Create(newKey: K; newValue: V; newParent: TNode);

      // 获取该节点平衡因子
      function BalanceFactor: integer;
      // 更新高度
      procedure UpdateHeight;

    end;

  protected
    // 判断传入节点是否平衡（平衡因子的绝对值 <= 1）
    function __isBalanced(node: TAVLNode): boolean;
    function __CreateNode(newKey: K; newValue: V; newParent: TNode): TNode; override;

  public
    constructor Create;
    destructor Destroy; override;
    function Height: integer;
  end;

implementation

{ TAVLTree<K, V> }

constructor TAVLTree<K, V>.Create;
begin
  inherited Create;
end;

destructor TAVLTree<K, V>.Destroy;
begin
  inherited Destroy;
end;

function TAVLTree<K, V>.Height: integer;
begin
  Result := (_root as TAVLNode).Height;
end;

function TAVLTree<K, V>.__CreateNode(newKey: K; newValue: V; newParent: TNode): TNode;
begin
  Result := TAVLNode.Create(newKey, newValue, newParent);
end;

function TAVLTree<K, V>.__isBalanced(node: TAVLNode): boolean;
begin
  Result := Abs(node.BalanceFactor) <= 1;
end;

{ TAVLTree.TAVLNode }

constructor TAVLTree<K, V>.TAVLNode.Create(newKey: K; newValue: V; newParent: TNode);
begin
  inherited Create(newKey, newValue, newParent);
  Height := 1;
end;

function TAVLTree<K, V>.TAVLNode.BalanceFactor: integer;
var
  leftHeight, rightHeight: integer;
begin
  leftHeight := IfThen(Left = nil, 0, (Left as TAVLNode).Height);
  rightHeight := IfThen(Right = nil, 0, (Right as TAVLNode).Height);
  Result := leftHeight - rightHeight;
end;

procedure TAVLTree<K, V>.TAVLNode.UpdateHeight;
var
  leftHeight, rightHeight: integer;
begin
  leftHeight := IfThen(Left = nil, 0, (Left as TAVLNode).Height);
  rightHeight := IfThen(Right = nil, 0, (Right as TAVLNode).Height);
  Height := 1 + Max(leftHeight, rightHeight);
end;

end.
