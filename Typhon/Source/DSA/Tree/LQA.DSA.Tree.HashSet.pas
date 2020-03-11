unit LQA.DSA.Tree.HashSet;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Generics.Collections;

type
  generic THashSet<T> = class
  private type
    TMap_T_Obj = specialize THashMap<T, TObject>;
    TArr_T = specialize TArray<T>;
    THashSet_T = specialize THashSet<T>;

  var
    __map: TMap_T_Obj;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(a: T);
    procedure Clear;
    function Clone: THashSet_T;
    function Count: integer;
    function ToArray: TArr_T;
  end;

implementation

{ THashSet }

constructor THashSet.Create;
begin
  __map := TMap_T_Obj.Create;
end;

procedure THashSet.Add(a: T);
begin
  if __map.ContainsKey(a) = False then
    __map.Add(a, nil);
end;

procedure THashSet.Clear;
begin
  __map.Clear;
end;

function THashSet.Clone: THashSet_T;
var
  ret: THashSet_T;
  e: T;
begin
  ret := THashSet_T.Create;

  for e in Self.ToArray do
    ret.Add(e);

  Result := ret;
end;

function THashSet.Count: integer;
begin
  Result := __map.Count;
end;

destructor THashSet.Destroy;
begin
  FreeAndNil(__map);
  inherited Destroy;
end;

function THashSet.ToArray: TArr_T;
begin
  Result := __map.Keys.ToArray;
end;

end.