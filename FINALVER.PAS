uses crt,graph;
label 1;
var i,j,harc,q,g,color,rq,z:byte;
c:char;
k,p,m:integer;t:boolean;
temp:word;
s1,s2,s3,s4,H1,H2,H3:string;
x:array[1..10] of byte;
{---------------------------------------}
procedure  tvs;
const r=50;dx=1000;
var k:integer;
xasp,yasp:word;

begin
setcolor(9);
     getaspectratio(xasp,yasp);
     for k:=0 to 20 do
     begin
          setaspectratio(xasp+k*dx,yasp);
          circle(getmaxx div 2,getmaxy div 2,r) end;
          setcolor(white);settextstyle(0,0,2);outtextxy(295,225,'TVS');
          settextstyle(1,0,14);outtextxy(180,245,'Development');
          outtextxy(375,245,'Corporation');
           end;
{---------------ABOUT ME---------------------------}
procedure about; {im masin}
begin
     repeat begin
     setbkcolor(blue);
     outtextxy(90,115,'This program is created with the own initiate. For advices');
     outtextxy(90,130,'or about observed defects please contact with me. And if');
     outtextxy(90,145,'will be any suggestion I am ready to collaborate with anyone.');
     outtextxy(410,415,'Tel: +37491262658');
     outtextxy(410,430,'Add: Erevan,A.Armenakyan 228');
     outtextxy(410,445,'E-mail: vardan@torosyan.com');
     outtextxy(220,460,'All Rights Reserved');
     end;
     c:=readkey;
 until c=#27;
end;
{-----------==========}
procedure exit;
begin
setcolor(15);
outtextxy(10,20,'    ฏ๓๏้ ฏ๓ ง๏ ้ฃง๗ Esc');
end;
{==============๏๋๗============================}

procedure drvacq;
begin
setbkcolor(0);
cleardevice;
setcolor(2);
settextstyle(0,0,0);
outtextxy(10,160,'              1. ซ๏ ๏๋๗');
setcolor(15);
outtextxy(140,180,'์๏๋ ซ N ซซ ๋ ๋ งฏฃๅ ํใ N*N ํ๏๏๏ ใ๏ฏ๓ซฏฃ');
outtextxy(140,200,'งํ๏๑: ฆํ๏๑ ก๋๕ฏ ฉซใ้, ฏ๏ ๋ฏ๏ ซฉฏ๓ซ ')  ;
outtextxy(140,220,'๋๏ ๏๋ ซ งใํ้ซ ํฏฃ งฏ๓ฉซ ํ๏๏:');
outtextxy(140,240,'์ใ ้ํ๑๋ งํ๏๑:');
setcolor(2);
outtextxy(10,260,'              2. ซ๏๏๏');
setcolor(15);
outtextxy(140,280,'๊๏๏กซ ๋ํฏ๏ k-ซ ๋้๏ ํ๏๏ ง๏: ');
outtextxy(140,300,'ํ๏ ๋ํฏ๏ d-๏ ๋ c-๏ ํ๏๏๏ ํฃ๕ฏฏ๓ฉฏ๓ซ:');
repeat
c:=readkey;
until c=#27;
cleardevice;
end;
{============LOADING======================}
procedure loading;
var i,c,z:byte;
begin
i:=4;
for z:=1 to 5 do begin
randomize;
setcolor(2);Settextstyle(0,0,2);outtextxy(250,400,'LOADING');
for c:=1 to 8 do begin
setcolor(2);Settextstyle(3,0,4);
outtextxy(380,407,'.');
outtextxy(395,407,'.');
outtextxy(410,407,'.');
Settextstyle(4,0,10);
setbkcolor(0);setcolor(14);
Settextstyle(0,0,3);
outtextxy(100,200,'T');
outtextxy(150,200,'V');
outtextxy(200,200,'S');
outtextxy(350,200,'G');
outtextxy(400,200,'A');
outtextxy(450,200,'M');
outtextxy(500,200,'E');
outtextxy(550,200,'S');
case c of
1:begin setcolor(i);
outtextxy(100,200,'T');end;
2:begin setcolor(i);
outtextxy(150,200,'V');setcolor(5);Settextstyle(3,0,4);outtextxy(380,407,'.');end;
3:begin setcolor(i);
outtextxy(200,200,'S');end;
4:begin setcolor(i);
outtextxy(350,200,'G');setcolor(5);Settextstyle(3,0,4);outtextxy(395,407,'.');end;
5:begin setcolor(i);
outtextxy(400,200,'A');end;
6:begin setcolor(i);
outtextxy(450,200,'M');setcolor(5);Settextstyle(3,0,4);outtextxy(410,407,'.');end;
7:begin setcolor(i);
outtextxy(500,200,'E');end;
8:begin setcolor(i);
outtextxy(550,200,'S');end;
end;
delay(40000);end;
end;cleardevice
end;
{==============================}
procedure lucum;
type arr=array[1..10,1..10] of integer;
vec=array[1..10] of integer;
var f:file of integer;
t:boolean;
i,j,n:byte;
a:arr;b:vec;
code,w:integer;
ch2:char;
s:string;
{------------------function--------------------}
function gvkemn(b1:vec;n1:byte;k1:integer):byte;
var i1,k2:byte;
begin
for i1:=1 to n1 do
if b1[i1]=k1 then k2:=i1;
gvkemn:=k2;
end;
{------------------procedure------------------}
procedure rev(var b2:vec;d2,c2:byte);
var a2:integer;
begin
a2:=b2[d2];
b2[d2]:=b2[c2];
b2[c2]:=a2;
end;
{\\\\\\\\\\\\\\\\\\\\\\///////////////}
begin
setbkcolor(1);
cleardevice;
setcolor(2);
repeat
cleardevice;
outtextxy(100,10,'ซ๏ฏ๓ง ซ๗ ซ๏งฏ๓ ๗็ฏ๓้ งํ๏๑ แ๕(1<n<10)');
outtextxy(305,20,'n=');
s:='';
repeat
repeat
outtextxy(320,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
if code<>0 then n:=0;
until (n>1) and (n<6);
setfillstyle(1,2);
bar(320-n*30,130-n*20,320+n*30,130+n*20);
for i:=1 to n do
for j:=1 to n do begin
repeat
t:=false;
s:='';
repeat
repeat
setcolor(4);
outtextxy(320-n*30+5+(j-1)*30,130-n*20+5+(i-1)*10,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#45) or(ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,w,code);
if code<>0 then begin
delete(s,1,1);
val(s,w,code);
if code=0 then t:=true;
end;
until t=true;
outtextxy(100,400,'123');
end;
{repeat
s:='';
repeat
outtextxy(320,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
if code<>0 then n:=0;
 }
repeat
c:=readkey;
until c=#27;
cleardevice;
end;
{==========WARNING==================}
procedure warning;
begin
settextstyle(0,0,2);setcolor(4);
outtextxy(200,150,'W A R N I N G !');delay(10000);
settextstyle(1,0,14);setcolor(9);
outtextxy(100,200,'The program author does not take responsibility for any');
outtextxy(100,215,'consequences (including illegal) that comes from direct ');
outtextxy(100,230,'or indirect use of program!!!');
setcolor(4);
outtextxy(100,260,'All rights are reserved by the author of this program,');
outtextxy(100,275,'and any illegal usage, copy or mass broadcasting must');
outtextxy(100,290,'be agreed with author!!!');
setcolor(9);outtextxy(180,330,'   Thank you for your attention');
end;
{================================}
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
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure monitor(k,x,y:integer;color1,color2:byte;s1,s2:string);
begin
setcolor(4);
line(x-28,y-62,x+28,y-62);
line(x-29,y-20,x-29,y-62);
line(x+29,y-20,x+29,y-62);
line(x-29,y-20,x+29,y-20);
line(x-32,y-66,x+32,y-66);
line(x-33,y-15,x-33,y-66);
line(x+33,y-15,x+33,y-66);
ellipse(x,y-32,237,304,60,20);
setfillstyle(1,8);
floodfill(x,y-15,4);
ellipse(x,y-12,180,360,14,10);
ellipse(x,y-5,140,40,25,14);
setfillstyle(11,8);
floodfill(x,y,4);
setfillstyle(1,color2);
floodfill(x,y-25,4);
setcolor(15);
settextstyle(0,0,0);
outtextxy(x-19,y-50,s1);
outtextxy(x-28+k,y-40,s2);
end;
{=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-}
procedure smallbar(x,y:integer;color:byte;s1,s2:string);
begin
setcolor(9);
line(x-50,y,x+150,y);
line(x-50,y+40,x+150,y+40);
line(x-70,y+20,x-50,y);
line(x-70,y+20,x-50,y+40);
line(x+170,y+20,x+150,y);
line(x+170,y+20,x+150,y+40);
line(x-130,y+20,x-70,y+20);
line(x+170,y+20,x+230,y+20);
setfillstyle(1,color);
floodfill(x,y+20,9);
setcolor(14);
outtextxy(x-50,y+18,s2);
outtextxy(x-40,y+18,'.');
setcolor(15);
outtextxy(x-30,y+18,s1);
end;
{-==========================}
procedure bigbar(s1,s2,s3:string);
begin
setcolor(9);
line(50,360,590,360);
line(50,300,590,300);
line(50,300,20,330);
line(50,360,20,330);
line(0,330,20,330);
line(590,300,620,330);
line(590,360,620,330);
line(620,330,640,330);
setcolor(15);
OUTTEXTXY(100,310,s1);
OUTTEXTXY(100,325,s2);
OUTTEXTXY(100,340,s3);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\}
procedure extrasmallbar(h:byte);
var i:byte;
s1:string;
begin
for i:=1 to 200
do begin
setcolor(0);
line(660-(i-1),100,850-(i-1),100);
setcolor(9);
line(660-i,100,850-i,100);
delay(1000);
end;
setcolor(9);
line(610,100,640,100);
for i:=1 to 13 do begin
setcolor(0);
line(480,100+(i-1),570,100+(i-1));
line(480,100-(i-1),570,100-(i-1));
line(460,100,480,100+(i-1));
line(460,100,480,100-(i-1));
line(590,100,570,100+(i-1));
line(590,100,570,100-(i-1));
setcolor(9);
line(480,100+i,570,100+i);
line(480,100-i,570,100-i);
line(460,100,480,100+i);
line(460,100,480,100-i);
line(590,100,570,100+i);
line(590,100,570,100-i);
delay(10000);
end;
setcolor(2);
outtextxy(490,97,' ๏๑ #');
str(h,s1);
outtextxy(547,97,s1);
end;
{-=======HARCERI BAZZZZZZZZZZZAAAAAAAA======================}
procedure harceribaza(z:byte);
begin
case z of
1:begin
s1:='Assembler';
s2:='Java';
s3:='C++';
s4:='C';
h1:='';
h2:='      ซแ ๋ฏ๋ ซ ๏ UNIX ๙ใ๏๑ฏซ ง๏       ';
h3:='';
rq:=4;
end;
2: begin
s1:='Oใํซ';
s2:='ฆซ้ซ';
s3:='ฆซฉฏ๓ซ';
s4:='๘ใ๏ํ๋';
h1:='';
h2:='          ซแใ้ ญฏฃ ้๏๗  ๋ซแ้ํฏ๏';
h3:='';
rq:=2;
end;
3: begin
s1:='Ctrl+Esc';
s2:='Alt+Enter';
s3:='Ctrl+z';
s4:='Alt+F4';
h1:='';
h2:=' ฎ๏ ้ํฃซ๏ ง๏ฏ๓ฉฏ๓ซซ  ๋้๏ Windows ้ํฃซซ';
h3:='';
rq:=1;
end;
4: begin
s1:='๏ซ';
s2:='ฆซ';
s3:='่ํฃซญ๏';
s4:='์ใแ';
h1:='';
h2:='          ง๏แ ฏ๏ ้๏๗ ํ  ฏ๏';
h3:='';
rq:=2;
end;
5: begin
s1:='';
s2:='่้';
s3:='๚ฏ้';
s4:='ฉฏ๓';
h1:='';
h2:='   ซแใ้ ซ ฅ ซ๋ซฏ๓ง ๏๏ฏ๓ง ซ้ซ ้ซ๏';
h3:='';
rq:=4;
end;
6: begin
s1:='Windows Vista';
s2:='Windows Lingvo';
s3:='Windows Info';
s4:='Windows Web';
h1:='';
h2:='   ซแใ้  ฏแ๋ฏ๓ง Microsoft  ง๏ใฏ๓ฉซ ';
h3:='          ซฏ๏ ๙ใ๏๑ฏซ ง๏';
rq:=1;
end;
7: begin
s1:='Adobe';
s2:='Macintosh';
s3:='IBM';
s4:='Microsoft';
h1:='';
h2:='ฎ๏ ง๏ใฏ๓ฉซ ซ๋ซงซ ํ ซ ฅ ๙ํฏ๏ฏ๓ง ';
h3:='             Must Die ๏ํฉํฏ๓ฉฏ๓ซ';
rq:=4;
end;
8: begin
s1:='ง ้๑';
s2:='โค ฉ๗';
s3:='ซํ๏ซํ ซฏ๓';
s4:='๚ฏ๏ฏ๓ง';
h1:='';
h2:='     ซแ  ๏ซ๑ ซ๏ฉ๑ซฏ๓ง EBuy.com ๋ ้๑ซ';
h3:='';
rq:=3;
end;
9:begin
s1:='11';
s2:='12';
s3:='10';
s4:='9';
h1:='';
h2:='    ๖ซ ้ํฃซ  ํซ๋ฏ๓ง Esc ๋ F12 ้ํฃซ๏ งๅ๋';
h3:='';
rq:=1;
end;
10: begin
s1:='Admin.sys';
s2:='Game.exe';
s3:='Play.dat';
s4:='Enjoy.sys';
h1:='';
h2:='     ซแ  ฉํซ ง้๏ ซฏ๓ซ,ฏ๏ ญ๏็แ';
h3:='               ฃ๏ ง้ซ ';
rq:=2;
end;
11: begin
s1:='ง ๏้';
s2:='โํฏ๓ซ ๑้';
s3:='๏ซ๏ฏ๓ง';
s4:='๊ ๅ๏ฏ๓ง';
h1:='';
h2:='              ฎ๏ํฃ ๏  ํ้ซ';
h3:='   ๋๑ซ ซํ๏ซ๏ ๑ฏ๓๑ฏ๓ง ๏ํฉํฏ๓ฉฏ๓ซ';
rq:=4;
end;
12:begin
s1:='่ใง๏ซ๏';
s2:='๊๏ฏ๓้ซ๏';
s3:='งซซ๏';
s4:='จฏ๓๏ซ๏';
h1:='';
h2:='    ซแใ้ ซ ซ๋ซฏ๓ง ฉซ ง๏ซ๑,ฏ๋๗๏ งฏ๋';
h3:='            ซใํ๗ ซงซ๏ ซ ฏ๓ฃ๏ฏ๓ง';
rq:=1;
end;
13:begin
s1:='Zip';
s2:='Rar';
s3:='Crack';
s4:='Keygen';
h1:='';
h2:='  ซแใ้ ซ ซ๋ซฏ๓ง ฉซ ๏๏๏,ฏ๏ฏซ๗ ซํ้๋ ซ';
h3:='             ฏ๏ ซ๏๑ซฏ๓ ง๏';
rq:=4;
end;
14: begin
s1:='B.Straustrup';
s2:='Deitel';
s3:='Nowton';
s4:='Shildt';
h1:='';
h2:='            ฎ๋  C++ ๋ ฃซ';
h3:='';
rq:=1;
end;
15: begin
s1:='1991';
s2:='1995';
s3:='1989';
s4:='1996';
h1:='';
h2:='     ฎ๋ ๋ซซ  ้ํฃ๋ Java ๏๏๋ฏ๏งซ ฏ๓ซ';
h3:='';
rq:=4;
end;
16: begin
s1:='ฆํ๏๑ฉซ';
s2:='ฏ๓้ฏฉซ';
s3:='โซญํฉซ';
s4:='๏ฉซ';
h1:='';
h2:='        ซแใ้ ใ๏ซํ๏ซ๏ ฏฉฏ๓ฉฏ๓ซ แฏ๓ซซ';
h3:='';
rq:=3;
end;
17: begin
s1:='27 งฏซ';
s2:='32 ๏';
s3:='256 งฏซ';
s4:='16.9 งฏซ';
h1:='';
h2:='        ๖ซ ฏ๓ฉซ ๏  ้ํซ RGB- งๅฏ๑ฏ๋ ';
h3:='';
rq:=4;
end;
18: begin
s1:='Lexus';
s2:='Liza';
s3:='Apricot';
s4:='Apple';
h1:='';
h2:='   ซแใ้  ฏแ๋ฏ๓ง Apple Computers ง๏ใฏ๓ฉซ';
h3:='              ็ๅซ ง๏แ';
rq:=2;
end;
19: begin
s1:='งใฏ๏ฏ็';
s2:='่ํฃซ';
s3:='่๏๗';
s4:='ญฏฃฏ๓ฉฏ๓ซ';
h1:='';
h2:='     ซแ  ซญซฏ๓ง Device, ง๏แฉซ ๋ฏ๋';
h3:='';
rq:=3;
end;
20: begin
s1:='Mouse';
s2:='CD-RW';
s3:='Modem';
s4:='Lan card';
h1:='';
h2:='  ซแ ้๏๗  ซ๏ญํ,ฏ๏ใ้ ง๏แ ๏ฏฃซ';
h3:='          งซ ฉ ง๏แซ๏ซ';
rq:=4;
end;
21: begin
s1:='';
s2:='่้ฏ๓ซ๑ ๋';
s3:='';
s4:='๏๗ง';
h1:='';
h2:=' ฎ๓ง ซฏ๓ซฏ๋  ฏ๏๋ฏ๓ง Pascal ๏๏๋ฏ๏งซ ฏ๓ซ ';
h3:='';
rq:=3;
end;

22: begin
s1:='Microsoft';
s2:='Netscape';
s3:='Avant';
s4:='Opera';
h1:='';
h2:='          ซใ้ Web Browser ฏฉฏ๓ฉฏ๓ซ แฏ๓ซ';
h3:='';
rq:=1;
end;
23: begin
s1:='Mail';
s2:='FAQ';
s3:='Forum';
s4:='Chat';
h1:='';
h2:=' ซใ้  ฏแ๋ฏ๓ง Web ๅ๏ฏ๓ง ฉซ ๋ฉ๏,ฏ๏ํฃ  ๏๋ฏ๓ง ซ ';
h3:='              งซญํ ํ๏๋ฏฃ ๏๑๏';
rq:=2;
end;
24: begin
s1:='MySql';
s2:='HTML';
s3:='PHP';
s4:='C++';
h1:='';
h2:='               ฎ๏ ๏๏๋ฏ๏งซ ฏ๓ แ';
h3:='';
rq:=2;
end;
25: begin
s1:='CPU';
s2:='Modem';
s3:='CD Drive';
s4:='Floppy Drive';
h1:='';
h2:='ฎ๏ ้๏๗ซ , ฏ๏ ใํ๗  ซใฉงซ ํฃ๏๋ ซ ง๏แฏ๓ง ';
h3:='';
rq:=1;
end;
26: begin
s1:='EATV';
s2:='Deitel';
s3:='Adobe';
s4:='EAGames';
h1:='';
h2:='    ฎ๏ซ  ฉํซ ง๏ใฏ๓ฉฏ๓ซ,ฏ๏ ง๏แฉซ';
h3:='                ฃ๏  ฏฃ๏ฏ๓ง';
rq:=4;
end;
27: begin
s1:='่ง๋';
s2:='ไฏ๏ๅ';
s3:='';
s4:='ฆฉ๗';
h1:='';
h2:='ซแ  Microsoft ง๏ใฏ๓ฉซ ้๕ซํ๏ฏๅ ซฏ๓ซ';
h3:='';
rq:=3;
end;
28: begin
s1:='FrontPage';
s2:='Netscape';
s3:='Internet Explorer';
s4:='Mozzila FireFox';
h1:='';
h2:=' ซแใ้ Web Browser ซ ฅ ๙ํฏ๏ฏ๓ง ็ฏ้ซ๏ฏ๓ง';
h3:='';
rq:=4;
end;
29: begin
s1:='โ๏ฏ๋ฉ๏ซ๏';
s2:='ฉซ๏ซ๏';
s3:='ฏซ้ํ๏ฏ๓ํฏ๏ซ๏';
s4:='๏งซซ๏';
h1:='';
h2:='ซแใ้ ซ ฏแ๋ฏ๓ง ซํ๏ซํ ํ๏ง๏ฏฃ ง๏ใฏ๓ฉฏ๓ซซ๏';
h3:='';
rq:=1;
end;
30: begin
s1:='ฃฉซ ๑ซ๑';
s2:='์ซฉซ ๑ซ๑';
s3:='งญ๏ฉซ ๑ซ๑';
s4:='ใ๏ซ๗ ฏ๓๏';
h1:='';
h2:='             ซแ  ซญซฏ๓ง WWW ใ๋ฏ๓ง';
h3:='';
rq:=3;
end;
31: begin
s1:='SMS';
s2:='MMS';
s3:='RGB';
s4:='PHP';
h1:='';
h2:='ซแใ้  ใ๋งซ ํ้๗ฏ๋ ํ๏๋ฏ๓ง ๏ง๏,ซแ,ใฏ๓ฉํ ';
h3:='                    ้๑ฏ๓ฉฏ๓ซ';
rq:=3;
end;
32: begin
s1:='โ๏ฏ';
s2:='Enter';
s3:='Shift';
s4:='Tab';
h1:='';
h2:='       ่ํฃซญ๏ ๋๏ ฏ๏ ้ํฃซ  งซ๏๏  ';
h3:='';
rq:=1;
end;
33: begin
s1:='CTRL';
s2:='Caps Lock';
s3:='Shift';
s4:='Tab';
h1:='';
h2:='       ่ํฃซญ๏ ๋๏ ฏ๏ ้ํฃซ  ๋ ๏๏  ';
h3:='';
rq:=3;
end;
34: begin
s1:='ซฏ๓ง  ซฏ๓';
s2:='๏ซฏ๓ง ';
s3:='๖ซฏ๓ง ';
s4:='ซๅํ๋ฏ๓ง ';
h1:='';
h2:='ซแ   ํ๏๋ฏ๓ง ง๏แ ํ ๏ ้ฃงฏ๓ง ซ๗ Power ้ํฃซ';
h3:='';
rq:=4;
end;
35: begin
s1:='F2';
s2:='F5';
s3:='F1';
s4:='F3';
h1:='';
h2:='      ฎ๏ ้ํฃซ  ๙ํฏ๏๋ฏ๓ง ๙ซฏ๓ฉซ ง๏';
h3:='';
rq:=3;
end;
36: begin
s1:='Nokia';
s2:='Xerox';
s3:='LG';
s4:='Samsung';
h1:='';
h2:='          ซแใ้ งฏซํฏ๏ ฏฉฏ๓ฉฏ๓ซ แฏ๓ซ ';
h3:='';
rq:=1;
end;
37: begin
s1:='';
s2:='ฌซ';
s3:='๔ฃ';
s4:='ํ๋';
h1:='';
h2:='              ซแใ้ ซ ซ๋ซฏ๓ง ^@^ ซญซ   ';
h3:='';
rq:=2;
end;
38: begin
s1:='Void';
s2:='Integer';
s3:='Byte';
s4:='Short';
h1:='';
h2:='    ซแใ้ ํใ ฏฉฏ๓ฉฏ๓ซ แฏ๓ซ Pascal ๋ฏ๓ง   ';
h3:='';
rq:=1;
{39: begin
s1:='Home+Insert';
s2:='Del+Power';
s3:='Alt+Ctrl+Del';
s4:='Shift+Enter';
h1:='';
h2:='ฎ๏ ้ํฃซ๏ ง๏ฏ๓ฉง ซ๗ ซแฏ๓ง Task Manager-  ';
h3:='';
rq:=1;
end; }
 end;
 {-------------------Harceri Baza-------------------}
end;
end;
begin
init;
1:setbkcolor(0);
cleardevice;
k:=1;
p:=1;
m:=5;
repeat
case p of
1:begin monitor(5,320,150,4,1,'ซ๏','๏๋๗');
monitor(0,320,350,4,0,'','  ๗  ');
monitor(0,220,250,4,0,'ซ๏','ฏ๓ฏ๓ง');
monitor(0,420,250,4,0,'','๏๛');
end;
2:begin
monitor(5,320,150,4,0,'ซ๏','๏๋๗');
monitor(0,320,350,4,0,'','  ๗  ');
monitor(0,220,250,4,1,'ซ๏','ฏ๓ฏ๓ง');
monitor(0,420,250,4,0,'','๏๛');
end;
3:begin
monitor(5,320,150,4,0,'ซ๏','๏๋๗');
monitor(0,320,350,4,0,'','  ๗  ');
monitor(0,220,250,4,0,'ซ๏','ฏ๓ฏ๓ง');
monitor(0,420,250,4,1,'','๏๛');
end;
4:begin
monitor(5,320,150,4,0,'ซ๏','๏๋๗');
monitor(0,320,350,4,1,'','  ๗  ');
monitor(0,220,250,4,0,'ซ๏','ฏ๓ฏ๓ง');
monitor(0,420,250,4,0,'','๏๛');
end;
end;
repeat
c:=readkey;
until (c=#77) or (c=#75) or (c=#80) or (c=#72) or (c=#27) or (c=#13);
if(p=1) and (c=#13) then begin drvacq;goto 1;end;
if(p=2) and (c=#13) then begin lucum ;goto 1;end;
if(p=4) and (c=#13) then halt;
if          (c=#27) then halt;
if(p=3) and (c=#13) then break;
case c of
     #72:begin k:=k-1;m:=5;end;
     #80:begin k:=k+1;m:=5;end;
     #75:begin m:=m-1;k:=5;end;
     #77:begin m:=m+1;k:=5;end;
end;
    if m=4 then m:=1;
    if m=6 then m:=2;
    if k=6 then k:=2;
    if k=4 then k:=1;
    if (m>2) and (m<>5) then m:=1;
    if (m<1) and (m<>5) then m:=2;
    if (k>2) and (k<>5) then k:=1;
    if (k<1) and (k<>5) then k:=2;
    if (k=5) and (m=2) then p:=3;
    if (k=5) and (m=1) then p:=2;
    if (m=5) and (k=2) then p:=4;
    if (m=5) and (k=1) then p:=1;
until (c=#27);
randomize;
cleardevice;
loading;tvs;
{delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
cleardevice;warning;
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);  }
cleardevice;
temp:=6000;
harc:=0;
for i:=1 to 10 do x[i]:=0;
repeat
      harc:=harc+1;
repeat
      z:=random(37)+1;
until (z<>x[1]) and (z<>x[2]) and (z<>x[3]) and (z<>x[4]) and
(z<>x[5]) and (z<>x[6]) and (z<>x[7]) and
(z<>x[8]) and (z<>x[9]) and (z<>x[10]);
x[harc]:=z;
harceribaza(z);
k:=1;
m:=1;
p:=1;
cleardevice;
exit;
extrasmallbar(harc);
bigbar(h1,h2,h3);
repeat
case p of
1:begin
smallbar(120,370,7,S1,'A');
smallbar(120,420,0,s2,'B');
smallbar(420,370,0,s3,'C');
smallbar(420,420,0,s4,'D');
end;
2:
begin
smallbar(120,370,0,s1,'A');
smallbar(120,420,7,s2,'B');
smallbar(420,370,0,s3,'C');
smallbar(420,420,0,s4,'D');
end;
3:
begin
smallbar(120,370,0,s1,'A');
smallbar(120,420,0,s2,'B');
smallbar(420,370,7,s3,'C');
smallbar(420,420,0,s4,'D');
end;
4:
begin
smallbar(120,370,0,s1,'A');
smallbar(120,420,0,s2,'B');
smallbar(420,370,0,s3,'C');
smallbar(420,420,7,s4,'D');
end;
end;
repeat
c:=readkey;
until (c=#77) or (c=#75) or (c=#80) or (c=#72) or (c=#27) or (c=#13);
case c of
#72:k:=k-1;
#80:k:=k+1;
#75:m:=m-1;
#77:m:=m+1;
end;
if m>2 then m:=1;
if m<1 then m:=2;
if k>2 then k:=1;
if k<1 then k:=2;
if (k=1) and (m=1) then p:=1;
if (k=2) and (m=1) then p:=2;
if (m=2) and (k=2) then p:=4;
if (m=2) and (k=1) then p:=3;
until (c=#27) or (c=#13);
if c=#27 then goto 1;
if p=rq then begin
case rq of
1:
begin
for i:=1 to 10 do begin
smallbar(120,370,g,s1,'A');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);delay(temp);
end;
end;
2:begin
for i:=1 to 10 do begin
smallbar(120,420,g,s2,'B');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);delay(temp);
end;end;
3:begin
for i:=1 to 10 do begin
smallbar(420,370,g,s3,'C');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);delay(temp);

end;
end;
4:begin
for i:=1 to 10 do begin
smallbar(420,420,g,s4,'D');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);delay(temp);
  end;end;
end;
end
else begin
case rq of
1:smallbar(120,370,10,s1,'A');
2:smallbar(120,420,10,s2,'B');
3:smallbar(420,370,10,s3,'C');
4:smallbar(420,420,10,s4,'D');
end;
case p of
1:
begin
for i:=1 to 10 do begin
smallbar(120,370,g,s1,'A');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);delay(temp);
end;
end;
2:begin
for i:=1 to 10 do begin
smallbar(120,420,g,s2,'B');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);delay(temp);
end;end;
3:begin
for i:=1 to 10 do begin
smallbar(420,370,g,s3,'C');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);delay(temp);

end;
end;
4:begin
for i:=1 to 10 do begin
smallbar(420,420,g,s4,'D');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);delay(temp);
  end;end;
end;
end;
until (harc=10) or (p<>rq);
cleardevice;
settextstyle(0,0,2);
Setcolor(4);
if p=rq then
for i:=1 to 15 do  begin
Setcolor(random(14)+1);
outtextxy(190,175,'ฌซฏ๏๋ฏ๏ฏ๓ง ซ๗');
outtextxy(210,200,'ฏ๓๗ ฃ๑๗');
delay(temp);delay(temp); delay(temp);
end
else begin
outtextxy(220,180,'   Sorry...')         ;
outtextxy(210,200,'ฏ๓๗ ใ๏ํ๋๑๗');
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
END;
goto 1;
end.
{0z(rn,ra,rn)30021}