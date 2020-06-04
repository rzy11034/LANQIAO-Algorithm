unit DeepStar.DSA.Tree.RBTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BinarySearchTree;

type
  generic TRBTree<K, V> = class(specialize TBinarySearchTree<K, V>)
  private const
    RED = false;
    BLACK = true;

  private type
    TRBNode = class(TNode)
    public
      Color: boolean;

      constructor Create(newKey: K; newValue: V; newParent: TRBNode);
    end;

  private
    function __isBlack(node: TNode): boolean;
    function __isRed(node: TNode): boolean;
    function __setColor(node: TNode; newColor: boolean): TNode;
    function __setRed(node: TNode): TNode;
    function __setBlack(node: TNode): TNode;

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRBTree.TRBNode }

constructor TRBTree.TRBNode.Create(newKey: K; newValue: V; newParent: TRBNode);
begin
  inherited Create(newKey, newValue, newParent);
  Color := RED;
end;

{ TRBTree }

constructor TRBTree.Create;
begin
  inherited Create;
end;

destructor TRBTree.Destroy;
begin
  inherited Destroy;
end;

function TRBTree.__isBlack(node: TNode): boolean;
var
  res: boolean;
begin
  if node = nil then
    res := BLACK
  else
    res := (node as TRBNode).Color = BLACK;

  Result := res;
end;

function TRBTree.__isRed(node: TNode): boolean;
begin
  Result := not __isBlack(node);
end;

function TRBTree.__setBlack(node: TNode): TNode;
begin
  Result := __setColor(node, BLACK);
end;

function TRBTree.__setColor(node: TNode; newColor: boolean): TNode;
begin
  if node = nil then
    Exit(node);

  (node as TRBNode).Color := newColor;
  Result := node;
end;

function TRBTree.__setRed(node: TNode): TNode;
begin
  Result := __setColor(node, RED);
end;

end.
