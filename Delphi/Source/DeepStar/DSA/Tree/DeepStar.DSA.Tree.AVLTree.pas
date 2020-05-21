unit DeepStar.DSA.Tree.AVLTree;

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BSTTree;

type
  TAVLtree<K, V> = class(TBSTTree<K, V>)
  private

  public
    constructor Create;
    destructor Destroy; override;

    function Remove(key: K): V;
  end;

implementation

{ TAVLtree }

constructor TAVLtree<K, V>.Create;
begin
  inherited Create;
end;

destructor TAVLtree<K, V>.Destroy;
begin
  inherited Destroy;
end;

function TAVLtree<K, V>.Remove(key: K): V;
var
  node: TBSTNode_K_V;
begin
  Result := inherited Remove(key);
  _root := nil;
end;

end.
