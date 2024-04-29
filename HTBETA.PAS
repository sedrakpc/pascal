uses crt,graph;
label 1;
type vek=array[1..6] of byte;
var p1,p2,p3,p4,p5,p6:pointer;
size1,size2,size3,size4,size5,size6:longint;
x,y:vek;i,j1,j2,j3,j4,k:byte;ch:char;
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
Settextstyle(4,0,10);
outtextxy(50,200,'S');
outtextxy(150,200,'E');
outtextxy(250,200,'D');
outtextxy(350,200,'R');
outtextxy(450,200,'A');
outtextxy(550,200,'K');
case c of
1:begin setcolor(i);
outtextxy(50,200,'S');end;
2:begin setcolor(i);
outtextxy(150,200,'E');setcolor(5);outtextxy(410,400,'.'); end;
3:begin setcolor(i);
outtextxy(250,200,'D');end;
4:begin setcolor(i);
outtextxy(350,200,'R');setcolor(5);outtextxy(425,400,'.');end;
5:begin setcolor(i);
outtextxy(450,200,'A');end;
6:begin setcolor(i);
outtextxy(550,200,'K');setcolor(5);outtextxy(440,400,'.');end;
end;
delay(40000);end;
end;cleardevice
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
procedure andra(x1:vek;y1:vek;var i:byte);
begin
if (x1[1]=y1[1]) or (x1[2]=y1[2]) or (x1[3]=y1[3])
 or (x1[4]=y1[4]) or (x1[5]=y1[5]) or (x1[6]=y1[6])
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
peshka;size1:=imagesize(200,100,280,200);
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
ham(j1,j2,j3,j4);
if j4=1 then begin Settextstyle(5,0,1);setcolor(9);
outtextxy(250,280,'Hamarshek E');end
else begin Settextstyle(5,0,1);setcolor(9);
outtextxy(250,280,'Hamarshek Che');end;
repeat
ch:=readkey
until (ch=#27) or (ch=#13);
if ch=#13 then goto 1;
freemem(p1,size1);freemem(p2,size2);freemem(p3,size3);
freemem(p4,size4);freemem(p5,size5);freemem(p6,size6);
end.