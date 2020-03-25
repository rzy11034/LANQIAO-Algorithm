unit LQA.Main;

{$mode objfpc}{$H+}
{$WARN 5023 off : Unit "$1" not used in $2}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Run;

implementation

uses
  LQA.Case08_14_CompleteKnapsackProblem;

procedure Run;
begin
  Main;
end;

end.