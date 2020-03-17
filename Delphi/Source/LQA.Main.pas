unit LQA.Main;

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Run;

implementation

uses
  LQA.Case07_08_部分和;

procedure Run;
var
  a, b: TArr2D_int;
begin
  a := [[1, 2], [3, 4]];
  b := copy(a);

  Main;
end;

end.
