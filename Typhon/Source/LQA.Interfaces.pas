unit LQA.Interfaces;

{$mode delphi}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  IList<T> = interface
    ['{E78FEF9F-3F59-41B7-BBF3-1ADCABF53922}']
    ///<summary> 获取数组中的元数个数 </summary>
    function GetSize: integer;
    ///<summary> 获取数组的容量 </summary>
    function GetCapacity: integer;
    ///<summary> 返回数组是否有空 </summary>
    function IsEmpty: boolean;
    ///<summary> 获取index索引位置元素 </summary>
    function Get(index: integer): T;
    ///<summary> 获取第一个元素</summary>
    function GetFirst: T;
    ///<summary> 获取最后一个元素</summary>
    function GetLast: T;
    ///<summary> 修改index索引位置元素 </summary>
    procedure Set_(index: integer; e: T);
    ///<summary> 向所有元素后添加一个新元素 </summary>
    procedure AddLast(e: T);
    ///<summary> 在第index个位置插入一个新元素e </summary>
    procedure Add(index: integer; e: T);
    ///<summary> 在所有元素前添加一个新元素 </summary>
    procedure AddFirst(e: T);
    ///<summary> 查找数组中是否有元素e </summary>
    function Contains(e: T): boolean;
    ///<summary> 查找数组中元素e忆的索引，如果不存在元素e，则返回-1 </summary>
    function Find(e: T): integer;
    ///<summary> 从数组中删除index位置的元素，返回删除的元素 </summary>
    function Remove(index: integer): T;
    ///<summary> 从数组中删除第一个元素，返回删除的元素 </summary>
    function RemoveFirst: T;
    ///<summary> 从数组中删除i最后一个元素，返回删除的元素 </summary>
    function RemoveLast: T;
    ///<summary> 从数组中删除元素e </summary>
    procedure RemoveElement(e: T);
    function ToString: string; override;
    property Items[i: integer]: T read Get write Set_; default;
  end;

procedure Main;

implementation

procedure Main;
var
  l: specialize i
begin

end;

end.