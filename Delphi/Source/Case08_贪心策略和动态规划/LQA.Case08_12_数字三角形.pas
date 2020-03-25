unit LQA.Case08_12_数字三角形;

(* *
 * 数字三角形(POJ1163)<br>
 *
 * 在数字三角形中寻找一条从顶部到底边的路径，使得路径上所经过的数字之和最大。
 * 路径上的每一步都只能往左下或 右下走。只需要求出这个最大和即可，不必给出具体路径。
 * 三角形的行数大于1小于等于100，数字为 0 - 99
 * 输入格式：
 * 5 //表示三角形的行数 接下来输入三角形
 *      7
 *     3 8
 *    8 1 0
 *   2 7 4 4
 *  4 5 2 6 5
 * 要求输出最大和
 *
 *)

interface

uses
  System.SysUtils,
  Math,
  LQA.Utils;

type
  TDigitalTriangle = class(TObject)
  private
    _triangle: TArr2D_int;

  public
    constructor Create(triangle: TArr2D_int);
    destructor Destroy; override;

    function Dfs: integer;
    function Dp: integer;
    function Memory: integer;
  end;

procedure Main;

implementation

procedure Main;
var
  triangle: TArr2D_int;
begin
  triangle := [
    [7],
    [3, 8],
    [8, 1, 0],
    [2, 7, 4, 4],
    [4, 5, 2, 6, 5]];

//  triangle := [
//    [7],
//    [3, 8],
//    [8, 1, 0],
//    [2, 7, 4, 4],
//    [4, 5, 2, 6, 5],
//    [4, 5, 2, 6, 5, 7],
//    [4, 13, 12, 88, 6, 6, 5],
//    [3, 8, 7, 11, 9, 22, 66, 3]];

  with TDigitalTriangle.Create(triangle) do
  begin
    writeln('Dp: ', Dp);
    writeln('Dfs: ', Dfs);
    writeln('Memory: ', Memory);
  end;
end;

{ TDigitalTriangle }

constructor TDigitalTriangle.Create(triangle: TArr2D_int);
begin
  _triangle := TArrayUtils_int.CopyArray2D(triangle);
end;

destructor TDigitalTriangle.Destroy;
begin
  inherited Destroy;
end;

function TDigitalTriangle.Dfs: integer;
  function __dfs(r, c: integer): integer;
  var
    v1, v2: integer;
  begin
    if r = Length(_triangle) - 1 then
      Exit(_triangle[r, c]);

    v1 := _triangle[r, c] + __dfs(r + 1, c);
    v2 := _triangle[r, c] + __dfs(r + 1, c + 1);
    Result := Max(v1, v2);
  end;

begin
  Result := __dfs(0, 0);
end;

function TDigitalTriangle.Dp: integer;
var
  rec: TArr2D_int;
  r, i, j: integer;
begin
  r := Length(_triangle);
  SetLength(rec, r, r);

  // //初始化最后一行
  for i := 0 to high(rec[r - 1]) do
    rec[r - 1, i] := _triangle[r - 1, i];

  for i := r - 2 downto 0 do
  begin
    for j := 0 to high(_triangle[i]) do
    begin
      rec[i, j] := Max(_triangle[i, j] + rec[i + 1, j], _triangle[i, j] + rec[i + 1, j + 1]);
    end;
  end;

  Result := rec[0, 0];
end;

function TDigitalTriangle.Memory: integer;
var
  rec: TArr2D_int;

  function __memory(r, c: integer): integer;
  var
    v1, v2: integer;
  begin
    if r = Length(_triangle) - 1 then
    begin
      rec[r, c] := _triangle[r, c];
      Exit(rec[r, c]);
    end;

    if rec[r, c] = -1 then
    begin
      v1 := _triangle[r, c] + __memory(r + 1, c);
      v2 := _triangle[r, c] + __memory(r + 1, c + 1);
      rec[r, c] := Max(v1, v2);
    end;

    Result := rec[r, c];
  end;

var
  len, i: integer;
begin
  len := Length(_triangle);
  SetLength(rec, len, len);
  for i := 0 to high(rec) do
    TArrayUtils_int.FillArray(rec[i], -1);

  Result := __memory(0, 0);
end;

end.
