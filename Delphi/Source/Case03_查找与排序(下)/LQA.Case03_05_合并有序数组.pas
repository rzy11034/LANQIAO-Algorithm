unit LQA.Case03_05_合并有序数组;

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Merge(arr1, arr2: TArr_int): TArr_int;
var
  ret: TArr_int;
  i, j, n: integer;
begin
  i := High(arr1);
  j := High(arr2);
  SetLength(ret, i + j + 2);

  for n := High(ret) downto 0 do
  begin
    if (i >= 0) and (j < 0) then
    begin
      ret[n] := arr1[i];
      Dec(i);
      Continue;
    end
    else
    if (i < 0) and (j >= 0) then
    begin
      ret[n] := arr2[j];
      Dec(j);
      Continue;
    end;

    if arr1[i] > arr2[j] then
    begin
      ret[n] := arr1[i];
      Dec(i);
    end
    else
    begin
      ret[n] := arr2[j];
      Dec(j);
    end;
  end;

  Result := ret;
end;

procedure Main;
var
  arr1, arr2: TArr_int;
begin
  arr1 := [1, 3, 5, 7, 9, 11];
  arr2 := [2, 4, 6, 8, 10];
  TUtils_Int.PrintArray(Merge(arr1, arr2));
end;

end.
