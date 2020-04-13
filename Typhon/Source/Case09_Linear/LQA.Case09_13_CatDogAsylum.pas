unit LQA.Case09_13_CatDogAsylum;

(**有家动物收容所只收留猫和狗，但有特殊的收养规则，收养人有两种收养方式，
 第一种为直接收养所有动物中最早进入收容所的，
 第二种为选择收养的动物类型（猫或狗），并收养该种动物中最早进入收容所的。

 给定一个操作序列int[][2] ope(C++中为vector<vector<int>>)代表所有事件。
 若第一个元素为1，则代表有动物进入收容所，第二个元素为动物的编号，正数代表狗，负数代表猫；
 若第一个元素为2，则代表有人收养动物，第二个元素若为0，则采取第一种收养方式(最早)，
 若为1，则指定收养狗，若为-1则指定收养猫。
 请按顺序返回收养的序列。若出现不合法的操作，即没有可以符合领养要求的动物，则将这次领养操作忽略。
 测试样例：

 [[1,1],[1,-1],[2,0],[2,-1]]

 返回：[1,-1]
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.DSA.Linear.Queue,
  DeepStar.DSA.Linear.ArrayList,
  LQA.Utils;

type
  TCatDogAsylum = class(TObject)
  private type
    TAnimal = class
    private
      _Time: integer;
      _animalType: integer;

      class var TakeIn: integer;
    public
      constructor Create(AnimalType: integer);
      property AnimalType: integer read _AnimalType write _AnimalType;
      property Time: integer read _Time write _Time;
    end;

    TQueue_TAnimal = specialize TQueue<TAnimal>;
    TArrayList_TArr_int = specialize TArrayList<TArr_int>;

  private
    _cats: TQueue_TAnimal;
    _dogs: TQueue_TAnimal;

  public
    constructor Create;
    destructor Destroy; override;

    function Asylum(ope: TArr2D_int): TArrayList_TArr_int;
  end;

procedure Main;

implementation

procedure Main;
var
  t: TCatDogAsylum;
  ope: TArr2D_int;
begin
  t := TCatDogAsylum.Create;

  ope := [[1, 1], [1, -1], [2, 0], [2, -1]];

  TArrayUtils_int.Print2D(t.Asylum(ope).ToArray, false);
end;

{ TCatDogAsylum.TAnimal }

constructor TCatDogAsylum.TAnimal.Create(AnimalType: integer);
begin
  _animalType := animalType;
  time := TakeIn;
  TakeIn += 1;
end;

{ TCatDogAsylum }

constructor TCatDogAsylum.Create;
begin
  _cats := TQueue_TAnimal.Create;
  _dogs := TQueue_TAnimal.Create;
end;

function TCatDogAsylum.Asylum(ope: TArr2D_int): TArrayList_TArr_int;
var
  row: TArr_int;
  op, AsylumType: integer;
  res: TArrayList_TArr_int;
begin
  res := TArrayList_TArr_int.Create;

  for row in ope do
  begin
    op := row[0];
    AsylumType := row[1];

    if op = 1 then
    begin
      if AsylumType > 0 then
      begin
        _dogs.EnQueue(TAnimal.Create(AsylumType));
      end
      else if AsylumType < 0 then
      begin
        _cats.EnQueue(TAnimal.Create(AsylumType));
      end;
    end
    else if op = 2 then
    begin
      if AsylumType = 0 then
      begin
        if TAnimal(_cats.Peek).Time < TAnimal(_dogs.Peek).Time then
          res.AddLast([op, _cats.DeQueue.AnimalType])
        else
          res.AddLast([op, _dogs.DeQueue.AnimalType]);
      end
      else if AsylumType = 1 then
      begin
        if not _dogs.IsEmpty then
          res.AddLast([op, _dogs.DeQueue.AnimalType]);
      end
      else if AsylumType = -1 then
      begin
        if not _cats.IsEmpty then
          res.AddLast([op, _cats.DeQueue.AnimalType]);
      end;
    end;
  end;

  Result := res;
end;

destructor TCatDogAsylum.Destroy;
begin
  _cats.Free;
  _dogs.Free;
  inherited Destroy;
end;

end.