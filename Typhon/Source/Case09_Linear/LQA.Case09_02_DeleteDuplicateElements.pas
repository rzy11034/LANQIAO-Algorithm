unit LQA.Case09_02_DeleteDuplicateElements;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TNode = class(TObject)
  public
    E: integer;
    Next: TNode;

    constructor Create(newE: integer);
    destructor Destroy; override;

    procedure AppendToTail(newE: integer);
  end;

procedure Main;

implementation

procedure Main;
var
  node, p, flag, del: TNode;
  a: TArr_int;
  i: integer;
begin
  a := [1, 2, 3, 4, 5, 1];
  for i in a do
    node.AppendToTail(i);

  p := node.Next;
  while p.Next <> nil do
  begin
    flag := p;

    while flag.Next <> nil do
    begin
      if flag.Next.E = p.E then
      begin
        del := flag.Next;
        flag.Next := del.Next;
        FreeAndNil(del);
      end;

      flag := flag.Next;
    end;

    p := p.Next;
  end;

  p := node.Next;
  while p <> nil do
  begin
    Write(p.E, ' ');
  end;
end;

{ TNode }

constructor TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

procedure TNode.AppendToTail(newE: integer);
var
  tail, n: TNode;
begin
  tail := TNode.Create(newE);
  n := Self;

  while n.Next <> nil do
  begin
    n := n.Next;
  end;

  n.Next := tail;
end;

destructor TNode.Destroy;
var
  n, del: TNode;
begin
  n := Self;

  while n.Next <> nil do
  begin
    del := n;
    n := n.Next;
    FreeAndNil(del);
  end;

  inherited Destroy;
end;

end.
