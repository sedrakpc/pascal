uses crt,graph;
label 1;
var k:byte;ch:char;
procedure init;
var GD,GM,EC:integer;
begin
GD:=detect;
initgraph(GD,GM,'c:\bp\bgi');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
end;
procedure disc(x,y:integer;col,gujn:byte;s1,s2:string);
begin
setcolor(15);
circle(x,y,48);
circle(x,y,10);
circle(x,y,15);
setfillstyle(1,15);
floodfill(x+12,y,15);
setfillstyle(1,col);
floodfill(x+20,y,15);
settextstyle(0,0,0);
setcolor(gujn);
outtextxy(x-20,y-28,s1);
outtextxy(x-25,y+22,s2);
setcolor(8);
settextstyle(2,0,4);
outtextxy(x-41,y-7,'Sony');
outtextxy(x+22,y-7,'DVD');
settextstyle(2,0,4);
outtextxy(x+14,y+6,'4.7GB');
end;
procedure graphika;
var ch,ss:char;f:longint;color:byte;
procedure draw(ite:longint;col:byte);
var t,x,y,p:real;
k:longint;
midx,midy,radius:integer;
begin
midx:=getmaxx div 2;
midy:=getmaxy;
radius:=trunc(0.1*midy);
randomize;
x:=1.0;y:=0.0;
for k:=1 to ite do
begin
p:=random;t:=x;
if p<=0.85 then
begin
x:=0.85*x+0.04*y;y:=-0.04*t+0.85*y+1.6;
end else
if p<=0.92 then begin
x:=0.20*x-0.26*y;
y:=0.23*t+0.22*y+1.6;
end else
if p<=0.99 then begin
x:=-0.15*x+0.28*y;y:=0.26*t+0.24*y+0.44;
end else
begin
x:=0.0;y:=0.16*y;
end;
putpixel(midx+round(radius*x),midy-round(radius*y),col);
end;
end;
begin
repeat
clrscr;
setbkcolor(1);cleardevice;
setcolor(15);settextstyle(0,0,0);
outtextxy(0,450,'  read n');
outtextxy(0,456,'  read color');readln(f);readln(color);cleardevice;
draw(f,color);
outtextxy(0,456,'press <Enter> to repeat or <Esc> to exit:');
repeat
ch:=readkey;
until (ch=#13) or (ch=#27);
until (ch=#27);
setbkcolor(0);
cleardevice;
end;
procedure XndDr;
begin
setbkcolor(1);
cleardevice;
setcolor(12);
settextstyle(0,0,0);
outtextxy(100,50,'μολ›  M*N αυ«• §νο•ρ:μ‰£‰ο―λ υ―™‰— §νο•ρ• λ‰οε•«');
outtextxy(100,65,'ι©―σ« ©« ηε•« ι©« ‰ν, ―ο §•©« ƒρι« νοο‰ο ');
outtextxy(100,80,'γο―σ«―σ§:€ον›‰— ινρλ› §νο•ρ:‘‰ ©‡γ•ι• ι©―σ« α,');
outtextxy(100,95,'γ ον›‰— «‰ο§―σ›λ› §νο•ρ:');
outtextxy(100,125,'•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο.');
outtextxy(100,140,'     1.­λ‰— λ‰ν―ο• ƒρι« νο‰ο• χ«:');
outtextxy(100,155,'     2.‘‰ λ‰ν―ο• ƒ―—―ο νο‰ο •οο λιο ‰«:');
outtextxy(100,170,'       λ‰ο‡ο΅«‰— true η ‡‰γχ―σ§ false:');
repeat
ch:=readkey;
until ch=#27;
setbkcolor(0);
cleardevice;
end;
procedure Xndlt;
type masiv=array[1..10,1..10] of real;
type vec=array[1..10] of real;
var s:string;
ch2:char;
n,m,i,j,k,ss:byte;
code:integer;
b:vec;
a:masiv;
t:boolean;
w,c:real;
f:file of real;
function qan(b1:vec;n1:byte):byte;
var i1,k1:byte;
begin
k1:=0;
for i1:=1 to n1 do
if b1[i1]<0 then k1:=k1+1;
qan:=k1;
end;
Begin
setcolor(15);
settextstyle(0,0,0);
repeat
cleardevice;
setfillstyle(7,1);
bar(0,0,getmaxx,getmaxy);
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
setfillstyle(7,1);
bar(295,30,640,40);
outtextxy(295,30,'m=');
s:='';
repeat
repeat
outtextxy(313,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
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
if (copy(s,1,1)='-')  then k:=6 else k:=5;
if length(s)<k then begin
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
t:=true;w:=(-1)*w;
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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Karen.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'Karen.dat');
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
setfillstyle(7,1);
bar(50,245,600,270);
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

for j:=1 to m do begin
for i:=1 to n do
b[i]:=a[i,j];
k:=qan(b,n);
if k=n then
for i:=1 to n do begin
c:=a[i,j];
a[i,j]:=a[i,m];
a[i,m]:=c;
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
outtextxy(280-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;
repeat
until readkey=#27;
setbkcolor(0);
cleardevice;
end;
begin
init;
setbkcolor(0);
k:=1;
repeat
1:case k of
1:begin
disc(130,100,11,5,'«‡ο•','†ολ›χ');
disc(260,200,14,4,'«‡ο•','–―σ›―σ§');
disc(390,300,14,4,'','„οϋ•');
disc(520,400,14,4,'','  —χ');
end;
2:begin
disc(130,100,14,4,'«‡ο•','†ολ›χ');
disc(260,200,11,5,'«‡ο•','–―σ›―σ§');
disc(390,300,14,4,'','„οϋ•');
disc(520,400,14,4,'','  —χ');
end;
3:begin
disc(130,100,14,4,'«‡ο•','†ολ›χ');
disc(260,200,14,4,'«‡ο•','–―σ›―σ§');
disc(390,300,11,5,'','„οϋ•');
disc(520,400,14,4,'','  —χ');
end;
4:begin
disc(130,100,14,4,'«‡ο•','†ολ›χ');
disc(260,200,14,4,'«‡ο•','–―σ›―σ§');
disc(390,300,14,4,'','„οϋ•');
disc(520,400,11,5,'','  —χ');
end;
end;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if (k=1) and (ch=#13) then begin xnddr;goto 1 end;
if (k=2) and (ch=#13) then begin xndlt;goto 1 end;
if (k=3) and (ch=#13) then begin graphika;goto 1 ;end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.

