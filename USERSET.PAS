unit UserSet;
{
 множество 64*64 - откуда - куда пошла фигура
 для запоминания просчитанных ходов
}
INTERFACE
uses def;
Type
 SetMoves = record
     S:array[0..1] of LongInt; {откуда}
     D:array[0..1] of LongInt; {куда}
 end;

procedure ResetMoves(var SetM:SetMoves);
procedure SetMove(move:TMove; var setM:SetMoves);
function InMove(move:TMove; var setM:SetMoves):boolean;


IMPLEMENTATION
procedure ResetMoves(var SetM:SetMoves);
begin
   with SetM do
   begin
       S[0] := 0; S[1] := 0;
       D[0] := 0; D[1] := 0;
   end;
end;

procedure SetMove(move:TMove; var setM:SetMoves);
var
 N1,N2:integer;
begin
  N1 := glIndex8[move.source];
  N2 := glIndex8[move.dest];
 with SetM do
 begin
  S[N1 shr 5] := (LongInt(1) shl (N1 and 31))  or
                 (S[N1 shr 5]);

  D[N2 shr 5] := (LongInt(1) shl (N2 and 31))  or
                 (D[N2 shr 5]);
 end;
end;

function InMove(move:TMove; var setM:SetMoves):boolean;
var
 N1,N2:integer;
begin
  InMove := false;

  N1 := glIndex8[move.source];
  N2 := glIndex8[move.dest];

  with setM do begin
     if (S[N1 shr 5]  and  (LongInt(1) shl (N1 and 31)) ) = 0  then
       exit;
     if (D[N2 shr 5]  and  (LongInt(1) shl (N2 and 31)) ) = 0  then
       exit;

  end;
  InMove := true;
end;


END.