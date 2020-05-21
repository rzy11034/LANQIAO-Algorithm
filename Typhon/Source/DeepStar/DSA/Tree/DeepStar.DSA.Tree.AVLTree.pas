unit DeepStar.DSA.Tree.AVLTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.BSTTree;

type
  generic TAVLtree<K, V> = class(specialize TBSTTree<K, V>)


  public
    constructor Create;
    destructor Destroy; override;

    function Remove(key: K): V;
  end;


implementation

{ TAVLtree }

constructor TAVLtree.Create;
begin
  inherited Create;
end;

destructor TAVLtree.Destroy;
begin
  inherited Destroy;
end;

function TAVLtree.Remove(key: K): V;
begin
  Result := inherited Remove(key);
end;

end.
