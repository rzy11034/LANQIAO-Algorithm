unit LQA.Case09_12_栈的排序;

(* *
 *
 请编写一个程序，按升序对栈进行排序（即最大元素位于栈顶），
 要求最多只能使用一个额外的栈存放临时数据，但不得将元素复制到别的数据结构中。
 给定一个int[] numbers(C++中为vector<int>)，其中第一个元素为栈顶，
 请返回排序后的栈。请注意这是一个栈，意味着排序过程中你只能访问到第一个元素。
 测试样例：

 [1,2,3,4,5]
 返回：
 [5,4,3,2,1]

 *)

interface

uses
  System.SysUtils,
  DeepStar.DSA.Linear.Stack,
  LQA.Utils;

type
  TStacksSort = class(TObject)
  private type
    TStack = TStack<integer>;

  private
    _stack: TStack;

  public
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    function Solution: TArr_int;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TStacksSort.Create([1, 2, 3, 4, 5]) do
  begin
    TArrayUtils_int.Print(Solution);
    Free;
  end;

  with TStacksSort.Create([5, 4, 3, 2, 1]) do
  begin
    TArrayUtils_int.Print(Solution);
    Free;
  end;

  with TStacksSort.Create([5, 2, 1, 3, 4]) do
  begin
    TArrayUtils_int.Print(Solution);
    Free;
  end;
end;

{ TStacksSort }

constructor TStacksSort.Create(arr: TArr_int);
var
  i: integer;
begin
  _stack := TStack.Create;

  for i := 0 to high(arr) do
  begin
    _stack.Push(arr[i]);
  end;
end;

destructor TStacksSort.Destroy;
begin
  _stack.Free;
  inherited Destroy;
end;

function TStacksSort.Solution: TArr_int;
var
  temp: TStack;
  e, i: integer;
  res: TArr_int;
begin
  temp := TStack.Create;

  while not _stack.IsEmpty do
  begin
    e := _stack.Pop;

    if temp.IsEmpty then
    begin
      temp.Push(e);
    end
    else
    begin
      if e >= temp.Peek then
      begin
        temp.Push(e);
      end
      else
      begin
        while (not temp.IsEmpty) and (e < temp.Peek) do
        begin
          _stack.Push(temp.Pop);
        end;

        temp.Push(e);
      end;
    end;
  end;

  SetLength(res, temp.Count);
  for i := 0 to high(res) do
  begin
    res[i] := temp.Pop;
  end;

  Result := res;
end;

end.
