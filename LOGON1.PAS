uses crt,graph,dos;
var size:longint;p:pointer;
x,y,xn,yn,i,j:integer;ch:char;
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
setcolor(15);
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
procedure start15;
begin
i:=15;j:=15;
start(i);size:=imagesize(1,460,640,480);
getmem(p,size);
getimage(1,460,640,480,p^);
repeat setbkcolor(0);cleardevice;
if y<=460 then putimage(1,460,p^,andput)
else start(15);
time;
arow(j);
cursor(x,y,15);
ch:=readkey;xn:=x;yn:=y;
case ch of
#75:x:=x-10;
#77:x:=x+10;
#72:y:=y-10;
#80:y:=y+10;
end;
if x<1 then x:=1;
if x>640 then x:=640;
if y<1 then y:=1;
if y>480 then y:=480;
if (x<=54) and (y>=459) then i:=4
else i:=15;
if (x<591) and (y>=464) and (x>579) and (y<476) then j:=4
else j:=15;
delay(1);
until ch=#27;
end;
{[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
begin
init;randomize;
x:=random(80);y:=random(140)+300;
start15;freemem(p,size);
closegraph
end.