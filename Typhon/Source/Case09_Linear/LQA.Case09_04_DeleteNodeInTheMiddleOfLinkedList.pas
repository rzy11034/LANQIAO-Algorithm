unit LQA.Case09_04_DeleteNodeInTheMiddleOfLinkedList;

(**
 * 实现一个算法，删除单向链表中间的某个结点，假定你只能访问该结点。
 * 示例：
 * 输入单向链表a->b->c->d->e中的节点c
 * 结果：不返回任何数据，但该链表变为a->b->d->e
 *
 给定待删除的节点，请执行删除操作，若该节点为尾节点，返回false，否则返回true
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils.UString;

type
  TDeleteNodeInTheMiddleOfLinkedList = class(TObject)
  private type
    TNode = class(TObject)
    public
      E: integer;
      Next: TNode;

      constructor Create; overload;
      constructor Create(newE: integer); overload;
      destructor Destroy; override;
      function ToString: UString; reintroduce;
    end;

  public
    function Solution(node: TNode): boolean;
  end;

implementation

{ TDeleteNodeInTheMiddleOfLinkedList }

function TDeleteNodeInTheMiddleOfLinkedList.Solution(node: TNode): boolean;
var
  del: TNode;
  res: boolean;
begin
  if node.Next = nil then
  begin
    res := false;
  end
  else
  begin
    del := node.Next;
    del.E := node.E;
    node.Next := del.Next;
    FreeAndNil(del);
    res := true;
  end;

  Result := res;
end;

{ TDeleteNodeInTheMiddleOfLinkedList.TNode }

constructor TDeleteNodeInTheMiddleOfLinkedList.TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

constructor TDeleteNodeInTheMiddleOfLinkedList.TNode.Create;
begin
  Self.Create(-1);
end;

destructor TDeleteNodeInTheMiddleOfLinkedList.TNode.Destroy;
begin
  inherited Destroy;
end;

function TDeleteNodeInTheMiddleOfLinkedList.TNode.ToString: UString;
begin
  if Self = nil then
  begin
    Result := 'NULL';
    Exit;
  end;

  Result := Self.E.ToString;
end;

end.
