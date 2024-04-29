program Praktika;
uses graph,dos,crt,mouse;
var ss:string;mouse_ok:boolean;
count,x,y:word;
button,port:byte;
ver:str6;i,j,c,z:byte;ch:char;
procedure loadingXP;
begin
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
settextstyle(0,0,1);Setcolor(white);
outtextxy(550,455,'Microsoft');
outtextxy(10,455,'Copyright  Microsoft Corporation');
circle(288,223,5);circle(87,459,5);settextstyle(2,0,4);
outtextxy(85,452,'c');outtextxy(286,217,'R');
settextstyle(1,0,5);outtextxy(210,220,'Windows');
circle(380,240,5);settextstyle(2,0,4);
outtextxy(378,234,'R');
settextstyle(2,0,4);
outtextxy(390,215,'TM');
settextstyle(0,0,1);Setcolor(white);
outtextxy(210,220,'Microsoft');
settextstyle(1,0,4);Setcolor(4);
outtextxy(385,218,'XP');
setcolor(blue);setfillstyle(1,blue);
ellipse(315,220,0,160,20,10);
ellipse(326,185,0,160,20,10);line(296,216,307,182);
line(336,218,346,184);floodfill(325,195,1);
setcolor(4);setfillstyle(1,4);
ellipse(330,174,0,160,20,10);
ellipse(342,138,0,160,20,10);line(311,170,322,136);
line(351,172,362,138);floodfill(340,149,4);
setcolor(14);setfillstyle(1,14);
ellipse(365,220,180,340,20,10);
ellipse(376,184,180,340,20,10);line(344,220,355,183);
line(383,223,395,189);floodfill(370,200,14);
setcolor(2);setfillstyle(1,2);
ellipse(379,174,180,340,20,10);
ellipse(392,138,180,340,20,10);line(359,173,371,138);
line(398,178,411,143);floodfill(380,150,2);
setcolor(7);
line(265,350,372,350);line(265,364,372,364);
ellipse(265,357,90,270,5,7);
ellipse(372,357,270,90,5,7);
for j:=1 to 5 do begin
setcolor(blue);setfillstyle(1,blue);
bar(267,352,272,362);delay(30000);
bar(274,352,279,362);delay(30000);
bar(281,352,286,362);delay(30000);
for i:=1 to 12 do begin
setcolor(0);setfillstyle(1,0);
bar(267+(i-1)*7,352,272+(i-1)*7,362);
setcolor(blue);setfillstyle(1,blue);
bar(281+i*7,352,286+i*7,362);delay(10000);
bar(267+i*7,352,272+i*7,362);delay(10000);
bar(274+i*7,352,279+i*7,362);delay(10000);
end;
setcolor(0);setfillstyle(1,0);
for i:=13 to 15 do begin
bar(267+(i-1)*7,352,272+(i-1)*7,362);delay(20000);end;
end;
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
outtextxy(350,230,'Logging off...');
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
setcolor(3);outtextxy(350,230,'Logging off...');
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
init;loadingxp;
cleardevice;
delay(50000);delay(50000);
delay(50000);delay(50000);
delay(50000);delay(50000);
show_cursor;
delay(50000);delay(50000);
delay(50000);delay(50000);
delay(50000);delay(50000);
hide_cursor;
settextstyle(0,0,1);
start(15);
reset_mouse(mouse_ok,button);
if not mouse_ok then halt;
show_cursor;start15;
closegraph
end.



















