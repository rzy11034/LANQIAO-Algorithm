unit LQA.Case05_07_旋转词;

{ **
  * 判断A串是否B串的旋转字符串
  *
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

function IsRotate(s1, s2: UString): boolean;
var
  sb: TStringBuilder;
  ret: UString;
begin
  if s1.Length <> s2.Length then
    Exit(False);

  sb := TStringBuilder.Create(s1).Append(s2);

  ret := sb.ToString;
  Result := string(ret).Contains(s1);
end;

procedure Main;
begin
  WriteLn(IsRotate('defa', 'fabdde'));
  WriteLn(IsRotate('abc', 'acb'));
  WriteLn(IsRotate('大众化', '化大众'));
end;

end.
