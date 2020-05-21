unit LQA.Case06_10_PrimeNumber;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 测试num是否素数
function IsPrime(num: integer): boolean;
var
  i: integer;
begin
  i := 2;
  while i * i <= num do
  begin
    if num mod i = 0 then
      Exit(false);

    Inc(i);
  end;

  Result := true;
end;

//质因数分解 =====>  8: 2*2*2
function PrimeFactor(num: integer): TMap_int_int;
var
  map: TMap_int_int;
  i: integer;
begin
  map := TMap_int_int.Create;

  i := 2;
  while i * i <= num do
  begin
    while num mod i = 0 do
    begin
      if not map.ContainsKey(i) then
        map.Add(i, 1)
      else
        map.SetItem(i, map.GetItem(i) + 1);

      num := num div i;
    end;

    Inc(i);
  end;

  Result := map;
end;

procedure Main;
var
  map: TMap_int_int;
  sb: TStringBuilder;
  pair: TMap_int_int.TPair;
  k, v, i: integer;
  s: UString;
begin
  WriteLn(IsPrime(7));

  map := PrimeFactor(100);
  sb := TStringBuilder.Create;

  for pair in map.Pairs do
  begin
    k := pair.Key;
    v := pair.Value;

    for i := 0 to v - 1 do
    begin
      sb.Append('×').Append(k);
    end;
  end;

  s := sb.ToString;
  s := s.Substring(1, s.Length - 1);
  WriteLn(s);

  FreeAndNil(sb);
end;

end.
