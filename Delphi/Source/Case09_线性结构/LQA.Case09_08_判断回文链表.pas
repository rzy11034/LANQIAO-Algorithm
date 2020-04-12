unit LQA.Case09_08_判断回文链表;

(*
 * 回文链表
 * 检查链表是否回文
 *)

interface

uses
  System.SysUtils,
  LQA.Utils,
  DeepStar.DSA.Linear.Stack;

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

  TPalindromeLinkedList = class(TObject)
  private type
    TStack = TStack<integer>;

  private
    function __reverseList_Iteration(node: TNode): TNode;
    function __reverseList_Recursion(node: TNode): TNode;
  public
    function IsPalindrome(node: TNode): boolean;
  end;

procedure Main;

implementation

procedure Main;
var
  node: TNode;
  pl: TPalindromeLinkedList;
begin
  node := TNode.Create(1);
  node.Next := TNode.Create(2);
  node.Next.Next := TNode.Create(3);
  node.Next.Next.Next := TNode.Create(2);
  node.Next.Next.Next.Next := TNode.Create(1);
  //node.Next.Next.Next.Next.Next := TNode.Create(1);
  //node.Next.Next.Next.Next.Next.Next := node.Next.Next;

  pl := TPalindromeLinkedList.Create;
  WriteLn(node.ToString);
  WriteLn(pl.IsPalindrome(node));

end;

{ TPalindromeLinkedList }

function TPalindromeLinkedList.IsPalindrome(node: TNode): boolean;
var
  s, f: TNode;
  stack: TStack;
begin
  s := node;
  f := node;
  stack := TStack.Create;

  while (s <> nil) and (f <> nil) and (f.Next <> nil) do
  begin
    stack.Push(s.E);
    s := s.Next;
    f := f.Next.Next;
  end;

  if not Odd(stack.Count) then
  begin
    s := s.Next;
  end;

  while (not stack.IsEmpty) and (s <> nil) do
  begin
    if stack.Peek <> s.E then
      Exit(false);

    stack.Pop;
    s := s.Next;
  end;

  Result := true;
end;

function TPalindromeLinkedList.__reverseList_Iteration(node: TNode): TNode;
var
  prev, Next: TNode;
begin
  prev := nil;
  //Next := nil;

  while node <> nil do
  begin
    Next := node.Next;
    node.Next := prev;
    prev := node;
    node := Next;
  end;

  Result := prev;
end;

function TPalindromeLinkedList.__reverseList_Recursion(node: TNode): TNode;
var
  temp, newNode: TNode;
begin
  if (node = nil) or (node.Next = nil) then
  begin
    Result := node;
    Exit;
  end;

  temp := node.Next;
  newNode := __reverseList_Recursion(node.Next);
  temp.Next := node;
  node.Next := nil;

  Result := newNode;
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
