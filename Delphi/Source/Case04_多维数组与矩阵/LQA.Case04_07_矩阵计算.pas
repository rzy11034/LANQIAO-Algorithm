unit LQA.Case04_07_矩阵计算;

{ *
  * M N
  * 随后的M行,每行有N个数据(空格隔开),这些是A的数据
  * 随后的M行,每行有N个数据(空格隔开),这些是B的数据
  *
  * * }

interface

uses
  LQA.Utils;

procedure Main;

implementation

procedure Main;
var
  M, N, i, j: integer;
  A, B: TArr2D_int;
begin
  M := 10;
  N := 10;

  SetLength(A, M, N);
  SetLength(B, M, N);

  for i := 0 to M - 1 do
  begin
    for j := 0 to N - 1 do
    begin
      A[i, j] := i + j;
    end;
  end;

  for i := 0 to M - 1 do
  begin
    for j := 0 to N - 1 do
    begin
      B[i, j] := i + j;
    end;
  end;
end;

end.
