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
  private
    function __solution(a, b: TNode; m: integer): TNode;
  public
    function Solution(const a, b: TNode): TNode;
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

end;

{ TPlusLinkNode }

function TPlusLinkNode.Solution(const a, b: TNode): TNode;
begin
  Result := __solution(a, b, 0);
end;

function TPlusLinkNode.__solution(a, b: TNode; m: integer): TNode;
var
  node: TNode;
begin
  if (a = nil) and (b = nil) and (m = 0) then
  begin
    Result := nil;
    Exit;
  end;

  sum := a.E + b.E;
  node := TNode.Create(a.E + b.E)
end;

{ TNode }

constructor TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

constructor TNode.Create(const arr: TArr_int);
var
  node: TNode;
  i: integer;
begin
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
    sb.Append('NULL');

    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

end.
