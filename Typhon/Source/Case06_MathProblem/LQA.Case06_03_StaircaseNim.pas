unit LQA.Case06_03_StaircaseNim;

{**
 * Sample Input
   2
   3
   1 2 3
   8
   1 5 6 7 9 12 14 17
   Sample Output
   Bob will win
   Georgia will win
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Solution(arr: TArr_int): UString;
var
  len, ret, i: integer;
begin
  len := Length(arr);
  TArrayUtils_int.Sort(arr);//7 3 2 9  最坑之处
  ret := 0;

  if (len and 1) = 1 then
  begin//奇数
    for i := 0 to len - 1 do
    begin
      if i = 0 then
        ret := ret xor (arr[0] - 1)
      else
        ret := ret xor (arr[i] - arr[i - 1] - 1);
    end;
  end
  else
  begin
    i := 1;
    while i < len do
    begin
      ret := ret xor (arr[i] - arr[i - 1] - 1);
      Inc(i, 2);
    end;

  end;

  if ret = 0 then
  begin
    Result := 'Bob will win';
  end
  else
  begin
    Result := 'Georgia will win';
  end;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [1, 5, 6, 7, 9, 12, 14, 17];
  WriteLn(Solution(arr));
end;

end.
