unit LQA.Case08_15_LIS;

(**
 * 最长递增子序列的长度
 *输入 4 2 3 1 5 6
 *输出 3 （因为 2 3 5组成了最长递增子序列）
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type
  TLis = class(TObject)
  private
    _data: TArr_int;

    // 在递增数组中，从左查找第一个比v大的元素的下标
    function __indexOfFirstBigger(rec: TArr_int; v, l, r: integer): integer;

  public
    constructor Create(arr: TArr_int);
    destructor Destroy; override;

    function Dp: integer;
    function Dp_Simplicity: integer;
    function Simplicity: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  s: TArr_int;
begin
  s := [4, 2, 3, 1, 5, 6];

  with TLis.Create(s) do
  begin
    WriteLn('Solution_Simplicity: ', Simplicity);
    writeln('Dp_Simplicity: ', Dp_Simplicity);
    writeln('Dp: ', Dp);
  end;
end;

{ TLis }

constructor TLis.Create(arr: TArr_int);
begin
  _data := arr;
end;

destructor TLis.Destroy;
begin
  inherited Destroy;
end;

function TLis.Dp: integer;
var
  rec: TArr_int;
  p, i, indexOfFirstBigger: integer;
begin
  SetLength(rec, Length(_data) + 1);

  rec[1] := _data[0];//长度为1的最长递增子序列，初始化为第一个元素

  p := 1;//记录dp更新的最后位置
  for i := 1 to High(_data) do
  begin
    if _data[i] > rec[p] then
    begin
      rec[p + 1] := _data[i];
      p += 1;
    end
    else
    begin
      //扫描dp数组，替换第一个比arr[i]大的dp
      // for (int j := 0; j <= p; j++) begin
      //   if (rec[j]>_data[i])begin
      //     rec[j]=_data[i];
      //   end;
      // end;

      indexOfFirstBigger := __indexOfFirstBigger(rec, _data[i], 0, p);
      if indexOfFirstBigger <> -1 then
        rec[indexOfFirstBigger] := _data[i];
    end;
  end;

  Result := p;
end;

function TLis.Dp_Simplicity: integer;
var
  rec, tmp: TArr_int;
  i, j: integer;
begin
  SetLength(rec, Length(_data));
  rec[0] := 1;

  for i := 1 to High(_data) do
  begin
    for j := i downto 0 do
    begin
      SetLength(tmp, i + 1);

      if _data[i] > _data[j] then
      begin
        tmp[j] := rec[j] + 1;
      end
      else
      begin
        tmp[j] := rec[j];
      end;
    end;

    rec[i] := MaxIntValue(tmp);
  end;

  Result := rec[High(rec)];
end;

function TLis.Simplicity: integer;
var
  cnt, maxCnt, i, j: integer;
begin
  maxCnt := 0;

  for i := 0 to High(_data) do
  begin
    cnt := 1;
    for j := i to High(_data) - 1 do
    begin
      if _data[j] < _data[j + 1] then
        cnt += 1;
    end;

    maxCnt := Max(maxCnt, cnt);
  end;

  Result := maxCnt;
end;

function TLis.__indexOfFirstBigger(rec: TArr_int; v, l, r: integer): integer;
var
  mid: integer;
begin
  while l <= r do
  begin
    mid := l + (r - 1) div 2;

    if rec[mid] > v then
    begin
      r := mid;  // 保留大于v的下标以防这是第一个
    end
    else
    begin
      l := mid + 1;
    end;

    if (l = r) and (rec[l] > v) then
      Exit(l);
  end;

  Result := -1;
end;

end.