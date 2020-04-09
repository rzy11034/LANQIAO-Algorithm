unit LQA.Case09_05_用基准值将链表分区;

(* *
 * 编写代码，以给定值x为基准将链表分割成两部分，所有小于x的结点排在大于或等于x的结点之前
 给定一个链表的头指针 ListNode* pHead，请返回重新排列后的链表的头指针。

 注意：分割以后保持原来的数据顺序不变。

 不要开辟新的空间，即不要新建节点
 *)

interface

uses
  System.SysUtils,
  LQA.Utils;

type
  TNode = class(TObject)
  public
    E: integer;
    Next: TNode;

    constructor Create(newE: integer);
    function ToString: UString; reintroduce;
    procedure AppendToTail(newE: integer);
  end;

  TPartitionLinkNode = class(TObject)
  public
    procedure Solution(var node: TNode; x: integer);
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
  node: TNode;
  i: integer;
begin
  a := [5, 6, 3, 2, 1];
  node := TNode.Create(a[0]);
  for i := 1 to high(a) do
    node.AppendToTail(a[i]);

  with TPartitionLinkNode.Create do
  begin
    Solution(node, 3);
  end;

  WriteLn(node.ToString);
end;

{ TPartitionLinkNode }

procedure TPartitionLinkNode.Solution(var node: TNode; x: integer);
var
  leftHead, leftTail, cur, rightHead, rightTail: TNode;
begin
  if node = nil then
  begin
    Exit;
  end;

  cur := node;
  leftHead := nil;
  leftTail := nil;
  rightHead := nil;
  rightTail := nil;

  while cur <> nil do
  begin
    if cur.E < x then
    begin
      if leftHead = nil then
      begin
        leftHead := cur;
        leftTail := cur;
      end
      else
      begin
        leftTail.Next := cur;
        leftTail := leftTail.Next;
      end;
    end
    else
    begin
      if rightHead = nil then
      begin
        rightHead := cur;
        rightTail := cur;
      end
      else
      begin
        rightTail.Next := cur;
        rightTail := rightTail.Next;
      end;
    end;

    cur := cur.Next;
  end;

  if leftHead <> nil then
  begin
    leftTail.Next := rightHead;
    rightTail.Next := nil;
    node := leftHead;
    Exit;
  end;

  node := rightHead;
  rightTail.Next := nil;
end;

{ TNode }

constructor TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
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
