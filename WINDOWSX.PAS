program Praktika;
uses graph,dos,crt,mouse;
var ss:string;mouse_ok:boolean;
count,x,y:word;
button,port:byte;
ver:str6;i,j,c,z:byte;ch:char;
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
procedure icon1(x,y:integer);
var i:byte;
begin
for i:=0 to 6 do putpixel(x+20+i,y,12);putpixel(x+27,y,0);
putpixel(x+28,y,0);
for i:=1 to 9 do putpixel(x+4+i,y+1,0);
for i:=1 to 9 do putpixel(x+18+i,y+1,12);
putpixel(x+28,y+1,0);putpixel(x+29,y+1,0);
putpixel(x+4,y+2,0);putpixel(x+5,y+2,0);
for i:=1 to 6 do putpixel(x+5+i,y+2,7);
for i:=1 to 4 do putpixel(x+11+i,y+2,0);
for i:=1 to 10 do putpixel(x+17+i,y+2,12);
putpixel(x+28,y+2,0);putpixel(x+29,y+2,0);putpixel(x+30,y+2,0);
putpixel(x+3,y+3,0);putpixel(x+4,y+3,0);
for i:=1 to 8 do putpixel(x+4+i,y+3,7);
for i:=1 to 4 do putpixel(x+12+i,y+3,0);
for i:=1 to 12 do putpixel(x+16+i,y+3,12);
putpixel(x+29,y+3,0);putpixel(x+30,y+3,0);
putpixel(x+2,y+4,0);putpixel(x+3,y+4,0);
for i:=1 to 10 do putpixel(x+3+i,y+4,7);
for i:=1 to 3 do putpixel(x+13+i,y+4,0);
for i:=1 to 12 do putpixel(x+16+i,y+4,12);
putpixel(x+29,y+4,0);putpixel(x+30,y+4,0);
putpixel(x+2,y+5,0);
for i:=1 to 6 do putpixel(x+2+i,y+5,7);
putpixel(x+9,y+5,0);for i:=1 to 4 do putpixel(x+9+i,y+5,0);
putpixel(x+14,y+5,0);putpixel(x+15,y+5,0);putpixel(x+16,y+5,0);
putpixel(x+17,y+5,12);putpixel(x+18,y+5,14);putpixel(x+19,y+5,14);
putpixel(x+20,y+5,12);putpixel(x+21,y+5,12);
for i:=1 to 5 do putpixel(x+21+i,y+5,14);putpixel(x+27,y+5,12);
putpixel(x+28,y+5,12);putpixel(x+29,y+5,0);putpixel(x+30,y+5,0);
putpixel(x+1,y+6,0);putpixel(x+2,y+6,0);
for i:=1 to 3 do putpixel(x+2+i,y+6,7);putpixel(x+6,y+6,0);
for i:=1 to 4 do putpixel(x+6+i,y+6,4);
for i:=1 to 4 do putpixel(x+10+i,y+6,12);putpixel(x+15,y+6,0);
putpixel(x+16,y+6,0);putpixel(x+17,y+6,12);
for i:=1 to 10 do putpixel(x+17+i,y+6,14);putpixel(x+28,y+6,12);
putpixel(x+29,y+6,0);putpixel(x+30,y+6,0);
putpixel(x+1,y+7,0);for i:=1 to 4 do putpixel(x+1+i,y+7,7);
putpixel(x+6,y+7,4);for i:=1 to 8 do putpixel(x+6+i,y+7,12);
putpixel(x+15,y+7,4);putpixel(x+16,y+7,0);putpixel(x+17,y+7,12);
for i:=1 to 10 do putpixel(x+17+i,y+7,14);putpixel(x+28,y+7,12);
putpixel(x+29,y+7,0);putpixel(x+30,y+7,0);
putpixel(x+1,y+8,0);
for i:=1 to 3 do putpixel(x+1+i,y+8,7);
putpixel(x+5,y+8,0);for i:=1 to 9 do putpixel(x+5+i,y+8,12);
putpixel(x+15,y+8,4);putpixel(x+16,y+8,0);putpixel(x+17,y+8,12);
for i:=1 to 10 do putpixel(x+17+i,y+8,14);putpixel(x+28,y+8,12);
putpixel(x+29,y+8,0);putpixel(x+30,y+8,0);
putpixel(x+1,y+9,0);putpixel(x+2,y+9,0);
for i:=1 to 2 do putpixel(x+2+i,y+9,7);
putpixel(x+5,y+9,0);for i:=1 to 9 do putpixel(x+5+i,y+9,12);
putpixel(x+15,y+9,4);putpixel(x+16,y+9,0);putpixel(x+17,y+9,12);
for i:=1 to 10 do putpixel(x+17+i,y+9,14);putpixel(x+28,y+9,12);
putpixel(x+29,y+9,0);putpixel(x+30,y+9,0);
putpixel(x+1,y+10,0);putpixel(x+2,y+10,0);putpixel(x+3,y+10,0);
putpixel(x+4+i,y+10,7);putpixel(x+5,y+10,0);
for i:=1 to 9 do putpixel(x+5+i,y+10,12);
putpixel(x+15,y+10,4);putpixel(x+16,y+10,0);putpixel(x+17,y+10,12);
putpixel(x+18,y+10,12);for i:=1 to 8 do putpixel(x+18+i,y+10,14);
putpixel(x+27,y+10,12);putpixel(x+28,y+10,0);putpixel(x+29,y+10,0);
putpixel(x+30,y+10,0);
for i:=1 to 5 do putpixel(x+i,y+11,0);putpixel(x+3,y+10,7);
putpixel(x+3,y+11,7);
for i:=1 to 8 do putpixel(x+5+i,y+11,12);putpixel(x+14,y+11,4);
for i:=1 to 3 do putpixel(x+14+i,y+11,0);putpixel(x+18,y+11,12);
for i:=1 to 7 do putpixel(x+18+i,y+11,14);putpixel(x+26,y+11,12);
putpixel(x+27,y+11,12);for i:=1 to 3 do putpixel(x+27+i,y+11,0);
for i:=1 to 5 do putpixel(x+i,y+12,0);putpixel(x+6,y+12,4);
for i:=1 to 7 do putpixel(x+6+i,y+12,12);putpixel(x+14,y+12,4);
for i:=1 to 3 do putpixel(x+14+i,y+12,0);putpixel(x+18,y+12,12);
putpixel(x+19,y+12,12);for i:=1 to 5 do putpixel(x+19+i,y+12,14);
putpixel(x+25,y+12,12);putpixel(x+26,y+12,12);
for i:=1 to 4 do putpixel(x+26+i,y+12,0);
for i:=1 to 5 do putpixel(x+i,y+13,0);putpixel(x+6,y+13,4);
for i:=1 to 7 do putpixel(x+6+i,y+13,12);putpixel(x+14,y+13,4);
for i:=1 to 3 do putpixel(x+14+i,y+13,0);putpixel(x+18,y+13,12);
putpixel(x+19,y+13,12);for i:=1 to 5 do putpixel(x+19+i,y+13,14);
putpixel(x+25,y+13,12);putpixel(x+26,y+13,12);
for i:=1 to 4 do putpixel(x+26+i,y+13,0);
for i:=1 to 6 do putpixel(x+i,y+14,0);putpixel(x+7,y+13,4);
for i:=1 to 5 do putpixel(x+7+i,y+14,12);putpixel(x+13,y+14,4);
putpixel(x+14,y+14,0);putpixel(x+15,y+14,0);putpixel(x+16,y+14,2);
putpixel(x+17,y+14,2);putpixel(x+18,y+14,10);putpixel(x+19,y+14,2);
for i:=1 to 6 do putpixel(x+i+19,y+14,12);
putpixel(x+25,y+14,12);putpixel(x+26,y+14,2);
for i:=1 to 3 do putpixel(x+26+i,y+14,0);
for i:=1 to 7 do putpixel(x+i,y+15,0);putpixel(x+8,y+15,4);
for i:=1 to 3 do putpixel(x+8+i,y+15,12);putpixel(x+12,y+15,4);
putpixel(x+13,y+15,0);putpixel(x+14,y+15,0);putpixel(x+7,y+14,0);
putpixel(x+15,y+15,2);putpixel(x+16,y+15,2);
for i:=1 to 3 do putpixel(x+16+i,y+15,10 );putpixel(x+20,y+15,15);
putpixel(x+21,y+15,14);putpixel(x+22,y+15,12);putpixel(x+23,y+15,14);
putpixel(x+24,y+15,15);putpixel(x+25,y+15,10);putpixel(x+26,y+15,10);
putpixel(x+27,y+15,2);putpixel(x+28,y+15,0);putpixel(x+29,y+15,0);
for i:=1 to 3 do putpixel(x+1+i,y+16,0);putpixel(x+5,y+16,2);
putpixel(x+6,y+16,3);putpixel(x+7,y+16,9);
for i:=1 to 4 do putpixel(x+7+i,y+16,4);putpixel(x+12,y+16,9);
putpixel(x+13,y+16,3);putpixel(x+14,y+16,3);putpixel(x+15,y+16,2);
for i:=1 to 3 do putpixel(x+15+i,y+16,10);putpixel(x+19,y+16,2);
for i:=1 to 4 do putpixel(x+19+i,y+16,15);putpixel(x+24,y+16,2);
for i:=1 to 3 do putpixel(x+24+i,y+16,10);putpixel(x+28,y+16,2);
putpixel(x+29,y+16,0);putpixel(x+30,y+16,0);
putpixel(x+3,y+17,1);putpixel(x+4,y+17,1);putpixel(x+5,y+17,3);
putpixel(x+6,y+17,3);putpixel(x+7,y+17,1);putpixel(x+8,y+17,3);
putpixel(x+9,y+17,9);putpixel(x+10,y+17,9);putpixel(x+11,y+17,3);
putpixel(x+12,y+17,3);putpixel(x+13,y+17,1);putpixel(x+14,y+17,3);
putpixel(x+15,y+17,3);putpixel(x+16,y+17,1);putpixel(x+17,y+17,10);
putpixel(x+18,y+17,10);putpixel(x+19,y+17,2);
for i:=1 to 3 do putpixel(x+19+i,y+17,15);putpixel(x+23,y+17,2);
for i:=1 to 5 do putpixel(x+23+i,y+17,10);putpixel(x+29,y+17,2);
putpixel(x+30,y+17,0);putpixel(x+31,y+17,0); putpixel(x+3,y+18,1);
for i:=1 to 4 do putpixel(x+3+i,y+18,3);putpixel(x+8,y+18,1);
for i:=1 to 4 do putpixel(x+8+i,y+18,15);putpixel(x+13,y+18,1);
for i:=1 to 4 do putpixel(x+13+i,y+18,3);putpixel(x+18,y+18,10);
putpixel(x+19,y+18,2);putpixel(x+20,y+18,15);putpixel(x+21,y+18,15);
putpixel(x+22,y+18,10);putpixel(x+23,y+18,2);
for i:=1 to 5 do putpixel(x+23+i,y+18,10);putpixel(x+29,y+18,2);
putpixel(x+30,y+18,0);putpixel(x+31,y+18,0);putpixel(x+2,y+19,1);
for i:=1 to 7 do putpixel(x+2+i,y+19,3);for i:=1 to 3 do
putpixel(x+9+i,y+19,15);for i:=1 to 4 do putpixel(x+12+i,y+19,3);
putpixel(x+17,y+19,1);putpixel(x+18,y+19,10);putpixel(x+19,y+19,2);
putpixel(x+20,y+19,10);putpixel(x+21,y+19,15);putpixel(x+22,y+19,2);
for i:=1 to 6 do putpixel(x+22+i,y+19,10);putpixel(x+29,y+19,2);
for i:=1 to 3 do putpixel(x+29+i,y+19,0);putpixel(x+2,y+20,1);
for i:=1 to 6 do putpixel(x+2+i,y+20,3);putpixel(x+9,y+20,1);
putpixel(x+10,y+20,3);putpixel(x+11,y+20,15);putpixel(x+12,y+20,3);
putpixel(x+13,y+20,1);for i:=1 to 3 do putpixel(x+13+i,y+20,3);
putpixel(x+17,y+20,1);for i:=1 to 11 do putpixel(x+17+i,y+20,10);
putpixel(x+20,y+20,2);putpixel(x+21,y+20,2);
putpixel(x+29,y+20,10);putpixel(x+30,y+20,2);putpixel(x+31,y+20,0);
putpixel(x+32,y+20,0);putpixel(x+2,y+21,1);
for i:=1 to 7 do putpixel(x+2+i,y+21,3);putpixel(x+10,y+21,1);
putpixel(x+11,y+21,15);for i:=1 to 5 do putpixel(x+11+i,y+21,3);
putpixel(x+17,y+21,1);for i:=1 to 11 do putpixel(x+17+i,y+21,10);
putpixel(x+29,y+21,2);for i:=1 to 3 do putpixel(x+29+i,y+21,0);
putpixel(x+2,y+22,1);for i:=1 to 8 do putpixel(x+2+i,y+22,3);
putpixel(x+11,y+22,1);putpixel(x+12,y+22,1);
for i:=1 to 3 do putpixel(x+12+i,y+22,3);putpixel(x+16,y+22,1);
for i:=1 to 3 do putpixel(x+16+i,y+22,2);
for i:=1 to 8 do putpixel(x+19+i,y+22,10);putpixel(x+28,y+22,2);
putpixel(x+29,y+22,2);for i:=1 to 3 do putpixel(x+29+i,y+22,0);
putpixel(x+2,y+23,1);putpixel(x+3,y+23,1);
for i:=1 to 10 do putpixel(x+3+i,y+23,3);
for i:=1 to 2 do putpixel(x+13+i,y+23,1);
for i:=1 to 17 do putpixel(x+15+i,y+23,0);putpixel(x+2,y+24,0);
for i:=1 to 10 do putpixel(x+2+i,y+24,1);
for i:=1 to 19 do putpixel(x+12+i,y+24,0);
for i:=1 to 17 do putpixel(x+2+i,y+25,0);
for i:=1 to 13 do putpixel(x+3+i,y+26,0);
end;
procedure loggon;
begin
setfillstyle(1,1);setcolor(1);
bar(0,0,640,30);
bar(0,440,640,480);
setfillstyle(1,3);setcolor(3);floodfill(320,240,1);
setcolor(15);
setlinestyle(0,0,1);line(0,30,640,30);
setcolor(12);line(0,440,640,440);
setcolor(15);line(320,90,320,390);
setcolor(12);
line(354,223,388,223);line(354,257,388,257);
line(350,227,350,253);line(392,227,392,253);
ellipse(353,226,90,180,3,3);ellipse(389,226,0,90,3,3);
ellipse(353,254,180,270,3,3);ellipse(389,254,270,0,3,3);
setfillstyle(1,15);floodfill(359,240,12);
end;
procedure winlogon;
const masks:array[0..1,0..15] of word=(
($e1ff,$edff,$edff,$edff,
$edff,$ec00,$edb6,$edb6,
$0db6,$6ffe,$6ffe,$6ffe,
$7fee,$7fee,$7fee,$0000),
($1e00,$1200,$1200,$1200,
$1200,$13ff,$1249,$1249,
$f249,$9001,$9001,$9001,
$8001,$8001,$8001,$ffff));
var f:text;username,pas,s:string;
mouse_ok,t,t1:boolean;
count,x,y:word;ch:char;
button,port,k:byte;
begin
reset_mouse(mouse_ok,button);
if not mouse_ok then  halt;
loggon;icon1(353,227);
assign(f,'sam.sys');reset(f);
readln(f,username);readln(f,pas);close(f);
settextstyle(0,0,1);setcolor(15);
outtextxy(400,225,username);
setfillstyle(1,4);
line(20,445,36,445);line(20,465,36,465);
line(16,449,16,461);line(40,449,40,461);
ellipse(19,448,90,180,3,3);ellipse(37,448,0,90,3,3);
ellipse(19,462,180,270,3,3);ellipse(37,462,270,0,3,3);
floodfill(25,455,15);circle(28,455,5);line(28,452,28,458);
outtextxy(45,450,'Turn off computer');
settextstyle(2,0,4);
outtextxy(130,255,'To begin, click your user name');
show_cursor;
t:=true;t1:=false;
repeat
k:=0;
get_mouse_status(button,x,y);
if (x>350) and (x<392) and (y>223) and (y<257) and (button=1)
then t1:=true;
if (x>16) and (x<180) and (y>445) and (y<465) then k:=1;
if (t=true) and (k=1) then
begin hide_cursor;setcolor(15);line(45,460,180,460);t:=false;show_cursor end;
if (k=1) and (button=1) then begin shutt_down;halt;end;
if (k<>1) then
begin setcolor(1);line(45,460,180,460);t:=true; end;
until t1=true;
hide_cursor;
setcolor(1);
line(350,220,510,220);line(350,260,510,260);
line(346,224,346,256);line(514,224,514,256);
ellipse(349,223,90,180,3,3);ellipse(511,223,0,90,3,3);
ellipse(349,257,180,270,3,3);ellipse(511,257,270,0,3,3);
setfillstyle(1,1);floodfill(480,240,1);
setcolor(12);
line(354,223,388,223);line(354,257,388,257);
line(350,227,350,253);line(392,227,392,253);
ellipse(353,226,90,180,3,3);ellipse(389,226,0,90,3,3);
ellipse(353,254,180,270,3,3);ellipse(389,254,270,0,3,3);
setfillstyle(1,15);floodfill(359,240,12);icon1(353,227);
setcolor(15);setfillstyle(1,15);settextstyle(0,0,1);
outtextxy(400,225,username);
line(405,250,490,250);line(405,265,490,265);
line(401,254,401,261);line(494,254,494,261);
ellipse(404,253,90,180,3,3);ellipse(491,253,0,90,3,3);
ellipse(404,262,180,270,3,3);ellipse(491,262,270,0,3,3);
floodfill(450,260,15);settextstyle(2,0,4);
outtextxy(400,235,'Type your password');
settextstyle(2,0,2);
outtextxy(440,445,'After you log on,you can add or change accounts.');
outtextxy(440,452,'Just go to Cantrol Panel and click User Accounts.');
show_cursor;delay(20000);
t:=true;t1:=false;s:='';setcolor(15);
repeat
k:=0;
get_mouse_status(button,x,y);
if keypressed  then  begin
ch:=readkey;if ch=#0 then ch:=readkey;
if ch=#13 then if s=pas then break
else halt
else begin ch:=readkey;s:=s+ch;setcolor(15);outtextxy(10,10,s);end;end;
{if (x>350) and (x<392) and (y>223) and (y<257) and}
if (x>16) and (x<180) and (y>445) and (y<465) then k:=1;
if (t=true) and (k=1) then
begin hide_cursor;setcolor(15);line(45,460,180,460);t:=false;show_cursor end;
if (k=1) and (button=1) then begin shutt_down;halt;end;
if (k<>1) then
begin setcolor(1);line(45,460,180,460);t:=true; end;
until t1=true;
hide_cursor;
cleardevice;show_cursor
end;
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
end;cleardevice;
delay(50000);delay(50000);
delay(50000);delay(50000);
delay(50000);delay(50000);
show_cursor;
delay(50000);delay(50000);
delay(50000);delay(50000);
delay(50000);delay(50000);
hide_cursor;
winlogon;
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



















