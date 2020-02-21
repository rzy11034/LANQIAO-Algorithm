unit LQA.Case03_11_数组能排成的最小数;

interface

uses
  System.SysUtils,
  LQA.Utils,
  System.Generics.Defaults;

procedure Main;

implementation

function Cmp(const Left, Right: integer): integer;
var
  s1, s2: UString;
begin
  s1 := Left.ToString + Right.ToString;
  s2 := Right.ToString + Left.ToString;

  Result := CompareText(s1, s2);
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [3, 22, 321];
  TArrayUtils_int.Sort(arr, Cmp);
  TArrayUtils_int.Print(arr);
end;

end.
