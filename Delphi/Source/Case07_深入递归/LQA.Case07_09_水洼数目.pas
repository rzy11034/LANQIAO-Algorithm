unit LQA.Case07_09_水洼数目;

(*
  有一个大小为 N*M 的园子，雨后积起了水。八连通的积水被认为是连接在一起的。请求出
  园子里总共有多少水洼？（八连通指的是下图中相对 W 的*的部分）

      ***
      *W*
      ***

  限制条件

   N, M ≤ 100

   样例:

   输入
      N=10, M=12

  园子如下图（'W'表示积水， '.'表示没有积水）

  W........WW.
  .WWW.....WWW
  ....WW...WW.
  .........WW.
  .........W..
  ..W......W..
  .W.W.....WW.
  W.W.W.....W.
  .W.W......W.
  ..W.......W.

  输出

      3

 *)

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  TPuddlesNumber = class(TObject)
  private
    _data: TArr2D_chr;

  public
    constructor Create;
    destructor Destroy; override;

    function Solution(const arr: TArr2D_chr): integer;
  end;

procedure Main;
var
  arr: TArr2D_chr;
  i, j: integer;
begin
  SetLength(arr, 10, 12);
  for i := 0 to High(arr) do
  begin
    for j := 0 to High(arr[i]) do
    begin
      Read(arr[i, j]);
    end;
    ReadLn;
  end;

  with TPuddlesNumber.Create do
  begin
    WriteLn(Solution(arr));
  end;
end;

{ TPuddlesNumber }

constructor TPuddlesNumber.Create;
begin
  inherited;
end;

destructor TPuddlesNumber.Destroy;
begin
  inherited Destroy;
end;

function TPuddlesNumber.Solution(const arr: TArr2D_chr): integer;
  procedure __solution(row, col: integer);
  var
    i, j: integer;
  begin
    _data[row, col] := '.';

    for i := -1 to 1 do
    begin
      for j := -1 to 1 do
      begin
        if (i = 0) and (j = 0) then
          Continue;

        if (row + i >= 0) and (row + i <= High(_data))
          and (col + j >= 0) and (col + j <= High(_data[0])) then
        begin
          if _data[row + i, col + j] = 'W' then
            __solution(row + i, col + j);
        end;
      end;
    end;
  end;

var
  k, i, j: integer;
begin
  _data := TArrayUtils_chr.CopyArray2D(arr);
  k := 0;

  for i := 0 to High(_data) do
  begin
    for j := 0 to High(_data[i]) do
    begin
      if _data[i, j] = 'W' then
      begin
        __solution(i, j);
        Inc(k);
      end;
    end;
  end;

  Result := k;
end;

end.
