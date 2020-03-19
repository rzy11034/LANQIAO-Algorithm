unit LQA.Case07_12_DifficultString;

(**
 * 问题描述:如果一个字符串包含两个相邻的重复子串，则称它为容易的串，其他串称为困难的串,
 * 如:BB，ABCDACABCAB,ABCDABCD都是容易的，A,AB,ABA,D,DC,ABDAB,CBABCBA都是困难的。

 输入正整数n,L，输出由前L个字符(大写英文字母)组成的，字典序第n小的困难的串。
 例如，当L=3时，前7个困难的串分别为:
 A,AB,ABA,ABAC,ABACA,ABACAB,ABACABA
 n指定为4的话,输出ABAC
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

type
  TDifficultString = class(TObject)
  private
    _prefix: UString;
    _max: integer;
    _count: integer;

    // 判断prefix+i是否一个困难的串
    // 1.遍历所有的长度为偶数的子串,看是否对称
    // 2.prefix是一个困难的串 ABACA i
    function __isDifficul(c: UChar): boolean;

  public
    constructor Create(l, n: integer);
    destructor Destroy; override;

    procedure Solution;
  end;

procedure Main;

implementation

procedure Main;
begin
  with TDifficultString.Create(3, 7) do
  begin
    Solution;
  end;
end;

{ TDifficultString }

constructor TDifficultString.Create(l, n: integer);
begin
  _prefix := '';
  _max := l;
  _count := n;
end;

destructor TDifficultString.Destroy;
begin
  inherited Destroy;
end;

procedure TDifficultString.Solution;
var
  cnt: integer;

  procedure __dfs;
  var
    i: integer;
  begin
    for i := Ord('A') to Ord('A') + _max do
    begin
      if __isDifficul(Chr(i)) then
      begin
        _prefix := _prefix + Chr(i);
        writeln(_prefix);
        Inc(cnt);

        if cnt >= _count then
          Exit;;

        __dfs;
      end;
    end;
  end;

begin
  cnt := 0;
  __dfs;
end;

function TDifficultString.__isDifficul(c: UChar): boolean;
var
  cnt, i: integer;
  s1, s2: UString;
begin
  cnt := 0;

  i := _prefix.Length - 1;
  while i >= 0 do
  begin
    s1 := _prefix.Substring(i, i + cnt + 1);
    s2 := _prefix.Substring(i + cnt + 1, _prefix.Length) + c;
    Inc(cnt);

    if s1 = s2 then
      Exit(false);

    Dec(i, 2);
  end;

  Result := true;
end;

end.