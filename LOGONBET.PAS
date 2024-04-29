uses crt,graph,dos;
var size:longint;p:pointer;t:boolean;
x,y,i,j,xn,yn,b:integer;ch:char;
{[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]}
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
{[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure time;
var a,s,d,f:word;s1:string;aa,ss:integer;
begin
gettime(a,s,d,f);
if a=0 then s1:=chr(ord(48))+chr(ord(48))
else
if a<10 then s1:=chr(ord(48+a))
else begin aa:=a div 10;ss:=a mod 10;
s1:=chr(ord(48+aa));s1:=s1+chr(ord(48+ss));end;
s1:=s1+chr(ord(58));
if s=0 then s1:=s1+chr(ord(48))+chr(ord(48))
else
if s<10 then s1:=s1+chr(ord(48))+chr(ord(48+s))
else  begin aa:=s div 10;ss:=s mod 10;
s1:=s1+chr(ord(48+aa));s1:=s1+chr(ord(48+ss));end;setcolor(15);
outtextxy(595,467,s1)
end;
{[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]}
procedure start(a:byte);
begin
setfillstyle(1,1);
bar(1,460,640,480);setfillstyle(1,2);bar(1,460,50,480);
setlinestyle(0,0,1);setcolor(2);line(50,460,60,470);
line(60,470,50,480);line(50,460,50,480);floodfill(59,470,2);
setcolor(a);outtextxy(7,466,'start');
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure cursor(x,y,k:word);
begin
setlinestyle(0,0,1);
setcolor(k);
line(x,y,x,y+16);line(x,y+16,x+4,y+14);line(x+4,y+14,x+6,y+18);
line(x+6,y+18,x+9,y+18);line(x+9,y+18,x+6,y+13);
line(x+6,y+13,x+11,y+11);line(x+11,y+11,x,y);
setfillstyle(1,k);floodfill(x+1,y+2,k);
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure arow(v:byte);
begin
setcolor(15);setfillstyle(1,2);
line(585,460,585,463);line(585,477,585,480);
circle(585,470,6);
if v=4 then setfillstyle(1,4);floodfill(585,470,15);
line(586,467,583,470);line(583,470,586,473);
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure Sedrak;
begin
setfillstyle(1,1);
bar(1,320,120,460);outtextxy(35,330,'SEDRAK');
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure turn_off(g:byte);
begin
setfillstyle(1,g);
bar(2,433,110,458);setfillstyle(1,4);
bar(5,435,30,456);outtextxy(35,440,'Turn OFF');
circle(17,446,7);line(17,443,17,449)
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure start15;
begin
i:=15;j:=15;t:=false;b:=1;
start(i);
repeat cleardevice;start(i);time;
arow(j);
if t=true then begin sedrak;turn_off(b);end;
cursor(x,y,15);
ch:=readkey;
case ch of
#75:x:=x-10;
#77:x:=x+10;
#72:y:=y-10;
#80:y:=y+10;
end;
if (b=8) and (ch=#13) then ch:='s';
if (ch=#13) and (i=4) then t:=true;
if x<1 then x:=1;
if x>640 then x:=640;
if y<1 then y:=1;
if y>480 then y:=480;
if (t=true) and (ch=#27) then t:=false;
if (x<=54) and (y>=459) then i:=4
else i:=15;
if (x<591) and (y>=464) and (x>579) and (y<476) then j:=4
else j:=15;
if (x<110) and (y>=433) and (x>1) and (y<458) and(t=true) then b:=8
else b:=1;
delay(2);
until ch='s';
end;
{[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
begin
init;randomize;
x:=random(80);y:=random(140)+300;
start15;
closegraph
end.