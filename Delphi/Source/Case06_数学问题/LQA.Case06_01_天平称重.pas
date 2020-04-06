unit LQA.Case06_01_天平称重;

{ *
  用天平称重时，我们希望用尽可能少的砝码组合称出尽可能多的重量。
  如果只有5个砝码，重量分别是1，3，9，27，81
  则它们可以组合称出1到121之间任意整数重量（砝码允许放在左右两个盘中）。

  本题目要求编程实现：对用户给定的重量，给出砝码组合方案。
  例如：
  用户输入：
  5
  程序输出：
  9-3-1
  用户输入：
  19
  程序输出：
  27-9+1

  要求程序输出的组合总是大数在前小数在后。
  可以假设用户的输入的数字符合范围1~121。
  * */

  /**
  用天平称重时，我们希望用尽可能少的砝码组合称出尽可能多的重量。
  如果有无限个砝码，但它们的重量分别是1，3，9，27，81，……等3的指数幂
  神奇之处在于用它们的组合可以称出任意整数重量（砝码允许放在左右两个盘中）。

  本题目要求编程实现：对用户给定的重量，给出砝码组合方案，重量<1000000。
  例如：
  用户输入：
  5
  程序输出：
  9-3-1
  用户输入：
  19
  程序输出：
  27-9+1

  要求程序输出的组合总是大数在前小数在后。
  可以假设用户的输入一定是一个大于0的整数。
  * }

interface

uses
  System.SysUtils,
  System.Math,
  LQA.Utils,
  DeepStar.DSA.Math;

procedure Main;

implementation

procedure Solution(n: integer);
var
  list: TList_int;
  arr: Tarr_chr;
  arr1: TArr_int;
  i, k: integer;
  sb: TStringBuilder;
  s: UString;
begin
  list := TList_int.Create;
  arr := TMath.DecToAny(n, 3).ReverseString.ToCharArray;

  for i := 0 to high(arr) do
  begin
    if arr[i] = '2' then
    begin
      if i = high(arr) then
      begin
        list.Add(-1);
        list.Add(1);
      end
      else
      begin
        list.Add(-1);
        Inc(arr[i + 1]);
      end;
    end
    else if arr[i] = '3' then
    begin
      if i = high(arr) then
      begin
        list.Add(0);
        list.Add(1);
      end
      else
      begin
        list.Add(0);
        Inc(arr[i + 1]);
      end;
    end
    else
      list.Add(StrToInt(arr[i]));
  end;

  SetLength(arr1, list.Count);
  for i := 0 to list.Count - 1 do
    arr1[i] := list[i];

  sb := TStringBuilder.Create;

  k := list.Count - 1;
  for i := list.Count - 1 downto 0 do
  begin
    if list[i] = 1 then
    begin
      sb.Append('+');
      sb.Append(Round(Power(3, k)));
    end
    else if list[i] = -1 then
    begin
      sb.Append('-');
      sb.Append(Round(Power(3, k)));
    end;

    Dec(k);
  end;

  s := sb.ToString;
  WriteLn(s.Substring(1, s.Length - 1));
end;

procedure Solution_Simplicity(n: integer);
var
  s: TArr_int;
  a, b, c, d, e: integer;
  sb: TStringBuilder;
  str: UString;
begin
  s := [0, 1, -1];
  for a := 0 to 2 do
  begin
    for b := 0 to 2 do
    begin
      for c := 0 to 2 do
      begin
        for d := 0 to 2 do
        begin
          for e := 0 to 2 do
          begin
            if (s[a] * 81 + s[b] * 27 + s[c] * 9 + s[d] * 3 + s[e] * 1 = n) then
            begin
              sb := TStringBuilder.Create;

              if (s[a] = 1) then
                sb.Append('81');
              if (s[b] = 1) then
                sb.Append('+27');
              if (s[b] = -1) then
                sb.Append('-27');
              if (s[c] = 1) then
                sb.Append('+9');
              if (s[c] = -1) then
                sb.Append('-9');
              if (s[d] = 1) then
                sb.Append('+3');
              if (s[d] = -1) then
                sb.Append('-3');
              if (s[e] = 1) then
                sb.Append('+1');
              if (s[e] = -1) then
                sb.Append('-1');

              str := sb.ToString;
              if (str.Chars[0] = '+') or (str.Chars[0] = '-') then
                WriteLn(str.Substring(1, str.Length - 1))
              else
                WriteLn(sb.ToString());
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Main;
var
  n: integer;
begin
  n := 19;

  Solution_Simplicity(n);
  DrawLineBlockEnd;
  Solution(n);
end;

end.
