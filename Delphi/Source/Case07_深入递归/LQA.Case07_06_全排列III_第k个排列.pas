unit LQA.Case07_06_全排列III_第k个排列;

{ **
 * LeetCode60 n个数的排列组合找出字典序的第k个排列
 * The set[1,2,3,…,n]contains a total of n! unique permutations.
 By listing and labeling all of the permutations in order,
 We get the following sequence (ie, for n = 3):
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"

 Given n and k, return the k th permutation sequence.
 Note: Given n will be between 1 and 9 inclusive.

 时间限制：1秒
 * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  TSolution = class(TObject)
  private
    _kCount: integer;
    _data: TList_str;

    function __count(chrArr: TArr_chr; c: UChar): integer; overload;
    function __count(str: UString; c: UChar): integer; overload;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Permutation(const str: UString; k: integer);
  end;

procedure Main;
var
  s: UString;
  sln: TSolution;
begin
  s := '123456789';
  sln := TSolution.Create;
  sln.Permutation(s, 10);
end;

{ TSolution }

constructor TSolution.Create;
begin
  _kCount := 0;
  _data := TList_str.Create;
end;

destructor TSolution.Destroy;
begin
  FreeAndNil(_data);
  inherited Destroy;
end;

procedure TSolution.Permutation(const str: UString; k: integer);
var
  chrArr: TArr_chr;

  function __permutation(prefix: UString): boolean;
  var
    ch: UChar;
    i: integer;
    isFinished: boolean;
  begin
    isFinished := False;

    // 前缀的长度==字符集的长度,一个排列就完成了
    if prefix.Length = Length(chrArr) then
    begin
      Inc(_kCount);

      if _kCount = k then
      begin
        WriteLn('====', _kCount, ': ', prefix);
        Exit(True);
      end;

      WriteLn('----', _kCount, ': ', prefix);
    end;

    // 每次都从头扫描,只要该字符可用, 我们就附加到前缀后面,前缀变长了
    for i := 0 to Length(chrArr) - 1 do
    begin
      ch := chrArr[i];

      // 这个字符可用: 在pre中出现次数<在字符集中的出现次数
      if __count(prefix, ch) < __count(chrArr, ch) then
        isFinished := __permutation(prefix + ch);

      if isFinished then
        Break;
    end;

    Result := isFinished;
  end;

begin
  chrArr := str.ToCharArray;
  __permutation('');
end;

function TSolution.__count(str: UString; c: UChar): integer;
var
  tmp: UChar;
begin
  Result := 0;

  for tmp in str do
  begin
    if tmp = c then
      Inc(Result);
  end;
end;

function TSolution.__count(chrArr: TArr_chr; c: UChar): integer;
var
  tmp: UChar;
begin
  Result := 0;

  for tmp in chrArr do
  begin
    if tmp = c then
      Inc(Result);
  end;
end;

end.
