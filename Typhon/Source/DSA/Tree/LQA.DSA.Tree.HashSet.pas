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

    procedure Add(e: T);
    procedure AddAll(hashSet: THashSet_T);
    function Contains(e: T): boolean;
    procedure Clear;
    function Clone: THashSet_T;
    function Count: integer;
    function IsEmpty: boolean;
    procedure Remove(e: T);
    function ToArray: TArr_T;
  end;

implementation

{ THashSet }

constructor THashSet.Create;
begin
  __map := TMap_T_Obj.Create;
end;

procedure THashSet.Add(e: T);
begin
  if __map.ContainsKey(e) = False then
    __map.Add(e, nil);
end;

procedure THashSet.AddAll(hashSet: THashSet_T);
var
  e: T;
begin
  for e in hashSet.ToArray do
    Add(e);
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

function THashSet.Contains(e: T): boolean;
begin
  Result := __map.ContainsKey(e);
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

function THashSet.IsEmpty: boolean;
begin
  Result := Count = 0;
end;

procedure THashSet.Remove(e: T);
begin
  __map.Remove(e);
end;

function THashSet.ToArray: TArr_T;
begin
  Result := __map.Keys.ToArray;
end;

end.
