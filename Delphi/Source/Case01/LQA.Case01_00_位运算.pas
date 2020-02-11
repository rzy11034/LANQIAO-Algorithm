unit LQA.Case01_00_位运算;

interface

uses
  System.SysUtils;

procedure Main;

implementation

// 位移
procedure BitwiseShift;
begin
  WriteLn(1 shl 35);
  WriteLn(1 shl 3);
end;

procedure Main;
begin
  BitwiseShift;
end;

end.
