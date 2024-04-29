uses crt,graph;
var d,i,i1,m,j,k,kk:integer;
c:char;
size:word;
p:pointer;
{********************menu***********}
procedure menu(q,w,e,r:integer);
begin
setfillstyle(1,q); setbkcolor(14);
bar(200,100,400,150);
 setfillstyle(1,w);
bar(200,170,400,220);
  setfillstyle(1,e);
bar(200,240,400,290);
 setfillstyle(1,r);
bar(200,310,400,360);
end;


   {************************ãŸ«å**********************}
   procedure  pahang;
   begin
   setbkcolor(9);
   cleardevice;
   setcolor(10);
   outtextxy(240,90,'˜ ª † ” î    N498');
   outtextxy(90,140,'ìîê€š ˆª N ‚ª€œ€ª ”ê ˆê €¦‚®¢ä ì”â” N*N ì€îîˆî â€î®òª€œ®¢:');
   outtextxy(90,160,'¦€ìî”ğ:¦€ìî”ğ  ˆê€ô®˜ˆ– €¨ªâˆè, ®î ø’€ª†€œ €ªœ¨®òª€„š” êî€ ');
   outtextxy(90,180,'„îê€š –”ª” €¦€â€ì€è˜€ª ì®¢” ô®öî€„®ò¨ª ì€îî:ìâˆ– èì€ğê€š');
   outtextxy(90,200,'¦€ìî”ğ:');
   outtextxy(240,360,'ìîê€š ˆª€šî€„îˆî.');
   outtextxy(90,380,'1.®î®¬ˆ– êˆœì®î” ¦”ª”¦®ò¦ ì€îî” €¦€î');
   outtextxy(90,400,'2.êˆœì®î” C-î† ˆê D-î† ì€îîˆî” ìˆ¢€ô®˜®ò¨®òª œ€ì€îˆ–:');
   outtextxy(290,460,'¦‰«©¯ó ë‰ï‡ç«—¯ó Ÿ§ï é‰™§‰÷ Esc éí‰£«');
   repeat until readkey=#27;
    end;
   {******************™«‡•ï*****************}
   procedure xndir;
 type masiv=array[1..10,1..10] of real;
     vec=array[1..10] of real;
 var s:string;
     ch2:char;
     n,m,i,j,q,mi,c,d:byte;
     code:integer;
     a:masiv;
     t:boolean;
     w:real;
     b:vec;
     f:file of real;
 function min(b1:vec;n1:byte):byte;
var i1,k1:byte;
    m1:real;
begin
m1:=b1[1];k1:=1;
for i1:=1 to n1 do
if (b1[i1]<m1) then begin m1:=b1[i1];k1:=i1;end;
min:=k1;
end;
procedure pox(var b2:vec;c2,d2:byte);
var k2:real;
begin
k2:=b2[c2];
b2[c2]:=b2[d2];
b2[d2]:=k2;
end;
Begin
setcolor(15);
setbkcolor(0);
repeat
cleardevice;
outtextxy(190,10,'ª‰ï§¯ó›‰— §íï•ñ• áõ(1<n<6)');
outtextxy(295,20,'n=');
s:='';
repeat
repeat
outtextxy(313,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
if code<>0 then n:=0;
until (n>1) and (n<6);
m:=n;
setfillstyle(1,10);

bar(320-m*30,140-n*20,320+m*30,140+n*20);
for i:=1 to n do
for j:=1 to m do begin
s:='';
repeat
setcolor(10);
outtextxy(328-m*30+(j-1)*55,165-n*25+(n-1)*6+(i-1)*30,s);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
t:=false;
s:='';
repeat
repeat
setcolor(4);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51)
or (ch2=#52) or (ch2=#53)or (ch2=#54) or (ch2=#55) or
(ch2=#56) or (ch2=#57) or(ch2=#46) or (ch2=#45) or(ch2=#13);
if (copy(s,1,1)='-')  then q:=6 else q:=5;
if length(s)<q then begin
if ch2<>#13 then s:=s+ch2 end
until (ch2=#13);
if pos(s,'-')<>0 then t:=false
else
begin
if (((copy(s,1,2)='-0') and (length(s)=2))
or ((copy(s,1,2)='-0') and (copy(s,3,1)<>'.'))
or ((copy(s,1,2)='-0') and (copy(s,length(s),1)='0')))
then t:=false
else begin
if (copy(s,1,1)='0') and (length(s)=1) then begin
val(s,w,code);t:=true end else begin
if (
((copy(s,1,1)='0') and (copy(s,2,1)<>'.')) or
((copy(s,1,1)='0') and (copy(s,length(s),1)='0'))
or (copy(s,length(s),1)='.'))
then t:=false
else begin
if (copy(s,1,1)='.') or (copy(s,1,2)='-.') then t:=false
else   begin
val(s,w,code);
if code<>0 then begin
if copy(s,1,1)<>'-' then t:=false;
if code=0 then begin
t:=true;w:=(-1)*w
end
end
else t:=true;
end
end
end
end
end;
if ((copy(s,1,1)<>'0') and (pos('.',s)>0) and (copy(s,length(s),1)='0'))
then t:=false
until t=true;


setcolor(14);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
a[i,j]:=w;
end;

setcolor(4);
outtextxy(50,250,'è‰£§•ï <Enter> §íï•ñ• íïï‰ï Tiko.dat û©—¯ó§ ãŸ‰—¯ó  Ÿ§ï');
readln;
assign(f,'Tiko.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
bar(328-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
328-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(6000);
delay(6000);
end;
close(f);
setcolor(0);
outtextxy(50,250,'è‰£§•ï <Enter> §íï•ñ• íïï‰ï Tiko.dat û©—¯ó§ ãŸ‰—¯ó  Ÿ§ï');

setcolor(4);
outtextxy(80,250,'è‰£§•ï <Enter> §íï•ñ• íïï‰ï ë‰ï«‘‰ïñ‰—¯ó  Ÿ§ï');
readln;
reset(f);
setcolor(14);
for i:=1 to n do
for j:=1 to m do begin
read(f,w);
a[i,j]:=w;
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
end;
{------------------------------------}
for i:=1 to n do begin
for j:=1 to n do b[j]:=a[i,j];
mi:=min(b,n);
pox(b,mi,n+1-i);
for j:=1 to n do a[i,j]:=b[j];
end;
{------------------------------------}
setfillstyle(1,7);
bar(320-(m)*30,380-(n)*20,320+(m)*30,380+(n)*20);
for i:=1 to n do
for j:=1 to m do begin
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
setcolor(15);
outtextxy(290-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;

    repeat until readkey=#27;
   end;


procedure govazd;
begin
  setbkcolor(0);
       cleardevice;
       setcolor(8);
        line(200,0,640,480);  line(380,195,460,195); line(460,116,596,262);
        line(460,0,460,284);  line(250,55,250,0);    line(460,40,596,182);
        line(596,430,640,430);line(460,204,596,350); line(460,36,596,178);
        line(596,430,596,0);  line(460,200,596,346); line(460,-44,596,98);
        line(380,195,380,0);  line(460,120,596,266); line(460,-48,596,94);
        line(596,350,640,350); line(596,266,640,266); line(596,183,640,183);
        line(596,347,640,347); line(596,263,640,263); line(596,180,640,180);
        line(596,100,640,100); line(596,97,640,97);   line(460,-128,596,14);
        line(460,-132,596,10); line(596,14,640,14);   line(596,11,640,11);
setfillstyle(1,3); floodfill(480,300,8); setfillstyle(1,3); floodfill(480,200,8);
setfillstyle(1,3); floodfill(630,360,8); setfillstyle(1,11); floodfill(630,340,8);
setfillstyle(1,3); floodfill(480,100,8);  setfillstyle(1,3); floodfill(630,190,8);
setfillstyle(1,3); floodfill(595,105,8); setfillstyle(1,11); floodfill(630,140,8);
setfillstyle(1,3); floodfill(595,50,8);  setfillstyle(1,3); floodfill(630,80,8);
setfillstyle(1,3); floodfill(595,6,8); setfillstyle(1,11); floodfill(630,8,8);
setcolor(8); line(550,0,550,300); line(505,0,505,247); line(0,325,120,489);
setfillstyle(1,11); floodfill(470,190,8); setfillstyle(1,11); floodfill(555,170,8);
setfillstyle(1,11); floodfill(530,170,8); setfillstyle(1,11); floodfill(530,80,8);
setfillstyle(1,11); floodfill(480,55,8); setfillstyle(1,11); floodfill(570,30,8);
setfillstyle(1,8); floodfill(638,470,8); setfillstyle(1,8); floodfill(440,240,8);
setfillstyle(1,green); floodfill(210,1,8); line(380,150,250,10);setcolor(0);
setfillstyle(1,6); floodfill(450,15,8);line(400,123,400,194);
line(400,123,450,123); line(450,123,450,194);line(402,125,402,194);line(402,125,448,125);
line(448,125,448,194); line(426,125,426,194);ellipse(422,165,0,360,2,2); setcolor(15);
line(400,110,400,100); line(400,110,404,110); line(400,100,404,100);line(400,105,404,105);
ellipse(400,102,320,43,6,3);ellipse(401,108,320,43,6,3); line(418,100,415,110);
line(417,106,420,106); line(429,100,429,110); line(429,100,433,110);line(418,100,421,110);
line(433,110,433,100); line(442,100,442,110); line(442,105,446,100);line(442,103,448,110);
setfillstyle(1,6); floodfill(320,15,8); setfillstyle(1,6); floodfill(320,90,8);setcolor(8);
line(360,0,360,128);line(340,0,340,106);line(320,0,320,85);line(300,0,300,64);
line(280,0,280,42); line(265,0,265,25); line(380,125,263,0);line(380,100,284,0);
line(380,75,305,0); line(380,50,328,0); line(380,28,350,0); line(380,8,370,0);
setfillstyle(1,green); floodfill(10,470,8); line(207,0,249,45); setfillstyle(1,7);
floodfill(214,14,8); line(0,336,105,481);setfillstyle(1,7);floodfill(70,430,8);
setfillstyle(1,8); floodfill(320,400,8);setcolor(0); line(170,0,363,215); line(460,215,460,219);
line(363,215,460,215); line(163,0,360,219); line(360,219,460,219);line(170,-2,165,-2);
setfillstyle(1,7);floodfill(168,2,0); line(396,263,460,263); line(387,260,460,260);
line(387,260,580,482); line(396,263,586,482);line(460,260,460,263); setfillstyle(1,7);
floodfill(457,262,0); ellipse(90,90,120,260,60,42); ellipse(130,90,300,80,60,40);
ellipse(73,65,123,330,20,14); ellipse(135,62,225,75,20,12); ellipse(105,68,160,15,15,10);
ellipse(94,120,7,230,23,15); ellipse(140,117,325,190,22,15); ellipse(112,90,0,360,30,7);
ellipse(60,115,0,360,2,4); ellipse(173,107,0,360,2,4); setfillstyle(1,0); floodfill(170,90,0);
setfillstyle(1,0); floodfill(80,90,0); setfillstyle(1,yellow); floodfill(140,90,0);
setfillstyle(1,4); floodfill(60,116,0); setfillstyle(1,4); floodfill(173,107,0); ellipse(130,160,0,360,60,30);
setfillstyle(1,0); floodfill(130,160,0); size:=imagesize(1,30,189,200); getmem(p,size);
getimage(1,30,189,200,p^); for i1:=1 to 25 do begin putimage(13*i1,34+17*i1,p^,0); delay(35000);end;
repeat until readkey=#27;   end;





 {***************************…—™ë¯ï ›ç…•ï****************************}
          BEGIN
    detectgraph(i,m);
 initgraph(i,m,'');

   REPEAT


cleardevice;setbkcolor(0);
K:=1;
REPEAT

CASE K OF

1: menu(3,2,2,2);
2: menu(2,3,2,2);
3: menu(2,2,3,2);
4: menu(2,2,2,3);
 end;
  settextstyle(0,0,2);
      setcolor(8);
     outtextxy(250,120,'âŸ«å');
     outtextxy(250,190,'–¯ó›¯ó§');
     outtextxy(250,260,'„¯ë‹‡');
     outtextxy(265,330,'ê‰ïå');
    settextstyle(0,0,1);

C:=READKEY;
IF (ORD(C)=80)  THEN K:=K+1;
IF (ORD(C)=72)  THEN K:=K-1;
IF K=5 THEN K:=1;
IF K=0 THEN K:=4;
UNTIL ORD(C)=13;
CASE K OF
 1: pahang ;
 2: xndir;
 3:govazd;
  end;
 until k=4; end.