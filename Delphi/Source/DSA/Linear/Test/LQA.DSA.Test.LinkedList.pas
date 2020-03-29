unit LQA.DSA.Test.LinkedList;

interface

uses
  System.SysUtils,
  LQA.DSA.LinkedList,
  LQA.DSA.Interfaces,
  LQA.Utils;

procedure Main;

implementation

type
  TLinkedList = TLinkedList<integer>;
  TImpl = TImpl<integer>;

procedure Main;
var
  al: TLinkedList;
  a, b: TImpl.TArr;
begin
  a := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  al := TLinkedList.Create;
  al.AddRange(a);
  b := al.ToArray;
  al.RemoveFirst;
  al.RemoveLast;
  al.RemoveElement(10);
  writeln('Main ', al.ToString);
  writeln('Main ', al.Remove(3));
end;

end.
