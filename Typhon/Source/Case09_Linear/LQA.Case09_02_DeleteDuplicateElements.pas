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

    constructor Create;
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
  node := TNode.Create;
  a := [1, 2, 1, 2, 3, 4, 5, 1, 4];
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
        Continue;
      end;

      flag := flag.Next;
    end;

    p := p.Next;
  end;

  p := node.Next;
  while p <> nil do
  begin
    Write(p.E, ' ');
    p := p.Next;
  end;
  WriteLn;
end;

{ TNode }

constructor TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

constructor TNode.Create;
begin
  Self.Create(0);
end;

procedure TNode.AppendToTail(newE: integer);
var
  tail, n: TNode;
begin
  n := Self;

  while n.Next <> nil do
  begin
    n := n.Next;
  end;

  tail := TNode.Create(newE);
  n.Next := tail;
end;

destructor TNode.Destroy;
var
  n: TNode;
begin
  inherited Destroy;
end;

end.