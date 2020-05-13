unit DeepStar.DSA.Tree.BSTNode;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  generic TBSTNode<K, V> = class(TObject)
  private type
    TBSTNode_K_V = specialize TBSTNode<K, V>;

  public
    Key: K;
    Value: V;
    LChild: TBSTNode_K_V;
    RChild: TBSTNode_K_V;
    Parent: TBSTNode_K_V;
    IsLeftChild: boolean;
    Height: integer;
    Num: integer;
    IsRed: boolean;

    constructor Create(AKey: K; AValue: V; AParent: TBSTNode_K_V);

    function IsLeft: boolean;
    function IsRight: boolean;
  end;

implementation

{ TBstNode }

constructor TBSTNode.Create(AKey: K; AValue: V; AParent: TBSTNode_K_V);
begin
  Key := AKey;
  Value := AValue;
  LChild := nil;
  RChild := nil;
  Parent := AParent;
  Height := 1;
  Num := 0;
  IsLeftChild := false;
  IsRed := true;
end;

function TBSTNode.IsLeft: boolean;
begin
  Result := IsLeftChild;
end;

function TBSTNode.IsRight: boolean;
begin
  Result := not IsLeftChild;
end;

end.
