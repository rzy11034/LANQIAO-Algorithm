unit DeepStar.DSA.Hash.Test.HashMap;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Hash.HashMap,
  DeepStar.DSA.Interfaces,
  LQA.Utils;

procedure Main;

implementation

type
  TMap = specialize THashMap<integer, integer>;
  TPtr_int = specialize TPtr_V<integer>;

procedure Main;
var
  map, mm: TMap;
  i, j: integer;
  arr: TArr_int;
  p: TPtr_int;
begin
  map := TMap.Create;
  arr := [55, 55, 56, 74, 96, 22, 62, 20, 70, 68, 90, 50];
  j := -1;

  for i := 0 to High(arr) do
  begin
    p.PValue := map.Add(arr[i], i + 100).PValue;

    if p.PValue <> nil then
    begin
      j := p.PValue^;
      WriteLn(p.PValue^);
      WriteLn(j);
    end
    else
      WriteLn('nil');
  end;

  WriteLn(map.Remove(55).PValue^);

  WriteLn(map.Count);
  WriteLn(map.IsEmpty);
  TArrayUtils_int.Print(map.Keys);
  TArrayUtils_int.Print(map.Values);

  DrawLineBlockEnd;

  mm := map.Clone;
  TArrayUtils_int.Print(mm.Keys);
  TArrayUtils_int.Print(mm.Values);

  DrawLineBlockEnd;

  map.AddAll(mm);
  WriteLn(map.ContainsKey(99));
  TArrayUtils_int.Print(map.Keys);
  TArrayUtils_int.Print(map.Values);

  DrawLineBlockEnd;

  map.Clear;
  WriteLn(map.Count);
  WriteLn(map.IsEmpty);
  TArrayUtils_int.Print(map.Keys);
  TArrayUtils_int.Print(map.Values);
end;

end.
