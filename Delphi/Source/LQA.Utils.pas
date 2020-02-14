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
  TArr_str = TArray<UString>;

  TUtils<T> = class
  private type
    TArr_T = array of T;
  public
    class procedure Swap(var a, b: T);
    class procedure PrintArray(arr: TArr_T);
  end;

  TUtils_Obj = TUtils<TObject>;
  TUtils_Int = TUtils<integer>;

procedure DrawLineBlockEnd;
procedure DrawLineProgramEnd;

resourcestring
  END_OF_PROGRAM_EN = 'Press any key to continue...';
  END_OF_PROGRAM_CH = '按任意键继续...';

implementation

procedure DrawLineBlockEnd;
var
  i: integer;
begin
  for i := 0 to 10 do
  begin
    Write('-');
  end;
  Writeln;
end;

procedure DrawLineProgramEnd;
var
  i: integer;
begin
  for i := 0 to 70 do
  begin
    Write('=');
  end;
  Writeln;
end;

{ TLAUtils }

class procedure TUtils<T>.PrintArray(arr: TArr_T);
var
  i: integer;
begin
  if arr = nil then
  begin
    Writeln('Cannot print an empty array!');
    Exit;
  end;

  Write('[');
  for i := 0 to high(arr) do
  begin
    if i <> high(arr) then
      Write(TValue.From<T>(arr[i]).ToString, ', ')
    else
      Write(TValue.From<T>(arr[i]).ToString);
  end;
  Write(']'#10);
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
