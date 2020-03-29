unit LQA.DSA.Test.ArrayList;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.DSA.ArrayList,
  LQA.DSA.Interfaces,
  LQA.DSA.UString;

procedure Main;

implementation

type
  TArrayList = specialize TArrayList<integer>;
  TImpl = specialize TImpl<integer>;

procedure Main;
var
  al: TArrayList;
  a: TImpl.TArr;
begin
  a := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  al := TArrayList.Create;
  al.AddRange(a);
end;

end.