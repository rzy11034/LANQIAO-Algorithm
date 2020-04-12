unit LQA.Case09_09_StackWithMin;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Linear.Stack;

type
  TStackWithMin = class(TObject)
  private type
    TStack = specialize TStack<integer>;

  private
    _data: TStack;
    _min: TStack;
  public
    constructor Create;
    destructor Destroy; override;

    function Count: integer;
    function IsEmpty: boolean;
    procedure Push(e: integer);
    function Pop: integer;
    function Peek: integer;
    function Min: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  stack: TStackWithMin;
begin
  stack := TStackWithMin.Create;

  stack.Push(2);
  stack.Push(9);
  stack.Push(3);
  stack.Push(1);
  stack.Push(5);

  writeln(stack.Min);
  stack.Pop;
  writeln(stack.Min);
  stack.Pop;
  writeln(stack.Min);
  stack.Pop;
  writeln(stack.Min);
  stack.Pop;
  writeln(stack.Min);
  stack.Pop;
  writeln(stack.Min);
end;

{ TStackWithMin }

constructor TStackWithMin.Create;
begin
  _data := TStack.Create;
  _min := TStack.Create;
end;

function TStackWithMin.Count: integer;
begin
  Result := _data.Count;
end;

destructor TStackWithMin.Destroy;
begin
  _data.Free;
  _min.Free;

  inherited Destroy;
end;

function TStackWithMin.IsEmpty: boolean;
begin
  Result := _data.IsEmpty;
end;

function TStackWithMin.Min: integer;
begin
  if _min.IsEmpty then
    Exit(integer.MinValue);

  Result := _min.Peek;
end;

function TStackWithMin.Peek: integer;
begin
  Result := _data.Peek;
end;

function TStackWithMin.Pop: integer;
var
  val: integer;
begin
  val := _data.Pop;

  if val = _min.Peek then
    _min.Pop;

  Result := val;
end;

procedure TStackWithMin.Push(e: integer);
begin
  _data.Push(e);

  if _min.IsEmpty then
  begin
    _min.Push(e);
  end
  else
  begin
    if _min.Peek > e then
      _min.Push(e);
  end;
end;

end.