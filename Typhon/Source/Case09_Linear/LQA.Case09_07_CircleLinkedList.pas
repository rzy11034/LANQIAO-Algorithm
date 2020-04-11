unit LQA.Case09_07_CircleLinkedList;

(**
 * 给定一个有环链表，实现一个算法返回环路的开头结点
 *
 * 有环链表的定义：
 * 在链表中某个结点的next元素指向在它前面出现过的节点，则表明该链表存在环路
 * *)

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

    constructor Create(const arr: TArr_int); overload;
    constructor Create(newE: integer); overload;
    function ToString: UString; reintroduce;
    procedure AppendToTail(newE: integer);
  end;

  TCircleLinkedList = class(TObject)
  public
    function HasCircle(node: TNode): boolean;
    function Solution(node: TNode): TNode;
  end;

procedure Main;

implementation

procedure Main;
var
  node, p: TNode;
  i: integer;
begin
  node := TNode.Create(1);
  node.Next := TNode.Create(2);
  node.Next.Next := TNode.Create(3);
  node.Next.Next.Next := TNode.Create(4);
  node.Next.Next.Next.Next := TNode.Create(5);
  node.Next.Next.Next.Next.Next := TNode.Create(6);
  node.Next.Next.Next.Next.Next.Next := node.Next.Next;

  p := node;
  for i := 0 to 10 do
  begin
    Write(p.E.ToString, ' -> ');
    p := p.Next;
  end;
  WriteLn('nil');

  DrawLineBlockEnd;

  with TCircleLinkedList.Create do
  begin
    WriteLn(HasCircle(node));
    WriteLn(Solution(node).E);
  end;
end;

{ TCircleLinkedList }

function TCircleLinkedList.HasCircle(node: TNode): boolean;
var
  s, f: TNode;
begin
  s := node;
  f := node;

  while true do
  begin
    if (s = nil) or (f = nil) or (f.Next = nil) then
      Exit(false);

    s := s.Next;
    f := f.Next.Next;

    if s = f then
      Exit(true);
  end;

  Result := false;
end;

function TCircleLinkedList.Solution(node: TNode): TNode;
var
  s, f, p: TNode;
begin
  s := node;
  f := node;

  while true do
  begin
    s := s.Next;
    f := f.Next.Next;

    if s = f then
      Break;
  end;

  p := node;
  while s <> p do
  begin
    p := p.Next;
    s := s.Next;
  end;

  Result := p;
end;

{ TNode }

constructor TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

constructor TNode.Create(const arr: TArr_int);
var
  i: integer;
begin
  if arr = nil then
  begin
    Self := nil;
    Exit;
  end;

  Self.Create(arr[0]);

  for i := 1 to High(arr) do
  begin
    AppendToTail(arr[i]);
  end;
end;

procedure TNode.AppendToTail(newE: integer);
var
  node, tail: TNode;
begin
  node := Self;

  while node.Next <> nil do
  begin
    node := node.Next;
  end;

  tail := TNode.Create(newE);
  node.Next := tail;
end;

function TNode.ToString: UString;
var
  sb: TStringBuilder;
  n: TNode;
begin
  n := Self;
  sb := TStringBuilder.Create;
  try
    while n <> nil do
    begin
      sb.Append(n.E).Append(' -> ');
      n := n.Next;
    end;
    sb.Append('nil');

    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

end.