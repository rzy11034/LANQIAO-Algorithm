﻿unit LQA.DSA.LinkedList;

interface

uses
  System.SysUtils,
  System.Rtti,
  System.Generics.Defaults,
  LQA.DSA.Interfaces,
  LQA.DSA.UString;

type
  TLinkedList<T> = class(TInterfacedObject, IList<T>)
  private type
    TImpl = TImpl<T>;
    TCmp = TComparer<T>;

  public type
    TNode = class(TObject)
    private
      _E: T;
      _Next: TNode;
    public
      constructor Create; overload;
      constructor Create(e: T; Next: TNode = nil); overload;
      destructor Destroy; override;
      property E: T read _E write _E;
      property Next: TNode read _Next write _Next;
    end;

  var
    _size: integer;
    _dummyHead: TNode;

  public
    constructor Create; overload;
    constructor Create(const arr: array of T); overload;
    destructor Destroy; override;

    function Contains(e: T): boolean;
    function GetFirst: T;
    function GetItem(index: integer): T;
    function GetLast: T;
    function GetSize: integer;
    function IndexOf(e: T): integer;
    function IsEmpty: boolean;
    function Remove(index: integer): T;
    function RemoveFirst: T;
    function RemoveLast: T;
    function ToArray: TImpl.TArr;
    function ToString: UString; reintroduce;
    procedure Add(index: integer; e: T);
    procedure AddFirst(e: T);
    procedure AddLast(e: T);
    procedure AddRange(const arr: array of T);
    procedure RemoveElement(e: T);
    procedure SetItem(index: integer; e: T);

    property Count: integer read GetSize;
    property Items[i: integer]: T read GetItem write SetItem; default;
  end;

implementation

{ TLinkedList.TNode }

constructor TLinkedList<T>.TNode.Create(e: T; Next: TNode);
begin
  _E := e;
  _Next := Next;
end;

constructor TLinkedList<T>.TNode.Create;
begin
  Self.Create(default (T));
end;

destructor TLinkedList<T>.TNode.Destroy;
begin
  inherited Destroy;
end;

{ TLinkedList<T> }

constructor TLinkedList<T>.Create(const arr: array of T);
begin
  Self.Create;
  Self.AddRange(arr);
end;

constructor TLinkedList<T>.Create;
begin
  _dummyHead := TNode.Create;
  _size := 0;
end;

procedure TLinkedList<T>.Add(index: integer; e: T);
var
  prev: TNode;
  i: integer;
begin
  if (index < 0) or (index > _size) then
    raise Exception.Create('Add failed. Index is Illegal.');

  prev := _dummyHead;
  for i := 0 to index - 1 do
    prev := prev.Next;

  prev.Next := TNode.Create(e, prev.Next);
  _size := _size + 1;
end;

procedure TLinkedList<T>.AddFirst(e: T);
begin
  Self.Add(0, e);
end;

procedure TLinkedList<T>.AddLast(e: T);
begin
  Self.Add(_size, e);
end;

procedure TLinkedList<T>.AddRange(const arr: array of T);
var
  i: integer;
  prev, tmp: TNode;
begin
  prev := _dummyHead;
  while prev.Next <> nil do
    prev := prev.Next;

  for i := 0 to High(arr) do
  begin
    tmp := TNode.Create(arr[i]);
    prev.Next := tmp;
    prev := tmp;
    _size := _size + 1;
  end;
end;

function TLinkedList<T>.Contains(e: T): boolean;
var
  cur: TNode;
begin
  cur := _dummyHead.Next;

  while cur <> nil do
  begin
    if TCmp.Default.Compare(cur.E, e) = 0 then
      Exit(true);

    cur := cur.Next;
  end;

  Result := false;
end;

destructor TLinkedList<T>.Destroy;
begin
  inherited Destroy;
end;

function TLinkedList<T>.GetFirst: T;
begin
  Result := GetItem(0);
end;

function TLinkedList<T>.GetItem(index: integer): T;
var
  cur: TNode;
  i: integer;
begin
  if (index < 0) or (index >= _size) then
    raise Exception.Create('GetItem failed. Index is Illegal.');

  cur := _dummyHead.Next;

  for i := 0 to index - 1 do
    cur := cur.Next;

  Result := cur.E;
end;

function TLinkedList<T>.GetLast: T;
begin
  Result := GetItem(_size - 1);
end;

function TLinkedList<T>.GetSize: integer;
begin
  Result := _size;
end;

function TLinkedList<T>.IndexOf(e: T): integer;
var
  i: integer;
  cur: TNode;
begin
  i := 0;
  cur := _dummyHead.Next;

  while cur <> nil do
  begin
    if TCmp.Default.Compare(cur.E, e) = 0 then
      Exit(i);

    cur := cur.Next;
    i := i + 1;
  end;

  Result := -1;
end;

function TLinkedList<T>.IsEmpty: boolean;
begin
  Result := _size <> 0;
end;

function TLinkedList<T>.Remove(index: integer): T;
var
  prev, del: TNode;
  i: integer;
begin
  if (index < 0) or (index >= _size) then
    raise Exception.Create('Remove failed. Index is Illegal.');

  prev := _dummyHead;
  for i := 0 to index - 1 do
    prev := prev.Next;

  del := prev.Next;
  prev.Next := del.Next;
  _size := _size - 1;
  Result := del.E;
  FreeAndNil(del);
end;

procedure TLinkedList<T>.RemoveElement(e: T);
var
  prev, del: TNode;
begin
  prev := _dummyHead;

  while prev.Next <> nil do
  begin
    del := prev.Next;

    if TCmp.Default.Compare(del.E, e) = 0 then
    begin
      prev.Next := del.Next;
      _size := _size - 1;
      FreeAndNil(del);
    end
    else
    begin
      prev := prev.Next;
    end;
  end;
end;

function TLinkedList<T>.RemoveFirst: T;
begin
  Result := Remove(0);
end;

function TLinkedList<T>.RemoveLast: T;
begin
  Result := Remove(Count - 1);
end;

procedure TLinkedList<T>.SetItem(index: integer; e: T);
var
  cur: TNode;
  i: integer;
begin
  if (index < 0) or (index >= _size) then
    raise Exception.Create('SetItem failed. Index is Illegal.');

  cur := _dummyHead.Next;
  for i := 0 to index - 1 do
    cur := cur.Next;

  cur.E := e;
end;

function TLinkedList<T>.ToArray: TImpl.TArr;
var
  res: TImpl.TArr;
  cur: TNode;
  i: integer;
begin
  SetLength(res, Count);
  cur := _dummyHead.Next;

  for i := 0 to High(res) do
  begin
    res[i] := cur.E;
    cur := cur.Next;
  end;

  Result := res;
end;

function TLinkedList<T>.ToString: UString;
var
  sb: TStringBuilder;
  cur: TNode;
  e: T;
  Value: TValue;
begin
  sb := TStringBuilder.Create;
  try
    cur := _dummyHead.Next;

    while cur <> nil do
    begin
      e := cur.E;
      TValue.Make(@e, TypeInfo(T), Value);

      sb.Append(Value.ToString + ' -> ');
      cur := cur.Next;
    end;

    sb.Append('nil');

    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

end.
