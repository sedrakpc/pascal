{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}




unit utils;
{
 вспомогательные функции к шахматам
}
INTERFACE
uses crt,graph,mouse,types,def,dos,font8_8;

CONST
 FigureWidth = 50;   {клетки доски}
 FigureHeight = 50;
 BOARD_LEFT = 20;
 BOARD_TOP  = 20;
 FONT_COLOR = WHITE;
 BACK_COLOR = BLACK;
 {координаты строк статуса}
  STR1_LEFT = BOARD_LEFT+FigureWidth*8+20;
  STR1_TOP  = 300;
  STR2_LEFT = STR1_LEFT;
  STR2_TOP  = STR1_TOP+20;
  STR3_LEFT = STR1_LEFT;
  STR3_TOP  = STR2_TOP+20;
{  STR4_LEFT = STR1_LEFT;
  STR4_TOP  = STR3_TOP+20;}
  STR4_LEFT = BOARD_LEFT;
  STR4_TOP  = BOARD_TOP+FigureWidth*8+20;
  STR5_LEFT = BOARD_LEFT;
  STR5_TOP  = STR4_TOP + 14;

  {строки статуса}
  glStatusStr1:string = '';
  glStatusStr2:string = '';
  glStatusStr3:string = '';
  glStatusStr4:string = '';
  glStatusStr5:string = '';


{стартовая координата фигуры}
const StartSquare:integer = 0;
{массив выделенных клеток - куда фигура может пойти}
const Sel:array[0..63] of byte =
(
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0
);

(*
{загружает маски картинок}
procedure LoadPic(var pic:PByteArray);
*)
{звуковой сигнал}
PROCEDURE Beep;
PROCEDURE Show(var pos:TBoard; pic:PByteArray; invert:boolean);
procedure ShowLiters(invert:boolean);
FUNCTION GetTickCount:LongInt;
function IntToStr(I: Longint): String;
procedure BlipStr(left,top,width,height,backColor,fontColor:integer;
                    str:string);

procedure BlipChar(left,top,width,height,backColor,fontColor:integer;
                    ch:char);
{выводит меню}
PROCEDURE ShowMenuDialog;

{устанавливает в 1 клетки массива Sel на которые может
переместиится фигура с координатой FN}
function FillSel( FN:integer;
                  var pos:TBoard; player,opponent:integer;
                  lastMove:TMove):boolean;

FUNCTION LoadGame(var game:TGame):boolean;
PROCEDURE SaveGame(var game:TGame);

IMPLEMENTATION

(*
{загружает маски картинок}
procedure LoadPic(var pic:PByteArray);
var
 f:FILE;
 size:word;
begin
   Assign(f, 'pic.dat'); { Open input file }
   Reset(f, 1);  { Record size = 1 }
   size := FileSize(f);
   GetMem(pic,size+1);
   BlockRead(f, pic^, size);
   Close(f);
end;
*)

{звуковой сигнал}
PROCEDURE Beep;
begin
  Sound(1000);        { Beep }
  Delay(10);        { For 200 ms }
  NoSound;           { Relief! }
end;

{показывает шахматную фигуру}
procedure ShowFigure(left,top,number:word; pic:PByteArray);
var
 p:PByteArray;
 x,y,mask,color:integer;
begin

  p := @pic^[number*FigureWidth*FigureHeight];

  for y := 0 to FigureHeight-1 do for x := 0 to FigureWidth-1 do
  begin
     mask := p^[y*FigureWidth + x];
     if (mask = 0) then color := BLACK
     else color := LightGray;
     PutPixel(left+x,top+y,color);
  end;

end;

PROCEDURE RotateByteArray(var data; min,max:integer);
VAR
 tmp:integer;
 p:PByteArray;
BEGIN
   p := @data;
   while min < max do
   begin
      tmp := p^[min];
      p^[min] := p^[max];
      p^[max] := tmp;
      inc(min);
      dec(max);
   end;
END;



{показывает доску
всегда показывает текущую позицию в игре
}


PROCEDURE Show(var pos:TBoard; pic:PByteArray; invert:boolean);
{это массив служит для того, чтобы не
перерисовывать напрасно ннеизмененные
клетки доски
}
const saveCh:array[0..63] of integer =
(
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1,
  -1,-1,-1,-1,-1,-1,-1,-1
);

{массив - 1 - черная клетка, 0 - белая}
const Desc:array[0..63] of byte =
(
  0,1,0,1,0,1,0,1,
  1,0,1,0,1,0,1,0,
  0,1,0,1,0,1,0,1,
  1,0,1,0,1,0,1,0,
  0,1,0,1,0,1,0,1,
  1,0,1,0,1,0,1,0,
  0,1,0,1,0,1,0,1,
  1,0,1,0,1,0,1,0
);


VAR
 n,k:integer;
 index:integer;
 x,y:integer;
 index16:integer;
 piece,color:integer;
 x1,y1,x2,y2:integer;
 selCh,setCh:integer;
BEGIN


   MouseHide;

   for n := 0 to 63 do
   begin
       if invert then k := 63-n
         else k := n;

       x := n and 7;
       y := n shr 3;
       index16 := glIndex16[k];

       piece := pEmpty;
       color := 0;

       if pos[index16] <> 0 then
       begin
         color := (pos[index16] shr 4) and 3;
         piece := PieceTab[color,pos[index16] and 15].piPiece;
       end;


       selCh := sel[k];
       setCh := (color shl 8) + piece + (selCh shl 12);
       if setCh = saveCh[n] then continue;
       saveCh[n] := setCh;



      {индекс показываемой фигуры}
         if piece = pEmpty then
         begin
            if Desc[n] <> 0 then index := 24
              else index := 25;
         end else begin
            if color = cBlack then index := piece-1
              else index := piece-1+12;
            if Desc[n] = 0 then inc(index,6);
         end;
         ShowFigure(BOARD_LEFT + x*FigureWidth,
                    BOARD_TOP + y*FigureHeight,
                    index,pic);
   end;

   {выводим выделенные клетки}
     if invert then
        RotateByteArray(sel,0,63);
     for y := 0 to 7 do for x := 0 to 7 do
     begin
         if Sel[y*8+x] <> 0 then
         begin
            x1 := BOARD_LEFT+x*FigureWidth;
            y1 := BOARD_TOP+y*FigureHeight;
            x2 := BOARD_LEFT+x*FigureWidth + FigureWidth -1;
            y2 := BOARD_TOP+y*FigureHeight + FIgureHeight-1;


            Line(x1,y1,x2,y1);
            Line(x1,y1,x1,y2);

            if (x+1 > 7) or (sel[y*8+x+1] = 0) then
              Line(x2,y1,x2,y2);

            if (y+1 > 7) or (sel[(y+1)*8+x] = 0) then
              Line(x1,y2,x2,y2);
         end;
     end;

     if invert then
        RotateByteArray(sel,0,63);

   MouseShow;

END;


FUNCTION GetTickCount:LongInt;
VAR
  Hour, Minute, Second, Sec100: Word;
BEGIN
     GetTime(Hour, Minute, Second, Sec100);
     GetTickCount := LongInt(Hour)*60*60 +
                     LongInt(Minute)*60 +
                     LongInt(Second);
END;

function IntToStr(I: Longint): String;
{ Convert any integer type to a string }
var
 S: string[11];
begin
 Str(I, S);
 IntToStr := S;
end;



procedure ShowLiters(invert:boolean);
var
 x,y:integer;
begin

      {рисуем буквы, обозначающие клетки доски}
      MouseHide;

      if invert then begin
         for y := 0 to 7 do
           BlipStr (BOARD_LEFT-10,
                    BOARD_TOP+y*FigureHeight + FigureHeight div 2,
                    8,8,BACK_COLOR,FONT_COLOR,
                    IntToStr(y+1));

{           BlipStr(left,top,width,height,backColor,fontColor:integer;
                    ch:char);}
         for x := 0 to 7 do
            BlipStr(BOARD_LEFT+x*FigureWidth + FigureWidth div 2,
                    BOARD_TOP+8*FigureHeight+5,
                    8,8,BACK_COLOR,FONT_COLOR,
                    chr( ord('h') - x ));

      end else begin
         for y := 0 to 7 do
          BlipStr(BOARD_LEFT-10,
                    BOARD_TOP+y*FigureHeight + FigureHeight div 2,
                    8,8,BACK_COLOR,FONT_COLOR,
                    IntToStr(8-y));
         for x := 0 to 7 do
          BlipStr(BOARD_LEFT+x*FigureWidth + FigureWidth div 2,
                    BOARD_TOP+8*FigureHeight+5,
                    8,8,BACK_COLOR,FONT_COLOR,
                    chr( ord('a') + x ));
      end;

         {надпись о help}
         BlipStr(500,400,8,10,BACK_COLOR,FONT_COLOR,
                 'F1 - Help');
         {название программы}
         BlipStr(480,60,16,16,BACK_COLOR,FONT_COLOR,
                   'Chess');

    MouseShow;
end;


 procedure BlipChar(left,top,width,height,backColor,fontColor:integer;
                    ch:char);
 var
 index:integer;
 x,y,value,romY,romX,mask:integer;
 begin


     for y := 0 to height-1 do
     begin
       romY := 8 * y div height;
       value := Font8_8_[ integer(ch)*8 + romY ];
        for x := 0 to width-1 do
        begin
           romX := 8 * x div width;
           mask := 1 shl (7 - romX);
           if (value and mask) <> 0 then
             PutPixel(left+x,top+y,fontColor)
           else
             PutPixel(left+x,top+y,backColor);
        end;
      end;
 end;



 procedure BlipStr(left,top,width,height,backColor,fontColor:integer;
                    str:string);
 var
  n:integer;
 begin
   n := 1;
   while n <= length(str) do begin
     BlipChar(left,top,width,height,backColor,fontColor,str[n]);
     left := left + width;
     n := n + 1;
   end;
 end;



{заполняет прямоугольник цветом фона}
PROCEDURE ClearPlace(x1,y1,x2,y2:integer);
BEGIN
     SetViewPort(x1, y1,x2,y2, ClipOn);
     ClearViewPort;
     SetViewPort(0,0,GetMaxX,GetMaxY, ClipOn);
END;


{выводит меню}
PROCEDURE ShowMenuDialog;
CONST
 M_WIDTH  = 200;
 M_HEIGHT = 200;
 M_LEFT  = (BOARD_LEFT+FigureWidth*4) - M_WIDTH div 2;
 M_TOP   = (BOARD_TOP+FigureHeight*4) - M_HEIGHT div 2;
 M_RIGHT = M_LEFT + M_WIDTH;
 M_BOTTOM = M_TOP + M_HEIGHT;
 M_DEL_Y  = 20;
var
 buf:array[0..30000] of byte;
 X,Y:integer;

BEGIN
    while keyPressed do ReadKey;
    MouseHide;

    GetImage(M_LEFT,M_TOP,M_RIGHT,M_BOTTOM,buf);
    ClearPlace(M_LEFT,M_TOP,M_RIGHT,M_BOTTOM);
    Rectangle(M_LEFT+2,M_TOP+2,M_RIGHT-2,M_BOTTOM-2);

    X := M_LEFT+20;
    Y := M_TOP+20;


    OutTextXY(X,Y,'Chess ver. 002  2003');
    Y := Y + 10;
    OutTextXY(X,Y,'CopyRight Korniloff E');
    Y := Y + 10;
    OutTextXY(X,Y,'e_k@sbor.net');
    Y := Y + M_DEL_Y;
    OutTextXY(X,Y,'Ctrl-A    -  Go');
    Y := Y + M_DEL_Y;
    OutTextXY(X,Y,'Ctrl-W(B) -  New');
    Y := Y + M_DEL_Y;
    OutTextXY(X,Y,'Ctrl-Z    -  Back');
    Y := Y + M_DEL_Y;
    OutTextXY(X,Y,'Ctrl-X    -  Next');
    Y := Y + M_DEL_Y;
    OutTextXY(X,Y,'Esc       -  Exit');
    Y := Y + M_DEL_Y;
    OutTextXY(X,Y,'Press any key...');

    ReadKey;
    PutImage(M_LEFT, M_TOP,buf, NormalPut);

    MouseShow;
END;

{устанавливает в 1 клетки массива Sel на которые может
переместиится фигура с координатой FN}
function FillSel( FN:integer;
                  var pos:TBoard; player,opponent:integer;
                  lastMove:TMove):boolean;
procedure AddMove(N2:integer);
begin
   Sel[ glIndex8[N2] ] := 1;
   FillSel := true;
end;
var
 n,k:integer;
 N1,N2:integer;
 piece:integer;
 j:integer;
 lastPiece:integer;


begin

    FillChar(Sel,sizeof(Sel),0);
    StartSquare := FN;
    FillSel := false;

    lastPiece := 0;
    if lastMove.data <> 0 then lastPiece :=
       PieceTab[opponent,pos[lastMove.dest] and 15].piPiece;

    {взятия}
    for n := 0 to PawnNo[opponent] do
      if PieceTab[opponent,n].piPiece <> pEmpty then
      begin
        for k := PawnNo[player] downto 0 do
        if (PieceTab[player,k].piPiece <> pEmpty) and
           (PieceTab[player,k].piN = FN)
        then
        begin
           N1 := PieceTab[player,k].piN;
           N2 := PieceTab[opponent,n].piN;
           piece := PieceTab[player,k].piPiece;
           if Attack(piece,player,N1,N2,pos) then
             AddMove(N2);
        end;
      end;


     {остальные перемещения}
     for k := PawnNo[player] downto 0 do
       with PieceTab[player,k] do
       if piN = FN then
       case piPiece of
         pEmpty: ;
         pPawn: begin
            N2 := piN + DirPawn[player];
            if pos[N2] = 0 then
            begin
                AddMove(N2);
                if (PawnFirstMove[piN shr 4] = 1) and
                   (PawnFirstMove[N2 shr 4]  = 2) then
                begin
                   N2 := N2 + DirPawn[player];
                   if pos[N2] = 0 then
                     AddMove(N2);
                end;
            end;
            {взятие через битое поле}
            if (lastPiece = pPawn) and
               (PawnExtMove [lastMove.source shr 4] = 1) and
               (PawnExtMove [lastMove.dest shr 4] = 2) and
               ( (piN shr 4) = (lastMove.dest shr 4) ) and
               (
                ( piN+1 = lastMove.dest) or
                ( piN-1 = lastMove.dest)
               )then
             begin
                 N2 := LastMove.dest + DirPawn[player];
                 AddMove(N2);
             end;

         end;

         pKnight:begin
           for j := 0 to 7 do
           begin
              N2 := piN + DirTab[piPiece,j];
              if pos[N2] = 0 then
                AddMove(N2);
           end;
         end;

         pKing:begin
           for j := 0 to 7 do
           begin
              N2 := piN + DirTab[piPiece,j];
              if (pos[N2] = 0) and
                 not AttackSquare(N2,opponent,pos)
              then
                AddMove(N2);
           end;


           {рокировки}
           if piIsMove = false then
           begin
            if RightCastlingEnable(player,pos) then
              AddMove(piN + 2);
            if LeftCastlingEnable(player,pos) then
              AddMove(piN - 2);


           end;
         end;


         else begin
           j := 0;
           while DirTab[piPiece,j] <> 0 do
           begin
              N2 := piN + DirTab[piPiece,j];
              while pos[N2] = 0 do
              begin
                AddMove(N2);
                N2 := N2 + DirTab[piPiece,j];
              end;
              j := j + 1;
           end;
         end;
       end;

end;


CONST
  GAME_FILE_NAME = 'chess.dat';
FUNCTION LoadGame(var game:TGame):boolean;
VAR
 f:FILE;
 numberRead:word;
 summ:LongInt;
BEGIN
   LoadGame := false;
   FillChar(game,sizeof(TGame),0);
   {$I-}
   Assign(f, GAME_FILE_NAME); { Open input file }
   Reset(f, 1);  { Record size = 1 }
   {$I+}
   if IOResult <> 0 then
      exit;

   BlockRead(f,game,sizeof(TGame),numberRead);
   Close(f);

   summ :=  ControlSumm(game,sizeof(TGame)-sizeof(game.summ));
   if  ( numberRead <> sizeof(TGame))  or
       (summ <> game.summ) then
      exit;

   LoadGame := true;
END;


PROCEDURE SaveGame(var game:TGame);
VAR
 f:FILE;
BEGIN
   game.Summ := ControlSumm(game,sizeof(TGame)-sizeof(game.summ));
   {I-}
   Assign(f,GAME_FILE_NAME);
   Rewrite(f,1);
   BlockWrite(f,Game,sizeof(TGame));
   Close(f);
   {I+}
END;




END.