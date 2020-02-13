unit LQA.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti;

type
  UChar = Char;
  UString = string;

  TArr_int = TArray<integer>;
  TArr2D_int = TArray<TArray<integer>>;

  TUtils<T> = class
  private type
    TArr_T = array of T;
  public
    class procedure DrawLine(c: UChar; times: integer = 70);
    class procedure Swap(var a, b: T);
    class procedure PrintArray(arr: TArr_T);
  end;

  TUtils_Obj = TUtils<TObject>;
  TUtils_Int = TUtils<integer>;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

{ TLAUtils }

class procedure TUtils<T>.DrawLine(c: UChar; times: integer);
var
  i: integer;
begin
  for i := 0 to times do
  begin
    write(c);
  end;
  Writeln;
end;

class procedure TUtils<T>.PrintArray(arr: TArr_T);
var
  i: integer;
begin
  write('[');
  for i := 0 to high(arr) do
  begin
    if i <> high(arr) then
      write(TValue.From<T>(arr[i]).ToString, ', ')
    else
      write(TValue.From<T>(arr[i]).ToString);
  end;
  write(']');
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
