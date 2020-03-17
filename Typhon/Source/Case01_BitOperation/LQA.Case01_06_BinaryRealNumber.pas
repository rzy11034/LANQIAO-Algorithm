unit LQA.Case01_06_BinaryRealNumber;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

procedure BinaryRealNumber;
var
  num, r: double;
  sb: TStringBuilder;
begin
  num := 0.625;

  sb := TStringBuilder.Create('0.');
  try
    while (num > 0) do
    begin
      //乘2：挪整
      r := num * 2;
      //判断整数部分
      if (r >= 1) then
      begin
        sb.append('1');
        //消掉整数部分
        num := r - 1;
      end
      else
      begin
        sb.append('0');
        num := r;
      end;
    end;

    WriteLn(sb.ToString);
  finally
    FreeAndNil(sb);
  end;
end;

procedure Main;
begin
  BinaryRealNumber;
end;

end.
