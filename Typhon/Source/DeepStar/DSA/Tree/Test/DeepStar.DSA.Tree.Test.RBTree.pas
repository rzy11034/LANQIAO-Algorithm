﻿unit DeepStar.DSA.Tree.Test.RBTree;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Tree.RBTree,
  LQA.Utils;

procedure Main;

implementation

type
  TRBT_int_int = specialize TRBTree<integer, integer>;

procedure Main;
var
  tree: TRBT_int_int;
  arr: TArr_int;
  i: integer;
begin
  arr := [55, 87, 56, 74, 96, 22, 62, 20, 70, 68, 90, 50];
  tree := TRBT_int_int.Create;

  for i := 0 to High(arr) do
  begin
    tree.Add(arr[i], 0);
    Write(arr[i], '-->');
    tree.keyToArray;
    WriteLn;
    DrawLineBlockEnd;
  end;

  TArrayUtils_int.Print(tree.Keys);

end;

end.
