unit LQA.Case05_09_移除字符串中连续出现的K个0;

interface

uses
  System.SysUtils,
  System.RegularExpressions,
  LQA.Utils;

procedure Main;

implementation

function RemoveKZeros(src: UString; k: integer): UString;
var
  reg: TRegEx;
begin
  reg.Create('0{' + k.ToString + '}');
  Result := reg.Replace(src, '');
end;

procedure Main;
begin
  WriteLn(RemoveKZeros('a00000b', 3));
end;

end.
