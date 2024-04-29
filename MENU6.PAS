uses crt,graph;
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
procedure grafika;
var i,d,f,xo,yo,xa,ya,xb,yb,xm,ym,r:integer; k:word;alfa:real;
procedure linek(k:word);
begin
             setcolor(k);
             line(xo,yo,xa,ya);
             line(xa,ya,xb,yb);
             line(xb,yb,xo,yo);

end;
begin
     d:=0;
     InitGraph(d,f,'');
     xm:=GetMaxX; ym:=GetMaxY; xo:=90; yo:=ym div 2-1;
     k:=3; r:=80;
     SetBkColor(magenta); SetColor(7);
     line(0,ym div 2,xm,ym div 2);
     SetColor(12);

     MoveTo(xo,yo);
     while xo<=xm-r-10  do

     begin alfa:=0;
          while alfa<=2*pi/3 do
          begin
               xa:=xo-round(r*cos(alfa));
               ya:=yo-round(r*sin(alfa));
               xb:=xo-round(r*cos(alfa+pi/3));
               yb:=yo-round(r*sin(alfa+pi/3));
               linek(blue);
               alfa:=alfa+pi/60; delay(6000);
               linek(magenta) ;
          end;
          xo:=xo+r;

     end;
     repeat until readkey=#27;
     cleardevice;
     setbkcolor(0);
end;
procedure drvacq;
begin
cleardevice;
setbkcolor(1);
setcolor(2);
outtextxy(100,100,'μολ›  M*N αυ«• §νο•ρ σ k(1<k<=N) ƒ«« ‘•λ:');
outtextxy(100,120,'¦νο•ρ• k-ο‡ ι©―σ«•ρ ‰ν― λ‰—ρ«‰— 1 ο“‰χ ―σ«‰ρ―£');
outtextxy(100,140,'νο‰ο―λ ι©―σ«:');
setcolor(4);
outtextxy(100,180,'        •οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο.');
setcolor(2);
outtextxy(100,200,'1.‘‰ c γν«―σ§  [a,b] §•ε©χ•« λ‰ο‡ορ«‰— true,');
outtextxy(100,220,'η ‡‰γχ―σ§` false:');
outtextxy(100,240,'2.¦νο•ρ• l-ο‡ ι©« υ―™ο‰« …ο‰— d λ‰ν―ο• νοο‰ο:');
repeat
until readkey=#27;
cleardevice;
setbkcolor(0);
end;
procedure   lucum;
type masiv=array[1..10,1..10] of real;
     vec=array[1..10] of real;
var s:string;
ch2:char;
n,m,i,j,ss,q,k:byte;
code:integer;
a:masiv;
t:boolean;
w:real;
d:vec;
f:file of real;
function iner(c1,a1,b1:byte):boolean;
var t:boolean;
begin
t:=false;
if (c1>=a1) and (b1>=c1) then t:=true;
iner:=t;
end;
procedure change(var a2:masiv;b2:vec;l2,n2:byte);
var i2:byte;
begin
for i2:=1 to n2 do
a2[i2,l2]:=b2[i2];
end;
Begin
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
outtextxy(330,30,'k=');
repeat
setfillstyle(1,0);
bar(330,30,640,40);
outtextxy(330,30,'k=');
s:='';
repeat
repeat
outtextxy(348,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,k,code);
if code<>0 then k:=0;
until iner(k,1,m);

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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Anush.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'Anush.dat');
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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Anush.dat ϋ©—―σ§ γ‰—―σ  §ο');

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
for j:=m downto k+1 do
for i:=1 to n do a[i,j+1]:=a[i,j];
for j:=1 to n do d[j]:=1;
change(a,d,k+1,n);
{------------------------------------}
setfillstyle(1,7);
bar(320-(m)*30,380-(n)*20,320+(m+1)*30,380+(n)*20);
for i:=1 to n do
for j:=1 to m+1 do begin
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
outtextxy(285-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;
repeat
until readkey=#27;
cleardevice;
setbkcolor(0);
end;
procedure menu(x,y:integer;s1,s2:string;color:byte);
begin
setcolor(14);
setfillstyle(1,2);
fillellipse(x,y,60,20);
setcolor(color);
Settextstyle(0,0,0);
outtextxy(x-30+4,y-10,s1);
outtextxy(x-25-2,y,s2);
end;
begin
init;
k:=1;
repeat
case k of
1:begin
menu(320,150,' «‡ο•','†ολ›χ',4);
menu(320,200,' «‡ο•','–―σ›―σ§',1);
menu(320,250,'','„οϋ•',1);
menu(320,300,'','  —χ',1);
end;
2:begin
menu(320,150,' «‡ο•','†ολ›χ',1);
menu(320,200,' «‡ο•','–―σ›―σ§',4);
menu(320,250,'','„οϋ•',1);
menu(320,300,'','  —χ',1);
end;
3:begin
menu(320,150,' «‡ο•','†ολ›χ',1);
menu(320,200,' «‡ο•','–―σ›―σ§',1);
menu(320,250,'','„οϋ•',4);
menu(320,300,'','  —χ',1);
end;
4:begin
menu(320,150,' «‡ο•','†ολ›χ',1);
menu(320,200,' «‡ο•','–―σ›―σ§',1);
menu(320,250,'','„οϋ•',1);
menu(320,300,'','  —χ',4);
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
if (k=1) and (ch=#13) then drvacq;
if (k=3) and (ch=#13) then grafika;
if (k=2) and (ch=#13) then lucum;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.