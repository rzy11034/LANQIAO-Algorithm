unit LQA.Case03_01_AdjustsTheArrayOrder;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function Func(arr: TArr_int): TArr_int;
var
  ret: TArr_int;
  l, r, i: integer;
begin
  SetLength(ret, Length(arr));
  l := Low(arr);
  r := High(arr);

  for i := 0 to high(arr) do
  begin
    if Odd(arr[i]) then
    begin
      ret[l] := arr[i];
      Inc(l);
    end
    else
    begin
      ret[r] := arr[i];
      Dec(r);
    end;
  end;

  Result := ret;
end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [2, 3, 4, 5, 6];
  TArrayUtils_int.Print(Func(arr));
end;

end.