unit LQA.Case09_03_倒数第k个节点;

interface

uses
  System.SysUtils,
  LQA.Utils;

type
  TTheKthReciprocalNode = class(TObject)
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

  private
    _dummyhead: TNode;
    procedure __appendToTail(newE: integer);
  public
    constructor Create(arr: TArr_int);
    destructor Destroy; override;
    function Solution(k: integer): TNode;
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
begin
  a := [1, 2, 3, 4, 5, 6, 7, 8, 9];

  with TTheKthReciprocalNode.Create(a) do
  begin
    writeln(Solution(0).ToString);
    writeln(Solution(1).ToString);
    writeln(Solution(2).ToString);
    writeln(Solution(9).ToString);
    writeln(Solution(10).ToString);
  end;
end;

{ TTheKthReciprocalNode.TNode }

constructor TTheKthReciprocalNode.TNode.Create(newE: integer);
begin
  E := newE;
  Next := nil;
end;

constructor TTheKthReciprocalNode.TNode.Create;
begin
  Self.Create(-1);
end;

destructor TTheKthReciprocalNode.TNode.Destroy;
begin
  inherited Destroy;
end;

function TTheKthReciprocalNode.TNode.ToString: UString;
begin
  if Self = nil then
  begin
    Result := 'NULL';
    Exit;
  end;

  Result := Self.E.ToString;
end;

{ TTheKthReciprocalNode }

constructor TTheKthReciprocalNode.Create(arr: TArr_int);
var
  i: integer;
begin
  _dummyhead := TNode.Create;

  for i := 0 to High(arr) do
    __appendToTail(arr[i]);
end;

destructor TTheKthReciprocalNode.Destroy;
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

function TTheKthReciprocalNode.Solution(k: integer): TNode;
var
  i: integer;
  p, res: TNode;
begin
  if (k = 0) or (_dummyhead = nil) then
  begin
    Result := nil;
    Exit;
  end;

  p := _dummyhead;
  i := 0;
  while (p <> nil) and (i < k) do
  begin
    p := p.Next;
    i := i + 1;
  end;

  // 判断是否超出链表长度
  if p = nil then
  begin
    Result := nil;
    Exit;
  end;

  res := _dummyhead;
  while p <> nil do
  begin
    res := res.Next;
    p := p.Next;
  end;

  Result := res;
end;

procedure TTheKthReciprocalNode.__appendToTail(newE: integer);
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

end.
