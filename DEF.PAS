{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}
unit def;
{
    ���������� ����������� � TCHESS
}
INTERFACE
uses types;

CONST

  {梥�}
  cWhite = 1;
  cBlack = 2;
  {䫠� ��室� �� �।��� ��஢��� ����}
  cOut   = 128;
TYPE
  TSquare = byte;
  {
   ���� 4-5 - 梥�
   0,1,2,3 - ����� ������� ᯨ᪠ 䨣��
   7 - 䫠� ��室� �� �।��� ��᪨
  }

  TBoard = array[0..16*16-1] of TSquare;
CONST
    {���� 䨣��}
    pEmpty = 0;
    pKing  = 1;
    pQueen = 2;
    pRook  = 3;
    pBishop = 4;
    pKnight = 5;
    pPawn   = 6;


    {��� 䨣��}
    wPawn = 200;
    wKnight = (3*wPawn);
    wBishop = wKnight;
    wRook = (5*wPawn);
    wQueen = (9*wPawn);
    wKing  = 0;
    INFINITY = 30000;

    {���ᨢ ��४���஢�� ���� 䨣��� � ���}
    _wf:array[0..6] of integer =
    (0,wKing,wQueen,wRook,wBishop,wKnight,wPawn);


TYPE
  {������� ᯨ᪠ 䨣��}
  TPiece = record
    case byte of
     0:(
       piN:byte;         {���न���}
       piPiece:byte;     {䨣��}
       piColor:byte;     {�� 梥�}
       piIsMove:boolean; {��६�饠���� �� 䨣��}
       );
     1:( piData:LongInt );
  end;
  PPiece = ^TPiece;

  {����⥫� ��६�饭��}
  TMove = record
    case byte of
    1:(source,dest:byte);
    2:(data:word)
  end;



  {ࠧ������ ����⥫� ��६�饭��
  ��� �������� �������� �㭪�� MakeMove �
  �� ��� �㭪�� UnMakeMove ����⠭�������� ������}
  type
  TKind = (kNormal,
           kCapture,
           kEnPassant,
           kCastling,
           kPawnPromote,
           kPawnPromoteCapture);

  TagMove = record
    N1,N2,eatFN:integer;  {����� ���⮪}
    F,eatF:integer;       {ᮤ�ন��� ���⮪}
    kind:TKind;           {⨯ 室�}
    Piece,eatPiece:TPiece;  {��࠭���� �������� ᯨ᪮� 䨣��}
    {⮫쪮 ��� ப�஢��}
    RookN1,RookN2:integer;
    Rook:integer;
    RookPiece:TPiece;

    delScore:integer; {���饭�� �業�� �� 室�}
    delKey:LongInt;
  end;

  {���}
  const MAX_MOVES_IN_GAME = 400;
  TYPE
  TGame = record
     gMoves:array[0..MAX_MOVES_IN_GAME-1] of TMove;
     gCurr,gMax:integer;
     gColorMachin:integer;
     res1,res2,res3,res4:integer;
     Summ:LongInt; {����஫쭠� �㬬�}
  end;


  {��᪨ � ���⥣���}
  TStBoard = array[0..16*16-1] of integer;
  PStBoard = ^TStBoard;
  var BlackSt,WhiteSt:TStBoard;
  const StTab:array[cWhite..cBlack] of PStBoard =
  (@WhiteSt,@BlackSt);


VAR
 {ᯨ᪨ 䨣��
 ���� ���� ��஫� - ��᫥���� ��誨}
 PieceTab:array[cWhite..cBlack,0..15] of TPiece;
 {���ᨬ���� ������ (ᬮ��� ᪮�쪮 䨣��)}
 PawnNo:array[cWhite..cBlack] of integer;
 KnightNo:array[cWhite..cBlack] of integer;



{���ᨢ� ��४���஢��}
const glIndex8:array[0..16*16-1] of integer =
(
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 0, 0, 0, 0,
  0, 0, 0, 0, 8, 9,10,11,12,13,14,15, 0, 0, 0, 0,
  0, 0, 0, 0,16,17,18,19,20,21,22,23, 0, 0, 0, 0,
  0, 0, 0, 0,24,25,26,27,28,29,30,31, 0, 0, 0, 0,
  0, 0, 0, 0,32,33,34,35,36,37,38,39, 0, 0, 0, 0,
  0, 0, 0, 0,40,41,42,43,44,45,46,47, 0, 0, 0, 0,
  0, 0, 0, 0,48,49,50,51,52,53,54,55, 0, 0, 0, 0,
  0, 0, 0, 0,56,57,58,59,60,61,62,63, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
);


const glIndex16:array[0..63] of integer =
(
68, 69, 70, 71, 72, 73, 74, 75,
84, 85, 86, 87, 88, 89, 90, 91,
100, 101, 102, 103, 104, 105, 106, 107,
116, 117, 118, 119, 120, 121, 122, 123,
132, 133, 134, 135, 136, 137, 138, 139,
148, 149, 150, 151, 152, 153, 154, 155,
164, 165, 166, 167, 168, 169, 170, 171,
180, 181, 182, 183, 184, 185, 186, 187
);

{���ᨢ ��४���஢�� ���न��� 8*8 � ᨬ��쭮� �।�⠢�����}
const glChMove:array[0..63] of string[2] =
(
  'a8','b8','c8','d8','e8','f8','g8','h8',
  'a7','b7','c7','d7','e7','f7','g7','h7',
  'a6','b6','c6','d6','e6','f6','g6','h6',
  'a5','b5','c5','d5','e5','f5','g5','h5',
  'a4','b4','c4','d4','e4','f4','g4','h4',
  'a3','b3','c3','d3','e3','f3','g3','h3',
  'a2','b2','c2','d2','e2','f2','g2','h2',
  'a1','b1','c1','d1','e1','f1','g1','h1'
);





{���饭�� �� �������� 䨣��}
type
 TDir = array[0..8] of integer;
 PDir = ^TDir;
const
 DirTab:array[pKing..pKnight] of TDir =
 (
(16,-16,1,-1,17,-17,15,-15,0),
(16,-16,1,-1,17,-17,15,-15,0),
(16,-16,1,-1,0,0,0,0,0),
(17,-17,15,-15,0,0,0,0,0),
(32+1,32-1,16+2,16-2,-(32+1),-(32-1),-(16+2),-(16-2),0)
 );


 DirPtr:array[pKing..pKnight] of PDir =
 (@DirTab[pKing],@DirTab[pQueen],@DirTab[pRook],
  @DirTab[pBishop],@DirTab[pKnight]);


 DirPawn:array[cWhite..cBlack] of integer =
(
  (-16),
  (16)
);
 ColorTab:array[cWhite..cBlack] of integer =
 (cBlack,cWhite);


  {������ ᮮ⢥����� ���� Y �ॢ�饭�� ��誨 � �২}
  const PawnPromoteDesc:array[0..15] of byte =
  (0,0,0,0, 1,0,0,0, 0,0,0,1, 0,0,0,0);
  {室 ��誨 � 1 �� 2 ����� �������� ���⨥ �१ ��⮥ ���� }
  const PawnEnPassantDesc:array[0..15] of byte =
  (0,0,0,0, 0,0,2,1, 1,2,0,0, 0,0,0,0);
  {��� ��।������ 室� ப�஢��}
  const CastlingDesc:array[0..15] of byte =
  (0,0,0,0, 0,0,3,0, 1,0,2,0, 0,0,0,0);
  {���� 室 ��誨}
  const PawnFirstMove:array[0..15] of byte =
  (0,0,0,0, 0,1,2,0, 0,2,1,0, 0,0,0,0);
  {���� 室 ��誨 �१ �����}
  const PawnExtMove:array[0..15] of byte =
  (0,0,0,0, 0,1,0,2, 2,0,1,0, 0,0,0,0);

  {� ��� 䨣��� �ॢ�頥��� ��誠}
  const PawnNewPiece:integer = pQueen;




{////////////////  FUNCTIONS ///////////////////}
{
 �����頥� true �᫨
 䨣��� piece 梥� color
 ����� �� source ���
 ���� dest
 (�஬� ����� ��誨 �१ ��⮥ ����)
}
FUNCTION Attack(Piece,Color,source,dest:integer; var pos:TBoard):boolean;
{��ந� ����� ����� ���� �窠��}
FUNCTION VerifyLine(source,dest:integer; var pos:TBoard):boolean;
{������ ��६�饭��}
procedure MakeMove(source,dest:integer; var tag:TagMove; var pos:TBoard);
{����⠭�������� ������}
procedure UnMakeMove(var tag:TagMove; var pos:TBoard);
{�����頥� 梥� ���⪨}
function GetColor(square:integer):integer;
{�����頥� ������ 䨣��� � ᯨ᪥ 䨣��}
function GetPieceIndex(square:integer):integer;
{�����頥� ⥪���� ������ � ���}
procedure gGetCurrPos(var game:TGame; var pos:TBoard);
{�ᯠ���뢠�� ���� ����樨}
procedure UnPackSquare(square:integer; var out,index,color:integer);

{���樠����� ����� ����}
procedure gInitNewGame(colorMachin:integer; var game:TGame);
{室 �����}
function  gBackMove(var game:TGame):boolean;
{�ॢ�襭� ������⢮ 室�� � ���}
function gGameOverflow(var game:TGame):boolean;
{室 ���।}
function gNextMove(var game:TGame):boolean;
{��⠢��� ���� 室}
function gInsertMove(var game:TGame; move:TMove):boolean;
{�����頥� ��᫥���� 室 � ���}
procedure gGetLastMove(var game:TGame; var move:TMove);

 {�����頥� true �᫨ ���� square �⠪�����
 䨣�ࠬ� 梥� color }
 function AttackSquare(square,color:integer; var pos:TBoard):boolean;
 {�����頥� true �᫨ ��������
 ப�஢��  䨣�� color}
 function RightCastlingEnable(color:integer; var pos:TBoard):boolean;
 function LeftCastlingEnable(color:integer; var pos:TBoard):boolean;

function ControlSumm(var data; size:LongInt):LongInt;

{////////////////////////   ��।������ �⠪� //////////}
{������ ��}

CONST
  N_QUEEN = 1;
  N_ROOK  = 2;
  N_BISHOP= 4;
  N_KNIGHT= 8;
  N_PAWN  = 16;
  N_KING  = 32;
  N_NO    = 64;
  _codeF:array[0..6] of integer =
(N_NO,N_KING,N_QUEEN,N_ROOK,N_BISHOP,N_KNIGHT,N_PAWN);

  BASE = (16*7)+8-1; {����. ����㠫쭮�� ��஫�}
  X = 0;
  _check:array[0..16*16-1] of integer =
  (
 5, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 5, 0,
 0, 5, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 5, 0, 0,
 0, 0, 5, 0, 0, 0, 0, 3, 0, 0, 0, 0, 5, 0, 0, 0,
 0, 0, 0, 5, 0, 0, 0, 3, 0, 0, 0, 5, 0, 0, 0, 0,
 0, 0, 0, 0, 5, 0, 0, 3, 0, 0, 5, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 5, 8, 3, 8, 5, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 8,53,35,53, 8, 0, 0, 0, 0, 0, 0,
 3, 3, 3, 3, 3, 3,35, X,35, 3, 3, 3, 3, 3, 3, 3,
 0, 0, 0, 0, 0, 8,53,35,53, 8, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 5, 8, 3, 8, 5, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 5, 0, 0, 3, 0, 0, 5, 0, 0, 0, 0, 0,
 0, 0, 0, 5, 0, 0, 0, 3, 0, 0, 0, 5, 0, 0, 0, 0,
 0, 0, 5, 0, 0, 0, 0, 3, 0, 0, 0, 0, 5, 0, 0, 0,
 0, 5, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 5, 0, 0,
 5, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 5, 0,
 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 5
  );


  {���饭�� �� ����஥��� �����}
  _del:array[0..16*16-1] of integer =
  (
-17,  0,  0,  0,  0,  0,  0,-16,  0,  0,  0,  0,  0,  0,-15,  0,
  0,-17,  0,  0,  0,  0,  0,-16,  0,  0,  0,  0,  0,-15,  0,  0,
  0,  0,-17,  0,  0,  0,  0,-16,  0,  0,  0,  0,-15,  0,  0,  0,
  0,  0,  0,-17,  0,  0,  0,-16,  0,  0,  0,-15,  0,  0,  0,  0,
  0,  0,  0,  0,-17,  0,  0,-16,  0,  0,-15,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,-17,  0,-16,  0,-15,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  8,-17,-16,-15,  8,  0,  0,  0,  0,  0,  0,
 -1, -1, -1, -1, -1, -1, -1,  X,  1,  1,  1,  1,  1,  1,  1,  1,
  0,  0,  0,  0,  0,  8, 15, 16, 17,  8,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0, 15,  0, 16,  0, 17,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0, 15,  0,  0, 16,  0,  0, 17,  0,  0,  0,  0,  0,
  0,  0,  0, 15,  0,  0,  0, 16,  0,  0,  0, 17,  0,  0,  0,  0,
  0,  0, 15,  0,  0,  0,  0, 16,  0,  0,  0,  0, 17,  0,  0,  0,
  0, 15,  0,  0,  0,  0,  0, 16,  0,  0,  0,  0,  0, 17,  0,  0,
 15,  0,  0,  0,  0,  0,  0, 16,  0,  0,  0,  0,  0,  0, 17,  0,
  0,  0,  0,  0,  0,  0,  0, 16,  0,  0,  0,  0,  0,  0,  0, 17
  );






IMPLEMENTATION
uses hash;


{
 �����頥� true �᫨
 䨣��� piece 梥� color
 ����� �� source ���
 ���� dest
 (�஬� ����� ��誨 �१ ��⮥ ����)
}
FUNCTION Attack(Piece,Color,source,dest:integer; var pos:TBoard):boolean;
VAR
 del,N:integer;
BEGIN
    Attack := false;

    if (pos[source] = cOut) or (pos[dest] = cOut) then
      exit;


    if word(dest-source+BASE) >= 16*16-1 then
    begin
        exit;
    end;

    if (_check[ dest-source+BASE ] and _codeF[Piece]) <>
       (_codeF[Piece]) then
    exit;

    case Piece  of
     pKnight,pKing: begin
               Attack := true;
               exit;
             end;
     pPawn:begin
             if Color = cBlack then
             begin
                if source < dest then
                  Attack := true;
             end else begin
                if source > dest then
                  Attack := true;
             end;
             exit;
          end;
    end; {case}

    {��ந� ����� ����� ���� �窠��}
    del := _del[source - dest + BASE];
    if del = 0 then exit;
    N := dest + del;
    while (N <> source) and (pos[N] = 0) do
       inc(N,del);

    Attack := N = source;

END;


{��ந� ����� ����� ���� �窠��}
FUNCTION VerifyLine(source,dest:integer; var pos:TBoard):boolean;
VAR
 del,N:integer;
BEGIN

    VerifyLine := false;
    if (pos[source] = cOut) or (pos[dest] = cOut) then
      exit;

    {��ந� ����� ����� ���� �窠��}
    del := _del[source - dest + BASE];
    if del = 0 then exit;
    N := dest + del;
    while (N <> source) and (pos[N] = 0) do
       inc(N,del);
    VerifyLine := N = source;
END;




{�ᯠ���뢠�� ���� ����樨}
procedure UnPackSquare(square:integer; var out,index,color:integer);
begin
   color := (square shr 4) and 3;
   index := square and 15;
   out   := square and cOut;
end;

{�����頥� 梥� ���⪨}
function GetColor(square:integer):integer;
begin
    GetColor := (square shr 4) and 3;
end;
{�����頥� ������ 䨣��� � ᯨ᪥ 䨣��}
function GetPieceIndex(square:integer):integer;
begin
   GetPieceIndex := square and 15;
end;





procedure ErrorMsg(str:string);
begin
   Writeln(str);
   halt;
end;



{
������ ��६�饭�� � ������ ��蠣���� ���饭��
�業��
���४������ ���祭�� ���� � pos � ᯨ᪨ 䨣��
���������� ࠧ������ ����⥫� ��६�饭�� tag
�� �㦨� ��� ����⠭������� ����樨 �㭪樥�
UnMakeMove
}
procedure MakeMove(source,dest:integer; var tag:TagMove; var pos:TBoard);
var
 player,opponent:integer;
 fX,fY:integer;
 findRook:boolean;
begin
   with tag do begin
     {��ࠡ�⠥� ���⮩ 室 -
     �� ���⨥, �� ப�஢�� - �� ����設�⢮}
     N1 := source;
     N2 := dest;
     F := pos[N1];
     player := (F shr 4) and 3; {������� 梥� }



     opponent := ColorTab[player];
     eatPiece.piData := 0;

     {���饭�� �業�� �� 室�}
     delScore := StTab[player]^[N2] - StTab[player]^[N1];

     with PieceTab[player,F and 15] do begin
         Piece.piData := piData;
         piN := N2;
         piIsMove := true;

     end;

     delKey := hKeys[player, Piece.piPiece, glIndex8[ N1 ] ]  xor
               hKeys[player, Piece.piPiece, glIndex8[ N2 ] ];

     kind := kNormal;


     if pos[N2] <> 0 then begin
       {�।������⥫쭮 - ���⮥ ���⨥}
       eatFN := N2;
       eatF := pos[eatFN];
       with PieceTab[(eatF shr 4) and 3,  eatF and 15] do
       begin
           eatPiece.piData := piData;
           piPiece := pEmpty;
       end;
       kind := kCapture;
       {������� ��� �쥤���� 䨣��� � ���⥣��᪨� �����}
       delScore := delScore + _wf[ eatPiece.piPiece] +
                   StTab[opponent]^[eatFN];

       delKey := delKey xor
                 hKeys[opponent, eatPiece.piPiece, glIndex8[ eatFN ] ];
     end;

     pos[N1] := 0;
     pos[N2] := F;


     case Piece.piPiece of
       pPawn: begin
          {ᤥ�� �������� ���⨥ �१ ��⮥ ����
          � �ॢ�饭�� ��誨}
          fY := N2 shr 4;
          if PawnPromoteDesc[fY] <> 0 then begin
             {��誠 �ॢ�⨫��� � �২}
             PieceTab[player,F and 15].piPiece := PawnNewPiece;
             if kind = kCapture then
               kind := kPawnPromoteCapture
             else kind := kPawnPromote;
             {���⥬ ��� ��誨 � ������� ��� ���}
             delScore := delScore - wPawn + _wf[PawnNewPiece];
             exit;
          end;



          if (kind = kNormal)  and
             (PawnEnPassantDesc[ N1 shr 4 ] = 1) and
             (PawnEnPassantDesc[ N2 shr 4 ] = 2) and
             ( (N1 and 15) <> (N2 and 15) ) then
          begin
              {���⨥ �१ ��⮥ ����}
              if player = cBLack then
                eatFN := N2 - 16
              else eatFN := N2 + 16;

             kind := kEnPassant;
             eatF := pos[eatFN];
             with PieceTab[ (eatF shr 4) and 3, eatF and 15] do
             begin
                 eatPiece.piData := piData;
                 piPiece := pEmpty;
             end;
             pos[eatFN] := 0;

             {������� ��� �쥤���� 䨣��� � ���⥣��᪨� �����}
             delScore := delScore + _wf[ eatPiece.piPiece] +
                         StTab[opponent]^[eatFN];

             delKey := delKey xor
                 hKeys[opponent, eatPiece.piPiece, glIndex8[ eatFN ] ];

          end;

       end;

       pKing: begin
          findRook := false;
          if CastlingDesc[N1 and 15] = 1 then begin
             if CastlingDesc[N2 and 15] = 2 then begin
                 {�ࠢ�� ப�஢��}
                 RookN1 := N2 + 1;
                 RookN2 := N2 - 1;
                 findRook := true;
             end;
             if CastlingDesc[N2 and 15] = 3 then begin
                 {�ࠢ�� ப�஢��}
                 RookN1 := N2 - 2;
                 RookN2 := N2 + 1;
                 findRook := true;
             end;
             if findRook then begin
                 kind := kCastling;
                 Rook := pos[RookN1];
                 pos[RookN1] := 0;
                 pos[RookN2] := Rook;
                 with PieceTab[player,Rook and 15] do begin
                     RookPiece.piData := piData;
                     piN := RookN2;
                     piIsMove := true;
                 end;
                 {᪮�४��㥬 �業��}
                 delScore := delScore - StTab[player]^[RookN1] +
                             StTab[player]^[RookN2];

     delKey := delKey xor hKeys[player, pRook, glIndex8[ RookN1 ] ]  xor
               hKeys[player, pRook, glIndex8[ RookN2 ] ];

             end;
          end;


       end;
     end;{case}

   end;
end;


{����⠭�������� ������}
procedure UnMakeMove(var tag:TagMove; var pos:TBoard);
var
  color:integer;
begin
    with tag do begin
        pos[N2] := 0;
        pos[N1] := F;
        color := (F shr 4) and 3;
        PieceTab[color,F and 15].piData := Piece.piData;
        case kind of
            kNormal,kPawnPromote: exit;
            kCastling: begin
                pos[RookN2] := 0;
                pos[RookN1] := Rook;
                PieceTab[color,Rook and 15].piData := RookPiece.piData;
            end;
            else begin
                {�� ��६�饭�� � ���⨥�}
                pos[eatFN] := eatF;
                PieceTab[(eatF shr 4) and 3, eatF and 15].piData :=
                   eatPiece.piData;
            end;
        end;
    end;
end;


{���樠����� ����� ����}
procedure gInitNewGame(colorMachin:integer; var game:TGame);
begin
  FillChar(game,sizeof(TGame),0);
  game.gColorMachin := colorMachin;
end;

{室 �����}
function  gBackMove(var game:TGame):boolean;
begin
   with game do begin
       if gCurr <= 0 then gBackMove := false
       else begin
           gCurr := gCurr - 1;
           gBackMove := true;
       end;
   end;
end;

{�ॢ�襭� ������⢮ 室�� � ���}
function gGameOverflow(var game:TGame):boolean;
begin
    gGameOverflow := game.gCurr >= MAX_MOVES_IN_GAME;
end;

{室 ���।}
function gNextMove(var game:TGame):boolean;
begin
    with game do begin
        if (gCurr >= gMax) or gGameOverflow(game) then
          gNextMove := false
        else begin
           gCurr := gCurr + 1;
           gNextMove := true;
        end;
    end;
end;

{��⠢��� ���� 室}
function gInsertMove(var game:TGame; move:TMove):boolean;
begin
   with game do begin
       if gGameOverflow(game) then gInsertMove := false
       else begin
           gInsertMove := true;
           gMoves[gCurr] := move;
           gCurr := gCurr + 1;
           gMax := gCurr;
       end;
   end;
end;

{�����頥� ��᫥���� 室 � ���}
procedure gGetLastMove(var game:TGame; var move:TMove);
begin
  with game do begin
    if gCurr <= 0 then begin
       move.source := 0; move.dest := 0;
    end else begin
       move := gMoves[gCurr-1];
    end;
  end;
end;



{�����頥� ����஫��� �㬬� ���⮢��� ���ᨢ�}
function ControlSumm(var data; size:LongInt):LongInt;
var
 n,summ:LongInt;
 p:PByteArray;
begin
   p := @data;
   n := 0; summ := 0;
   while n < size do
   begin
       summ := summ + LongInt(p^[n]);
       n := n + 1;
   end;
   ControlSumm := summ;
end;




{�����頥� ⥪���� ������ � ���}
procedure gGetCurrPos(var game:TGame; var pos:TBoard);
const initPos:array[0..63] of byte =
(
  pRook,pKnight,pBishop,pQueen,pKing,pBishop,pKnight,pRook,
  pPawn,pPawn,pPawn,pPawn,pPawn,pPawn,pPawn,pPawn,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  pPawn,pPawn,pPawn,pPawn,pPawn,pPawn,pPawn,pPawn,
  pRook,pKnight,pBishop,pQueen,pKing,pBishop,pKnight,pRook
);
var
 n,piece,k,index16:integer;
 countBlack,countWhite:integer;
 tag:TagMove;
 summ1,summ2:LongInt;
 color,tmp:integer;
 tmpPiece:TPiece;
 P1,P2:PPiece;
 find:boolean;
begin
    {ᮧ����� ���⮢�� ������}
    FillChar(pos,sizeof(TBoard),cOut);
    {���㫨� ���� ����}
    for n := 0 to 63 do pos[ glIndex16[n] ] := 0;
    FillChar(PieceTab,sizeof(PieceTab),0);
    countBlack := 0; countWhite := 0;
    {���樠���㥬 ᯨ᪨ 䨣�� � �।�⠢����� ����樨}

for k := pKing to pPawn do begin
    for n := 0 to 63 do begin
       piece := InitPos[n];
       if piece = k then begin
       index16 := glIndex16[n];
         if n div 8  < 2 then begin
           {�ୠ� 䨣��}
           if countBlack < 16 then
           with PieceTab[cBlack,countBlack] do begin
               piN := index16;
               piPiece := piece;
               piColor := cBlack;
               piIsMove :=  false;
               pos[index16] := countBlack or (cBlack shl 4);
           end;
           countBlack := countBlack+1;
         end;
         if n div 8  > 5 then begin
           {����� 䨣��}
           if countWhite < 16 then
           with PieceTab[cWhite,countWhite] do begin
               piN := index16;
               piPiece := piece;
               piColor := cWhite;
               piIsMove :=  false;
               pos[index16] := countWhite or (cWhite shl 4);
           end;
           countWhite := countWhite+1;
         end;
       end;
    end;
end;

{������ �� ��६�饭�� � ��� �� ��砫�}
with game do begin

   for n := 0 to gCurr-1 do begin
     summ1 := ControlSumm(pos,sizeof(pos)) +
              ControlSumm(PieceTab,sizeof(PieceTab));

     MakeMove(gMoves[n].source, gMoves[n].dest, tag, pos);
     UnMakeMove(tag,pos);

     summ2 := ControlSumm(pos,sizeof(pos)) +
              ControlSumm(PieceTab,sizeof(PieceTab));

     if summ1 <> summ2 then
        summ1 := summ1;

     MakeMove(gMoves[n].source, gMoves[n].dest, tag, pos);

   end

end;


{㯫�⭨� ᯨ᪨ 䨣�� (�᫨ �쥫�)}
  n := 0;
  while n < countBlack do
  begin
      if PieceTab[cBlack,n].piPiece = pEmpty then
      begin
         n := n + 1;
         while n < countBlack do
         begin
             PieceTab[cBlack, n - 1] := PieceTab[cBlack,n];
             with PieceTab[cBlack,n-1] do
             if piPiece <> pEmpty then begin
               pos[piN] := (n-1) or (cBlack shl 4);
             end;
             n := n + 1;
         end;
         countBlack := countBlack - 1;
         n := 0;
      end else
        n := n + 1;
  end;


  n := 0;
  while n < countWhite do
  begin
      if PieceTab[cWhite,n].piPiece = pEmpty then
      begin
         n := n + 1;
         while n < countWhite do
         begin
             PieceTab[cWhite, n - 1] := PieceTab[cWhite,n];
             with PieceTab[cWhite,n-1] do
             if piPiece <> pEmpty then begin
               pos[piN] := (n-1) or (cWhite shl 4);
             end;
             n := n + 1;
         end;
         countWhite := countWhite - 1;
         n := 0;
      end else
        n := n + 1;
  end;



  PawnNo[cBlack] := countBlack-1;
  PawnNo[cWhite] := countWhite-1;


  {�᫨ �뫮 �ॢ�饭�� ��誨 - �㦭� ��� ᤢ����� �� ����
  ᯨ᪠}
  for color := cWhite to cBlack do
  begin
    repeat
      find := false;
      for n := PawnNo[color] downto 1 do
      begin
         P1 := @PieceTab[color,n-1];
         P2 := @PieceTab[color,n];
         if P2^.piPiece < P1^.piPiece then
         begin
            tmp := pos[ P1^.piN ];
            pos[ P1^.piN ] := pos[ P2^.piN ];
            pos[ P2^.piN ] := tmp;
            tmpPiece := P1^;
            P1^ := P2^;
            P2^ := tmpPiece;
            find := true;
         end;
      end;
     until not find;
  end;




  KnightNo[cBlack] := PawnNo[cBlack];
  while (KnightNo[cBlack] > 0) and
        (PieceTab[cBlack, KnightNo[cBlack]].piPiece = pPawn) do
        dec(KnightNo[cBlack]);

  KnightNo[cWhite] := PawnNo[cWhite];
  while (KnightNo[cWhite] > 0) and
        (PieceTab[cWhite, KnightNo[cWhite]].piPiece = pPawn) do
        dec(KnightNo[cWhite]);


end;{function}




 {�����頥� true �᫨ ���� square �⠪�����
 䨣�ࠬ� 梥� color }
 function AttackSquare(square,color:integer; var pos:TBoard):boolean;
 var
  k:integer;
 begin
        for k := 0 to PawnNo[color] do
        with PieceTab[color,k] do
        if (piPiece <> pEmpty) and
            Attack(piPiece,color,piN,square,pos) then
        begin
          AttackSquare := true;
          exit;
        end;
       AttackSquare := false;
 end;

 {�����頥� true �᫨ ��������
 ப�஢��  䨣�� color}
 function RightCastlingEnable(color:integer; var pos:TBoard):boolean;
 var
   kingN,rookN:integer;
   rookColor,rookIndex:integer;
   n:integer;
 begin
    RightCastlingEnable := false;
    with PieceTab[color,0] do begin
        if piIsMove then exit;
        kingN := piN;
    end;
    rookN := kingN + 3;
    rookColor := (pos[rookN] shr 4) and 3;
    if rookColor <> color then exit;
    rookIndex := pos[rookN] and 15;
    if PieceTab[color,rookIndex].piIsMove then exit;
    if pos[kingN+1] <> 0 then exit;
    if pos[kingN+2] <> 0 then exit;

    for n := kingN to rookN do
      if AttackSquare(n,ColorTab[color],pos) then
      exit;

      RightCastlingEnable := true;

 end;

 function LeftCastlingEnable(color:integer; var pos:TBoard):boolean;
 var
   kingN,rookN:integer;
   rookColor,rookIndex:integer;
   n:integer;
 begin
    LeftCastlingEnable := false;
    with PieceTab[color,0] do begin
        if piIsMove then exit;
        kingN := piN;
    end;
    rookN := kingN - 4;
    rookColor := (pos[rookN] shr 4) and 3;
    if rookColor <> color then exit;
    rookIndex := pos[rookN] and 15;
    if PieceTab[color,rookIndex].piIsMove then exit;
    if pos[kingN-1] <> 0 then exit;
    if pos[kingN-2] <> 0 then exit;
    if pos[kingN-3] <> 0 then exit;

    for n := kingN downto rookN do
      if AttackSquare(n,ColorTab[color],pos) then
      exit;

      LeftCastlingEnable := true;

 end;





END.