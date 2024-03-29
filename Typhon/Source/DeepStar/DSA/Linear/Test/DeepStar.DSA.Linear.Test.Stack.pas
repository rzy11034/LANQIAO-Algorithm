﻿unit DeepStar.DSA.Linear.Test.Stack;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Linear.Stack;

procedure Main;

implementation

type
  TStack = specialize TStack<integer>;

procedure Main;
var
  s: TStack;
  i: integer;
begin
  s := TStack.Create;

  for i := 0 to 4 do
  begin
    s.Push(i);

  end;

  while not s.IsEmpty do
  begin
    WriteLn(s.Count, ' - ', s.Peek, ' -> ', s.Pop);
  end;

  WriteLn(s.Count);
end;

end.
