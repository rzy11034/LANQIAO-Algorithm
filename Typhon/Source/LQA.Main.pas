unit LQA.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils, LQA.Utils;

procedure Run;

implementation

uses
  LQA.Case07_07_SudokuGame;

procedure Run;
var
  a, b :TArr_int;
begin
  a := [1,2];
  b := Copy(a);
  a[0]:=10;
  Main;
end;

end.