unit LQA.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Run;

implementation

uses
  LQA.Case07_09_PuddlesNumber;

procedure Run;
var
  a,b: TArr2D_int;
begin
  a := [[1, 2], [3, 4]];
  b := copy(a);
  a[0, 0] := 10;

  Main;
end;

end.