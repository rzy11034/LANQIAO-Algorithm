unit LQA.Case09_06_PlusLinkNode;

(*
有两个用链表表示的整数，每个结点包含一个数位。
这些数位是反向存放的，也就是个位排在链表的首部。编写函数对这两个整数求和，并用链表形式返回结果。
给定两个链表L A，B，请返回A+B的结果(ListNode)。
测试样例：
{1,2,3},{3,2,1}
返回：{4,4,4}

{7,4,0,7,5},{2,7,2,3,4}
返回：{9,1,3,0,0,1}
*)

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

  TPlusLinkNode = class(TObject)
  public
    function Solution_Recursion(const a, b: TNode): TNode;
    function Solution_Iteration(const a, b: TNode): TNode;
  end;

procedure Main;

implementation

procedure Main;
var
  a, b, c: TNode;
  p: TPlusLinkNode;
begin
  p := TPlusLinkNode.Create;
  a := TNode.Create([1, 2, 3]);
  b := TNode.Create([3, 2, 1]);
  c := p.Solution_Iteration(a, b);
  WriteLn('a: ', a.ToString);
  WriteLn('b: ', b.ToString);
  WriteLn('c: ', c.ToString);

  DrawLineBlockEnd;

  a := TNode.Create([7, 4, 0, 7, 5]);
  b := TNode.Create([2, 7, 2, 3, 4]);
  c := p.Solution_Iteration(a, b);
  WriteLn('a: ', a.ToString);
  WriteLn('b: ', b.ToString);
  WriteLn('c: ', c.ToString);

  DrawLineBlockEnd;

  p := TPlusLinkNode.Create;
  a := TNode.Create([1, 2, 3]);
  b := TNode.Create([3, 2, 1]);
  c := p.Solution_Recursion(a, b);
  WriteLn('a: ', a.ToString);
  WriteLn('b: ', b.ToString);
  WriteLn('c: ', c.ToString);

  DrawLineBlockEnd;

  a := TNode.Create([7, 4, 0, 7, 5]);
  b := TNode.Create([2, 7, 2, 3, 4]);
  c := p.Solution_Recursion(a, b);
  WriteLn('a: ', a.ToString);
  WriteLn('b: ', b.ToString);
  WriteLn('c: ', c.ToString);
end;

{ TPlusLinkNode }

function TPlusLinkNode.Solution_Iteration(const a, b: TNode): TNode;
var
  p1, p2, node: TNode;
  val1, val2, up, sum: integer;
begin
  if (a = nil) and (b = nil) then
  begin
    Result := nil;
    Exit;
  end;

  node := TNode.Create;
  up := 0;

  p1 := a;
  p2 := b;
  repeat
    if p1 <> nil then
    begin
      val1 := p1.E;
      p1 := p1.Next;
    end
    else
    begin
      val1 := 0;
    end;

    if p2 <> nil then
    begin
      val2 := p2.E;
      p2 := p2.Next;
    end
    else
    begin
      val2 := 0;
    end;

    sum := val1 + val2 + up;

    if (sum > 0) and (sum < 10) then
    begin
      node.AppendToTail(sum);
      up := 0;
    end
    else if sum >= 10 then
    begin
      node.AppendToTail(sum mod 10);
      up := 1;
    end;

    if (p1 = nil) and (p2 = nil) and (up = 1) then
    begin
      node.AppendToTail(1);
      up := 0;
    end;

  until (p1 = nil) and (p2 = nil);

  Result := node.Next;
  FreeAndNil(node);
end;

function TPlusLinkNode.Solution_Recursion(const a, b: TNode): TNode;
  function __solution_Recursion(a, b: TNode; m: integer): TNode;
  var
    sum: integer;
    node: TNode;
  begin
    if (a = nil) and (b = nil) and (m = 0) then
    begin
      Result := nil;
      Exit;
    end;

    sum := m;
    if a <> nil then
    begin
      sum += a.E;
      a := a.Next;
    end;

    if b <> nil then
    begin
      sum += b.E;
      b := b.Next;
    end;

    node := TNode.Create(sum mod 10);
    node.Next := __solution_Recursion(a, b, sum div 10);

    Result := node;
  end;

begin
  Result := __solution_Recursion(a, b, 0);
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