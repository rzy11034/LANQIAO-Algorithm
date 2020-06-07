unit LQA.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  {%H-}LQA.Utils;

procedure Run;

implementation

uses
  DeepStar.DSA.Tree.Test.RBTree;

type
  Person = class
  private
    _age: integer;   // 10  20
    _Height: double; // 1.55 1.67
    _Name: UString; // "jack" "rose"

  public
    constructor Create(age: integer; Height: double; Name: UString);
  end;

procedure Run;
var
  p1, p2: Person;
  i,j: integer;
begin
  i :=10;
  j:=i;
  p1 := Person.Create(10, 10.1, 'aaa');
  p2 := Person.Create(10, 10.1, 'aaa');
  WriteLn(p1.GetHashCode);
  WriteLn(p2.GetHashCode);
  WriteLn(i.ToString.GetHashCode);
  WriteLn(j.ToString.GetHashCode);
  WriteLn((i*2).ToString.GetHashCode);
  //Main;
end;

{ Person }

constructor Person.Create(age: integer; Height: double; Name: UString);
begin
  _age := age;
  _Height := Height;
  _Name := Name;
end;

end.
