program Praktika;
uses graph,dos,crt,mouse;
var ss:string;mouse_ok:boolean;
count,x,y:word;
button,port:byte;
ver:str6;i,j,c,z:byte;ch:char;
procedure loading;
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
delay(60000);end;
end;
settextstyle(0,0,1);
end;

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
procedure shutt_down;
begin
hide_cursor;
delay(50000);
cleardevice;
delay(50000);
setfillstyle(1,1);setcolor(1);
bar(0,0,640,30);
bar(0,450,640,480);
setfillstyle(1,3);setcolor(3);floodfill(320,240,1);
setcolor(15);settextstyle(1,0,3);
outtextxy(400,200,'Windows');
setcolor(4);
outtextxy(495,195,'XP');
setcolor(15);settextstyle(0,0,1);
outtextxy(350,230,'Loging off...');
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
setcolor(3);outtextxy(350,230,'Loging off...');
setcolor(15);outtextxy(350,230,'Seveing your settings...');
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
setcolor(3);outtextxy(350,230,'Seveing your settings...');
setcolor(15);outtextxy(350,230,'Windows is shutting down...');
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
setcolor(3);outtextxy(350,230,'Windows is shutting down...');
end;
{[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]}
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
procedure arow(v:byte);
begin
setcolor(15);setfillstyle(1,2);
line(585,460,585,463);line(585,477,585,480);
circle(585,470,6);
if v=4 then setfillstyle(1,4);floodfill(585,470,15);
line(586,467,583,470);line(583,470,586,473);
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
procedure Sedrak;
begin
setfillstyle(1,1);
bar(1,320,120,460);outtextxy(35,330,'SEDRAK');turn_off(1);
repeat time;
get_mouse_status(button,x,y);
until (x<110) and (y>=433) and (x>1) and (y<458);
hide_cursor;turn_off(8);show_cursor;
repeat time;
get_mouse_status(button,x,y);
until (x>110) or (y<433) or (x<1) or (y>=458) or (button=1);
if button=1 then begin shutt_down;halt end;
repeat time;
get_mouse_status(button,x,y);
until (button=1);
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure start15;
begin
start(15);time;
arow(j);ch:='a';
repeat
repeat time;
get_mouse_status(button,x,y);
until (x<=54) and (y>=459);
hide_cursor;
cleardevice;start(4);time;arow(j);
show_cursor;
repeat
button:=0;
get_mouse_status(button,x,y);
time;
until (x>54) or (y<459) or (button=1);
if button=1 then sedrak;
repeat time;
get_mouse_status(button,x,y);
until (x>54) or (y<459);
hide_cursor;
cleardevice;start(15);time;arow(j);
show_cursor;
until ch='s';
end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin
init;loading;cleardevice;start(15);
reset_mouse(mouse_ok,button);
if not mouse_ok then halt;
show_cursor;start15;
closegraph
end.



















