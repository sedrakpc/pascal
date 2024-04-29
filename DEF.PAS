{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}
unit def;
{
    ГЛОБАЛЬНЫЕ ОПРЕДЕЛЕНИЯ К TCHESS
}
INTERFACE
uses types;

CONST

  {цвета}
  cWhite = 1;
  cBlack = 2;
  {флаг выхода за пределы игрового поля}
  cOut   = 128;
TYPE
  TSquare = byte;
  {
   биты 4-5 - цвета
   0,1,2,3 - номер элемента списка фигур
   7 - флаг выхода за пределы доски
  }

  TBoard = array[0..16*16-1] of TSquare;
CONST
    {коды фигур}
    pEmpty = 0;
    pKing  = 1;
    pQueen = 2;
    pRook  = 3;
    pBishop = 4;
    pKnight = 5;
    pPawn   = 6;


    {веса фигур}
    wPawn = 200;
    wKnight = (3*wPawn);
    wBishop = wKnight;
    wRook = (5*wPawn);
    wQueen = (9*wPawn);
    wKing  = 0;
    INFINITY = 30000;

    {массив перекодировки кода фигуры в вес}
    _wf:array[0..6] of integer =
    (0,wKing,wQueen,wRook,wBishop,wKnight,wPawn);


TYPE
  {элемент списка фигур}
  TPiece = record
    case byte of
     0:(
       piN:byte;         {координата}
       piPiece:byte;     {фигура}
       piColor:byte;     {ее цвет}
       piIsMove:boolean; {перемещеалась ли фигура}
       );
     1:( piData:LongInt );
  end;
  PPiece = ^TPiece;

  {описатель перемещения}
  TMove = record
    case byte of
    1:(source,dest:byte);
    2:(data:word)
  end;



  {развернутый описатель перемещения
  эту структуру заполняет функция MakeMove и
  по ней функция UnMakeMove восстанавливает позицию}
  type
  TKind = (kNormal,
           kCapture,
           kEnPassant,
           kCastling,
           kPawnPromote,
           kPawnPromoteCapture);

  TagMove = record
    N1,N2,eatFN:integer;  {номера клеток}
    F,eatF:integer;       {содержимое клеток}
    kind:TKind;           {тип хода}
    Piece,eatPiece:TPiece;  {сохраненные элементы списков фигур}
    {только для рокировки}
    RookN1,RookN2:integer;
    Rook:integer;
    RookPiece:TPiece;

    delScore:integer; {приращение оценки при ходе}
    delKey:LongInt;
  end;

  {игра}
  const MAX_MOVES_IN_GAME = 400;
  TYPE
  TGame = record
     gMoves:array[0..MAX_MOVES_IN_GAME-1] of TMove;
     gCurr,gMax:integer;
     gColorMachin:integer;
     res1,res2,res3,res4:integer;
     Summ:LongInt; {контрольная сумма}
  end;


  {доски со стратегией}
  TStBoard = array[0..16*16-1] of integer;
  PStBoard = ^TStBoard;
  var BlackSt,WhiteSt:TStBoard;
  const StTab:array[cWhite..cBlack] of PStBoard =
  (@WhiteSt,@BlackSt);


VAR
 {списки фигур
 первый идет король - последние пешки}
 PieceTab:array[cWhite..cBlack,0..15] of TPiece;
 {максимальный индекс (смотря сколько фигур)}
 PawnNo:array[cWhite..cBlack] of integer;
 KnightNo:array[cWhite..cBlack] of integer;



{массивы перекодировик}
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

{массив перекодировки координат 8*8 в симлоьное представление}
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





{приращения при движении фигур}
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


  {еденица соответствует коор Y превращения пешки в ферзи}
  const PawnPromoteDesc:array[0..15] of byte =
  (0,0,0,0, 1,0,0,0, 0,0,0,1, 0,0,0,0);
  {ход пешки с 1 на 2 когда возможно взятие через битое поле }
  const PawnEnPassantDesc:array[0..15] of byte =
  (0,0,0,0, 0,0,2,1, 1,2,0,0, 0,0,0,0);
  {для определения хода рокировки}
  const CastlingDesc:array[0..15] of byte =
  (0,0,0,0, 0,0,3,0, 1,0,2,0, 0,0,0,0);
  {первый ход пешки}
  const PawnFirstMove:array[0..15] of byte =
  (0,0,0,0, 0,1,2,0, 0,2,1,0, 0,0,0,0);
  {первый ход пешки через клетку}
  const PawnExtMove:array[0..15] of byte =
  (0,0,0,0, 0,1,0,2, 2,0,1,0, 0,0,0,0);

  {в эту фигуру превращается пешка}
  const PawnNewPiece:integer = pQueen;




{////////////////  FUNCTIONS ///////////////////}
{
 возвращает true если
 фигуры piece цвета color
 стоящая на source бьет
 поле dest
 (кроме взятия пешки через битое поле)
}
FUNCTION Attack(Piece,Color,source,dest:integer; var pos:TBoard):boolean;
{строит линию между двумя точками}
FUNCTION VerifyLine(source,dest:integer; var pos:TBoard):boolean;
{делает перемещение}
procedure MakeMove(source,dest:integer; var tag:TagMove; var pos:TBoard);
{восстанавливает позицию}
procedure UnMakeMove(var tag:TagMove; var pos:TBoard);
{возвращает цвет клетки}
function GetColor(square:integer):integer;
{возвращает индекс фигуры в списке фигур}
function GetPieceIndex(square:integer):integer;
{возвращает текущую позицию в игре}
procedure gGetCurrPos(var game:TGame; var pos:TBoard);
{распаковывает байт позиции}
procedure UnPackSquare(square:integer; var out,index,color:integer);

{инициализует новую игру}
procedure gInitNewGame(colorMachin:integer; var game:TGame);
{ход назад}
function  gBackMove(var game:TGame):boolean;
{превышено количество ходов в игре}
function gGameOverflow(var game:TGame):boolean;
{ход вперед}
function gNextMove(var game:TGame):boolean;
{вставляет новый ход}
function gInsertMove(var game:TGame; move:TMove):boolean;
{возвращает последний ход в игре}
procedure gGetLastMove(var game:TGame; var move:TMove);

 {возвращает true если поле square атаковано
 фигурами цвета color }
 function AttackSquare(square,color:integer; var pos:TBoard):boolean;
 {возвращает true если возможна
 рокировка  фигур color}
 function RightCastlingEnable(color:integer; var pos:TBoard):boolean;
 function LeftCastlingEnable(color:integer; var pos:TBoard):boolean;

function ControlSumm(var data; size:LongInt):LongInt;

{////////////////////////   определение атаки //////////}
{вероятный шах}

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

  BASE = (16*7)+8-1; {коор. виртуального короля}
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


  {приращения при построении линии}
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
 возвращает true если
 фигуры piece цвета color
 стоящая на source бьет
 поле dest
 (кроме взятия пешки через битое поле)
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

    {строим линию между двумя точками}
    del := _del[source - dest + BASE];
    if del = 0 then exit;
    N := dest + del;
    while (N <> source) and (pos[N] = 0) do
       inc(N,del);

    Attack := N = source;

END;


{строит линию между двумя точками}
FUNCTION VerifyLine(source,dest:integer; var pos:TBoard):boolean;
VAR
 del,N:integer;
BEGIN

    VerifyLine := false;
    if (pos[source] = cOut) or (pos[dest] = cOut) then
      exit;

    {строим линию между двумя точками}
    del := _del[source - dest + BASE];
    if del = 0 then exit;
    N := dest + del;
    while (N <> source) and (pos[N] = 0) do
       inc(N,del);
    VerifyLine := N = source;
END;




{распаковывает байт позиции}
procedure UnPackSquare(square:integer; var out,index,color:integer);
begin
   color := (square shr 4) and 3;
   index := square and 15;
   out   := square and cOut;
end;

{возвращает цвет клетки}
function GetColor(square:integer):integer;
begin
    GetColor := (square shr 4) and 3;
end;
{возвращает индекс фигуры в списке фигур}
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
делает перемещение и вычисляет пошаговое приращение
оценки
корректируется значение поля в pos и списки фигур
заполняется развернутый описатель перемещения tag
он служит для восстановления позиции функцией
UnMakeMove
}
procedure MakeMove(source,dest:integer; var tag:TagMove; var pos:TBoard);
var
 player,opponent:integer;
 fX,fY:integer;
 findRook:boolean;
begin
   with tag do begin
     {обработаем простой ход -
     не взятие, не рокировка - их большинство}
     N1 := source;
     N2 := dest;
     F := pos[N1];
     player := (F shr 4) and 3; {извлеки цвет }



     opponent := ColorTab[player];
     eatPiece.piData := 0;

     {приращение оценки при ходе}
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
       {предположительно - простое взятие}
       eatFN := N2;
       eatF := pos[eatFN];
       with PieceTab[(eatF shr 4) and 3,  eatF and 15] do
       begin
           eatPiece.piData := piData;
           piPiece := pEmpty;
       end;
       kind := kCapture;
       {добавим вес сьеденой фигуры и стратегический прирост}
       delScore := delScore + _wf[ eatPiece.piPiece] +
                   StTab[opponent]^[eatFN];

       delKey := delKey xor
                 hKeys[opponent, eatPiece.piPiece, glIndex8[ eatFN ] ];
     end;

     pos[N1] := 0;
     pos[N2] := F;


     case Piece.piPiece of
       pPawn: begin
          {сдесь возможно взятие через битое поле
          и превращение пешки}
          fY := N2 shr 4;
          if PawnPromoteDesc[fY] <> 0 then begin
             {пешка превратилась в ферзи}
             PieceTab[player,F and 15].piPiece := PawnNewPiece;
             if kind = kCapture then
               kind := kPawnPromoteCapture
             else kind := kPawnPromote;
             {вычтем вес пешки и добавим вес ферзя}
             delScore := delScore - wPawn + _wf[PawnNewPiece];
             exit;
          end;



          if (kind = kNormal)  and
             (PawnEnPassantDesc[ N1 shr 4 ] = 1) and
             (PawnEnPassantDesc[ N2 shr 4 ] = 2) and
             ( (N1 and 15) <> (N2 and 15) ) then
          begin
              {взятие через битое поле}
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

             {добавим вес сьеденой фигуры и стратегический прирост}
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
                 {правая рокировка}
                 RookN1 := N2 + 1;
                 RookN2 := N2 - 1;
                 findRook := true;
             end;
             if CastlingDesc[N2 and 15] = 3 then begin
                 {правая рокировка}
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
                 {скорректируем оценку}
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


{восстанавливает позицию}
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
                {все перемещения со взятием}
                pos[eatFN] := eatF;
                PieceTab[(eatF shr 4) and 3, eatF and 15].piData :=
                   eatPiece.piData;
            end;
        end;
    end;
end;


{инициализует новую игру}
procedure gInitNewGame(colorMachin:integer; var game:TGame);
begin
  FillChar(game,sizeof(TGame),0);
  game.gColorMachin := colorMachin;
end;

{ход назад}
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

{превышено количество ходов в игре}
function gGameOverflow(var game:TGame):boolean;
begin
    gGameOverflow := game.gCurr >= MAX_MOVES_IN_GAME;
end;

{ход вперед}
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

{вставляет новый ход}
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

{возвращает последний ход в игре}
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



{возвращает контрольную сумму байтового массива}
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




{возвращает текущую позицию в игре}
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
    {создадим стартовую позицию}
    FillChar(pos,sizeof(TBoard),cOut);
    {обнулим поле игры}
    for n := 0 to 63 do pos[ glIndex16[n] ] := 0;
    FillChar(PieceTab,sizeof(PieceTab),0);
    countBlack := 0; countWhite := 0;
    {инициализуем списки фигур и представление позиции}

for k := pKing to pPawn do begin
    for n := 0 to 63 do begin
       piece := InitPos[n];
       if piece = k then begin
       index16 := glIndex16[n];
         if n div 8  < 2 then begin
           {черная фигура}
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
           {белая фигура}
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

{делаем все перемещения в игре от начала}
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


{уплотним списки фигур (если сьели)}
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


  {если было превращение пешки - нужно ферзя сдвинуть на верх
  списка}
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




 {возвращает true если поле square атаковано
 фигурами цвета color }
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

 {возвращает true если возможна
 рокировка  фигур color}
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