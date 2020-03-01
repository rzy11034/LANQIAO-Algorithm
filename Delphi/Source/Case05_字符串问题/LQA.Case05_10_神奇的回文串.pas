unit LQA.Case05_10_神奇的回文串;

interface

uses
  System.SysUtils;

procedure Main;

implementation

procedure Palindrome;
var
  i, j: integer;
begin
  for i := 1 to 9 do
  begin
    for j := 0 to 9 do
    begin
      WriteLn((i * 1000 + j * 100 + j * 10 + i).ToString);
    end;
  end;
end;

procedure Main;
begin
  Palindrome;
end;

end.
