Program LCDFonts;

Uses  Graph;

const InterRows = 20;            { Blank pixels between two rows }
      PathToBGI = 'C:\BP\BGI';   { Insert your path here! }
      FontName     : array[1..4] of string[4] = ('LCNE', 'LCDN', 'LCLE', 'LCDL');

var   Driver, Mode : integer;
      ErrCode      : integer;
      UserFont     : array[1..4] of integer;
      i            : byte;


begin
   for i := 1 to 4 do
      begin
         UserFont[i] := InstallUserFont(FontName[i]);
         if GraphResult <> grOk then
            begin
               WriteLn('Error installing ', FontName[i], '.CHR');
               halt(1)
            end
      end;

   Driver := detect;
   InitGraph(Driver, Mode, PathToBGI);
   ErrCode := GraphResult;
   if ErrCode <> grOk then
      begin
         WriteLn('Graphics error: ', GraphErrorMsg(ErrCode));
         halt(1)
      end;

   bar(0,0, GetMaxX,GetMaxY);    { White background }
   SetColor(black);
   SetTextJustify(LeftText, TopText);
   MoveTo(30,30);

   for i := 1 to 4 do
      begin
         SetTextStyle(UserFont[i], HorizDir, 4);
         ErrCode := GraphResult;
         if ErrCode <> grOK then
         begin
            CloseGraph;
            WriteLn('Graphics error: ', GraphErrorMsg(ErrCode));
            halt(1)
         end;
         OutText('0123456789');
         MoveTo(30, GetY + TextHeight('0') + InterRows)
      end;

   SetTextJustify(CenterText, TopText);
   SetTextStyle(DefaultFont, HorizDir, 1);
   OutTextXY(GetMaxX div 2, GetMaxY - 20, '* PRESS ENTER *');
   ReadLn;
   CloseGraph
end.
