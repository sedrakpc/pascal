uses crt,graph;
const r=20;
pause=10000;
var d,m,e,xm,ym,x,y,lx,ly,rx,ry,size,i,dx,dy,width,height:integer;
saucer:pointer;
label loop;
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
begin
init;
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
if readkey=#0 then x:=ord(readkey);
closegraph
end.

