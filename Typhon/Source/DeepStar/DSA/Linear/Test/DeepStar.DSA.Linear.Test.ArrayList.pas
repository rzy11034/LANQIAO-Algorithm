﻿unit DeepStar.DSA.Linear.Test.ArrayList;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Interfaces,
  DeepStar.Utils.UString,
  LQA.Utils;

procedure Main;

implementation

type
  TArrayList = specialize TArrayList<integer>;
  TImpl = specialize TImpl<integer>;

function cmp(constref a, b: integer): integer;
var
  res: integer;
begin
  if a > b then
    res := -1
  else if a = b then
    res := 0
  else
    res := 1;

  Result := res;
end;

procedure Main;
var
  al: TArrayList;
  a: TImpl.TArr;
begin
  a := [1, 2, 6, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 8, 20];
  al := TArrayList.Create(@cmp);
  al.AddRange(a);

  al.Sort;
  TArrayUtils_int.Print(al.ToArray);
end;

end.