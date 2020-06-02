unit LQA.Main;

interface

uses
  System.SysUtils,
  LQA.Utils;

type

  TT<T> = class(TObject)
    node: TT<T>;
  end;

procedure Run;

implementation

uses
  DeepStar.DSA.Tree.Test.AVLTree;

procedure Run;
begin
  Main;
end;

end.
