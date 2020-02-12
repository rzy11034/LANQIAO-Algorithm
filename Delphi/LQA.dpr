program LQA;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  LQA.Main in 'Source\LQA.Main.pas',
  LQA.Utils in 'Source\LQA.Utils.pas',
  LQA.Case01_00_位运算 in 'Source\Case01_位运算\LQA.Case01_00_位运算.pas',
  LQA.Case01_01_唯一成对的数 in 'Source\Case01_位运算\LQA.Case01_01_唯一成对的数.pas',
  LQA.Case01_02_找出落单的那个数 in 'Source\Case01_位运算\LQA.Case01_02_找出落单的那个数.pas',
  LQA.Case01_03_二进制中1的个数 in 'Source\Case01_位运算\LQA.Case01_03_二进制中1的个数.pas',
  LQA.Case01_04_用一条语句判断一个整数是不是2的整数次方 in 'Source\Case01_位运算\LQA.Case01_04_用一条语句判断一个整数是不是2的整数次方.pas',
  LQA.Case01_05_交换奇偶位 in 'Source\Case01_位运算\LQA.Case01_05_交换奇偶位.pas',
  LQA.Case01_06_二进制小数 in 'Source\Case01_位运算\LQA.Case01_06_二进制小数.pas';

begin
  try
    Run;
    TUtils_Obj.DrawLine('-');
    Writeln(END_OF_PROGRAM_EN);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
