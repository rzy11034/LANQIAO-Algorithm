unit LQA.Case04_04_MaxSquare;

{**
 *  给定一个N×N的矩阵matrix，在这个矩阵中，只有0和1两种值，
    返回边框全是1的最大正方形的边长长度。 
 　 例如： 
    [0, 1, 1, 1, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 1, 0, 1, 1]　
 　其中，边框全是1的最大正方形的大小是4*4，返回4
 *}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  LQA.Utils;

procedure Main;

implementation

// 动态规划
function MaxSquareADV(const matrix: TArr2D_int; out aux: TArr3D_int): integer;
  // 生成一个辅助表 ret[][][]
  // ret[x，x][0] 为下；ret[x，x][1] 为右；
  function __generateAux(const matrix: TArr2D_int): TArr3D_int;
  var
    rowCount, colCount, i, j: integer;
    ret: TArr3D_int;
  begin
    rowCount := Length(matrix);
    colCount := Length(matrix[0]);
    SetLength(ret, rowCount + 1, colCount + 1, 2);

    for i := rowCount - 1 downto 0 do
    begin
      for j := colCount - 1 downto 0 do
      begin
        if matrix[i, j] = 1 then
        begin
          ret[i, j][0] := matrix[i, j] + ret[i + 1, j][0];
          ret[i, j][1] := matrix[i, j] + ret[i, j + 1][1];
        end
        else
        begin
          ret[i, j][0] := 0;
          ret[i, j][1] := 0;
        end;
      end;
    end;

    Result := ret;
  end;

  function __check(r, l, n: integer; const aux: TArr3D_int): boolean;
  begin
    Result := False;

    // 左上角那个点往下数的1的数目要 >= n
    // 左上角那个点往右数的1的数目要 >= n
    // 右上角那个点往下数的1的数目要 >= n
    // 左下角那个点往右数的1的数目要 >= n
    if (aux[r, l][0] >= n) and (aux[r, l][1] >= n)
      and (aux[r, l + n - 1][0] >= n) and (aux[r + n - 1, l][1] >= n) then
    begin
      Result := True;
      Exit;
    end;
  end;

var
  len, n, i, j: integer;
begin
  len := Length(matrix);
  n := len;
  aux := __generateAux(matrix);

  while n > 0 do
  begin
    for i := 0 to len - 1 do
    begin
      if i + n > len then
        Break;

      for j := 0 to len - 1 do
      begin
        if j + n > len then
          Break;

        if __check(i, j, n, aux) then
        begin
          Result := n;
          Exit;
        end;
      end;
    end;

    Dec(n);
  end;

  Result := n;
end;

// 枚举法（暴力求解）————O(n³)
function MaxSquare(const matrix: TArr2D_int): integer;
label L2, L3;
var
  len, n, r, c, i, j: integer;
begin
  len := Length(matrix);
  n := len; // n代表最大正方形的边长长度
  Result := 0;

  // 从最大正方形的边长长度开始枚举
  while n > 0 do
  begin
    for i := 0 to len - 1 do
    begin
      for j := 0 to len - 1 do
      begin
        r := i;
        c := j;

        // 上
        while c < j + n do
        begin
          if c >= len then
            goto L2;

          if matrix[r][c] = 0 then
            goto L3;

          Inc(c);
        end;

        // 右
        Dec(c);
        while r < i + n do
        begin
          if r >= len then
            goto L2;

          if matrix[r][c] = 0 then
            goto L3;

          Inc(r);
        end;

        // 下
        Dec(r);
        while c >= j do
        begin
          if matrix[r][c] = 0 then
            goto L3;

          Dec(c);
        end;

        // 左
        Inc(c);
        while r >= i do
        begin
          if matrix[r][c] = 0 then
            goto L3;

          Dec(r);
        end;

        Exit(n);

        L3: Continue;
      end;

      L2: Continue;
    end;

    Dec(n);
  end;

  Result := n;
end;

procedure Main;
var
  matrix: TArr2D_int;
  aux: TArr3D_int;
  n: integer;
begin
  matrix := [
    //[0, 1, 1, 1, 1],
    //[0, 1, 0, 0, 1],
    //[0, 1, 0, 0, 1],
    //[0, 1, 1, 1, 1],
    //[0, 1, 0, 1, 1]];

    //[1, 1, 1, 1],
    //[1, 0, 0, 1],
    //[1, 0, 0, 1],
    //[1, 1, 1, 1]];

    [0, 0, 0],
    [0, 1, 0],
    [0, 0, 0]];

  TArrayUtils_int.Print2D(matrix);
  DrawLineBlockEnd;

  WriteLn(MaxSquare(matrix));
  DrawLineBlockEnd;

  n := MaxSquareADV(matrix, aux);
  TArrayUtils_int.Print3D(aux);
  WriteLn(n);
end;

end.
