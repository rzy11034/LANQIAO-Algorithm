unit LQA.Case05_07_IsRotate;

{**
 * 判断A串是否B串的旋转字符串
 *
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

function IsRotate(s1, s2: UString): boolean;
var
  sb: TStringBuilder;
  ret: UString;
begin
  if s1.Length <> s2.Length then
    Exit(false);

  sb := TStringBuilder.Create(s1).Append(s2);

  ret := sb.ToString;
  Result := string(ret).Contains(s1);
end;

procedure Main;
begin
  WriteLn(isRotate('defa', 'fabdde'));
  WriteLn(isRotate('abc', 'acb'));
  WriteLn(isRotate('大众化', '化大众'));
end;

end.
