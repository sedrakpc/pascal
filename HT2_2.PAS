uses crt,graph,dos;
label 1,2;
type vek=array[1..100] of byte;
var p1,p2,p3,p4,p5,p6:pointer;
a,b,x,y,z:vek;i,j,an,bn,zn,k:byte;
size1,size2,size3,size4,size5,size6:longint;
aa,bb:set of byte;s1:string;t,t1,t2:boolean;
j1,j2,j3,j4,amg:byte;ch,Ferrari:char;
procedure init;
var GD,GM,EC:integer;
begin
GD:=detect;
initgraph(GD,gm,'c:\bp\bgi');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
end;
procedure gam;
var d,r,rn,z,r1,r2,rr,k,x1,x2,y1,y2,x01,y01,x02,y02,m:integer;
xasp,yasp,q,w,e,f:word;
begin
x1:=getmaxx div 2;
y1:=getmaxy div 2;
getaspectratio(xasp,yasp);
r:=round(3*getmaxy*yasp/8/xasp);
r1:=round(0.9*r);
r2:=round(0.95*r);
circle(x1,y1,r);
circle(x1,y1,round(1.02*r));
for k:=0 to 59 do begin
if k mod 5=0 then rr:=r1
else rr:=r2;
x01:=x1+round(rr*sin(2*pi*k/60));
y01:=y1-round(rr*xasp*cos(2*pi*k/60)/yasp);
x2:=x1+round(r*sin(2*pi*k/60));
y2:=y1-round(r*xasp*cos(2*pi*k/60)/yasp);
line(x01,y01,x2,y2);
end;
setlinestyle(solidln,0,thickwidth);
gettime(q,w,e,f);
r:=12*e;z:=q*60+w;m:=12*w;rn:=0;
repeat
if not keypressed then
begin
if r=0 then m:=w*12;
if m=0 then z:=q*60+w;
x2:=x1+round(1*r1*sin(2*pi*r/60/12));
y2:=y1-round(1*r1*xasp*cos(2*pi*r/60/12)/yasp);
x02:=x1+round(0.90*r1*sin(2*pi*m/60/12));
y02:=y1-round(0.90*r1*xasp*cos(2*pi*m/60/12)/yasp);
x01:=x1+round(0.65*r1*sin(2*pi*z/60/12));
y01:=y1-round(0.65*r1*xasp*cos(2*pi*z/60/12)/yasp);
setcolor(15);
line(x1,y1,x01,y01);
line(x1,y1,x02,y02);
line(x1,y1,x2,y2);
outtextxy(292,340,'Quartz');rn:=r;
if r<59*12 then begin
repeat
gettime(q,w,e,f);
r:=e*12;m:=w*12;delay(5);
until r>rn;end
else begin r:=0;delay(50000);
delay(50000);end;
setcolor(0);
line(x1,y1,x01,y01);
line(x1,y1,x02,y02);
line(x1,y1,x2,y2);end;
until keypressed;
end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]}
procedure asd(x,y:vek;n:byte;var z:vek;var zn:byte);
var i,j:byte;t:boolean;
begin z[1]:=x[1];zn:=1;
for i:=1 to n do begin t:=true;
for j:=1 to zn do begin
if z[j]=x[i] then begin t:=false;break end;
if t=true then begin zn:=zn+1;z[zn]:=x[i] end;
end;end;
for i:=1 to n do begin t:=true;
for j:=1 to zn do begin
if z[j]=y[i] then begin t:=false;break end;
if t=true then begin zn:=zn+1;z[zn]:=y[i] end;
end;end;
end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure andr(x,y,z:vek;n,zn:byte;var t:boolean);{Andradarceliutjun}
var i,j:byte;zt:boolean;
begin t:=true;
for i:=1 to zn do begin
zt:=false;
for j:=1 to n do
if (z[i]=x[j]) and (z[i]=y[j]) then begin zt:=true;break end;
if zt=true then continue
else begin t:=false;break;end;
end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure hamat(x,y:vek;n:byte;var t:boolean);{Hamatexeli}
var zt:boolean;i,j:byte;
begin t:=true;
for i:=1 to n do begin
zt:=false;
for j:=1 to n do
if (x[i]=y[j]) and (y[i]=x[j]) then begin zt:=true;break end;
if zt=true then continue
else begin t:=false;break;end;
end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure poxan(x,y,z:vek;n,zn:byte;var t:boolean);{poxanceliutjun}
var i,j,k:byte;t1,t2:boolean;
begin t:=true;
for i:=1 to zn do begin t1:=true;
for j:=1 to zn do begin t2:=false;
for k:=1 to n do
if (x[k]=z[i]) and (y[k]=z[j]) then begin t2:=true;break;end;
if t2=true then continue
else begin t1:=false;break;end;
end;
if t1=true then continue
else begin t:=false;break;end;
end;
end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure functia(x:vek;n:byte;var t:boolean);{Function}
var i,j,k:byte;
begin  t:=true;
for i:=1 to n do  begin  k:=0;
for j:=1 to n do if x[i]=x[j] then k:=k+1;
if k>1 then begin t:=false;break;end;
end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure arta(x,z:vek;n,zn:byte;var t:boolean);{Artapatkerum}
var i,j:byte;t1:boolean;
begin t:=true;
if zn<>n then t:=false
else begin
for i:=1 to zn do begin t1:=false;
for j:=1 to n do if z[i]=x[j] then begin t1:=true;break;end;
if t1=true then continue
else begin t:=false;break;end;
end;end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure vrad(x,z:vek;n,zn:byte;var t:boolean);{Veradrumrum}
var i,j:byte;t1:boolean;
begin t:=true;
if zn<>n then t:=false
else begin
for i:=1 to zn do begin t1:=false;
for j:=1 to n do if z[i]=x[j] then begin t1:=true;break;end;
if t1=true then continue
else begin t:=false;break;end;
end;end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure peshka;
const
peshka1:array[1..19] of pointtype=
((x:200; y:200),(x:200; y:190),(x:210; y:180),(x:220; y:180),
(x:230;y:170),(x:230;y:140),(x:220;y:130),(x:220;y:110),
(x:230;y:100),(x:250;y:100),(x:260;y:110),(x:260;y:130),(x:250;y:140),
(x:250;y:170),(x:260;y:180),(x:270;y:180),(x:280;y:190),
(x:280;y:200),(x:200;y:200));
begin
setcolor(4);drawpoly(19,peshka1);floodfill(240,150,4);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure ladia;
const
ladia1:array[1..23] of pointtype=
((x:200; y:200),(x:200; y:190),(x:210; y:180),(x:210; y:130),
(x:200;y:120),(x:200;y:100),(x:210;y:100),(x:210;y:110),
(x:220;y:120),(x:230;y:110),(x:230;y:100),(x:250;y:100),(x:250;y:110),
(x:260;y:120),(x:270;y:110),(x:270;y:100),(x:280;y:100),
(x:280;y:120),(x:270;y:130),(x:270;y:180),(x:280;y:190),
(x:280;y:200),(x:200;y:200));
begin
setcolor(4);drawpoly(23,ladia1);floodfill(240,150,4);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure slon;
const
slon1:array[1..26] of pointtype=
((x:200; y:200),(x:200; y:190),(x:210; y:180),(x:220; y:180),
(x:220;y:170),(x:210;y:160),(x:220;y:160),(x:230;y:150),
(x:230;y:130),(x:220;y:130),(x:210;y:120),(x:230;y:100),(x:250;y:100),
(x:270;y:120),(x:260;y:130),(x:260;y:130),(x:250;y:130),(x:250;y:150),
(x:260;y:160),(x:270;y:160),(x:260;y:170),(x:260;y:180),
(x:270;y:180),(x:280;y:190),(x:280;y:200),(x:200;y:200));
begin
setcolor(4);drawpoly(26,slon1);floodfill(240,150,4);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure korol;
const
korol1:array[1..23] of pointtype=
((x:200; y:200),(x:200; y:190),(x:210; y:180),(x:220; y:180),
(x:200;y:160),(x:200;y:150),(x:210;y:140),(x:220;y:140),
(x:220;y:120),(x:210;y:110),(x:220;y:100),(x:260;y:100),(x:270;y:110),
(x:260;y:120),(x:260;y:140),(x:270;y:140),(x:280;y:150),(x:280;y:160),
(x:260;y:180),(x:270;y:180),(x:280;y:190),(x:280;y:200),
(x:200;y:200));
begin
setcolor(4);drawpoly(23,korol1);floodfill(240,150,4);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure ferz;
const
ferz1:array[1..24] of pointtype=
((x:200; y:200),(x:200; y:190),(x:210; y:180),(x:220; y:180),
(x:210;y:150),(x:220;y:150),(x:230;y:140),(x:230;y:130),
(x:220;y:130),(x:200;y:100),(x:230;y:110),(x:240;y:100),(x:250;y:110),
(x:280;y:100),(x:260;y:130),(x:250;y:130),(x:250;y:140),(x:260;y:150),
(x:270;y:150),(x:260;y:180),(x:270;y:180),(x:280;y:190),
(x:280;y:200),(x:200;y:200));
begin
setcolor(4);drawpoly(24,ferz1);floodfill(240,150,4);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure kon;
const
kon1:array[1..20] of pointtype=
((x:200; y:200),(x:200; y:190),(x:210; y:180),(x:220; y:180),
(x:230;y:160),(x:240;y:150),(x:240;y:140),(x:220;y:160),
(x:210;y:160),(x:200;y:150),(x:200;y:140),(x:230;y:100),(x:260;y:100),
(x:280;y:120),(x:280;y:140),(x:260;y:180),(x:270;y:180),(x:280;y:190),
(x:280;y:200),(x:200;y:200));
begin
setcolor(4);line(235,130,245,120);line(245,120,242,130);
line(242,130,235,130);
drawpoly(20,kon1);floodfill(250,150,4);
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure loading;
var i,j,c,z:byte;
begin
i:=4;
for z:=1 to 5 do begin
randomize;
setcolor(2);Settextstyle(3,0,4);outtextxy(270,400,'LOADING');
for c:=1 to 6 do begin
setcolor(2);Settextstyle(3,0,4);
outtextxy(410,400,'.');
outtextxy(425,400,'.');
outtextxy(440,400,'.');
Settextstyle(4,0,10);
setbkcolor(0);setcolor(14);
Settextstyle(1,0,10);
outtextxy(50,200,'H');
outtextxy(150,200,'T');
outtextxy(250,200,'&');
outtextxy(390,200,'I');
outtextxy(450,200,'M');
outtextxy(550,200,'H');
case c of
1:begin setcolor(i);
outtextxy(50,200,'H');end;
2:begin setcolor(i);
outtextxy(150,200,'T');setcolor(5);outtextxy(410,400,'.'); end;
3:begin setcolor(i);
outtextxy(250,200,'&');end;
4:begin setcolor(i);
outtextxy(390,200,'I');setcolor(5);outtextxy(425,400,'.');end;
5:begin setcolor(i);
outtextxy(450,200,'M');end;
6:begin setcolor(i);
outtextxy(550,200,'H');setcolor(5);outtextxy(440,400,'.');end;
end;
delay(40000);end;
end;cleardevice
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure andra(x1:vek;y1:vek;var i:byte);
begin
if (x1[1]=y1[1]) and (x1[2]=y1[2]) and (x1[3]=y1[3])
 and (x1[4]=y1[4]) and (x1[5]=y1[5]) and (x1[6]=y1[6])
then i:=1
else i:=0;
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure ham(m1,m2,m3:byte;var m4:byte);
begin
if (m1=1) and (m2=1) and (m3=1) then m4:=1
else m4:=0;
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin
init;loading;
Settextstyle(1,0,14);setcolor(9);
outtextxy(250,150,'SV');
circle(410,190,12);Settextstyle(1,0,2);
outtextxy(405,177,'R');
outtextxy(200,280,'Development Corporetion');
Settextstyle(1,0,1);
outtextxy(10,450,'All Rights Reserved');
Settextstyle(10,0,4);
outtextxy(365,270,'TM');
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
cleardevice;
Settextstyle(1,0,1);setcolor(15);
outtextxy(460,450,'For exit press Esc');
outtextxy(10,450,'Press F1 or F2');
gam;cleardevice;setlinestyle(solidln,0,1);
repeat
Ferrari:=readkey;
until (ferrari=#59) or (ferrari=#60) or (ferrari=#27);
case ferrari of
#59:begin peshka;size1:=imagesize(200,100,280,200);
getmem(p1,size1);getimage(200,100,280,200,p1^);
delay(60000);cleardevice;
ladia;size2:=imagesize(200,100,280,200);
getmem(p2,size2);getimage(200,100,280,200,p2^);
delay(60000);cleardevice;
slon;size3:=imagesize(200,100,280,200);
getmem(p3,size3);getimage(200,100,280,200,p3^);
delay(60000);cleardevice;
korol;size4:=imagesize(200,100,280,200);
getmem(p4,size4);getimage(200,100,280,200,p4^);
delay(60000);cleardevice;
ferz;size5:=imagesize(200,100,280,200);
getmem(p5,size5);getimage(200,100,280,200,p5^);
delay(60000);cleardevice;
kon;size6:=imagesize(200,100,280,200);
getmem(p6,size6);getimage(200,100,280,200,p6^);
delay(60000);cleardevice;
1:randomize;cleardevice;
for i:=1 to 6 do x[i]:=0;
for i:=1 to 6 do begin
repeat
k:=random(6)+1;
until (k<>x[1]) and (k<>x[2]) and (k<>x[3]) and (k<>x[4]) and
(k<>x[5]) and (k<>x[6]);
x[i]:=k;
case k of
1:putimage(50+(i-1)*90,10,p1^,xorput);
2:putimage(50+(i-1)*90,10,p2^,xorput);
3:putimage(50+(i-1)*90,10,p3^,xorput);
4:putimage(50+(i-1)*90,10,p4^,xorput);
5:putimage(50+(i-1)*90,10,p5^,xorput);
6:putimage(50+(i-1)*90,10,p6^,xorput);
end;
end;randomize;
for i:=1 to 6 do y[i]:=0;
for i:=1 to 6 do begin randomize;
repeat
k:=random(6)+1;
until (k<>y[1]) and (k<>y[2]) and (k<>y[3]) and (k<>y[4]) and
(k<>y[5]) and (k<>y[6]);
y[i]:=k;
case k of
1:putimage(50+(i-1)*90,120,p1^,xorput);
2:putimage(50+(i-1)*90,120,p2^,xorput);
3:putimage(50+(i-1)*90,120,p3^,xorput);
4:putimage(50+(i-1)*90,120,p4^,xorput);
5:putimage(50+(i-1)*90,120,p5^,xorput);
6:putimage(50+(i-1)*90,120,p6^,xorput);
end;
end;
Settextstyle(1,0,1);setcolor(9);outtextxy(5,450,'For EXIT press Esc');
outtextxy(380,450,'For New Shelve press Enter');
andra(x,y,j1);
if j1=1 then begin Settextstyle(5,0,1);setcolor(9);
outtextxy(250,250,'Andradardeli E');end
else begin Settextstyle(5,0,1);setcolor(9);;
outtextxy(250,250,'Andradardeli Che');end;
repeat
ch:=readkey
until (ch=#27) or (ch=#13);
if ch=#13 then goto 1;
freemem(p1,size1);freemem(p2,size2);freemem(p3,size3);
freemem(p4,size4);freemem(p5,size5);freemem(p6,size6);end;
#60:begin randomize;
restorecrtmode;
textbackground(15);textcolor(0);clrscr;gotoxy(15,1);
write('Mutqagrel erktox axjusaki erkarutjun@:>');
gotoxy(54,1);read(amg);
clrscr;gotoxy(13,1);
write('A bazmutjan erkarutjun@:>');read(an);aa:=[];bb:=[];
for i:=1 to an do begin
gotoxy(10,1+i);write('A[',i,']=');read(a[i]);aa:=aa+[a[i]];end;
gotoxy(53,1);write('B bazmutjan erkarutjun@:>');read(bn);
for i:=1 to bn do begin
gotoxy(50,1+i);write('B[',i,']=');read(B[i]);bb:=bb+[b[i]];end;
delay(60000);delay(60000);delay(60000);
setgraphmode(getgraphmode);setbkcolor(0);setcolor(15);
settextstyle(2,0,4);
2:j:=1;;cleardevice;line(80,1,640,1);
for i:=1 to 21 do line(1,22*i,640,22*i);
for i:=1 to 7 do line(80*i,1,80*i,480);
outtextxy(85,5,'Andradarceli');outtextxy(170,5,'Hamatexeli');
outtextxy(255,5,'Poxanceli');outtextxy(340,5,'Funckcia');
outtextxy(406,5,'Artapatkerum');outtextxy(500,5,'Vradrum');
outtextxy(575,5,'Veradrum');
{[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]}
repeat
s1:='';
for i:=1 to amg do begin
repeat
k:=random(9);
until k in aa;
x[i]:=k;
if i=amg then s1:=s1+chr(ord(48+k))
else s1:=s1+chr(ord(48+k))+' '
end;
outtextxy(1,(j+1)*10+j,s1);
{[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]}
s1:='';
for i:=1 to amg do begin
repeat
k:=random(9);
until k in bb;
y[i]:=k;
if i=amg then s1:=s1+chr(ord(48+k))
else s1:=s1+chr(ord(48+k))+' '
end;
outtextxy(1,(j+2)*10+j,s1);
andr(x,y,A,amg,an,t);
if t=true then outtextxy(110,15+j*11,'+')
else outtextxy(110,15+j*11,'-');
hamat(x,y,amg,t);
if t=true then outtextxy(200,15+j*11,'+')
else outtextxy(200,15+j*11,'-');
asd(x,y,amg,z,zn);
poxan(x,y,z,amg,zn,t);
if t=true then outtextxy(285,15+j*11,'+')
else outtextxy(285,15+j*11,'-');
functia(x,amg,t);
if t=true then outtextxy(370,15+j*11,'+')
else outtextxy(370,15+j*11,'-');
arta(x,A,amg,an,t);
if t=true then begin outtextxy(445,15+j*11,'+');t1:=true;end
else outtextxy(445,15+j*11,'-');
vrad(Y,B,amg,bn,t);
if t=true then begin outtextxy(520,15+j*11,'+');t2:=true;end
else outtextxy(520,15+j*11,'-');
if (t1=true) and (t2=true) then outtextxy(605,15+j*11,'+')
else outtextxy(605,15+j*11,'-');
j:=j+2;
until j=43;
{[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]}
repeat
ch:=readkey;
until (ch=#27) or (ch=#13);
if ch=#13 then goto 2;
end;
end;
end.