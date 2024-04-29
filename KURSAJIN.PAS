 uses crt,dos,graph;
type Str6=string[6];
{-------creating an object----}
type init = object
procedure openg;
procedure closeg;
private GD,GM,EC:integer;
end;
{------init graphic---------}

procedure init.openg;
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
{-------end inti graphic-------}
procedure init.closeg;
begin
closegraph;
if graphresult <> grOK then
Halt(1);
end;
{-----variables--------}
var ch:char;
i,newkey,oldkey:byte;
w:init;
var regs:registers;
{--------variables---------}
procedure reset_mouse(var mouse_ok:boolean;var button:byte);
begin
regs.ax:=$00;
intr($33,regs);
mouse_ok:=odd(regs.ax);
button:=regs.bx;end;
procedure show_cursor;
begin
regs.ax:=$01;
intr($33,regs);
end;
procedure hide_cursor;
begin
regs.ax:=$02;
intr($33,regs);
end;
procedure get_mouse_status(var button:byte;var x,y:word);
begin
regs.ax:=$03;
intr($33,regs);
with regs do begin
button:=bl;
x:=cx;y:=dx;end;
end;
procedure get_mouse_button_press(var button:byte;var count,x,y:word);
begin
regs.ax:=$05;
regs.bl:=button;
intr($33,regs);
with regs do begin
button:=al;count:=bx;
x:=cx;y:=dx;end;
end;
procedure set_graph_cursor_shape(hot_x,hot_y:integer;address:pointer);
begin
with regs do
begin
ax:=$09;
bx:=word(hot_x);
cx:=word(hot_y);
es:=seg(address^);
dx:=ofs(address^);
end;
intr($33,regs);
end;
{           //////////////// menu ////////////////          }
procedure dors(x,y:integer;k:byte;str:string);   {nemu}
var i:byte;
nx,ny:integer;
begin
case k of
0:begin
setcolor(8);
setfillstyle(1,8);
setlinestyle(0,0,1);
rectangle(x-110,y-30,x,y+30);
floodfill(x-50,y,8);
rectangle(x,y-30,x+110,y+30);
floodfill(x+50,y,8);
setfillstyle(1,0);
bar(x-107,y-27,x-1,y+27);
bar(x+107,y+27,x+1,y-27);
setcolor(2);
setfillstyle(1,2);
line(x-70,y-27,x-107,y+10);
line(x-32,y-27,x-86,y+27);
line(x-70,y-27,x-32,y-27);
line(x-107,y+10,x-107,y+27);
line(x-107,y+27,x-86,y+27);
floodfill(x-70,y-24,2);
line(x-1,y-18,x-46,y+27);
line(x-1,y-18,x-46,y+27);
line(x-1,y+20,x-8,y+27);
line(x-1,y-18,x-1,y+19);
line(x-46,y+27,x-8,y+27);
floodfill(x-10,y,2);
line(x+46,y-27,x+1,y+18);
line(x+8,y-27,x+1,y-20);
line(x+1,y-19,x+1,y+17);
line(x+46,y-27,x+8,y-27);
floodfill(x+10,y,2);
line(x+32,y+27,x+86,y-27);
line(x+70,y+27,x+107,y-10);
line(x+70,y+27,x+32,y+27);
line(x+107,y-10,x+107,y-27);
line(x+107,y-27,x+86,y-27);
floodfill(x+70,y+24,2);
end;
1:begin
for i:=1 to 4 do
begin
{cleardevice; }
setfillstyle(1,0);
bar(x-200,y-40,x+200,y+40);

i:=i*4;
setcolor(8);
setfillstyle(1,8);
setlinestyle(0,0,1);
rectangle(x-110-5*i,y-30,x-5*i,y+30);
floodfill(x-50-5*i,y,8);
rectangle(x+5*i,y-30,x+110+5*i,y+30);
floodfill(x+50+5*i,y,8);
setfillstyle(1,0);
bar(x-107-5*i,y-27,x-1-5*i,y+27);
bar(x+107+5*i,y+27,x+1+5*i,y-27);
setcolor(2);
setfillstyle(1,2);
line(x-70-5*i,y-27,x-107-5*i,y+10);
line(x-32-5*i,y-27,x-86-5*i,y+27);
line(x-70-5*i,y-27,x-32-5*i,y-27);
line(x-107-5*i,y+10,x-107-5*i,y+27);
line(x-107-5*i,y+27,x-86-5*i,y+27);
floodfill(x-70-5*i,y-24,2);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y+20,x-8-5*i,y+27);
line(x-1-5*i,y-18,x-1-5*i,y+19);
line(x-46-5*i,y+27,x-8-5*i,y+27);
floodfill(x-10-5*i,y,2);
line(x+46+5*i,y-27,x+1+5*i,y+18);
line(x+8+5*i,y-27,x+1+5*i,y-20);
line(x+1+5*i,y-19,x+1+5*i,y+17);
line(x+46+5*i,y-27,x+8+5*i,y-27);
floodfill(x+10+5*i,y,2);
line(x+32+5*i,y+27,x+86+5*i,y-27);
line(x+70+5*i,y+27,x+107+5*i,y-10);
line(x+70+5*i,y+27,x+32+5*i,y+27);
line(x+107+5*i,y-10,x+107+5*i,y-27);
line(x+107+5*i,y-27,x+86+5*i,y-27);
floodfill(x+70+5*i,y+24,2);
setfillstyle(1,8);
bar(x-80,y-25,x+80,y+25);

outtextxy(x-50,y,str);
delay(3000);
i:=i div 4;
end;
end;
2:begin
for i:=4 downto 0 do
begin
{cleardevice; }
setfillstyle(1,0);
bar(x-200,y-40,x+200,y+40);
i:=i*4;
setcolor(8);
setfillstyle(1,8);
setlinestyle(0,0,1);
rectangle(x-110-5*i,y-30,x-5*i,y+30);
floodfill(x-50-5*i,y,8);
rectangle(x+5*i,y-30,x+110+5*i,y+30);
floodfill(x+50+5*i,y,8);
setfillstyle(1,0);
bar(x-107-5*i,y-27,x-1-5*i,y+27);
bar(x+107+5*i,y+27,x+1+5*i,y-27);
setcolor(2);
setfillstyle(1,2);
line(x-70-5*i,y-27,x-107-5*i,y+10);
line(x-32-5*i,y-27,x-86-5*i,y+27);
line(x-70-5*i,y-27,x-32-5*i,y-27);
line(x-107-5*i,y+10,x-107-5*i,y+27);
line(x-107-5*i,y+27,x-86-5*i,y+27);
floodfill(x-70-5*i,y-24,2);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y+20,x-8-5*i,y+27);
line(x-1-5*i,y-18,x-1-5*i,y+19);
line(x-46-5*i,y+27,x-8-5*i,y+27);
floodfill(x-10-5*i,y,2);
line(x+46+5*i,y-27,x+1+5*i,y+18);
line(x+8+5*i,y-27,x+1+5*i,y-20);
line(x+1+5*i,y-19,x+1+5*i,y+17);
line(x+46+5*i,y-27,x+8+5*i,y-27);
floodfill(x+10+5*i,y,2);
line(x+32+5*i,y+27,x+86+5*i,y-27);
line(x+70+5*i,y+27,x+107+5*i,y-10);
line(x+70+5*i,y+27,x+32+5*i,y+27);
line(x+107+5*i,y-10,x+107+5*i,y-27);
line(x+107+5*i,y-27,x+86+5*i,y-27);
floodfill(x+70+5*i,y+24,2);
{setfillstyle(1,0);
bar(x-250,y-40,x-111,y+350);
bar(x+111,y-40,x+250,y+350); }
delay(3000);
i:=i div 4;
end;
end;
end;
end;
procedure initg;
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
{----------main procedure of calling others-------}
procedure xinX_P;
const tar=['a'..'z' ,'A'..'Z','_','0'..'9','=',
'+','[',']','\','{','}','|'];
arowcur:array[0..1,0..15] of word=(
($7fff,$3fff,$1fff,$0fff,
$07ff,$03ff,$01ff,$00ff,
$07ff,$27ff,$73ff,$f3ff,
$f9ff,$f9ff,$ffff,$ffff),
($8000,$c000,$e000,$f000,
$f800,$fc00,$fe00,$ff00,
$f800,$d800,$8c00,$0c00,
$0600,$0600,$0000,$0000));
var ss,sa:string;mouse_ok,ext,extended_code:boolean;
count,x,y:word;
button,port:byte;
temp:word;
ver:str6;i,j,c,z:byte;
ch:char;
regs:registers;
tt:boolean;
{---------creating logo of intel----------}
procedure intel(x,y:integer);               {logo}
begin
cleardevice;
setcolor(1);setfillstyle(1,1);
set_graph_cursor_shape(4,0,@arowcur);
bar(x,y,x+15,y+15);bar(x,y+25,x+15,y+85);
bar(x+30,y+25,x+45,y+85);bar(x+70,y+40,x+85,y+85);
ellipse(x+58,y+40,0,180,12,9);
ellipse(x+58,y+40,0,180,12,9);
ellipse(x+64,y+39,0,160,21,14);
floodfill(x+75,y+37,1);
line(x+105,y,x+105,y+75);
line(x+105,y+75,x+120,y+75);
line(x+120,y,x+120,y+75);
line(x+105,y,x+120,y);
floodfill(x+110,y+20,1);
bar(x+90,y+25,x+135,y+35);
ellipse(x+120,y+75,180,270,15,10);
line(x+120,y+85,x+191,y+85);
ellipse(x+132,y+65,180,270,12,10);
line(x+132,y+75,x+191,y+75);
line(x+191,y+75,x+191,y+84);
floodfill(x+126,y+78,1);
ellipse(x+160,y+80,0,335,28,30);
ellipse(x+160,y+80,0,320,16,20);
line(x+177,y+80,x+187,y+80);
line(x+172,y+92,x+185,y+92);
floodfill(x+140,y+74,1);
floodfill(x+140,y+94,1);
bar(x+191,y,x+205,y+85);
end;
{----------procedur for shutting down----------}
procedure shutt_down;
begin
hide_cursor;
delay(temp);
cleardevice;
delay(temp);
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
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
setcolor(3);outtextxy(350,230,'Logging off...');
setcolor(15);outtextxy(350,230,'Saveing your settings...');
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
setcolor(3);outtextxy(350,230,'Saveing your settings...');
setcolor(15);outtextxy(350,230,'Windows is shutting down...');
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
setcolor(3);outtextxy(350,230,'Windows is shutting down...');
end;
{------the icon of startup-----------}
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
procedure loggon;  {}
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
{-------------the first face of WinLogon after loading------------}
procedure winlogon;
label 1;
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
tt:=true;
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
set_graph_cursor_shape(0,0,@arowcur);
show_cursor;
t:=true;t1:=false;
repeat
k:=0;
get_mouse_status(button,x,y);
if (x>350) and (x<392) and (y>223) and (y<257)
then begin t1:=true;hide_cursor;set_graph_cursor_shape(4,0,@masks);
show_cursor;repeat get_mouse_status(button,x,y)
until (x<350) or (x>392) or (y<223) or (y>257) or (button=1);
if button=1 then goto 1;
{---------changing the shape of cursor----------------}
hide_cursor;set_graph_cursor_shape(0,0,@arowcur);
show_cursor;t1:=false end;
if (x>16) and (x<180) and (y>445) and (y<465) then begin k:=1;
hide_cursor;setcolor(15);line(45,460,180,460);
set_graph_cursor_shape(4,0,@masks);
show_cursor;repeat get_mouse_status(button,x,y)
until (x<16) or (x>180) or (y<445) or (y>465) or (button=1);
tt:=true;
if button=1 then begin shutt_down;tt:=false;end;
hide_cursor;setcolor(1);line(45,460,180,460);
set_graph_cursor_shape(0,0,@arowcur);
show_cursor;end;
until ((t1=true) and (button=1)) or (tt=false);
if tt=true then begin
1:hide_cursor;
set_graph_cursor_shape(0,0,@arowcur);
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
t:=true;t1:=false;s:='';setcolor(15);sa:='';
setfillstyle(1,2);
{\\\\\\\\\\\\\\\\\//////////////////}
repeat
k:=0;
get_mouse_status(button,x,y);
regs.ah:=$10;
intr($16,regs);
extended_code:=(regs.al=0) or (regs.al>127);
if extended_code=true  {or ((x>0) and (x<10) and (y>0) and (y<10))} then
ch:=chr(regs.ah)
else
ch:=chr(regs.al);
if ch=#13 then if s=pas then break
{if ch in tar then begin s:=s+ch;sa:=sa+'*';outtextxy(400,255,sa);}
else begin setcolor(15);settextstyle(2,0,5);
outtextxy(404,250,sa);goto 1;end
else
if ch in tar then begin s:=s+ch;sa:=sa+'*' end;
if length(s)>11 then begin s:=copy(s,1,length(s)-1);
sa:=copy(sa,1,length(sa)-1);sound(500);
delay(temp);nosound end;
if ch=#8 then begin s:=copy(s,1,length(s)-1);
setcolor(15);settextstyle(2,0,5);
outtextxy(404,250,sa);
sa:=copy(sa,1,length(sa)-1) end;
setcolor(0);
settextstyle(2,0,5);outtextxy(404,250,sa);
until (t1=true);
{\\\\\\\\\\\\\\\\///////////////////}
end;
hide_cursor;
cleardevice;show_cursor
end;
{-------------------painting of loading XP-----------}
procedure loadingXP(var tt:boolean);
var i,j:byte;
begin
cleardevice;
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
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
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
show_cursor;
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
hide_cursor;
winlogon;
cleardevice;
end;
{------------right corner of our windows----painting the time}
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
{-------painting start---------}
procedure start(a:byte);
begin
setfillstyle(1,1);
bar(1,460,640,480);setfillstyle(1,2);bar(1,460,50,480);
setlinestyle(0,0,1);setcolor(2);line(50,460,60,470);
line(60,470,50,480);line(50,460,50,480);floodfill(59,470,2);
setcolor(a);outtextxy(7,466,'start');
end;
{--------arrwond the time----------}
procedure arow(v:byte);
begin
setcolor(15);setfillstyle(1,2);
line(585,460,585,463);line(585,477,585,480);
circle(585,470,6);
if v=4 then setfillstyle(1,4);floodfill(585,470,15);
line(586,467,583,470);line(583,470,586,473);
end;
{-------painting of turn off---------}
procedure turn_off(g:byte);
begin
setfillstyle(1,g);
bar(2,433,110,458);setfillstyle(1,4);
bar(5,435,30,456);outtextxy(35,440,'Turn OFF');
circle(17,446,7);line(17,443,17,449)
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure Sedrak(var t:boolean);
begin
t:=true;
setfillstyle(1,1);
bar(1,320,120,460);outtextxy(35,330,'SEDRAK');turn_off(1);
repeat time;
get_mouse_status(button,x,y);
until (x<110) and (y>=433) and (x>1) and (y<458);
hide_cursor;turn_off(8);show_cursor;
repeat time;
get_mouse_status(button,x,y);
until (x>110) or (y<433) or (x<1) or (y>=458) or (button=1);
if button=1 then begin shutt_down;t:=false end;
repeat time;
get_mouse_status(button,x,y);
until (button=1) or (t=false);
end;
{[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]}
procedure start15;        {}
var tt:boolean;
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
if button=1 then sedrak(tt);
repeat time;
get_mouse_status(button,x,y);
until (x>54) or (y<459) or (tt=false);
hide_cursor;
cleardevice;start(15);time;arow(j);
show_cursor;
until (ch='s') or (tt=false) ;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
{dors(320,300,0,'');}
dors(320,400,0,'');
end;
{\\\\\\\\\\\  start loading,and so\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin
temp:=60000;
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
intel(220,190);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
cleardevice;
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
loadingxp(tt);
cleardevice;
if tt=true then begin
cleardevice;
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
show_cursor;
delay(temp);delay(temp);
delay(temp);delay(temp);
delay(temp);delay(temp);
hide_cursor;
settextstyle(0,0,1);
start(15);
reset_mouse(mouse_ok,button);
if not mouse_ok then halt;
show_cursor;
start15;end;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
{dors(320,300,0,'');}
dors(320,400,0,'');
end;
{---------------drvacq----------------}
procedure xndri_drvacq;
begin
     cleardevice;
     setbkcolor(0);
     cleardevice;
     setcolor(4);
     settextstyle(0,0,0);
     outtextxy(10,160,'    1. «‡ο• †ολ›χ');
     setcolor(2);
     outtextxy(110,180,'μολ› ‰« M,N ƒ«« ‘λ‰ο ‰λ §ƒ―£ε ν•γ• M*N νοο‰ο γο―σ«―£');
     outtextxy(110,200,'§νο•ρ,―ο« ―σ«• §•©« §‰ §‰›…―σ©« νοο:‹§‰— ƒ—―-ι™‰§ ‰λ ')  ;
     outtextxy(110,220,'›ο…•ο,―ο―«χ §νο•ρ•ρ ‰ηρ«‰« §‰›…―σ©« νοο γο―σ«―£ ν―£');
     outtextxy(110,240,'‰λ ι©―σ«: μγ‰— ινρλ› §νο•ρ:');
     setcolor(4);
     outtextxy(10,270,'    2.•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο');
     setcolor(2);
     outtextxy(110,290,'®ο―­‰— §νο•ρ―σ§ b-•« λιο νοο• ν―£• §ο: ');
     outtextxy(110,310,'‰ηρ«‰— §νο•ρ• l-ο‡ ι©―σ«:');
     setcolor(15);
     outtextxy(50,50,'  θ‰‡ο †——―©« 621-3');
repeat
until readkey=#27;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');
end;
{------------------------lucum--------------}
procedure   xndri_lucum;
type masiv=array[1..10,1..10] of real;
var s:string;
ch2:char;
n,m,i,j,k,ss,co:byte;
code:integer;
a:masiv;
t:boolean;
max,w:real;
f:file of real;
function func(A1:masiv;b1:real;n1,m1:byte):byte;
var i1,j1,k1:byte;
begin
for i1:=1 to n1 do
for j1:=1 to m1 do
if a1[i1,j1]=b1 then k1:=i1;
func:=k1;
end;
procedure proc(var a2:masiv;s2,n2,m2:byte);
var i2,j2:byte;
begin
for j2:=s2 to m2-1 do
for i2:=1 to n2 do
a2[i2,j2]:=a2[i2,j2+1];
end;

Begin
setcolor(15);
repeat
cleardevice;
outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6,1<m<10)');
outtextxy(295,20,'n=');
s:='';
repeat
repeat
outtextxy(313,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
if code<>0 then n:=0;
until (n>1) and (n<6);
outtextxy(295,30,'m=');
repeat
setfillstyle(1,0);
bar(295,30,640,40);
outtextxy(295,30,'m=');
s:='';
repeat
repeat
outtextxy(313,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,m,code);
if code<>0 then m:=0;
until (m>1) and (m<9);
setfillstyle(1,10);
repeat
bar(320-m*30,140-n*20,320+m*30,140+n*20);
co:=0;
for i:=1 to n do
for j:=1 to m do begin
s:='';
repeat
setcolor(10);
outtextxy(328-m*30+(j-1)*55,165-n*25+(n-1)*6+(i-1)*30,s);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
t:=false;
s:='';
repeat
repeat
setcolor(4);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51)
or (ch2=#52) or (ch2=#53)or (ch2=#54) or (ch2=#55) or
(ch2=#56) or (ch2=#57) or(ch2=#46) or (ch2=#45) or(ch2=#13);
if (copy(s,1,1)='-')  then k:=6 else k:=5;
if length(s)<k then begin
if ch2<>#13 then s:=s+ch2 end
until (ch2=#13);
if pos(s,'-')<>0 then t:=false
else
begin
if (((copy(s,1,2)='-0') and (length(s)=2))
or ((copy(s,1,2)='-0') and (copy(s,3,1)<>'.'))
or ((copy(s,1,2)='-0') and (copy(s,length(s),1)='0')))
then t:=false
else begin
if (copy(s,1,1)='0') and (length(s)=1) then begin
val(s,w,code);t:=true end else begin
if (
((copy(s,1,1)='0') and (copy(s,2,1)<>'.')) or
((copy(s,1,1)='0') and (copy(s,length(s),1)='0'))
or (copy(s,length(s),1)='.'))
then t:=false
else begin
if (copy(s,1,1)='.') or (copy(s,1,2)='-.') then t:=false
else   begin
val(s,w,code);
if code<>0 then begin
if copy(s,1,1)<>'-' then t:=false;
if code=0 then begin
t:=true;w:=(-1)*w
end
end
else t:=true;
end
end
end
end
end;
if ((copy(s,1,1)<>'0') and (pos('.',s)>0) and (copy(s,length(s),1)='0'))
then t:=false
until t=true;


setcolor(14);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
a[i,j]:=w;
end;
max:=a[1,1];
ss:=1;
for i:=1 to n do
for j:=1 to m do
if a[i,j]>max then begin max:=a[i,j];ss:=j;  end;
for i:=1 to n do
for j:=1 to m do
if a[i,j]=max then co:=co+1;
until co=1;
setcolor(4);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Sedrak.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'Sedark.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
bar(328-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
328-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(60000);
delay(60000);
end;
close(f);
setcolor(0);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Sedrak.dat ϋ©—―σ§ γ‰—―σ  §ο');

setcolor(4);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
readln;
setcolor(0);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
outtextxy(80,250,'For Exit press <Esc>');
reset(f);
setcolor(14);
for i:=1 to n do
for j:=1 to m do begin
read(f,a[i,j]);

str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
end;

k:=func(a,max,n,m);
proc(a,ss,n,m);
for i:=k to n-1 do
for j:=1 to m do
a[i,j]:=a[i+1,j];

setfillstyle(1,7);
bar(320-(m-1)*30,380-(n-1)*20,320+(m-1)*30,380+(n-1)*20);
for i:=1 to n-1 do
for j:=1 to m-1 do begin
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
setcolor(15);
outtextxy(315-m*30+5+(j)*55,390-n*20+5+(i)*30,s);
end;

repeat
until readkey=#27;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');
end;


{--------start of the main program---------}
begin
initg;
newkey:=1;
oldkey:=0;
repeat
{ dors(320,100,0,'™«‡ο• ‡ολ›χ');   }
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');
repeat
case oldkey of
1:dors(320,100,2,'');
2:dors(320,200,2,'');
3:dors(320,300,2,'');
4:dors(320,400,2,'');
end;
case newkey of
1:dors(320,100,1,' ™«‡ο• ‡ολ›χ');
2:dors(320,200,1,' ™«‡ο• —―σ›―σ§');
3:dors(320,300,1,'   „οϋ•');
4:dors(320,400,1,'     —χ');
end;
oldkey:=newkey;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:newkey:=newkey-1;
#80:newkey:=newkey+1;
end;
if (newkey=4) and (ch=#13) then halt;
if (newkey=3) and (ch=#13) then begin xinX_P;oldkey:=0;end;
if (newkey=1) and (ch=#13) then begin xndri_drvacq;oldkey:=0;end;
if (newkey=2) and (ch=#13) then begin xndri_lucum;oldkey:=0;end;
if newkey<1 then newkey:=4;
if newkey>4 then newkey:=1;
delay(5000)
until ch=#27;
until true;
{w.closeg;}
end.
