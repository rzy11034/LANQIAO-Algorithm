program LQA;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  LQA.Main in 'Source\LQA.Main.pas',
  LQA.Utils in 'Source\LQA.Utils.pas',
  LQA.Case01_00_位运算 in 'Source\Case01\LQA.Case01_00_位运算.pas';

begin
  try
    Run;
    TUtils.DrawLine;
    Writeln(END_OF_PROGRAM_EN);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
