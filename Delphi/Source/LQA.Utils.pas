unit LQA.Utils;

interface

uses
  System.SysUtils,
  System.Classes;

type
  UChar = Char;
  UString = string;

  TArr_int = TArray<integer>;
  TArr2D_int = TArray<TArray<integer>>;

  TUtils<T> = class
  public
    class procedure DrawLine(c: UChar);
    class procedure Swap(var a, b: T);
  end;

  TUtils_Obj = TUtils<TObject>;
  TUtils_Int = TUtils<integer>;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

{ TLAUtils }

class procedure TUtils<T>.DrawLine(c: UChar);
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    write(c);
  end;
  Writeln;
end;

class procedure TUtils<T>.Swap(var a, b: T);
var
  tmp: T;
begin
  tmp := a;
  a := b;
  b := tmp;
end;

end.
