unit LQA.Case03_09_TopK;

{**
 * 求海量数据（正整数）按逆序排列的前k个数（topK），因为数据量太大，不能全部存储在内存中，只能一个一个地从磁盘或者网络上读取数据，
 * 请设计一个高效的算法来解决这个问题
 第一行：用户输入K，代表要求得topK
 随后的N（不限制）行，每一行是一个整数代表用户输入的数据
 用户输入-1代表输入终止
 请输出topK，从小到大，空格分割
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TMaxHeap = class
  private
    __data: TArr_int;
    __index: integer;

    function __indexOfParent(index: integer): integer;
    function __indexOfLeftChild(index: integer): integer;
    function __indexOfRightChild(index: integer): integer;
    procedure __shiftDown(k: integer);
    procedure __shiftUp(k: integer);

  public
    constructor Create(capacity: integer = 10);
    destructor Destroy; override;

    procedure Add(n: integer);
    function Capacity: integer;
    function Count: integer;
    function Top: integer;
    function Extract: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  maxHeap: TMaxHeap;
  arr: TArr_int;
  k, i: integer;
begin
  k := 8;
  arr := [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
  maxHeap := TMaxHeap.Create(k);

  for i := 0 to High(arr) do
  begin
    if maxHeap.Count < k then
      maxHeap.Add(arr[i])
    else
    begin
      if arr[i] < maxHeap.Top then
      begin
        maxHeap.Extract;
        maxHeap.Add(arr[i]);
      end;
    end;
  end;

  arr := nil;
  SetLength(arr, maxHeap.Count);
  for i := maxHeap.Count - 1 downto 0 do
    arr[i] := maxHeap.Extract;
  TArrayUtils_int.Print(arr);
end;

{ TMaxHeap }

constructor TMaxHeap.Create(capacity: integer);
begin
  SetLength(__data, capacity);
  __index := -1;
end;

procedure TMaxHeap.Add(n: integer);
begin
  if __index < Self.Count then
  begin
    Inc(__index);
    __data[__index] := n;
    __shiftUp(Count - 1);
  end;
end;

function TMaxHeap.Capacity: integer;
begin
  Result := Length(__data);
end;

function TMaxHeap.Count: integer;
begin
  Result := __index + 1;
end;

destructor TMaxHeap.Destroy;
begin
  inherited Destroy;
end;

function TMaxHeap.Extract: integer;
var
  ret: integer;
begin
  ret := Self.Top;
  TUtils_int.Swap(__data[0], __data[__index]);
  Dec(__index);
  __shiftDown(0);
  Result := ret;
end;

function TMaxHeap.Top: integer;
begin
  if Self.Count = 0 then
    raise Exception.Create('Can not findFirst when heap is empty.');

  Result := __data[0];
end;

function TMaxHeap.__indexOfLeftChild(index: integer): integer;
begin
  Result := index * 2 + 1;
end;

function TMaxHeap.__indexOfParent(index: integer): integer;
begin
  Result := (index - 1) div 2;
end;

function TMaxHeap.__indexOfRightChild(index: integer): integer;
begin
  Result := index * 2 + 2;
end;

procedure TMaxHeap.__shiftDown(k: integer);
var
  j: integer;
begin
  while __indexOfLeftChild(k) < Count do
  begin
    j := __indexOfLeftChild(k);

    if (j + 1 < Count) and (__data[j + 1] > __data[j]) then
      j := __indexOfRightChild(k);  // __data[j] 是 leftChild 和 rightChild 中的最小值

    if __data[k] >= __data[j] then
      Break;

    TUtils_int.Swap(__data[k], __data[j]);
    k := j;
  end;
end;

procedure TMaxHeap.__shiftUp(k: integer);
var
  j: integer;
begin
  j := __indexOfParent(k);

  while (k > 0) and (__data[k] > __data[j]) do
  begin
    TUtils_int.Swap(__data[k], __data[j]);
    k := j;
  end;
end;

end.
