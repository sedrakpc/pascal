program fern;
uses crt,graph;
{$i asd.pas}
label 1,2;
var ch,ss:char;f:longint;
procedure draw(ite:longint);
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
putpixel(midx+round(radius*x),midy-round(radius*y),red);
end;
end;
begin
asd;
1:cleardevice; outtextxy(0,456,'read n');readln(f);cleardevice;
draw(f);
outtextxy(0,456,'press <Enter> to repeat or <Esc> to exit:');
repeat
ch:=readkey;
until (ch=#13) or (ch=#27);
if ch=#13 then goto 1;
closegraph;
end.