unit DeepStar.DSA.Hash.Test.HashMap;

interface

uses
  System.SysUtils,
  DeepStar.DSA.Hash.HashMap,
  LQA.Utils;

procedure Main;

implementation

type
  TMap = THashMap<integer, integer>;

procedure Main;
var
  map, mm: TMap;
  i: integer;
begin
  Randomize;
  map := TMap.Create;

  for i := 0 to 100 do
  begin
    map.Add(i, i + 100);
  end;

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
