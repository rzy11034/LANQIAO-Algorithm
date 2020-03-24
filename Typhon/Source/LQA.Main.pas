unit LQA.Main;

{$mode objfpc}{$H+}
{$WARN 5023 off : Unit "$1" not used in $2}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils,
  LQA.DSA.Strings.KMP;

procedure Run;

implementation

uses
  LQA.Case08_13_Lcs;

procedure Run;
var
  s1, s2: UString;
begin
  s1 := 'ABCDEF';
  s2 := s1.Substring(1, 2);
  Main;
end;

end.