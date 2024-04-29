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
outtextxy(10,20,'    †―σοι …—―σ §ο ι‰£§‰χ Esc');
end;
{==============‡ολ›χ============================}

procedure drvacq;
begin
setbkcolor(0);
cleardevice;
setcolor(2);
settextstyle(0,0,0);
outtextxy(10,160,'              1. «‡ο• †ολ›χ');
setcolor(15);
outtextxy(140,180,'μολ› ‰« N ƒ«« ‘•λ ‰λ §ƒ―£ε ν•γ• N*N νοο‰ο γο―σ«―£');
outtextxy(140,200,'§νο•ρ: ¦νο•ρ ΅‰λυ―™‰— ©«γ‰ι, ―ο …—™λ―ο «©―σ«…›• ')  ;
outtextxy(140,220,'λο …ολ› —•«• §γνι™« ν―£• §‰›…―σ©« νοο:');
outtextxy(140,240,'μγ‰— ινρλ› §νο•ρ:');
setcolor(2);
outtextxy(10,260,'              2. «‘›ο…ο‰ο');
setcolor(15);
outtextxy(140,280,'κ‰ο‡ο΅«‰— λ‰ν―ο• k-•« λιο νοο• §ο: ');
outtextxy(140,300,'νο‰— λ‰ν―ο• d-ο‡ ‰λ c-ο‡ νοο‰ο• ν‰£υ―™―σ‘©―σ«:');
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
outtextxy(100,10,'«‡ο―σ§ ‰«χ «‰ο§―σ›‰— χη―σι• §νο•ρ• αυ(1<n<10)');
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
outtextxy(490,97,' ορ #');
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
h2:='      ”«α —‰‹λ―λ ‰« …ο‰— UNIX ωγ‰ορ•―« §ο…       ';
h3:='';
rq:=4;
end;
2: begin
s1:='Oγν•«';
s2:='¦…«•ι«';
s3:='¦«©―σ«';
s4:='ψγ‰ον•λ';
h1:='';
h2:='          ”«αγ•ι• •­―£ ιοχ  λ•«α‰ιν―ο';
h3:='';
rq:=2;
end;
3: begin
s1:='Ctrl+Esc';
s2:='Alt+Enter';
s3:='Ctrl+z';
s4:='Alt+F4';
h1:='';
h2:=' ®ο ιν‰£«‰ο• §‡ο―σ‘©―σ««  λιο Windows ιν‰£«•«';
h3:='';
rq:=1;
end;
4: begin
s1:='ο«';
s2:='¦«•';
s3:='θν‰£«­ο';
s4:='μγ•α';
h1:='';
h2:='          §ο…α• ―ο ιοχ• ν  …―ο…';
h3:='';
rq:=2;
end;
5: begin
s1:='‚…';
s2:='θ•ι';
s3:='ϊ―—ι';
s4:='„—©―σ';
h1:='';
h2:='   ”«αγ‰ι ‰« ¥™ «λ«―σ§ ›ο…ο―σ§ «ι«—• ι™—«‰ο';
h3:='';
rq:=4;
end;
6: begin
s1:='Windows Vista';
s2:='Windows Lingvo';
s3:='Windows Info';
s4:='Windows Web';
h1:='';
h2:='   ”«αγ‰ι  ―αλ―σ§ Microsoft  ‹§‰ογ―σ‘©« ';
h3:='          «―ο ωγ‰ορ•―« §ο…';
rq:=1;
end;
7: begin
s1:='Adobe';
s2:='Macintosh';
s3:='IBM';
s4:='Microsoft';
h1:='';
h2:='®ο ‹§‰ογ―σ‘©« «λ«§« ‰ν ‰« ¥™ ω…ν…―ο›―σ§ ';
h3:='             Must Die ον©ν―σ‘©―σ«';
rq:=4;
end;
8: begin
s1:='”§ ιρ‰';
s2:='β¤ ©χ';
s3:='”«ν‰ο«‰ν «―σ‘';
s4:='ϊ―ο―σ§';
h1:='';
h2:='     ”«α  •ο‰«•ρ «‰ο©ρ«―σ§ EBuy.com λ‰ƒ ιρ‰«';
h3:='';
rq:=3;
end;
9:begin
s1:='11';
s2:='12';
s3:='10';
s4:='9';
h1:='';
h2:='    φ«• ιν‰£«  …ν«λ―σ§ Esc ‰λ F12 ιν‰£«‰ο• §•ε‰λ';
h3:='';
rq:=1;
end;
10: begin
s1:='Admin.sys';
s2:='Game.exe';
s3:='Play.dat';
s4:='Enjoy.sys';
h1:='';
h2:='     ”«α  ©ν«• §ι…ο• «―σ«,―ο ­™οηα';
h3:='               ™£‰ο• §ι•« ';
rq:=2;
end;
11: begin
s1:='”§ …ο‰—•ι';
s2:='βν―σ« ƒρ‰—•ι';
s3:='†ο«‰ο―σ§';
s4:='κ‰ƒ ε‰ο―σ§';
h1:='';
h2:='              ®ον‰£ ο‰—•  ν‰ι«‰—';
h3:='   €λ‰—ρ«‰— «νο›«‰ο• ρ―σρ―σ§ ον©ν―σ‘©―σ«';
rq:=4;
end;
12:begin
s1:='θγ§‰ο«‰ο';
s2:='κ•ο―σι•«‰ο';
s3:='€‡§•««‰ο';
s4:='¨―σ‹‰ο«‰ο';
h1:='';
h2:='    ”«αγ‰ι ‰« «λ«―σ§ ©« §ο‡«ρ,―λχ‰ο ”§―λ';
h3:='            «γ‰νχ «§«‰ο ‰« ―σ£ο―σ§';
rq:=1;
end;
13:begin
s1:='Zip';
s2:='Rar';
s3:='Crack';
s4:='Keygen';
h1:='';
h2:='  ”«αγ‰ι ‰« «λ«―σ§ ©« ›ο…ο‰ο,―ο―«χ «™ν‰ιλ› ‰«';
h3:='             ―‡‰ο …‰«‰ορ«‰—―σ §ο';
rq:=4;
end;
14: begin
s1:='B.Straustrup';
s2:='Deitel';
s3:='Nowton';
s4:='Shildt';
h1:='';
h2:='            ®λ  C++ —‰‹λ• ‰£•«';
h3:='';
rq:=1;
end;
15: begin
s1:='1991';
s2:='1995';
s3:='1989';
s4:='1996';
h1:='';
h2:='     ®λ ‘λ«•«  ιν‰£›λ‰— Java ›ο…ολ―ο§« —‰‹―σ«';
h3:='';
rq:=4;
end;
16: begin
s1:='¦νο•ρ©•«';
s2:='–―σι‡•―‡©•«';
s3:='β—«­‰ν©•«';
s4:='–‹‰ο©•«';
h1:='';
h2:='        ”«αγ•ι• γο•«ν‰ο«‰ο …―©―σ‘©―σ« α―σ«‰«';
h3:='';
rq:=3;
end;
17: begin
s1:='27 §•——•―«';
s2:='32 ‹ο';
s3:='256 §•——•―«';
s4:='16.9 §•——•―«';
h1:='';
h2:='        φ«• …―σ©« ο‰—•  ιν«— RGB-• §•ε―ρ―λ ';
h3:='';
rq:=4;
end;
18: begin
s1:='Lexus';
s2:='Liza';
s3:='Apricot';
s4:='Apple';
h1:='';
h2:='   ”«αγ‰ι  ―αλ―σ§ Apple Computers ‹§‰ογ―σ‘©«';
h3:='              ηε•« §ο…•α';
rq:=2;
end;
19: begin
s1:='€§γ…―ο…―η';
s2:='θν‰£«';
s3:='θοχ';
s4:='•­―£―σ‘©―σ«';
h1:='';
h2:='     ”«α  «­«―σ§ Device, §ο…α©•« —‰‹λ―λ';
h3:='';
rq:=3;
end;
20: begin
s1:='Mouse';
s2:='CD-RW';
s3:='Modem';
s4:='Lan card';
h1:='';
h2:='  ”«α ιοχ  «ο“‰­ν,―ογ‰ι‹• §ο…•α ο―£«';
h3:='          §•« ©— §ο…•α«‰ο•«';
rq:=4;
end;
21: begin
s1:='‘';
s2:='θι―σ«ρ• †λ•‘';
s3:='‚—‰‹';
s4:='€οχ•§‰‡';
h1:='';
h2:=' ®σ§ «―σ«―λ  ―ολ―σ§ Pascal ›ο…ολ―ο§« —‰‹―σ« ';
h3:='';
rq:=3;
end;

22: begin
s1:='Microsoft';
s2:='Netscape';
s3:='Avant';
s4:='Opera';
h1:='';
h2:='          ”«γ•ι• Web Browser …―©―σ‘©―σ« α―σ«•';
h3:='';
rq:=1;
end;
23: begin
s1:='Mail';
s2:='FAQ';
s3:='Forum';
s4:='Chat';
h1:='';
h2:=' ”«γ‰ι  ―αλ―σ§ Web ε‰ο―σ§ ©« λ©ο,―ον‰£  …ολ―σ§ ‰« ';
h3:='              §‰«­ν νολ―£ ορ‰ο';
rq:=2;
end;
24: begin
s1:='MySql';
s2:='HTML';
s3:='PHP';
s4:='C++';
h1:='';
h2:='               ®ο ›ο…ολ―ο§« —‰‹―σ α';
h3:='';
rq:=2;
end;
25: begin
s1:='CPU';
s2:='Modem';
s3:='CD Drive';
s4:='Floppy Drive';
h1:='';
h2:='®ο ιοχ« , ―ο γ‰νχ  «γ©§« ν‰£‡ολ› —•«• §ο…α―σ§ ';
h3:='';
rq:=1;
end;
26: begin
s1:='EATV';
s2:='Deitel';
s3:='Adobe';
s4:='EAGames';
h1:='';
h2:='    ®ο«  ©ν«• ‹§‰ογ―σ‘©―σ«,―ο §ο…α©•«';
h3:='                ™£‰ο  ‘―£ο―σ§';
rq:=4;
end;
27: begin
s1:='θ§λ‰—';
s2:='δ―οε';
s3:='‚•—';
s4:='¦©χ—';
h1:='';
h2:='”«α  Microsoft ‹§‰ογ―σ‘©« ι‰υ«ν•ο―ε «―σ«';
h3:='';
rq:=3;
end;
28: begin
s1:='FrontPage';
s2:='Netscape';
s3:='Internet Explorer';
s4:='Mozzila FireFox';
h1:='';
h2:=' ”«αγ•ι• Web Browser ‰« ¥™ ω…ν…―ο›―σ§ ‰η™―ι«‰ο―σ§';
h3:='';
rq:=4;
end;
29: begin
s1:='βο―λ©‡‰ο«‰ο';
s2:='†•‹©«‰ο«‰ο';
s3:='―«ινο―σν―ο«‰ο';
s4:='€ο§‰«‘‰—«‰ο';
h1:='';
h2:='”«αγ‰ι ‰« ―αλ―σ§ •«ν‰ο«‰ν νο§‡ο―£ ‹§‰ογ―σ‘©―σ««‰ο';
h3:='';
rq:=1;
end;
30: begin
s1:='£©•« ρ«ρ';
s2:='μ«©•« ρ«ρ';
s3:='§­™ο©•« ρ«ρ';
s4:='€γο‰«χ ―σο™';
h1:='';
h2:='             ”«α  «­«―σ§ WWW γλ―σ§';
h3:='';
rq:=3;
end;
31: begin
s1:='SMS';
s2:='MMS';
s3:='RGB';
s4:='PHP';
h1:='';
h2:='”«αγ‰ι  γλ§« ν‰ιχ―λ νολ―σ§ ο§•ο,«α,γ―σ©ν ';
h3:='                    ιρ―σ‘©―σ«';
rq:=3;
end;
32: begin
s1:='βο―ƒ‰—';
s2:='Enter';
s3:='Shift';
s4:='Tab';
h1:='';
h2:='       θν‰£«­ο• λο ―ο ιν‰£«  §‰«‰οο  ';
h3:='';
rq:=1;
end;
33: begin
s1:='CTRL';
s2:='Caps Lock';
s3:='Shift';
s4:='Tab';
h1:='';
h2:='       θν‰£«­ο• λο ―ο ιν‰£«  λ‰—• ‰οο  ';
h3:='';
rq:=3;
end;
34: begin
s1:='„«―σ§  ™«―σ‘';
s2:='ο‘«―σ§ ';
s3:='φ«―σ§ ';
s4:='€«ενλ―σ§ ';
h1:='';
h2:='”«α   νολ―σ§ §ο…α• ‰ν ‰οƒ ι£§―σ§ ‰«χ Power ιν‰£«';
h3:='';
rq:=4;
end;
35: begin
s1:='F2';
s2:='F5';
s3:='F1';
s4:='F3';
h1:='';
h2:='      ®ο ιν‰£«  ω…ν…―ο›λ―σ§ ω…«―σ‘©« §ο';
h3:='';
rq:=3;
end;
36: begin
s1:='Nokia';
s2:='Xerox';
s3:='LG';
s4:='Samsung';
h1:='';
h2:='          ”«αγ•ι• §―«•ν―ο …―©―σ‘©―σ« α―σ«• ';
h3:='';
rq:=1;
end;
37: begin
s1:='‚‡•';
s2:='¬«•';
s3:='τ£•';
s4:='νλ•';
h1:='';
h2:='              ”«αγ‰ι ‰« «λ«―σ§ ^@^ «­«   ';
h3:='';
rq:=2;
end;
38: begin
s1:='Void';
s2:='Integer';
s3:='Byte';
s4:='Short';
h1:='';
h2:='    ”«αγ•ι• ν•γ …―©―σ‘©―σ« α―σ«• Pascal —‰‹λ―σ§   ';
h3:='';
rq:=1;
{39: begin
s1:='Home+Insert';
s2:='Del+Power';
s3:='Alt+Ctrl+Del';
s4:='Shift+Enter';
h1:='';
h2:='®ο ιν‰£«‰ο• §‡ο―σ‘©§ƒ ‰«χ «α―σ§ Task Manager-  ';
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
1:begin monitor(5,320,150,4,1,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,0,'','  —χ  ');
monitor(0,220,250,4,0,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,0,'','„οϋ•');
end;
2:begin
monitor(5,320,150,4,0,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,0,'','  —χ  ');
monitor(0,220,250,4,1,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,0,'','„οϋ•');
end;
3:begin
monitor(5,320,150,4,0,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,0,'','  —χ  ');
monitor(0,220,250,4,0,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,1,'','„οϋ•');
end;
4:begin
monitor(5,320,150,4,0,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,1,'','  —χ  ');
monitor(0,220,250,4,0,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,0,'','„οϋ•');
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
outtextxy(190,175,'¬«―ολ―ο―σ§ ‰«χ');
outtextxy(210,200,'†―σχ £‘‰ρ•χ');
delay(temp);delay(temp); delay(temp);
end
else begin
outtextxy(220,180,'   Sorry...')         ;
outtextxy(210,200,'†―σχ γονλ‰ρ•χ');
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
END;
goto 1;
end.
{0z(rn,ra,rn)30021}