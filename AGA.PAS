uses crt,graph;
label 1;
var k,z:byte;ch:char;
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
procedure graphika;
var c:char;
masiv,masiv16:array[1..16] of byte;
oldx,oldy,x,sx,y,sy,i,m,r1,r2,r3,r4:byte;
t,t1,t2,t3:boolean;
procedure drow;
begin
setcolor(2);
rectangle(150,80,490,400);
line(150+85,80,150+85,400);
line(150+170,80,150+170,400);
line(150+170+85,80,150+170+85,400);
line(150,80+80,490,80+80);
line(150,80+160,490,80+160);
line(150,80+240,490,80+240);
end;
{--select--}
procedure select(x,y,oldx,oldy:byte;t:boolean);
var xx,yy:integer;
begin
if t=false then begin
case oldx of
1:xx:=151;
2:xx:=236;
3:xx:=236+85;
4:xx:=236+170;
end;
case oldy of
1:yy:=81;
2:yy:=81+80;
3:yy:=81+160;
4:yy:=81+240;
end;
setcolor(1);
rectangle(xx,yy,xx+83,yy+78);
end;
case x of
1:xx:=151;
2:xx:=236;
3:xx:=236+85;
4:xx:=236+170;
end;
case y of
1:yy:=81;
2:yy:=81+80;
3:yy:=81+160;
4:yy:=81+240;
end;
setcolor(4);
rectangle(xx,yy,xx+83,yy+78);
end;
{------selected}
procedure selected(x,y:byte);
var xx,yy:integer;
begin
case x of
1:xx:=151;
2:xx:=236;
3:xx:=236+85;
4:xx:=236+170;
end;
case y of
1:yy:=81;
2:yy:=81+80;
3:yy:=81+160;
4:yy:=81+240;
end;
setcolor(14);
rectangle(xx,yy,xx+83,yy+78);
end;
{-----preview--------}
procedure preview;
var i,j:byte;
s:string;
begin
setcolor(2);
for i:=1 to 4 do
for j:=1 to 4 do
begin
str(masiv[(i-1)*4+j],s);
settextstyle(0,0,5);
setfillstyle(1,1);
bar(76+83*j,20+78*i,148+83*j,70+78*i);
case masiv[(i-1)*4+j] of
1:outtextxy(95+83*j,25+78*i,s);
2:outtextxy(95+83*j,30+78*i,s);
3:outtextxy(95+83*j,30+78*i,s);
4:outtextxy(95+83*j,30+78*i,s);
5:outtextxy(95+83*j,30+78*i,s);
6:outtextxy(95+83*j,30+78*i,s);
7:outtextxy(95+83*j,30+78*i,s);
8:outtextxy(95+83*j,30+78*i,s);
9:outtextxy(95+83*j,30+78*i,s);
10:outtextxy(72+83*j,30+78*i,s);
11:outtextxy(72+83*j,30+78*i,s);
12:outtextxy(72+83*j,30+78*i,s);
13:outtextxy(72+83*j,30+78*i,s);
14:outtextxy(72+83*j,30+78*i,s);
15:outtextxy(72+83*j,30+78*i,s);
end;
end;
end;
begin
init;
setbkcolor(1);
masiv16[16]:=0;
randomize;
for i:=1 to 15 do masiv16[i]:=i;
masiv:=masiv16;
for i:=1 to 255 do begin
repeat
r1:=random(4)+1;r2:=random(4)+1;
r3:=random(4)+1;r4:=random(4)+1;
until  ((masiv[(r2-1)*4+r1]=0) or (masiv[(r4-1)*4+r3]=0)) and
((((r3-r1=1) or (r1-r3=1)) and ((r4-r2=0) or (r2-r4=0)))
or (((r4-r2=1) or (r2-r4=1)) and ((r3-r1=0) or (r1-r3=0))));
m:=masiv[(r2-1)*4+r1];
masiv[(r2-1)*4+r1]:=masiv[(r4-1)*4+r3];
masiv[(r4-1)*4+r3]:=m;
end;
drow;
x:=1;y:=1;oldx:=0;oldy:=0;t:=false;t1:=false;
t2:=false;
preview;
repeat
select(x,y,oldx,oldy,t);
if (oldx=sx) and (oldy=sy) and (t1=true) then selected(oldx,oldy);
t:=false;
if (c=#13) and (t1=true) then t2:=true;
if t2=true then
begin
if ((masiv[(y-1)*4+x]=0) or (masiv[(sy-1)*4+sx]=0)) and
((((sx-x=1) or (x-sx=1)) and ((sy-y=0) or (y-sy=0)))
or (((sy-y=1) or (y-sy=1)) and ((sx-x=0) or (x-sx=0))))
then
begin
{if (sx-x=1) or (x-sx=1) then begin   }
m:=masiv[(y-1)*4+x];
masiv[(y-1)*4+x]:=masiv[(sy-1)*4+sx];
masiv[(sy-1)*4+sx]:=m;
t:=false;t1:=false;t2:=false;
preview;
select(x,y,sx,sy,t);
{end }
end
else
begin
t:=false;t1:=false;t2:=false;
select(x,y,sx,sy,t);
end;
t3:=true;
for i:=1 to 16 do begin
if masiv[i]<>masiv16[i] then begin t3:=false;break;end
end;
if t3=true then begin
cleardevice;
SETBKCOLOR(0);
setcolor(9);
SETTEXTSTYLE(0,0,2);
outtextxy(200,100,'¬ª®ξ€κ®ξ®ς¦ ¦');
setcolor(2);
settextstyle(0,0,3);
outtextxy(170,150,'†®ςφ €Άπ”φ');
DELAY(60000);
DELAY(60000);DELAY(60000);DELAY(60000);
DELAY(60000);DELAY(60000);DELAY(60000);
break;
end
end
else begin
if c=#13 then
begin
selected(x,y);t1:=true;
sx:=x;sy:=y;
end;
end;
repeat
c:=readkey;
until (c=#77) or (c=#75) or (c=#80) or (c=#72) or (c=#27) or (c=#13);
oldx:=x;
oldy:=y;
case c of
#72:y:=y-1;
#80:y:=y+1;
#75:x:=x-1;
#77:x:=x+1;
end;
if y<1 then y:=4;
if x<1 then x:=4;
if x>4 then x:=1;
if y>4 then y:=1;
until c=#27;
cleardevice;
setbkcolor(0);
end;
procedure menuu(x,y:integer;s1,s2,s3:string;status:byte);
var i:byte;
begin
setcolor(7);
ellipse(x,y,270,90,30,30);
rectangle(x-200,y-33,x,y+33);
setfillstyle(9,10);
floodfill(x+5,y,7);
setfillstyle(8,9);
floodfill(x-5,y,7);
setcolor(15);
setfillstyle(1,0);
bar(x-130,y-20,x-70,y+20);
settextstyle(0,0,2);
outtextxy(x-105,y-10,s3);
setcolor(7);
rectangle(x-220,y-35,x-201,y+35);
setfillstyle(9,10);
floodfill(x-215,y,7);
setfillstyle(1,11);
bar(x-223,y-35,x-221,y+35);
case status of
0:begin
for i:=20 downto 0 do begin
setfillstyle(1,0);
bar(x-265-5*i,y+36,x-224,y-36);
if i>0 then begin
setfillstyle(1,7);
bar(x-224-5*i,y+30,x-224,y-30);
delay(300);
end;
setcolor(7);
rectangle(x-243-5*i,y-35,x-224-5*i,y+35);
setfillstyle(9,10);
floodfill(x-235-5*i,y,7);
rectangle(x-253-5*i,y-25,x-244-5*i,y+25);
setfillstyle(9,10);
floodfill(x-248-5*i,y,7);
setfillstyle(1,11);
bar(x-223-5*i,y-35,x-221-5*i,y+35);
end;end;
1:begin
for i:=0 to 20 do begin
setfillstyle(1,0);
bar(x-265-5*i,y+36,x-224,y-36);
if i>0 then begin
setfillstyle(1,7);
bar(x-224-5*i,y+30,x-224,y-30);
end;
setcolor(7);
rectangle(x-243-5*i,y-35,x-224-5*i,y+35);
setfillstyle(9,10);
floodfill(x-235-5*i,y,7);
rectangle(x-253-5*i,y-25,x-244-5*i,y+25);
setfillstyle(9,10);
floodfill(x-248-5*i,y,7);
setfillstyle(1,11);
bar(x-223-5*i,y-35,x-221-5*i,y+35);
delay(300);
end;
setcolor(15);
rectangle(x-310,y-25,x-230,y+25);
setfillstyle(7,9);
floodfill(x-260,y,15);
settextstyle(0,0,0);
setcolor(15);
outtextxy(x-288,y-15,s1);
outtextxy(x-300,y,s2);
end;
2:begin
setcolor(7);
rectangle(x-243,y-35,x-224,y+35);
setfillstyle(9,10);
floodfill(x-235,y,7);
rectangle(x-253,y-25,x-244,y+25);
setfillstyle(9,10);
floodfill(x-248,y,7);
setfillstyle(1,11);
bar(x-223,y-35,x-221,y+35);
end;
end;
end;

procedure lutcum;
type zang=array[1..6,1..6] of real;
vec=array[1..6] of real;
var m,n,k,j,i:byte;  a:zang;b:vec;
{----------------------------------------------}
s:string;
ch2:char;
code:integer;
t:boolean;
w:real;
f:file of real;
procedure pox(a1:zang;b1:vec;k1:integer);
begin b1[k1]:=a1[i,j]; a1[i,j]:=b1[j]; b1[j]:=b1[k1];
end;

procedure vek(n2:integer; var b2:vec);
var j:integer;
begin
for j:=1 to n2 do begin
write('b2[',j,']='); read(b2[j]);
end;                 end;

Begin
setcolor(15);
settextstyle(0,0,0);
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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο thv.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'thv.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
bar(328-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
328-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(60000);
delay(60000);
end;
close(f);
setcolor(0);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο thv.dat ϋ©—―σ§ γ‰—―σ  §ο');

setcolor(4);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
readln;
setcolor(0);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
outtextxy(80,250,'For Exit press <Esc>');
reset(f);
setcolor(14);
for i:=1 to n do
for j:=1 to m do begin
read(f,a[i,j]);

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
{
for i:=1 to m do
begin
vek(n,b);
for j:=1 to n do
a[i,j]:=b[j];end;
for j:=1 to n do
pox(a,b,k);
for i:= 1 to m do
for j:=1 to n do
 write  ( a[i,j] );end.

}

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
procedure xnddrv;
var i:byte;
begin
cleardevice;
setbkcolor(0);
for i:=1 to 15 do begin
setfillstyle(1,0);
bar(400,10*(i-1)-80,560,10*(i-1)-20);
setfillstyle(1,2);
bar(400,10*i-80,560,10*i-20);
delay(4000);
end;
for i:=1 to 15 do begin
setfillstyle(1,0);
bar(400-10*(i-1),70+8*(i-1),560-10*(i-1),130+8*(i-1));
setfillstyle(1,2);
bar(400-10*i,70+8*i,560-10*i,130+8*i);
delay(4000);
end;
for i:=3 to 15 do begin
setfillstyle(1,2);
bar(320-15*i,240-10*i,320+15*i,240+10*i);
delay(500);
end;
settextstyle(0,0,0);
setcolor(9);
outtextxy(130,120,'«‡ο• ‡ολ›χ');
settextstyle(0,0,0);
setcolor(15);
outtextxy(130,140,'  μολ›  M*N αυ«• §νο•ρ:‰ηρ«‰— §νο•ρ•');
outtextxy(130,160,'ƒ―—―ο ©« ι©―σ«‰ο,―ο―«χ §•©« ‡ο« νο‰ο ‰«');
outtextxy(130,180,'γο―σ«―σ§:‘‰ ©‡γ•ι• ι©―σ«‰ο α«,γ §νο•ρ');
outtextxy(130,200,'‘―£«‰— «υ―υ―™:€ον›‰— ινρλ› §νο•ρ:');
setcolor(5);
outtextxy(130,240,'•οη‰— ‰ν‰σ©— ‰«‘›ο…ο‰ο.');
Setcolor(5);
outtextxy(130,260,'  1.');
setcolor(15);
outtextxy(165,260,'­λ‰— λ‰ν―ο• ‡ο« νοο‰ο• χ«,');
setcolor(5);
outtextxy(130,280,'  2.');
setcolor(15);
outtextxy(165,280,'‰ηρ«‰— §νο•ρ• l-ο‡ ι©―σ«:');
repeat
until readkey=#27;
for i:=15 downto 4 do begin
setfillstyle(1,2);
bar(320-15*i,240-10*i,320+15*i,240+10*i);
delay(4000);
setfillstyle(1,0);
bar(320-15*i,240-10*i,320+15*i,240+10*i);
end;
for i:=15 downto 1 do begin
bar(400-10*i,70+8*i,560-10*i,130+8*i);
delay(5000);
setfillstyle(1,0);
bar(400-10*(i),70+8*(i),560-10*(i),130+8*(i));
setfillstyle(1,2);
end;
for i:=15 downto 1 do begin
setfillstyle(1,2);
bar(400,-80+10*i,560,-20+10*i);
delay(5000);
setfillstyle(1,0);
bar(400,-80+10*(i),560,-20+10*(i));
end;
setbkcolor(0);
cleardevice;
end;
Begin
init;
k:=1;
z:=0;
menuu(500,90,'«‡ο•',' †ολ›χ','1',1);
menuu(500,190,'«‡ο•','–―σ›―σ§','2',2);
menuu(500,290,'','„οϋ•','3',2);
menuu(500,390,'','  —χ','4',2);
repeat
case z of
1:menuu(500,90,'«‡ο•',' †ολ›χ','1',0);
2:menuu(500,190,'«‡ο•','–―σ›―σ§','2',0);
3:menuu(500,290,'','„οϋ•','3',0);
4:menuu(500,390,'','  —χ','4',0);
end;
case k of
1:menuu(500,90,'«‡ο•',' †ολ›χ','1',1);
2:menuu(500,190,'«‡ο•','–―σ›―σ§','2',1);
3:menuu(500,290,'','„οϋ•','3',1);
4:menuu(500,390,'','  —χ','4',1);
end;
z:=k;
1:repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if (k=1) and (ch=#13) then begin xnddrv;
menuu(500,90,'«‡ο•',' †ολ›χ','1',1);
menuu(500,190,'«‡ο•','–―σ›―σ§','2',2);
menuu(500,290,'','„οϋ•','3',2);
menuu(500,390,'','  —χ','4',2);goto 1;  end;
if (k=2) and (ch=#13) then begin lutcum;
menuu(500,90,'«‡ο•',' †ολ›χ','1',2);
menuu(500,190,'«‡ο•','–―σ›―σ§','2',1);
menuu(500,290,'','„οϋ•','3',2);
menuu(500,390,'','  —χ','4',2);goto 1; end;
if (k=3) and (ch=#13) then begin graphika;
menuu(500,90,'«‡ο•',' †ολ›χ','1',2);
menuu(500,190,'«‡ο•','–―σ›―σ§','2',2);
menuu(500,290,'','„οϋ•','3',1);
menuu(500,390,'','  —χ','4',2);goto 1; end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.