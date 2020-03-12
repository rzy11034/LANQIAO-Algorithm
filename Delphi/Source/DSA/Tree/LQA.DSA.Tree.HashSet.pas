unit LQA.DSA.Tree.HashSet;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  THashSet<T> = class
  private type
    TMap_T_Obj = TDictionary<T, TObject>;
    TArr_T = TArray<T>;
    THashSet_T = THashSet<T>;

  var
    __map: TMap_T_Obj;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(e: T);
    procedure AddAll(HashSet: THashSet_T);
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

constructor THashSet<T>.Create;
begin
  __map := TMap_T_Obj.Create;
end;

procedure THashSet<T>.Add(e: T);
begin
  if __map.ContainsKey(e) = False then
    __map.Add(e, nil);
end;

procedure THashSet<T>.AddAll(HashSet: THashSet_T);
var
  e: T;
begin
  for e in HashSet.ToArray do
    Add(e);
end;

procedure THashSet<T>.Clear;
begin
  __map.Clear;
end;

function THashSet<T>.Clone: THashSet_T;
var
  ret: THashSet_T;
  e: T;
begin
  ret := THashSet_T.Create;

  for e in Self.ToArray do
    ret.Add(e);

  Result := ret;
end;

function THashSet<T>.Contains(e: T): boolean;
begin
  Result := __map.ContainsKey(e);
end;

function THashSet<T>.Count: integer;
begin
  Result := __map.Count;
end;

destructor THashSet<T>.Destroy;
begin
  FreeAndNil(__map);
  inherited Destroy;
end;

function THashSet<T>.IsEmpty: boolean;
begin
  Result := __map.Count = 0;
end;

procedure THashSet<T>.Remove(e: T);
begin
  __map.Remove(e);
end;

function THashSet<T>.ToArray: TArr_T;
begin
  Result := __map.Keys.ToArray;
end;

end.
