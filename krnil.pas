


{
    �ਬ�� ���� ��������-������ 
    �ࢨ��: 

    ��� ���� �� �����⭮� ���� 3*3 ���⪨ 

    ��ப� �� ��।� �⠢�� � ���⪠� - ���� ���⨪�, 
    ��ன ������ 
    �먣�뢠�� ��, �� ���� ������ ����� (���⨪�����, 
    ��ਧ��⠫���, ����������� - �� �����) 
  

    �ணࠬ�� ����ᠭ� �� TurboPascal7 
    �뢮� �����⢫���� � ⥪�⮢�� ०��� 
} 
uses crt; 
  

TYPE 
 SquareType = ( 
               EMPTY , {����} 
               CROSS , {���⨪} 
               NULL    {�����} 
             ); 
 {���ᨢ ����} 
 PosType = array[0..8] of SquareType; 

 {���⮢�� ������} 
const pos:PosType = 
( 
  EMPTY,EMPTY,EMPTY, 
  EMPTY,EMPTY,EMPTY, 
  EMPTY,EMPTY,EMPTY 
); 

{������ �㭪�� �����頥� true �᫨ � ���ᨢ� 
 ���� ���� �������� ����� ���⨪�� ��� �������} 
function EndGame( z:SquareType):boolean; 
begin 
{        ����� ���⮪ ��� ����來��� 
  0,1,2, 
  3,4,5, 
  6,7,8 
} 
  EndGame := true; 
  if (pos[0] = z) and (pos[1] = z) and (pos[2] = z) then exit; 
  if (pos[3] = z) and (pos[4] = z) and (pos[5] = z) then exit; 
  if (pos[6] = z) and (pos[7] = z) and (pos[8] = z) then exit; 
  if (pos[0] = z) and (pos[3] = z) and (pos[6] = z) then exit; 
  if (pos[1] = z) and (pos[4] = z) and (pos[7] = z) then exit; 
  if (pos[2] = z) and (pos[5] = z) and (pos[8] = z) then exit; 
  if (pos[0] = z) and (pos[4] = z) and (pos[8] = z) then exit; 
  if (pos[6] = z) and (pos[4] = z) and (pos[2] = z) then exit; 
  EndGame := false; 

end; 
  

{� ��୥� ���訩 室} 
var retPos:PosType; 

{�㭪�� �����} 
function Search(s:SquareType;        {��� 䨣���} 
                alpha,beta:integer;  {������ � ���ᨬ�} 
                ply:integer          {��㡨��} 
               ):integer; 
var 
 n,tmp:integer; 
 f,opS:SquareType; 
 findMove:boolean; 
begin 
  

    {��।���� 梥� 䨣�� ��⨢����} 
    if s = NULL then opS := CROSS 
      else opS := NULL; 

    {�᫨ ���� �������� ����� - ��୥� �業��} 
    if EndGame(opS) then begin 
        {��⨢��� � ��-㧫� ������ ����� 
         �� ��� �ந����} 
        Search := -1; 
        exit; 
    end; 
  

    {���� �� ��諨 �� ����� ᢮������ ���⪨} 
    findMove := false; 

    {��ॡ�६ �� ���⪨ ��᪨} 
    for n := 0 to 8 do 
    begin 
       f := pos[n]; 
       if f = EMPTY then begin 
         findMove := true; 
         {ᤥ���� 室} 
         pos[n] := s; 
         {�����} 
         tmp := -Search(opS,-beta,-alpha,ply+1); 
         if tmp > alpha then 
         begin 
            alpha := tmp; 
            if ply = 0 then 
              Move(pos,retPos,sizeof(PosType)); 
         end; 
         {����⠭���� ������} 
         pos[n] := EMPTY; 
         if alpha >= beta then break; 

       end; 
    end; 

    if not findMove then Search := 0 {�����} 
      else  Search := alpha; 
end; 
  
  

{�뢮��� ������ �� �࠭} 
procedure ShowPos; 
  function Ch(n:integer):char; 
  begin 
   if pos[n] = CROSS then  Ch :='*' 
      else if pos[n] = NULL then Ch := '0' 
      else Ch := ' '; 
  end; 

begin 
   Writeln('   -------'); 
   Write('   |', Ch(0), '|', Ch(1), '|', Ch(2), '|'); Writeln; 
   Writeln('   -------'); 
   Write('   |', Ch(3), '|', Ch(4), '|', Ch(5), '|'); Writeln; 
   Writeln('   -------'); 
   Write('   |', Ch(6), '|', Ch(7), '|', Ch(8), '|'); Writeln; 
   Writeln('   -------'); 
  

end; 
  
  

{�����頥� true �᫨ ����� ���} 
function GameOver:boolean; 
var 
 n:integer; 
begin 
    GameOver := false; 
    if not (EndGame(CROSS) or EndGame(NULL)) then 
    begin 
        for n := 0 to 8 do 
          if pos[n] = EMPTY then exit; 
    end; 
    GameOver := true; 
end; 
  

VAR 
  ch:integer; 
  tmp:integer; 
  n:integer; 
BEGIN 
HighVideo; 

 repeat 

    Writeln; 
    Writeln('/////////////////////////////////////////'); 
    ShowPos; 
    Writeln; 

    if GameOver then begin 
        for n := 0 to 8 do pos[n] := EMPTY; 
        Writeln('Game Over!!!'); 
        Writeln; 
        ShowPos; 
        Writeln; 
    end; 
  

    repeat 
      Write('Enter move number [0..8] or -1 (exit):'); Read(ch); 
    until  (ch = -1) or 
           ((ch >=0) and (ch <= 8) and (pos[ch] = EMPTY)) ; 
    if ch = -1 then break; 
    pos[ch] := CROSS; 

    if not GameOver then begin 
       tmp := Search(NULL,-2,2,0); 
       pos := retPos; 
    end; 
  

  until ch = -1; 
  

LowVideo; 
Writeln('done'); 
END. 
  
  
  
  
  
  

