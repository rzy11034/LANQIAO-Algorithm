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

  var
    __map: TMap_T_Obj;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(a: T);
    procedure Clear;
    function Count: integer;
    function ToArray: TArr_T;
  end;

implementation

{ THashSet }

constructor THashSet<T>.Create;
begin
  __map := TMap_T_Obj.Create;
end;

procedure THashSet<T>.Add(a: T);
begin
  if __map.ContainsKey(a) = False then
    __map.Add(a, nil);
end;

procedure THashSet<T>.Clear;
begin
  __map.Clear;
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

function THashSet<T>.ToArray: TArr_T;
begin
  Result := __map.Keys.ToArray;
end;

end.
