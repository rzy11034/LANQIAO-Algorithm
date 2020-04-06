unit DeepStar.DSA.Interfaces;

{$mode delphi}{$H+}

interface

uses
  Classes,
  SysUtils,
  Generics.Defaults,
  DeepStar.Utils.UString;

type
  TImpl<T> = class
  public type
    TArr = array of T;
    TArr2D = array of array of T;

    TCmp = TComparer<T>;
    ICmp = IComparer<T>;
    TOnComparisons = TOnComparison<T>;
    TComparisonFuncs = TComparisonFunc<T>;
  end;

  IList<T> = interface
    ['{9D4D55EE-BC63-49D0-BE20-559D3F82E651}']
    function Contains(e: T): boolean;
    function GetFirst: T;
    function GetItem(index: integer): T;
    function GetLast: T;
    function GetSize: integer;
    function IndexOf(e: T): integer;
    function IsEmpty: boolean;
    function Remove(index: integer): T;
    function RemoveFirst: T;
    function RemoveLast: T;
    function ToArray: TImpl<T>.TArr;
    function ToString: UString;
    procedure Add(index: integer; e: T);
    procedure AddFirst(e: T);
    procedure AddLast(e: T);
    procedure AddRange(const arr: array of T);
    procedure Clear;
    procedure RemoveElement(e: T);
    procedure SetItem(index: integer; e: T);
    property Count:integer read GetSize;
    property Items[i: integer]: T read GetItem write SetItem; default;
  end;

implementation

end.