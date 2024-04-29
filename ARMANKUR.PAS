program game;
uses crt,graph;
label 1;
var x,y:integer;
i,k,m:byte;ch,ch1:char;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
procedure init;
var GD,GM,EC:integer;
begin
GD:=detect;
initgraph(GD,GM,'');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
end;
{////////////////////\\\\\\\\\\\\\\\\\\\}
procedure xnddrv;
begin
 cleardevice;
     setbkcolor(0);
       setcolor(4);
     settextstyle(0,0,0);
     outtextxy(10,160,'    1. «‡ο• †ολ›χ');
     setcolor(2);
     outtextxy(110,180,'μολ› ‰« M,N ƒ«« ‘λ‰ο ‰λ •ο« ν•γ• M*N νοο‰ο γο―σ«―£');
     outtextxy(110,200,'§νο•ρ:‹§‰— ƒ—―-ι™‰§ ‰λ ›ο…•ο ―ο §νο•ρ• ƒ―—―ο —―—')  ;
     outtextxy(110,220,'§χι•§―σ§«‰ο• «­««‰ο υ―™ο•«•  ‡ο΅ «­««‰ο―λ:–―— §χι•-');
     outtextxy(110,240,'§―σ§  ―αλ―σ§ §νο•ρ• ©« νο,―ο §‰›  •ο‰« ο‰λ« νο‰ο•ρ:');
     setcolor(4);
     outtextxy(10,270,'    2.•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο');
     setcolor(2);
     outtextxy(110,290,'‘‰ λ‰ν―ο• νοο‰ο υ―χο ‰« νολ› C ‘λ•ρ λ‰ο‡ο΅«‰— true η.');
     outtextxy(110,310,'‡‰γχ―σ§` false');
     outtextxy(110,330,'κ‰ν―ο• k-ο‡ νοο• ο“‰χ ‡ο΅«‰— λιο d-•:');
     setcolor(15);
     outtextxy(50,50,'  ―ι©« €ο§« 621-3');
repeat
until readkey=#27;
cleardevice;
end;
procedure   Xndlucum;
type masiv=array[0..10,0..10] of real;
     vec=array[1..10] of real;
var s:string;
ch2:char;
n,m,i,j,ss,q,k:byte;
code:integer;
a,b:masiv;
t:boolean;
min,w:real;
d:vec;
f:file of real;
function bool(var b1:vec;n1:byte;c1:real):boolean;
var t1:boolean;
    i1:byte;
begin
t1:=true;
for i1:=1 to n1 do
if b1[i1]>=c1 then begin t1:=false;break;end;
bool:=t1;
end;
procedure pox(var b2:vec;k2:byte;d2:real);
var j2:byte;
begin
b2[k2]:=d2;
end;
Begin
Settextstyle(0,0,0);
setcolor(15);
repeat
cleardevice;
outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6,1<m<10)');
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
outtextxy(295,30,'m=');
repeat
setfillstyle(1,0);
bar(295,30,640,40);
outtextxy(295,30,'m=');
s:='';
repeat
repeat
outtextxy(313,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,m,code);
if code<>0 then m:=0;
until (m>1) and (m<9);
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
a[i,j]:=w;b[i,j]:=w;
end;

setcolor(4);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Arman.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
setcolor(0);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Arman.dat ϋ©—―σ§ γ‰—―σ  §ο');
setcolor(4);
outtextxy(290,250,'„ο«ρσ§');
assign(f,'Arman.dat');
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
outtextxy(290,250,'„ο«ρσ§');
setcolor(4);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
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
min:=a[1,1];
for i:=1 to n do
for j:=1 to m do
if a[i,j]<min then min:=a[i,j];
for i:=0 to n+1 do
for j:=0 to m+1 do
if (i=0) or (j=0) or (i=n+1) or (j=m+1) then b[i,j]:=min;
for i:=1 to n do
for j:=1 to m do begin
d[1]:=b[i,j-1];
d[2]:=b[i,j+1];
d[3]:=b[i-1,j-1];
d[4]:=b[i-1,j+1];
d[5]:=b[i+1,j-1];
d[6]:=b[i+1,j+1];
d[7]:=b[i+1,j];
d[8]:=b[i-1,j];
if bool(d,8,a[i,j]) then begin
for k:=1 to m do d[k]:=a[i,k];
pox(d,j,(-1)*a[i,j]);
for k:=1 to m do a[i,k]:=d[k];
end;
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
outtextxy(275-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;

repeat
until readkey=#27;
cleardevice;
end;
procedure clear;
begin
setcolor(0);Settextstyle(7,0,4);
outtextxy(440,5,'Exit Game');
setcolor(15);Settextstyle(7,0,1);
outtextxy(140,150,'Are you sure that you want to exit');
setfillstyle(1,15);setcolor(15);
bar(200,100,450,300);
end;
{////////////////////\\\\\\\\\\\\\\\\\\\}
procedure poly;
begin
setbkcolor(0);setcolor(15);setfillstyle(1,15);
line(110,30,40,440);line(40,440,590,370);
line(590,370,520,70);line(520,70,110,30);
setfillstyle(15,1);floodfill(320,240,white);
end;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
{procedure graphika;
begin

end;}
{\\\\\\\\\\\\\\\\\\\\////////////////////}
procedure menu(k:byte);
begin
case k of
1:begin setfillstyle(1,2);setcolor(2);delay(5000);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,2);
setfillstyle(1,15);setcolor(15);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,15);
line(290,275,340,270);line(340,270,360,310);
line(360,310,275,305);line(290,275,275,305);
floodfill(290,290,15);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,15);
end;
2:begin
setfillstyle(1,2);setcolor(2);delay(5000);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,2);
setfillstyle(1,15);setcolor(15);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,15);
line(290,275,340,270);line(340,270,360,310);
line(360,310,275,305);line(290,275,275,305);
floodfill(290,290,15);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,15);
end;
3:begin
setfillstyle(1,2);setcolor(2);delay(1000);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,2);
setfillstyle(1,15);setcolor(15);delay(2000);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,15);
line(290,275,340,270);line(340,270,360,310);
line(360,310,275,305);line(290,275,275,305);
floodfill(290,290,15);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,15);
end;
4:begin
setfillstyle(1,2);setcolor(2);delay(1000);
line(290,275,340,270);line(340,270,360,310);
line(360,310,275,305);line(290,275,275,305);
floodfill(290,290,2);
setfillstyle(1,15);setcolor(15);delay(2000);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,15);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,15);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,15);
end;
end;
setcolor(13);Settextstyle(0,0,0);
outtextxy(305,285,'—χ');
outtextxy(285,245,'„οϋ•');
outtextxy(260,160,'«‡ο• ‡ολ›χ');
outtextxy(265,205,'«‡ο• —―σ›―σ§');
end;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
procedure newgame;
var ch:char;
begin
setcolor(13);Settextstyle(7,0,4);
outtextxy(520,5,'Menu');
repeat menu(k);
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#13) or (ch=#27);
if ch=#27 then halt;
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if k<1 then k:=4;
if k>4 then k:=1;
until ch=#13;
case k of
1:begin end;
2:begin end;
3:begin end;
4:begin
setfillstyle(1,15);setcolor(1);
bar(200,100,450,350);
setcolor(0);Settextstyle(7,0,4);
outtextxy(520,5,'Menu');
setcolor(13);Settextstyle(7,0,4);
outtextxy(440,5,'Exit Game');
setcolor(13);Settextstyle(7,0,1);
outtextxy(140,150,'Are you sure that you want to exit');m:=1;
{\\\\\\\\\\\\\\\\\\\\\\\\\\///////////////////}
repeat
case m of
1:begin
setfillstyle(1,15);setcolor(15);delay(2000);
line(294,211,335,216);line(335,216,343,238);
line(343,238,290,241);line(294,211,290,241);
floodfill(300,220,15);
setfillstyle(1,2);setcolor(2);
line(285,180,335,175);line(335,175,342,205);
line(342,205,279,208);line(285,180,279,208);
floodfill(290,190,2);
end;
2:begin setfillstyle(1,15);setcolor(15);delay(200);
line(285,180,335,175);line(335,175,342,205);
line(342,205,279,208);line(285,180,279,208);
floodfill(290,190,15);
setfillstyle(1,2);setcolor(2);
line(294,211,335,216);line(335,216,343,238);
line(343,238,290,241);line(294,211,290,241);
floodfill(300,220,2);
end;
end;
setcolor(13);Settextstyle(7,0,3);
outtextxy(295,175,'Yes');
outtextxy(298,210,'No');
repeat
ch1:=readkey
until (ch1=#72) or (ch1=#80) or (ch1=#13) or (ch1=#27);
case ch1 of
#72:m:=m-1;
#80:m:=m+1;
end;
if m<1 then m:=2;
if m>2 then m:=1;
until (ch1=#13) or (ch1=#27);
if ((ch1=#13) and (m=2)) or (ch1=#27) then begin clear;newgame;end;
end;
end;
end;
{\\\\\\\\\\\\\\///////////}
procedure graphika;
const r=20;
pause=10000;
var d,m,e,xm,ym,x,y,lx,ly,rx,ry,size,i,dx,dy,width,height:integer;
    saucer:pointer;
    c:char;
label loop;
begin
cleardevice;
setbkcolor(0);
x:=r*5;
y:=r*2;
xm:=getmaxx div 4;
ym:=getmaxy div 4;
ellipse(x,y,0,360,r,r div 3+2);
ellipse(x,y-4,190,357,r,r div 3);
line(x+7,y-6,x+10,y-12);
line(x-7,y-6,x-10,y-12);
circle(x+10,y-12,2);
circle(x-10,y-12,2);
floodfill(x+1,y+4,15);
lx:=x-r-1;
ly:=y-14;
rx:=x+r+1;
ry:=y+r div 3+3;
width:=rx-lx+1;
height:=ry-ly+1;
size:=imagesize(lx,ly,rx,ry);
getmem(Saucer,size);
getimage(lx,ly,rx,ry,saucer^);
putimage(lx,ly,saucer^,xorput);
rectangle(xm,ym,3*xm,3*ym);
setviewport(xm+1,ym+1,3*xm-1,3*ym-1,clipon);
xm:=2*xm;
ym:=2*ym;
for i:=1 to 200 do
putpixel(random(xm),random(ym),random(16));
x:=xm div 2;
y:=ym div 2;
dx:=10;
dy:=10;
repeat
putimage(x,y,saucer^,xorput);
delay(pause);
putimage(x,y,saucer^,xorput);
loop: x:=x+dx;
y:=y-dy;
if (x<0) or (x+width+1>xm) or (y<0) or (y+width+1-20>ym) then
begin
x:=x-dx;y:=y-dy;
dx:=getmaxx div 10 - random(getmaxx div 5);
dy:=getmaxy div 30 - random(getmaxy div 15);
goto loop
end
until keypressed;
c:=readkey;
if c<>#27 then goto loop;
setviewport(0,0,getmaxx,getmaxy,clipon);
cleardevice;
end;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
begin
init;k:=1;
1:poly;clear;newgame;
if (k=1) then begin clear;xnddrv;goto 1;end;
if (k=2) then begin clear;Xndlucum;goto 1;end;
if (k=3) then begin clear;graphika;goto 1;end;
end.