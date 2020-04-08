unit LQA.Case09_02_删除重复元素;

interface

uses
  System.SysUtils,
  LQA.Utils;

type
  TDeleteDuplicateElements = class(TObject)
  private type
    TNode = class(TObject)
    public
      E: integer;
      Next: TNode;

      constructor Create; overload;
      constructor Create(newE: integer); overload;
      destructor Destroy; override;
    end;

  private
    _dummyHead: TNode;
    procedure __appendToTail(newE: integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Solution(arr: TArr_int);
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
begin
  a := [1, 2, 1, 2, 3, 4, 5, 1, 4];

  with TDeleteDuplicateElements.Create do
  begin
    Solution(a);
    Free;
  end;
end;

{ TDeleteDuplicateElements }

constructor TDeleteDuplicateElements.Create;
begin
  _dummyHead := TNode.Create;
end;

destructor TDeleteDuplicateElements.Destroy;
var
  cur, del: TNode;
begin
  cur := _dummyHead;

  while cur.Next <> nil do
  begin
    del := cur.Next;
    cur.Next := del.Next;
    FreeAndNil(del);
  end;

  FreeAndNil(_dummyHead);
  inherited Destroy;
end;

procedure TDeleteDuplicateElements.Solution(arr: TArr_int);
var
  i: integer;
  p, flag, del: TNode;
begin
  for i in arr do
    __appendToTail(i);

  p := _dummyHead.Next;
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

  p := _dummyHead.Next;
  while p <> nil do
  begin
    Write(p.E, ' ');
    p := p.Next;
  end;
  WriteLn;
end;

procedure TDeleteDuplicateElements.__appendToTail(newE: integer);
var
  prev, tail: TNode;
begin
  prev := _dummyHead;

  while prev.Next <> nil do
  begin
    prev := prev.Next;
  end;

  tail := TNode.Create(newE);
  prev.Next := tail;
end;

{ TDeleteDuplicateElements.TNode }

constructor TDeleteDuplicateElements.TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

constructor TDeleteDuplicateElements.TNode.Create;
begin
  Self.Create(0);
end;

destructor TDeleteDuplicateElements.TNode.Destroy;
begin
  inherited Destroy;
end;

end.
