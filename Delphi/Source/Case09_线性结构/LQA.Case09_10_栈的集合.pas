unit LQA.Case09_10_栈的集合;

(* *
 请实现一种数据结构SetOfStacks，由多个栈组成，其中每个栈的大小为size，当前一个栈填满时，新建一个栈。
 该数据结构应支持与普通栈相同的push和pop操作。

 给定一个操作序列int[][2] ope，每个操作的第一个数代表操作类型，
 若为1，则为push操作，后一个数为应push的数字；
 若为2，则为pop操作，后一个数无意义。

 请返回一个int[][](C++为 vector<vector<int>> )，为完成所有操作后的 SetOfStacks，
 顺序应为从下到上，默认初始的SetOfStacks为空。

 保证数据合法。
 *)

interface

uses
  System.SysUtils,
  DeepStar.DSA.Linear.ArrayList,
  DeepStar.DSA.Linear.Stack;

type
  TSetOfStacks = class(TObject)
  private type
    TStack_int = TStack<integer>;
    TArrayList = TArrayList<TStack_int>;

  private const
    SIZE = 10;

  private
    _data: TArrayList;
    _index: integer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Push(e: integer);
    function Pop: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  s: TSetOfStacks;
  i: integer;
begin
  s := TSetOfStacks.Create;

  for i := 0 to 99 do
  begin
    s.Push(i);
  end;

  for i := 0 to 99 do
  begin
    Write(s.Pop, ' ');
  end;
  WriteLn;
end;

{ TSetOfStacks }

constructor TSetOfStacks.Create;
begin
  _data := TArrayList.Create;
  _index := 0;

  _data.AddLast(TStack_int.Create);
end;

destructor TSetOfStacks.Destroy;
var
  i: integer;
begin
  for i := 0 to _data.Count do
  begin
    _data[i].Free;
  end;

  _data.Free;
  inherited Destroy;
end;

function TSetOfStacks.Pop: integer;
var
  res: integer;
begin
  if _data[_index].Count = 0 then
  begin
    _data[_index].Free;
    _index := _index - 1;
    res := _data[_index].Pop;
  end
  else
  begin
    res := _data[_index].Pop;
  end;

  Result := res;
end;

procedure TSetOfStacks.Push(e: integer);
begin
  if _data[_index].Count = SIZE then
  begin
    _index := _index + 1;

    _data.AddLast(TStack_int.Create);
    _data[_index].Push(e);
  end
  else
  begin
    _data[_index].Push(e);
  end;
end;

end.
