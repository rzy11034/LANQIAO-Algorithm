unit LQA.Case07_05_非空子集;

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

procedure Main;
var
  a, b: TSet_str;
  s: UString;
  ss: set of 0..9;
begin
  a := TSet_str.Create;
  a.Add('()');
  a.Add('[]');

  b := a.Clone;
  b.Add('{}');

  for s in a.ToArray do
    write(s, ' ');
  WriteLn;

  for s in b.ToArray do
    write(s, ' ');
  WriteLn;
end;

end.
