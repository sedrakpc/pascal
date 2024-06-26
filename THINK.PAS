{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}
unit think;
INTERFACE
uses types,def,utils,hash,lib;
{
    ����� ��� TCHESS

}
  CONST
   LINE_MAX = 30; {室�� � �����}
  TYPE
   TLine = array[0..LINE_MAX-1] of TMove;
   PLine = ^TLine;

{
  ���樠������ ��६���� � �맮� �����
  �����뢠���� �ᥣ�� ⥪��� ������ � ���
}
function CallSearch(var game:TGame; var pos:TBoard;
                    var retMove:TMove):boolean;




IMPLEMENTATION
  CONST
  BASE_DEPTH = 4;  {��� ��㡨�� � �� ��砥 �� ����}
  MIN_DEPTH  = 10; {��� ��㡨�� ��⠥��� ���㬠�� �� 3 ���}
  MAX_DEPTH  = 16; {�।��쭠� ��㡨�� ���⨢��� 㣫㡫����}
  MAX_PLY_FULL_WIDTH = 20; {���ᨬ��쭠� ��㡨�� ���᪠ ������ �ਭ�}
  MAX_PLY = 70;
  glMaxTimeThink = 5;
  FULL_FREE:integer = 2;
  {�������� ��६���� ��� �����}
  var
    glFindPawn:boolean;      {���� �� ��誨}
    glFindOneQueen:boolean; {���� �� ��� ���� ���}
    glStartTimeThink,
    glCurrTimeThink:LongInt; {���⮢�� �६�}
    glDepth:integer;         {�� ����� ��㡨�� ��⠥�}
    glTimeOver:boolean;
    glCountPos:LongInt; {������⢮ ����⠭��� ����権}
    glBestLine:TLine;
    glScore:integer;
    glRootVal:array[cWhite..cBlack] of integer;

    history:array[cWhite..cBlack,0..64*64-1] of byte;

  const
   {
     ��室�� ��誨 - �᫨ ���祭��
     � ���ᨢ� �� ���न��� Y ��誨
     ࠢ�� 1 ��� 2 - 㧥� �� ���१�����
   }
   passedPawnDesc:array[cWhite..cBlack,0..15] of byte =
   (
    (0,0,0,0, 0,2,1,0,0,0,0,0, 0,0,0,0),
    (0,0,0,0, 0,0,0,0,0,1,2,0, 0,0,0,0)
   );
   passedPawnValue:integer = 2;



procedure ResetLine(var line:TLine);
begin
    line[0].data := 0;
end;

procedure GetTime;
begin
   glCurrTimeThink := GetTickCount;
   if glCurrTimeThink < glStartTimeThink then
     glStartTimeThink := glCurrTimeThink;
end;

FUNCTION TimeUp:boolean;
VAR
 maxT:LongInt;
BEGIN
    TimeUp := false;
    if glDepth <= BASE_DEPTH then exit;
    GetTime;
    if glDepth <= MIN_DEPTH then maxT := 3*60
      else  maxT := glMaxTimeThink;
    if glCurrTimeThink - glStartTimeThink >= maxT then
       TimeUp := true
END;


{�����뢠�� ����� �����}
PROCEDURE ShowStatus;
VAR
  t:LongInt;
  posSec:LongInt;
  n,x1,y1,x2,y2:integer;

BEGIN
    GetTime;
    t := glCurrTimeThink - glStartTimeThink;
    if t <> 0 then
       posSec := glCountPos div LongInt(t)
    else posSec := 0;


    glStatusStr2 := 'Depth ' + IntToStr(glDepth) + '; ' +
                    IntToStr(t) + 'sec; ' +
                    IntToStr(posSec) + 'p/s;' + '           ';

    BlipStr(STR2_LEFT,STR2_TOP,8,8,BACK_COLOR,FONT_COLOR,
            glStatusStr2);

    glStatusStr3 := 'Score ' + IntToStr(glScore) + '           ';

    BlipStr(STR3_LEFT,STR3_TOP,8,8,BACK_COLOR,FONT_COLOR,
                  glStatusStr3);


    {������� ��ப� �������� ���������}
    glStatusStr4 := '';

    n := 0;
    while glBestLine[n].data <> 0 do
    with glBestLine[n] do
    begin
      glStatusStr4 := glStatusStr4 +
                      glChMove[glIndex8[source]] +
                      glChMove[glIndex8[dest]] + ';';
      n := n + 1;
    end;
    glStatusStr4 := glStatusStr4 + '                                                           ';
    BlipStr(STR4_LEFT,STR4_TOP,8,8,BACK_COLOR,FONT_COLOR,
                  glStatusStr4);

END;



{�����뢠�� ⥪�訩 室 � ����� ���樨
(��� ��� ��������, ���⮬� �⤥�쭠� �㭪��
}

PROCEDURE ShowCurrentMove(move:TMove);
BEGIN


     glStatusStr5 := 'Current - ' + glChMove[glIndex8[move.source]] +
                                    glChMove[glIndex8[move.dest]] +
                                    '                 ';

    BlipStr(STR5_LEFT,STR5_TOP,8,8,BACK_COLOR,FONT_COLOR,
            glStatusStr5);
END;



{�����頥� true �᫨ 室 ������ �������
 (⮫쪮 ��� ������ ��६�饭��
}
function KillMoveIsLegal(player,opponent,N1,N2,piece:integer;
                         var pos:TBoard):boolean;
var
 S1,color1,S2,color2:integer;
begin
   KillMoveIsLegal := false;
   S1 := pos[N1];
   color1 := (S1 shr 4) and 3;
   if color1 <> player then exit;

   S2 := pos[N2];
   color2 := (S2 shr 4) and 3;
   if color2 = player then exit;

   with PieceTab[player, S1 and 15] do
   if piPiece = piece then
   case piPiece of
     pEmpty: exit;
     pKnight: KillMoveIsLegal := true;

     else begin
        if not VerifyLine(N1,N2,pos) then exit;
        if piPiece <> pPawn then KillMoveIsLegal := true
        else begin
           if S2 = 0 then begin
               if (N1 and 15) <> (N2 and 15) then exit;
           end else begin
               if (N1 and 15) = (N2 and 15) then exit;
           end;
           KillMoveIsLegal := true;
        end;
     end;
   end; {case}
end;


{killer}

Type
TKill = record
 case byte of
 1:(
   kMove:TMove;
   kPiece:word);
 2:( kData:LongInt );
end;
PKill = ^TKill;

var Killer1:array[0..MAX_PLY] of TKill;
    Killer2:array[0..MAX_PLY] of TKill;




{/////////////// ⠡���  PV ///////////////}
const PV_MAX = 40; {᪮�쪮 ��ப � ⠡���}
var PVTable:array[0..PV_MAX-1] of TLine;
    PVCount:integer;

procedure PVReset;
begin
    FillChar(PVTable,sizeof(PVTable),0);
    PVCount := 0;
end;

procedure PVInsert(var line:TLine);
var
 n:integer;
begin
    if PVCount < PV_MAX then
    begin
      for n := 0 to LINE_MAX-1 do
      if line[n].data <> 0 then
      begin
        PVTable[PVCount][n].data := line[n].data;
      end else break;

      inc(PVCount);
    end;
end;


var path:array[0..MAX_PLY] of TMove;






const BACK_BANK_SIZE = 200;
      BACK_MAX_PLY = 20;

type  TBackMoves = record
         bGoodMoves:array[0..BACK_BANK_SIZE] of TMove;
         bBadMoves:array[0..BACK_BANK_SIZE] of TMove;
         bGoodCount:integer;
         bBadCount:integer;
      end;
      PBackMoves = ^TBackMoves;
var backMoves:array[0..BACK_MAX_PLY-1] of TBackMoves;
const backPtr:array[0..BACK_MAX_PLY-1] of PBackMoves =
(
  @backMoves[0],@backMoves[1],@backMoves[2],@backMoves[3],@backMoves[4],
  @backMoves[5], @backMoves[6],@backMoves[7],@backMoves[8], @backMoves[9],
  @backMoves[10],@backMoves[11],@backMoves[12], @backMoves[13],
  @backMoves[14],@backMoves[15], @backMoves[16],@backMoves[17],
  @backMoves[18],@backMoves[19]
);

procedure backReset(ply:integer);
begin
    if ply >= BACK_MAX_PLY then exit;
    with backPtr[ply]^ do
    begin
        bGoodCount := 0;
        bBadCount := 0;
    end;
end;



{////////////////////////////////////////////////
 ����ﭨ� �� ��஫� ��⨢����
 ����㠫�� ��஫� �⮨� �� ���⪥ KING_N
 �᫨
   N - ���न��� 䨣���
   opKingN - ���न��� ��஫� ��⨢����
   �, �⮡� ������� ���祭�� taxi �㦭�
   taxi[N - opKingN + KING_N]
}
const
  KING_N = 16*7+7;
  taxi:array[0..16*16-1] of integer =
  (
         1, 2, 3, 4, 5, 6, 7, 8,  7,6,5,4,3,2,1,0,
         9,10,11,12,13,14,15,16,  15,14,13,12,11,10,9,0,
        17,18,19,20,21,22,23,24,  23,22,21,20,19,18,17,0,
        25,26,27,28,29,30,31,32,  31,30,29,28,27,26,25,0,
        33,34,35,36,37,38,39,40,  39,38,37,36,35,34,33,0,
        41,42,43,44,45,46,47,48,  47,46,45,44,43,42,41,0,
        49,50,51,52,53,54,55,56,  55,54,53,52,51,50,49,0,
        57,58,59,60,61,62,63,64,  63,62,61,60,59,58,57,0,
        49,50,51,52,53,54,55,56,  55,54,53,52,51,50,49,0,
        41,42,43,44,45,46,47,48,  47,46,45,44,43,42,41,0,
        33,34,35,36,37,38,39,40,  39,38,37,36,35,34,33,0,
        25,26,27,28,29,30,31,32,  31,30,29,28,27,26,25,0,
        17,18,19,20,21,22,23,24,  23,22,21,20,19,18,17,0,
         9,10,11,12,13,14,15,16,  15,14,13,12,11,10,9,0,
         1, 2, 3, 4, 5, 6, 7, 8,  7,6,5,4,3,2,1,0,
         0,0,0,0,0,0,0,0,         0,0,0,0,0,0,0,0
  );
  {
    ������ ��஫�
    䮮�ࠦ���� ��஫� �⮨� �� ���⪥ KING_N
  }
  kingSquare:array[0..16*16-1] of byte =
  (
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,1,1,1,  1,1,0,0,0,0,0,0,
    0,0,0,0,0,1,1,1,  1,1,0,0,0,0,0,0,
    0,0,0,0,0,1,1,1,  1,1,0,0,0,0,0,0,
    0,0,0,0,0,1,1,1,  1,1,0,0,0,0,0,0,
    0,0,0,0,0,1,1,1,  1,1,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0

  );
{////////////////////////////////////////////}








{�᭮���� �����
  3 �஢�� ���᪠
  3. ���� ⮫쪮 ���⨩
     �� � ��㡨�� �ਡ����⥫쭠� �業�� ����樨
     ��ਧ���
  2. 2 ��᫥���� ����室� - ���� �客
     alpha �ᥣ�� ����蠥��� ⥪�饩 �業���
     �᫨ �� ��
     �᫨ �� - ��㡨�� ���᪠ 㢥��稢����� �� 1
  1. �᭮���� ���� - beta ���������� ����᪮�
     �業��� ��᫥ 室� (�᫨ �� �� �த���������)
     ������� ��������� ����頥��� � ⠡���� PV
     � �������
     (�� ���१����� 室 �� PV-table � �⢥� �� ����)

     ������� ��ॡ�� ���
     (� �㭪樨 Cut ����� �������� ����ன�� �
     ����� ⠪�� ����� ��ॡ��, ����� �ॡ����)



}

function Search(alpha,beta,player,opponent,score:integer;
                lastMove:TMove;
                var pos:TBoard;
                ply,depth:integer;
                var line:TLine;
                check:boolean;
                PV:boolean;
                key:LongInt;
                CaptureSearch:boolean;
                CheckSearch:boolean;
                badPieceOrder:boolean {�᫨ � ��ப� �뫮
                                      �ॢ�饭�� ��誨, �
                                      ���冷� 䨣�� �� �뢠���
                                      ��� ����襭}
                ):integer;
label
 done;
var
 {⥪�騩 室 ���뢠���� � tag }
 tag:TagMove;
 stopSearch:boolean;
 moveOnlyKing:boolean;
 MaxVal:integer;
 tmpLine:TLine;
 CapturesLastMove:boolean;
 moveGenType:( mPV,
               mHash,
               mKill,
               mInterDeep,
               mCaptureLastMove,
               mCapture,
               mPawnPromote,
               mNoCapture,
               mBack
             );
 zerroMove:boolean;
 lastPiece:integer;
 findHashMove:boolean;
 firstPV:boolean;

 const SAVE_MAX = 20;
 var save:array[0..SAVE_MAX-1] of TMove;
     saveCount:integer;


 {
   ������ �㭪�� �믮���� ���⥩訩 ࠧ���
   ��६�饭�� ⮫쪮 ��� ��-���⨩
   室� ࠧ�������� �� 3 ��⥣�ਨ:
   1. ���訥 - ��� �����뢠���� �ࠧ�
   2. �।���
   3. ��訥
     ��᫥���� 2 ��⥣�ਨ ������������ � ����
     � �����뢠���� � ��᫥���� ��।�

 }
 function Analysis(move:TMove; nextCheck:boolean):boolean;
 begin
   Analysis := false;
   if ply >= BACK_MAX_PLY then exit;
   if moveGenType <> mNoCapture then exit;
   if nextCheck then exit;
   if tag.delScore >= 14 then exit;
   with tag do
    if history[player][(glIndex8[N1] shl 6) + glIndex8[N2]] >
       0 then exit;


   with backPtr[ply]^ do begin
     if tag.delScore > 0 then begin
         if bGoodCount < BACK_BANK_SIZE then begin
            bGoodMoves[bGoodCount].data := move.data;
            inc(bGoodCount);
            Analysis := true;
         end;
     end else begin
         if bBadCount < BACK_BANK_SIZE then begin
            bBadMoves[bBadCount].data := move.data;
            inc(bBadCount);
            Analysis := true;
         end;
     end;

   end;
 end;



 {������������ 室� �� PV-table
 �� ���� � �� ।�� �믮����}
 procedure SaveInsert(move:TMove);
 begin
     if saveCount < SAVE_MAX then begin
         save[saveCount].data := move.data;
         inc(saveCount);
     end;
 end;

 {
   �᫨ 室 㦥 �� ����⠭ � PV ⠡���
   � �㭪�� ��୥� true
   �� ।�� �믮������
 }
 function SaveLook(move:TMove):boolean;
 var
  n:integer;
 begin
     SaveLook := true;
     for n := 0 to saveCount-1 do
     if save[n].data = move.data then exit;
     SaveLook := false;
 end;





 {
   �롮��� �த�����
   ��㡨�� ���᪠ �� ᮪�頥���:
   1. ��
   2. ������ ��襪
   3. ����� ������᭮��� ��஫� १�� ᭨������
      (���ﭨ� ����� ��訬 �৥� � ��஫��
      ��⨢���� ���᭮ ᮪�頥���)
 }

 function Extensiens(nextCheck:boolean):integer;
 const
  R:integer = 2;
 var
  N1,N2,opKingN:integer;
 begin

    Extensiens := -1;
    if CaptureSearch then exit;

    if CheckSearch then
    begin
      if nextCheck then begin
          Extensiens := 0;
      end;
      exit;
    end;


    if nextCheck then
    begin
      Extensiens := 0;
      exit;
    end;

    if (tag.Piece.piPiece = pPawn) and
       ( passedPawnDesc[player, tag.N2 shr 4] >= passedPawnValue) then
    begin
       Extensiens := 0;
       exit;
    end;


    { �᫨ ����ﭨ� ����� �৥� �
      ��஫�� ��⨢���� ���᭮ ᮪�⨫���
    }
    if (tag.Piece.piPiece = pQueen) and
       (ply < glDepth) then
    begin
      opKingN := PieceTab[opponent,0].piN;
      N1 := tag.N1 - opKingN + KING_N;
      N2 := tag.N2 - opKingN + KING_N;
      if (taxi[N2] - taxi[N1] > 0) and
         (kingSquare[N2] <> 0) then begin
          Extensiens := 0;
          exit;
      end;

    end;


    Extensiens := -1;

 end;



{
  ����᪮� ���祭��
  �᫨ 室 �� �த��������, �
  ���������� beta ����᪮� �業��� ��᫥
  室�
  �᫨ ����� ���祭� �� ���蠥� alpha -
  � ���窠

}
 function Cut(nextCheck:boolean; var nextBeta:integer):boolean;
 var
  nextScore:integer;
 begin
     Cut := false;

     nextScore := score + tag.delScore;
     nextBeta  := beta;

     if (ply >= FULL_FREE)     and
       { (ply >= glDepth-6) and}
        not nextCheck and
        not PV        and
        (tag.delScore < wPawn div 2) and
        (nextScore < beta) then
     begin
       {室 ��誨 �� �।��᫥���� ��ਧ��⠫� �� ���१���}
       if (tag.Piece.piPiece = pPawn) and
        ( passedPawnDesc[player, tag.N2 shr 4] >= passedPawnValue) then
        begin end
        else  begin
            nextBeta := nextScore;
            if nextScore <= alpha then
               Cut := true;
        end;
     end;
 end;


 {��࠭�� move+tmpLine � line}
 procedure SaveLine(move:TMove);
 var
  n:integer;
 begin
   if not glTimeOver then begin
      line[0].data := move.data;
      n := 0;
      while (tmpLine[n].data <> 0) and
            (n < LINE_MAX-2)   do
      begin
          line[n+1].data := tmpLine[n].data;
          inc(n);
      end;
      line[n+1].data := 0;

      if ply = 0 then begin
        glScore := alpha;
        ShowStatus;
      end;
   end;
 end;


 {�����뢠�� killer}
 procedure WriteKiller;
 var
  kill:TKill;
 begin
    if not glTimeOver and
       (tag.kind <> kEnPassant) and
       (tag.kind <> kCastling)  and
       not CapturesLastMove then
       begin
          with kill do begin
             kPiece := tag.Piece.piPiece;
             kMove.source := tag.N1;
             kMove.dest := tag.N2;
          end;
          if killer1[ply].kData = kill.kData then exit;
          killer2[ply].kData := killer1[ply].kData;
          killer1[ply].kData := kill.kData;
       end;
 end;



 {�����뢠�� 室 � ���-⠡����}
 procedure WriteHash;
 var
  move:TMove;
 begin
    if not glTimeOver and
       (tag.kind <> kEnPassant) and
       (tag.kind <> kCastling)  then
    begin
      move.source := tag.N1;
      move.dest := tag.N2;
      hInsert(key,move,tag.Piece.piPiece, depth);
    end;
 end;


 procedure WriteHistory;
 begin
   with tag do
    history[player][(glIndex8[N1] shl 6) + glIndex8[N2]] := 1;
 end;

 {
  �믮���� ����� -
  ⥪�訩 室 ������ ���� ����� � tag
  �㭪樥� MakeMove
 }
 procedure LoopBody;
 var
  tmp:integer;
  move:TMove;
  nextCheck:boolean;
  extend:integer;
  nextBadPieceOrder:boolean;
  zerroWindow:boolean;
  nextBeta:integer;
 begin

   move.source := tag.N1;
   move.dest := tag.N2;
   ResetLine(tmpLine);

   if PV and SaveLook(move) then  exit;

   if tag.Piece.piPiece <> pKing then
     moveOnlyKing := false;
   if tag.N2 = lastMove.dest then
     CapturesLastMove := true;



   {�᫨ �쥫� ��஫� - �४�頥� �����}
   if tag.eatPiece.piPiece = pKing then
   begin
     MaxVal := INFINITY-ply;
     SaveLine(move);
     WriteKiller;
     WriteHash;
     stopSearch := true;
     exit;
   end;


   if captureSearch then nextCheck := false
   else  nextCheck :=  Attack(tag.Piece.piPiece, player,
                          tag.N2, PieceTab[opponent,0].piN,
                          pos);

   extend := Extensiens(nextCheck);
   nextBeta := beta;

   if extend < 0 then begin
      if Cut(nextCheck,nextBeta) then begin
         if alpha > MaxVal then MaxVal := alpha;
         exit;
      end;

      if (ply < BACK_MAX_PLY) and
         (moveGenType = mNoCapture) and
        Analysis(move,nextCheck) then exit;

   end;


   if (ply = 0) and not glTimeOver then
     ShowCurrentMove(move);




 if check and
    not captureSearch and
    not zerroMove and
    (tag.N2 <> lastMove.dest) and
    Attack(lastPiece,opponent,lastMove.dest,
           PieceTab[player,0].piN,pos) then
 begin


    tmp := -(INFINITY-(ply+1));

 end else begin

 {///////// 001////////////////////}
    path[ply].data := move.data;
    if (tag.kind = kPawnPromote) or
       (tag.kind = kPawnPromoteCapture) then
        nextBadPieceOrder := true
    else nextBadPieceOrder := badPieceOrder;


    zerroWindow := not firstPV;

 if not zerroWindow then begin


   tmp := -Search(-nextBeta,-alpha,opponent,player,-(score+tag.delScore),
                  move,pos,
                  ply+1,depth+extend,
                  tmpLine,
                  nextCheck,
                  moveGenType = mPV,
                  key xor tag.delKey,
                  CaptureSearch,CheckSearch,
                  nextBadPieceOrder
                  );
   end else begin

      tmp := -Search(-(alpha+1),-alpha,opponent,player,-(score+tag.delScore),
                  move,pos,
                  ply+1,depth+extend,
                  tmpLine,
                  nextCheck,
                  moveGenType = mPV,
                  key xor tag.delKey,
                  CaptureSearch,CheckSearch,
                  nextBadPieceOrder
                  );
     if (tmp > alpha) and (tmp < nextBeta) then begin
         ResetLine(tmpLine);
         tmp := -Search(-nextBeta,-alpha,opponent,player,-(score+tag.delScore),
                  move,pos,
                  ply+1,depth+extend,
                  tmpLine,
                  nextCheck,
                  moveGenType = mPV,
                  key xor tag.delKey,
                  CaptureSearch,CheckSearch,
                  nextBadPieceOrder
                  );


     end;
   end;


 {///////// 001////////////////////}
end;{skipSearch}



   if tmp > MaxVal then MaxVal := tmp;
   if MaxVal > alpha then begin
      alpha := MaxVal;
      if depth > 0 then begin
        if alpha < beta then
           SaveLine(move);
        WriteKiller;
        WriteHash;
        WriteHistory;
      end;
   end;
   if alpha >= beta then stopSearch := true;

 end;{function}



 {���⨥ 䨣��� ��⨢���� �� ���⪥ Square}
 procedure CapMovGen(square:integer; capPiece:integer; var pos:TBoard);
 var
   n,j:integer;
   newN:integer;
   del,source,dest,piece:integer;
   goodMove:boolean;
   start:integer;
 begin

      if pos[square] = cOut then exit;

      {�᫨ �� �饬 ⮫쪮 ����� �
      䨣��� �����஢��� �� ���浪�
      � ���⨥ ������ 䨣��� �� �����
      alpha, � �� �㦭� � �᪠�� ����� ��}
      if captureSearch and (capPiece <> pKing) and
         (score + _wf[capPiece] <= alpha)  then begin
         if alpha > MaxVal then MaxVal := alpha;
         exit;
      end;


      {����� ��襪}
      newN := square - DirPawn[player] + 1;
 for j := 0 to 1 do
 begin
      if (  ((pos[newN] shr 4) and 3) = player  ) and
         ( PieceTab[player, pos[newN] and 15].piPiece = pPawn) then
      begin
        MakeMove(newN,square,tag,pos);
        LoopBody;
        UnMakeMove(tag,pos);
        if StopSearch then exit;
      end;
      newN := newN - 2;
 end;

 if badPieceOrder then start := PawnNo[player]
   else start := KnightNo[player];

 {��⠫�� �����}
 dest := square;
 for j := start downto 0 do
 begin
 {///// 001 ///////}
   with PieceTab[player,j] do
   begin
       if piPiece = pEmpty then continue;
       Piece := piPiece;
       source := piN;
   end;


   if (_check[ dest-source + BASE ] and _codeF[Piece]) <>
       (_codeF[Piece]) then
       continue;

        goodMove := false;
        case Piece of
          pPawn:;
          pKing,pKnight: goodMove := true;
          else begin
              del := _del[source - dest + BASE];
              if del <> 0 then
              begin
                 N := dest + del;
                 while (N <> source) and (pos[N] = 0) do
                 inc(N,del);
                 goodMove := N = source;
              end;
          end;
        end;{case}

        if goodMove then begin
            MakeMove(source,dest,tag,pos);
            LoopBody;
            UnMakeMove(tag,pos);
            if StopSearch then exit;
        end;

   {////// 001 /////}
  end;{for}

 end;


 procedure NonCapMovGen(index:integer; var pos:TBoard);
 var
 N2:integer;
 j:integer;
 del:PDir;

 begin
     with PieceTab[player,index] do
     begin
{////// 001 //////////}

   case piPiece of
         pEmpty: ;
         pPawn: begin
            N2 := piN + DirPawn[player];
            if pos[N2] = 0 then
            begin

                MakeMove(piN,N2,tag,pos);
                LoopBody;
                UnMakeMove(tag,pos);
                if stopSearch then exit;


                if (PawnFirstMove[piN shr 4] = 1) and
                   (PawnFirstMove[N2 shr 4]  = 2) then
                begin
                   N2 := N2 + DirPawn[player];
                   if pos[N2] = 0 then begin

                       MakeMove(piN,N2,tag,pos);
                       LoopBody;
                       UnMakeMove(tag,pos);
                       if stopSearch then exit;

                   end;
                end;
            end;

         end;

         pKnight:begin
           del := DirPtr[pKnight];
           for j := 0 to 7 do
           begin
              N2 := piN + del^[j];
              if pos[N2] = 0 then begin
                    MakeMove(piN,N2,tag,pos);
                    LoopBody;
                    UnMakeMove(tag,pos);
                    if stopSearch then exit;
              end;
           end;
         end;

         pKing:begin
           del := DirPtr[pKing];
           for j := 0 to 7 do
           begin
              N2 := piN + del^[j];
              if (pos[N2] = 0) then begin
                    MakeMove(piN,N2,tag,pos);
                    LoopBody;
                    UnMakeMove(tag,pos);
                    if stopSearch then exit;
              end;
           end;


           {ப�஢��}
           if (piIsMove = false) and not checkSearch then
           begin
            if RightCastlingEnable(player,pos) then begin
              N2 := piN + 2;
                    MakeMove(piN,N2,tag,pos);
                    LoopBody;
                    UnMakeMove(tag,pos);
                    if stopSearch then exit;
            end;
            if LeftCastlingEnable(player,pos) then begin
              N2 := piN - 2;
                    MakeMove(piN,N2,tag,pos);
                    LoopBody;
                    UnMakeMove(tag,pos);
                    if stopSearch then exit;
            end;
           end;
         end;{pKing}

         else begin {�� 䨣��� �஬� ��஫� � ��襪}
           del := DirPtr[piPiece];
           j := 0;
           while del^[j] <> 0 do
           begin
              N2 := piN + del^[j];
              while pos[N2] = 0 do
              begin
                    MakeMove(piN,N2,tag,pos);
                    LoopBody;
                    UnMakeMove(tag,pos);
                    if stopSearch then exit;

                N2 := N2 + del^[j];
              end;
              j := j + 1;
           end;
         end;
       end;{case}
{/////// 001 /////////}
     end;{with}
 end;{function}



 {⮫쪮 �ॢ�饭�� ��襪}
 procedure PawnPromoteGen;
 const
   pawnDesc:array[cWhite..cBlack] of integer =
   (5,10);
 var
  n:integer;
 begin
    for n := PawnNo[player] downto 0 do
    with PieceTab[player,n] do
    if piPiece <> pEmpty then
    begin
        if piPiece <> pPawn then exit;
        if (piN shr 4) = pawnDesc[player] then
        begin
           NonCapMovGen(n,pos);
           if stopSearch then exit;
        end;
    end;
 end;



 procedure KillMoveGen;
 begin
     with Killer1[ply] do
     if (kPiece <> 0) and
        KillMoveIsLegal(player,opponent,kMove.source,
                  kMove.dest,kPiece ,pos)
     then begin

        MakeMove(kMove.source,kMove.dest,tag,pos);
         LoopBody;
        UnMakeMove(tag,pos);
        if StopSearch then exit;
     end;

     with Killer2[ply] do
     if (kPiece <> 0) and
        KillMoveIsLegal(player,opponent,kMove.source,
                  kMove.dest,kPiece ,pos)
     then begin

        MakeMove(kMove.source,kMove.dest,tag,pos);
        LoopBody;
        UnMakeMove(tag,pos);
        if StopSearch then exit;
     end;

 end;


 procedure PVGen;
 var
  p:PLine;
  y,n:integer;
  compare:boolean;
 begin
     if ply >= LINE_MAX then exit;

       for y := PVCount-1 downto 0 do
       begin
          firstPV := y = (PVCount - 1);
          p := @PVTable[y];
          if p^[ply].data = 0 then continue;
             compare := true;
             for n := 0 to ply-1 do
             begin
                 if p^[n].data <> path[n].data then
                 begin
                     compare := false;
                     break;
                 end;
             end;
             if compare then
             with p^[ply] do
             begin


                MakeMove(source,dest,tag,pos);
                LoopBody;
                UnMakeMove(tag,pos);
                if StopSearch then exit;
                SaveInsert(p^[ply]);
             end;

       end; {for}

       firstPV := false;
 end;




 procedure HashGen;
 var
  hashMove:TMove;
  hPiece:integer;
 begin
      if hLook(key,hashMove,hPiece) and
         KillMoveIsLegal(player,opponent,hashMove.source,
                  hashMove.dest, hPiece, pos)
      then
      begin
         findHashMove := true;
         MakeMove(hashMove.source,
                  hashMove.dest,
                  tag,pos);
         LoopBody;
         UnMakeMove(tag,pos);
      end;
 end;



 procedure PawnEnPassantGen;
 var
  n,S,D:integer;
 begin
     for n := -1 to 1 do
     if n <> 0 then begin
        S := lastMove.dest + n;
        if (  ((pos[S] shr 4) and 3) = player )  and
           (PieceTab[player, pos[S] and 15].piPiece = pPawn) then
        begin
            D := lastMove.dest + DirPawn[player];
            MakeMove(S,D,tag,pos);
            LoopBody;
            UnMakeMove(tag,pos);
            if StopSearch then exit;
        end;
     end;
 end;


 procedure BackMovGen;
 var
  n,S,D:integer;
 begin
     if ply >= BACK_MAX_PLY then exit;
     with backPtr[ply]^ do
     begin
         for n := 0 to bGoodCount-1 do
         begin
            S := bGoodMoves[n].source;
            D := bGoodMoves[n].dest;
            MakeMove(S,D,tag,pos);
            LoopBody;
            UnMakeMove(tag,pos);
            if StopSearch then exit;
         end;

         for n := 0 to bBadCount-1 do
         begin
            S := bBadMoves[n].source;
            D := bBadMoves[n].dest;
            MakeMove(S,D,tag,pos);
            LoopBody;
            UnMakeMove(tag,pos);
            if StopSearch then exit;
         end;

     end;
 end;


      {//////////  SEARCH ///////////}

var
 n:integer;
begin


    {�஢�ઠ �� �ॢ�襭�� ����� �६���}
    inc(glCountPos);
    if (glCountPos and $FFFF) = 0 then begin
       if TimeUp then glTimeOver := true;
       if not glTimeOver then ShowStatus;
    end;
    if glTimeOver then exit;


    {�ॢ�襭� ��㡨�� �����}
    if ply >= MAX_PLY then
    begin
        Search := score;
        exit;
    end;



    {���樠������ ��६�����}
    stopSearch := false;
    moveOnlyKing := true;
    MaxVal := -INFINITY;
    CaptureSearch := false;
    CapturesLastMove := false;
    Killer1[ply+1].kPiece := 0;
    Killer2[ply+1].kPiece := 0;
    zerroMove := lastMove.data = 0;
    lastPiece := 0;
    if not zerroMove then lastPiece :=
       PieceTab[opponent,pos[lastMove.dest] and 15].piPiece;
    findHashMove := false;
    saveCount := 0;
    firstPV := false;
    if ply < BACK_MAX_PLY then backReset(ply);

    if (
       (Depth <= 0) or
       (ply >= MAX_PLY_FULL_WIDTH)
       )
       then begin
          CaptureSearch := true;
       end;

    if (ply > 0) and ((Depth > 0) and (Depth <= 2)) then begin
       CheckSearch := true;
    end;


    if CaptureSearch or
       ( not check and  CheckSearch ) then
       begin
          MaxVal := score;
          if MaxVal > alpha then alpha := MaxVal;
          if alpha >= beta then goto done;
        end;




      {PV}
      if PV and (ply < LINE_MAX) and not CaptureSearch then
      begin
          moveGenType := mPV;
          PVGen;
          if StopSearch then goto done;
      end;

      {室 �� ���}
      if not CaptureSearch then begin
         moveGenType := mHash;
         HashGen;
         if StopSearch then goto done;
      end;


      {����稬 ����� ��᫥���� �室��襩 䨣���
      ��⨢����}
      if not zerroMove then begin

        moveGenType := mCaptureLastMove;
        CapMovGen(lastMove.dest, lastPiece, pos);
        if StopSearch then goto done;

        {���⨥ ��誨 �� ��室�}
            if (lastPiece = pPawn) and
               (PawnExtMove [lastMove.source shr 4] = 1) and
               (PawnExtMove [lastMove.dest shr 4] = 2) then
             begin
                PawnEnPassantGen;
                if stopSearch then goto done;
             end;

      end;


      {killer}
      if not CaptureSearch and
         not CapturesLastMove then
      begin
         moveGenType := mKill;
         KillMoveGen;
         if StopSearch then goto done;
      end;


      {����稬 ��⠫�� �����}
      for n := 0 to PawnNo[opponent] do
      with PieceTab[opponent,n] do
      if (piPiece <> pEmpty) and
         (piN <> lastMove.dest) {��᫥���� �室����� 䨣��� 㦥 �᫨}
      then begin

         moveGenType := mCapture;
         CapMovGen(piN,piPiece,pos);
         if stopSearch then goto done;
         {
           �᫨ �� - � �� �����, �஬� ���⨩
           ��᫥���� �室��襩 䨣��� � ��஫� �ய�饭�
         }
         {if check and not captureSearch and (ply > 0) then break;}
      end;



      if CaptureSearch then begin
         moveGenType := mPawnPromote;
         PawnPromoteGen;
         goto done;
      end;




      {��⠫�� ��६�饭��}

{
      for n := 0 to PawnNo[player]  do
      with PieceTab[player,n] do
      if piPiece <> pEmpty then
      begin
         moveGenType := mNoCapture;
         NonCapMovGen(n,pos);
         if stopSearch then goto done;
      end;
 }

      for n := 1 to KnightNo[player]  do
      with PieceTab[player,n] do
      if piPiece <> pEmpty then
      begin
         moveGenType := mNoCapture;
         NonCapMovGen(n,pos);
         if stopSearch then goto done;
      end;
      with PieceTab[player,0] do
      if piPiece <> pEmpty then
      begin
         moveGenType := mNoCapture;
         NonCapMovGen(0,pos);
         if stopSearch then goto done;
      end;
      for n := KnightNo[player]+1 to PawnNo[player]  do
      with PieceTab[player,n] do
      if piPiece <> pEmpty then
      begin
         moveGenType := mNoCapture;
         NonCapMovGen(n,pos);
         if stopSearch then goto done;
      end;



    {back moves gen}
    if ply < BACK_MAX_PLY then begin
        moveGenType := mBack;
        BackMovGen;
        if StopSearch then goto done;

    end;


done:


  if not CaptureSearch and
     moveOnlyKing and
     (MaxVal = -(INFINITY-(ply+1))) and
     not check then
  begin
      {�஢�ઠ �� ��� - �᫨
       室�� ⮫쪮 ��஫� � �� ᫥���饬 室�
       ��� ᮦࠫ� � ��஫� �� ��� �宬 -
       ���
      }
      MaxVal := 0;
  end;

  if alpha > MaxVal then MaxVal := alpha;
  Search := MaxVal;


end;








{
  ���樠������ ��६���� � �맮� �����
  �����뢠���� �ᥣ�� ⥪��� ������ � ���
}
function CallSearch(var game:TGame; var pos:TBoard;
                    var retMove:TMove):boolean;
{�業�� ��� ���孨� � ������ � ���� ����}
        const endGSt:array[0..63] of byte =
        (
         1 ,2 ,3 ,4 ,  4, 3, 2, 1,
         9,10,11,12 , 12,11,10, 9,
        17,18,19,20 , 20,19,18,17,
        25,26,27,28 , 28,27,26,25,

        25,26,27,28 , 28,27,26,25,
        17,18,19,20 , 20,19,18,17,
         9,10,11,12 , 12,19,18,17,
         1, 2, 3, 4 ,  4, 3, 2, 1
        );

{�業�� ��� ���孨�}
        const upSt:array[0..63] of byte =
        (
         1, 2, 3, 4, 5, 6, 7, 8,
         9,10,11,12,13,14,15,16,
        17,18,19,20,21,22,23,24,
        25,26,27,28,29,30,31,32,
        33,34,35,36,37,38,39,40,
        41,42,43,44,45,46,47,48,
        49,50,51,52,53,54,55,56,
        57,58,59,60,61,62,63,64
        );
{�業�� ��� ������}
        const botSt:array[0..63] of byte =
        (
        64,63,62,61,60,59,58,57,
        56,55,54,53,52,51,50,49,
        48,47,46,45,44,43,42,41,
        40,39,38,37,36,35,34,33,
        32,31,30,29,28,27,26,25,
        24,23,22,21,20,19,18,17,
        16,15,14,13,12,11,10, 9,
         8, 7, 6, 5, 4, 3, 2, 1
        );

var
  player,opponent:integer;
  n:integer;
  score:integer;
  lastMove:TMove;
  tmp:integer;
  key:LongInt;
begin



    CallSearch := false;
    retMove.data := 0;
    gGetCurrPos(game,pos);
    hReset;
    fillChar(history,sizeof(history),0);
    key := 0;
    {�᫨ ��� 2 ��஫�� � ����稨 - ��室}
    if (PieceTab[cWhite,0].piPiece = pEmpty) or
       (PieceTab[cBlack,0].piPiece = pEmpty) then
       exit;
    {��।���� 梥� ���� 䨣��}
    if game.gCurr mod 2 = 0 then player := cWhite
     else player := cBlack;
    opponent := ColorTab[player];

    {���� �� ��誨}
    glFindPawn := false;
    for n := 0 to PawnNo[player] do
     if PieceTab[player,n].piPiece = pPawn then
     glFindPawn := true;
    for n := 0 to PawnNo[opponent] do
     if PieceTab[opponent,n].piPiece = pPawn then
     glFindPawn := true;

    {���� ��� ���� ���}
    glFindOneQueen := false;
    if (PieceTab[opponent,1].piPiece = pQueen) or
       (PieceTab[player,1].piPiece = pQueen) then
       glFindOneQueen := true;

    {�ਮ��� ��室��� ��襪}
    if glFindOneQueen then passedPawnValue := 2
     else passedPawnValue := 1;


    {���樠���㥬 ���⥣��}
    FillChar(BlackSt,sizeof(TStBoard),0);
    FillChar(WhiteSt,sizeof(TStBoard),0);

    for n := 0 to 63 do begin
      if glFindPawn then begin
         BlackSt[ glIndex16[n] ] := upSt[n];
         WhiteSt[ glIndex16[n] ] := botSt[n];

      end else begin
        BlackSt[ glIndex16[n] ] := EndGSt[n];
        WhiteSt[ glIndex16[n] ] := EndGSt[n];
      end;
    end;


    {���樠������ ��������� ��६�����}
    glStartTimeThink := GetTickCount;
    glTimeOver := false;
    glCountPos := 0;
    glDepth := 0;
    ResetLine(glBestLine);
    FillChar(Killer1,sizeof(Killer1),0);
    FillChar(Killer2,sizeof(Killer2),0);
    glStatusStr1 := '';
    glStatusStr2 := '';
    glStatusStr3 := '';
    glStatusStr4 := '';


    {���᫨� ���⮢�� �業��}
    score := 0;
    for n := 0 to PawnNo[player] do
    with PieceTab[player,n] do
    if piPiece  <> pEmpty then begin
      score := score + _wf[piPiece] +
               StTab[player]^[piN];
      key := key xor hKeys[player,piPiece,glIndex8[piN]];
    end;

    for n := 0 to PawnNo[opponent] do
    with PieceTab[opponent,n] do
    if piPiece  <> pEmpty then begin
      score := score - _wf[piPiece] -
               StTab[opponent]^[piN];
      key := key xor hKeys[opponent,piPiece,glIndex8[piN]];
    end;


    gGetLastMove(game,lastMove);
    glScore := score;
    PVReset;
    glRootVal[player] := score;
    glRootVal[opponent] := -score;



   {����⠥��� ������� 室 �� ������⥪�}
   LoadLib;
   if LibLook(game,retMove) then begin
      ShowStatus;
      CallSearch := true;
      exit;
   end;





    glDepth := 2;

while (glDepth < MAX_DEPTH) and not glTimeOver do
begin
    glDepth := glDepth + 1;

    ShowStatus;

    FULL_FREE := 4;
    if not glFindPawn then FULL_FREE := 4;
    if glDepth > 10 then
      FULL_FREE := FULL_FREE + (glDepth-10);

    tmp := Search(
                  -INFINITY,INFINITY,
                  player,opponent,score,
                  lastMove,
                  pos,
                  0,{ply}
                  glDepth,
                  glBestLine,
                  AttackSquare(PieceTab[player,0].piN, opponent, pos),
                  true,
                  key,
                  false,
                  false,
                  false {badMoveOrder}
                 );
    { if glDepth >= 5 then}
        PVInsert(glBestLine);

end;


    retMove := glBestLine[0];
    ShowStatus;
    CallSearch := true;
    {WriteHashDamp;}
end;



END.