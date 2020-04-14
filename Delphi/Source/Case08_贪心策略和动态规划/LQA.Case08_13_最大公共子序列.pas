unit LQA.Case08_13_最大公共子序列;

(* *
 * 求最大公共子序列问题
 * AB34C
 * A1BC2 结果为 ABC
 * 更多案例请看测试用例
 * *)

interface

uses
  System.SysUtils,
  System.Math,
  LQA.Utils;

type
  TLcs = class(TObject)
  private

  public
    constructor Create;
    destructor Destroy; override;

    function Dfs(s1, s2: UString): TList_chr;
    function Dp(s1, s2: UString): TList_chr;
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
    TArrayUtils_chr.Print(Dfs('JFSF6F7F9F', 'JSDED6FF').ToArray);

    DrawLineBlockEnd;

    TArrayUtils_chr.Print(Dp('AB34C', 'A1BC2').ToArray);
    TArrayUtils_chr.Print(Dp('3563243', '513141').ToArray);
    TArrayUtils_chr.Print(Dp('3069248', '513164318').ToArray);
    TArrayUtils_chr.Print(Dp('123', '456').ToArray);
    TArrayUtils_chr.Print(Dp('JFSF6F7F9F', 'JSDED6FF').ToArray);
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
        list.AddLast(s1.Chars[i]);
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

function TLcs.Dp(s1, s2: UString): Tlist_chr;
  function __parse(const rec: TArr2D_int): TList_chr;
  var
    i, j: integer;
    res: TList_chr;
  begin
    i := Length(rec) - 1;
    j := Length(rec[i]) - 1;
    res := TList_chr.Create;

    while (i > 0) and (j > 0) do
    begin
      // 比左和上大，一定是当前位置的字符相等
      if rec[i, j] > Max(rec[i - 1, j], rec[i, j - 1]) then
      begin
        res.Add(0, s1.Chars[i - 1]);
        i := i - 1;
        j := j - 1;
      end
      else
      begin
        // 选择左边或上边的较大的值
        if rec[i - 1, j] > rec[i, j - 1] then
        begin
          i := i - 1; // 往上移
        end
        else
        begin
          j := j - 1; // 往左移
        end;
      end;
    end;

    Result := res;
  end;

var
  rec: TArr2D_int;
  i, j: integer;
begin
  SetLength(rec, s1.Length + 1, s2.Length + 1);

  for i := 1 to High(rec) do
  begin
    for j := 1 to High(rec[i]) do
    begin
      if s1.Chars[i - 1] = s2.Chars[j - 1] then
      begin
        rec[i, j] := rec[i - 1, j - 1] + 1;
      end
      else
      begin
        rec[i, j] := MaxIntValue([rec[i - 1, j - 1], rec[i, j - 1], rec[i - 1, j]]);
      end;
    end;
  end;

  Result := __parse(rec);
end;

end.
