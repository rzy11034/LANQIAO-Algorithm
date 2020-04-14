unit LQA.Case07_08_部分和;

(*
  给定整数序列a1,a2,...,an,判断是否可以从中选出若干数,使它们的和恰好为k.

  1≤n≤20

  -10^8≤ai≤10^8

  -10^8≤k≤10^8

  样例:

  输入

  n=4
  a = [1,2,4,7]
  k=13
  输出:

  Yes (13 = 2 + 4 + 7)

*)

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  TPartialSum = class(TObject)
  private
    _list: TList_int;
    _result: TArr_int;

  public
    constructor Create;
    destructor Destroy; override;

    function Solution(const arr: TArr_int; k: integer): UString;
  end;

procedure Main;
var
  arr: TArr_int;
begin
  arr := [1, 2, 4, 7];

  with TPartialSum.Create do
  begin
    WriteLn(Solution(arr, 13));
  end;
end;

{ TSolution }

constructor TPartialSum.Create;
begin
  _list := TList_int.Create;
end;

destructor TPartialSum.Destroy;
begin
  FreeAndNil(_list);
  inherited Destroy;
end;

function TPartialSum.Solution(const arr: TArr_int; k: integer): UString;
  procedure __solution(sum, cur: integer);
  begin
    // 已找到了一组解
    if (sum = 0) then
    begin
      _result := _list.ToArray;
      Exit;
    end;

    // 没有找到解
    if (k < 0) or (cur = Length(arr)) then
      Exit;

    _list.AddLast(arr[cur]);
    __solution(sum - arr[cur], cur + 1);

    // 回溯
    _list.Remove(_list.Count - 1);
    __solution(sum, cur + 1);
  end;

var
  sb: TStringBuilder;
  i: integer;
begin
  __solution(k, 0);

  sb := TStringBuilder.Create;
  try
    sb.Append(k).Append('=');

    for i := 0 to Length(_result) - 1 do
    begin
      if i <> High(_result) then
        sb.Append(_result[i]).Append('+')
      else
        sb.Append(_result[i]);
    end;

    Result := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

end.
