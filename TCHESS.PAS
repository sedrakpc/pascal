{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}
{
              ***  ШАХМАТЫ ***




}

uses crt,def,types,graph,mouse,utils,think,uObj;


procedure vgadrv;external;
{$L vga.obj}


var  pic:PByteArray; {масик картинок}
     pos:TBoard;
     game:TGame;



LABEL
 done;

VAR
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;

 key:integer;
 mouseX,mouseY,countPress:integer;
 mouseEvent:boolean;
 bx,by:integer;
 oldKey,tmp:integer;
 color,index:integer;
 move,lastMove:TMove;


      procedure ThinkMachin;
      begin
               FillChar(Sel,sizeof(Sel),0);
               if CallSearch(game,pos,
                           move) then
               begin
                 if gInsertMove(game,move) then
                    gGetCurrPos(game,pos);
               end;
              Show(pos,pic,game.gColorMachin = cWhite);
              beep;
      end;


BEGIN

   LoadPic(pic);

 {
 grDriver := Detect;
 InitGraph(grDriver, grMode,' ');
 ErrCode := GraphResult;
 if ErrCode <> grOk then
 begin
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
   exit;
 end;
 }
 if RegisterBGIDriver(@vgadrv) < 0 then begin
     Writeln('Graphics error');
     halt;
 end;
 grDriver := VGA;
 grMode   := VGAHi;


 grDriver := VGA;
 grMode   := VGAHi;
 InitGraph(grDriver, grMode,'');
 ErrCode := GraphResult;
 if ErrCode <> grOk then begin
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
   halt
 end;



   MouseInit;
   MouseSpeed(4,4);
   MouseShow;

   if not LoadGame(game) then
     gInitNewGame(cBlack,game);
   gGetCurrPos(game,pos);
   Show(pos,pic,game.gColorMachin = cWhite);
   ShowLiters(game.gColorMachin = cWhite);

   {основной цикл программы}
   while true do
   BEGIN

      mouseEvent := false;

      if KeyPressed then begin
        {проверим нажатие клавиши}
        key := integer(ReadKey);
        case key of
           27: goto done;
           59: {F1}
              begin

                 ShowMenuDialog;

              end;
            1:  {Ctrl+A  просчет}
              begin
                ThinkMachin;
              end;
            26: {Ctrl+Z    назад}
              begin
               if gBackMove(game) then
               begin
                 FillChar(Sel,sizeof(Sel),0);
                 gGetCurrPos(game,pos);
                 Show(pos,pic,game.gColorMachin = cWhite)
               end else beep;
              end;
            24: {Ctrl+X  вперед}
              begin
               if gNextMove(game) then
               begin
                 FillChar(Sel,sizeof(Sel),0);
                 gGetCurrPos(game,pos);
                 Show(pos,pic,game.gColorMachin = cWhite)
               end else beep;

              end;

            19: {Ctrl-S  сохранение игры }
              begin
                 SaveGame(game);
              end;

            23: {Ctrl-W  новая игра белыми}
              begin
                FillChar(Sel,sizeof(Sel),0);
                gInitNewGame(cBlack,game);
                gGetCurrPos(game,pos);
                Show(pos,pic,game.gColorMachin = cWhite);
                ShowLiters(game.gColorMachin = cWhite);

              end;

            2:  {Ctrl-B новая игра черными}
              begin
                FillChar(Sel,sizeof(Sel),0);
                gInitNewGame(cWhite,game);
                gGetCurrPos(game,pos);
                Show(pos,pic,game.gColorMachin = cWhite);
                ShowLiters(game.gColorMachin = cWhite);
                ThinkMachin;
              end;
        end;
      end else begin

          mouseButtonDown(LEFT_BUTTON,   {какая кнопка}
                          countPress,    {сколько раз была нажата}
                          mouseX,        {координаты последнего}
                          mouseY          {нажатия}
                          );
            if countPress <> 0 then
              mouseEvent := true;
      end;


      if mouseEvent then
      begin
         bx := (mouseX - BOARD_LEFT) div FigureWidth;
         by := (mouseY - BOARD_TOP) div FigureHeight;
         if (word(bx) < 8) and (word(by) < 8) then
         begin
           if game.gColorMachin = cWhite then begin
              {инвертируем координаты мыши}
              tmp := by*8  + bx;
              tmp := 63 - tmp;
              by := tmp shr 3;
              bx := tmp and 7;
           end;

          index := glIndex16[ by*8 + bx];
          if Sel[by*8 + bx] <> 0 then
          begin
            FillChar(Sel,sizeof(Sel),0);
            move.source := StartSquare;
            move.dest := index;
            if gInsertMove(game,move) then
            begin
                {move of player}
                gGetCurrPos(game,pos);
                Show(pos,pic,game.gColorMachin = cWhite);

                {reply machin}
                ThinkMachin;
            end else beep;

          end else  if pos[index] <> 0 then
          begin
            FillChar(Sel,sizeof(Sel),0);
            color := (pos[index] shr 4) and 3;
            gGetLastMove(game,lastMove);

            if (color = cWhite) or
               ((color = cBlack) and (game.gColorMachin = cWhite)) then
            begin
               if not FillSel(index,
                             pos,color,ColorTab[color],
                             lastMove) then
                   beep;
            end else beep;
            Show(pos,pic,game.gColorMachin = cWhite)

          end else beep;

         {/////// end mouse click on board ////////}
         end;
      end; {mouseEvent}



      {????}
      if (key <> oldKey) or mouseEvent
      then begin
        glStatusStr1 := 'Key-'+IntToStr(key)+
                        ' mX-'+IntToStr(mouseX)+
                        ' mY-'+IntToStr(mouseY)+
                        ' ' + IntToStr(bx) + ' '+
                        IntToStr(by) + '            '
                        ;
        BlipStr(STR1_LEFT,STR1_TOP,8,8,BACK_COLOR,FONT_COLOR,
                      glStatusStr1);
        oldKey := key;
      end;
      {????}

   END;
   {/////  end main loop ///////////////}

  



done:
   MouseClose;
   CloseGraph;




END.