unit LQA.Case09_01_BucketSort;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TNode = class(TObject)
  public
    E: integer;
    Next: TNode;
    constructor Create(newE: integer; newNext: TNode = nil);
  end;

  TBucketSort = class(TObject)
  private
    class var _data: array of TNode;

    class function __hash(element, max, len: integer): integer;
    class function __insert(node: TNode; element: integer): TNode;

  public
    class procedure Sort(var arr: TArr_int);
  end;

procedure Main;

implementation

procedure Main;
var
  a: TArr_int;
begin
  a := [12, 56, 7, 5, 38, 38, 84, 2, 58, 14, 38, 1];

  TBucketSort.Sort(a);
  TArrayUtils_int.Print(a);
end;

class procedure TBucketSort.Sort(var arr: TArr_int);
var
  max, len, hash, i, a: integer;
  d, tmp: TNode;
begin
  max := MaxIntValue(arr);
  len := Length(arr);
  SetLength(_data, len);

  for a in arr do
  begin
    hash := __hash(a, max, len);
    _data[hash] := __insert(_data[hash], a);
  end;

  i := 0;
  for d in _data do
  begin
    tmp := d;

    while tmp <> nil do
    begin
      arr[i] := tmp.E;
      i += 1;
      tmp := tmp.Next;
    end;
  end;
end;

class function TBucketSort.__hash(element, max, len: integer): integer;
begin
  Result := element * len div (max + 1);
end;

class function TBucketSort.__insert(node: TNode; element: integer): TNode;
var
  res: TNode;
begin
  res := node;

  if res = nil then
  begin
    res := TNode.Create(element);
  end
  else if node.E >= element then
  begin
    res := TNode.Create(element);
    res.Next := node;
  end
  else
    res.Next := __insert(node.Next, element);

  Result := res;
end;

{ TNode }

constructor TNode.Create(newE: integer; newNext: TNode);
begin
  E := newE;
  Next := newNext;
end;

end.