unit LQA.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  {%H-}LQA.Utils;

type
  ClassName = class(TObject)
  private
    procedure aa(list: TList_chr);
    procedure aa(list: TList_int);
  public
    constructor Create;
    destructor Destroy; override;

  end;

procedure Run;

implementation

uses
  DeepStar.DSA.Tree.Test.BSTTree;

procedure Run;
begin
  Main;
end;

{ ClassName }

constructor ClassName.Create;
begin

end;

procedure ClassName.aa(list: TList_chr);
begin

end;

procedure ClassName.aa(list: TList_int);
begin

end;

destructor ClassName.Destroy;
begin
  inherited Destroy;
end;

end.
