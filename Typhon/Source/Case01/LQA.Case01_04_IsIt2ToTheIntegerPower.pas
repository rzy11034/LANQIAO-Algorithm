unit LQA.Case01_04_IsIt2ToTheIntegerPower;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

// 用一条语句判断一个整数是不是2的整数次方
procedure IsIt2ToTheIntegerPower(n: integer);
begin
  if ((n - 1) and n) = 0 then
    WriteLn('True')
  else
    WriteLn('False');
end;

procedure Main;
begin
  IsIt2ToTheIntegerPower(8);
end;

end.