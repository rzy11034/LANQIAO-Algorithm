unit LQA.Case08_13_Lcs;

(**
 * 求最大公共子序列问题
 * AB34C
 * A1BC2 结果为 ABC
 * 更多案例请看测试用例
 * *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TLcs = class(TObject)
  private

  public
    constructor Create;
    destructor Destroy; override;

    function Dfs(s1, s2: UString): TList_chr;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TLcs.Create do
  begin
    TArrayUtils_chr.Print(Dfs('AB34C', 'A1BC2').ToArray);
    TArrayUtils_chr.Print(Dfs('3563243', '513141').ToArray);
    TArrayUtils_chr.Print(Dfs('3069248', '513164318').ToArray);
    TArrayUtils_chr.Print(Dfs('123', '456').ToArray);
  end;
end;

{ TLcs }

constructor TLcs.Create;
begin
  inherited;
end;

destructor TLcs.Destroy;
begin
  inherited Destroy;
end;

function TLcs.Dfs(s1, s2: UString): TList_chr;
var
  len1, len2, i, j: integer;
  ans, list: TList_chr;
  tmpS1, tmpS2: UString;
begin
  len1 := s1.Length;
  len2 := s2.Length;
  ans := TList_chr.Create;

  for i := 0 to len1 - 1 do
  begin
    // 求以i字符开头的公共子序列
    list := TList_chr.Create;

    // 和s2的每个字符比较
    for j := 0 to len2 - 1 do
    begin
      if (s1.Chars[i] = s2.Chars[j]) then // 如果相同
      begin
        list.add(s1.Chars[i]);
        tmpS1 := s1.substring(i + 1);
        tmpS2 := s2.substring(j + 1);
        list.AddRange(Dfs(tmpS1, tmpS2).ToArray);
        Break;
      end;
    end;

    if list.Count > ans.Count then
    begin
      ans := list;
    end;
  end;

  Result := ans;
end;

end.
