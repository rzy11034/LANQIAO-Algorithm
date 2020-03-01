﻿unit LQA.DSA.Strings.RabinKarp;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  LQA.Utils;

type

{**
 * 滚动hash法
 * 对目标字符串按d进制求值,mod h 取余作为其hash
 * 对源串,依次求出m个字符的hash,保存在数组中(滚动计算)
 * 匹配时,只需比对目标串的hash值和预存的源串的hash值表
 *}
  TRabinKarp = class(TObject)
  private const
    SEED = 31;

  private
    // 使用100000个不同字符串产生的冲突数，大概在0~3波动，
    // 使用100百万不同的字符串，冲突数大概110+范围波动
    class function __hash(s: UString): int64;
    // **
    // * subStringLen是子串的长度
    // * 用滚动方法求出s中长度为n的每个子串的hash,组成一个hash数组
    // *
    class function __hash(src: UString; subStringLen: integer): TArr_int64;
    class function __match(hash_p: int64; hashOfSrcArr: TArr_int64): TArr_int;

  public
    // 朴素匹配
    class function Match_Simplicity(src, p: UString): TArr_int;
    // 滚动Hash匹配
    class function Match(src, p: UString): TArr_int;
  end;

procedure Main;

implementation

procedure Main;
var
  s, p: UString;
begin
  s := 'ABABABA';
  p := 'ABA';

  TArrayUtils_int.Print(TRabinKarp.Match_Simplicity(s, p));
  TArrayUtils_int.Print(TRabinKarp.Match(s, p));
end;

{ TRabinKarp }

class function TRabinKarp.Match_Simplicity(src, p: UString): TArr_int;
var
  P_len, i, hash_i: integer;
  ret: TArr_int;
begin
  P_len := p.Length;
  ret := nil;

  for i := 0 to src.Length do
  begin
    if i + P_len > src.Length then
      Break;

    hash_i := __hash(src.Substring(i, P_len));

    if __hash(p) = hash_i then
    begin
      SetLength(ret, Length(ret) + 1);
      ret[High(ret)] := i;
    end;
  end;

  Result := ret;
end;

class function TRabinKarp.Match(src, p: UString): TArr_int;
var
  hash_p: int64;
  hashOfSrcArr: TArr_int64;
begin
  hash_p := __hash(p);
  hashOfSrcArr := __hash(src, p.Length);
  Result := __match(hash_p, hashOfSrcArr);
end;

class function TRabinKarp.__hash(s: UString): int64;
var
  h: int64;
  i: integer;
begin
  h := 0;

  for i := 0 to s.Length - 1 do
    h := SEED * h + Ord(s.Chars[i]);

  Result := h mod int64.MaxValue;
end;

class function TRabinKarp.__hash(src: UString; subStringLen: integer): TArr_int64;
var
  ret: TArr_int64;
  oldChar, newChar: UChar;
  n, i: integer;
  tmpHash: int64;
begin
  n := subStringLen;
  SetLength(ret, src.Length - n + 1);

  //前 n 个字符的 hash
  ret[0] := __hash(src.Substring(0, n));

  for i := n to src.Length - 1 do
  begin
    newChar := src.Chars[i];
    oldChar := src.Chars[i - n];

    //前 n个字符的 hash*seed---前 n字符的第一字符 *seed的 n 次方
    tmpHash := (ret[i - n] * SEED + Ord(newChar) - Trunc(Power(SEED, n)) * Ord(oldChar))
      mod int64.MaxValue;
    ret[i - n + 1] := tmpHash;
  end;

  Result := ret;
end;

class function TRabinKarp.__match(hash_p: int64; hashOfSrcArr: TArr_int64): TArr_int;
var
  i: integer;
begin
  Result := nil;

  for i := 0 to Length(hashOfSrcArr) - 1 do
  begin
    if hash_p = hashOfSrcArr[i] then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := i;
    end;
  end;
end;

end.
