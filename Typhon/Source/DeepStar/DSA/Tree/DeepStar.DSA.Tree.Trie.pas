unit DeepStar.DSA.Tree.Trie;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils.UString,
  DeepStar.DSA.Hash.HashMap;

type
  generic TTrie<V> = class
  private type
    THashMap = specialize THashMap<UChar, V>;
    TImpl = specialize TImpl<UChar>;
    TPtrValue = specialize TPtrValue<V>;
    ICmp = TImpl.ICmp;
    TCmp = TImpl.TCmp;

    TNode = class
    public
      Next: THashMap;
      IsWord: boolean;
      Value: V;

      constructor Create;
      destructor Destroy; override;
    end;

  private
    _size: integer;


  public
    constructor Create;
    destructor Destroy; override;

    function Count:integer;
    function IsEmpty: Boolean;
    function Contains(str: UString): boolean;
    procedure Clear;
    function Add(str: UString): TPtrValue;
    function Remove(str: UString): TPtrValue;
  end;

implementation

{ TTrie }

constructor TTrie.Create;
begin

end;

destructor TTrie.Destroy;
begin
  inherited Destroy;
end;

{ TTrie.TNode }

constructor TTrie.TNode.Create;
begin

end;

destructor TTrie.TNode.Destroy;
begin
  inherited Destroy;
end;

end.
