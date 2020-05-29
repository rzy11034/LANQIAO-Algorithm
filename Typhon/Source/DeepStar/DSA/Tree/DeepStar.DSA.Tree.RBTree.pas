unit DeepStar.DSA.Tree.RBTree;

(**
 * 红黑树
 * 1)每个节点要么是红色要么是黑色
 * 2)根节点是黑色的
 * 3)每个叶子节点(NIL)是黑色
 * 4)红色节点的的子节点都是黑色的
 * 5)对每个节点，从该节点到其后代叶子节点的简单路径上，均包含数目相同的黑色节点
 *
 * 通常我们认为树末梢的节点还有两个为空的节点，这些空节点是黑色的，所以不必检测第三条
 *)

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  TRBTree = class(TObject)

  end;

implementation

end.
