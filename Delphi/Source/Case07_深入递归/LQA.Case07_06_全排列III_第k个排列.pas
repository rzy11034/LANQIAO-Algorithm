unit LQA.Case07_06_全排列III_第k个排列;

{ **
  * LeetCode60 n个数的排列组合找出字典序的第k个排列
  * The set[1,2,3,…,n]contains a total of n! unique permutations.
  By listing and labeling all of the permutations in order,
  We get the following sequence (ie, for n = 3):
  "123"
  "132"
  "213"
  "231"
  "312"
  "321"

  Given n and k, return the k th permutation sequence.
  Note: Given n will be between 1 and 9 inclusive.

  时间限制：1秒
  * }

interface

uses
  System.SysUtils,
  LQA.Utils;

procedure Main;

implementation

type
  TSolution = class(TObject)
  private
    _KCount: integer;

    function __count(chrArr: TArr_chr; c: UChar): integer; overload;
    function __count(s: UString; c: UChar): integer; overload;
  public

  end;

procedure Main;
begin

end;

{ TSolution }

function TSolution.__count(arr: TArr_chr; c: UChar): integer;
begin

end;

function TSolution.__count(s: UString; c: UChar): integer;
begin

end;

end.
