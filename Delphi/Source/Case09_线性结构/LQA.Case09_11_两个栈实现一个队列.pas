unit LQA.Case09_11_两个栈实现一个队列;

interface

uses
  System.SysUtils,
  DeepStar.DSA.Linear.Stack;

type
  TQueueByTwoStack = class(TObject)
  private type
    TStack_int = TStack<integer>;

  private
    _stack1, _stack2: TStack_int;

    procedure _move(stack1, stack2: TStack_int);

  public
    constructor Create;
    destructor Destroy; override;

    procedure EnQueue(e: integer);
    function DeQueue: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  queue: TQueueByTwoStack;
begin
  queue := TQueueByTwoStack.Create;

  queue.EnQueue(1);
  queue.EnQueue(2);
  WriteLn(queue.DeQueue);

  queue.EnQueue(3);
  WriteLn(queue.DeQueue);

  queue.EnQueue(4);
  queue.EnQueue(5);
  queue.EnQueue(6);
  WriteLn(queue.DeQueue);
  WriteLn(queue.DeQueue);
  WriteLn(queue.DeQueue);
  WriteLn(queue.DeQueue);
end;

{ TQueueByTwoStack }

constructor TQueueByTwoStack.Create;
begin
  _stack1 := TStack_int.Create;
  _stack2 := TStack_int.Create;
end;

function TQueueByTwoStack.DeQueue: integer;
begin
  if _stack2.IsEmpty then
    _move(_stack1, _stack2);

  Result := _stack2.Pop;
end;

destructor TQueueByTwoStack.Destroy;
begin
  _stack1.Free;
  _stack2.Free;
  inherited Destroy;
end;

procedure TQueueByTwoStack.EnQueue(e: integer);
begin
  if _stack1.IsEmpty then
    _move(_stack2, _stack1);

  _stack1.Push(e);
end;

procedure TQueueByTwoStack._move(stack1, stack2: TStack_int);
begin
  while not stack1.IsEmpty do
  begin
    stack2.Push(stack1.Pop);
  end;
end;

end.
