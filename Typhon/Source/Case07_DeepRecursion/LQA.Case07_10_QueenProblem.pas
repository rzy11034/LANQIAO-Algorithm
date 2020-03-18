unit LQA.Case07_10_QueenProblem;

(**
 * 请设计一种算法，解决著名的n皇后问题。这里的n皇后问题指在一个n*n的棋盘上放置n个棋子，
 * 使得每行每列和每条对角线上都只有一个棋子，求其摆放的方法数。

 给定一个int n，请返回方法数，保证n小于等于15
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  TQueenProblem = class(TObject)
  private
    _rec: TArr_int;
    _cnt: integer;
    _max: integer;

    function __check(row, col: integer): boolean;

  public
    constructor Create(n: integer);
    destructor Destroy; override;

    function Solution: integer;
  end;

procedure Main;
var
  qp: TQueenProblem;
begin
  qp := TQueenProblem.Create(5);
  writeln(qp.Solution);
end;

{ TQueenProblem }

constructor TQueenProblem.Create(n: integer);
begin
  _max := n;
  _cnt := 0;
  SetLength(_rec, n);
end;

destructor TQueenProblem.Destroy;
begin
  inherited Destroy;
end;

function TQueenProblem.Solution: integer;
  procedure __slt(row: integer);
  var
    col: integer;
  begin
    if row = _max then
    begin
      Inc(_cnt);
      TArrayUtils_int.Print(_rec);
      Exit;
    end;

    for col := 0 to _max - 1 do
    begin
      if __check(row, col) then
      begin
        _rec[row] := col;
        __slt(row + 1);
        _rec[row] := -1;
      end;
    end;
  end;

begin
  __slt(0);
  Result := _cnt;
end;

function TQueenProblem.__check(row, col: integer): boolean;
var
  i: integer;
begin
  Result := true;

  for i := 0 to row - 1 do
  begin
    if (col = _rec[i]) or (row - col = i - _rec[i]) or
      (row + col = i + _rec[i]) then
    begin
      Exit(false);
    end;
  end;
end;

end.