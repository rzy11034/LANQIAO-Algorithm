unit DeepStar.DSA.Tree.BSTNode;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  generic TBstNode<K, V> = class(TObject)
  private type
    TBstNode_K_V = specialize TBstNode<K, V>;

  public
    Key: K;
    Value: V;
    LChild: TBstNode_K_V;
    RChild: TBstNode_K_V;
    Parent: TBstNode_K_V;
    IsLeftChild: boolean;
    Height: integer;
    Num: integer;
    IsRed: boolean;

    constructor Create(AKey: K; AValue: V; ALChild: TBstNode_K_V = nil;
      ARChild: TBstNode_K_V = nil; AParent: TBstNode_K_V = nil);

    function IsLeft: boolean;
    function IsRight: boolean;
  end;

implementation

{ TBstNode }

constructor TBstNode.Create(AKey: K; AValue: V; ALChild: TBstNode_K_V; ARChild: TBstNode_K_V;
  AParent: TBstNode_K_V);
begin
  Key := AKey;
  Value := AValue;
  LChild := ALChild;
  RChild := ARChild;
  Parent := AParent;
  Height := 0;
  Num := 0;
  IsLeftChild := false;
  IsRed := true;
end;

function TBstNode.IsLeft: boolean;
begin
  Result := IsLeftChild;
end;

function TBstNode.IsRight: boolean;
begin
  Result := not IsLeftChild;
end;

end.