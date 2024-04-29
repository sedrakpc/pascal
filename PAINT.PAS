program test_text_mouse;
uses graph,dos,crt;
type
   Str6=string[6];
var regs:registers;ss:string;
mouse_ok:boolean;
count,x,y:word;
button,port,irq:byte;
ver:str6;i,j:byte;ch:char;
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
procedure mouse_gotoxy(x,y:word);
begin
with regs do begin
ax:=$04;
cx:=x;
dx:=y;
end;
intr($33,regs);
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
function double_click(timeout:word):boolean;
var k,x,y:word;
button:byte;
begin
double_click:=false;
repeat
get_mouse_status(button,x,y);
until button=0;
repeat
get_mouse_status(button,x,y);
until button=0;
repeat
get_mouse_status(button,x,y);
until button=1;
repeat
get_mouse_status(button,x,y);
until button=0;
k:=0;
repeat
delay(1);inc(k);
get_mouse_status(button,x,y);
until (button=1) or (k=timeout);
if k=timeout then exit;
repeat
delay(1);inc(k);
get_mouse_status(button,x,y);
until (button=0) or (k=timeout);
double_click:=(k<timeout);
end;
procedure get_mouse_button_release(var button:byte;var count,x,y:word);
begin
regs.ax:=$06;
regs.bl:=button;
intr($33,regs);
with regs do
begin
button:=al;
count:=bx;
x:=cx;
y:=dx;
end;end;
procedure set_cursor_x_lim(min_x,max_x:word);
begin
with regs do
begin
ax:=$07;
cx:=min_x;
dx:=max_x;
end;
intr($33,regs);
end;
procedure set_cursor_y_lim(min_y,max_y:word);
begin
with regs do
begin
ax:=$08;
cx:=min_y;
dx:=max_y;
end;
intr($33,regs);
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
procedure set_text_cursor_shape(screen_mask,cursor_mask:word);
begin
with regs do
begin
ax:=$0A;
bx:=$00;
cx:=screen_mask;
dx:=cursor_mask;
end;
intr($33,regs);
end;
procedure get_relative_move(var x,y:integer);
begin
regs.ax:=$0b;
intr($33,regs);
x:=integer(regs.cx);
y:=integer(regs.dx);
end;
procedure set_hide_cursor_window(x0,y0,x1,y1:word);
begin
with regs do begin
ax:=$10;
cx:=x0;
dx:=y0;
si:=x1;
di:=y1;
end;
intr($33,regs);
end;
procedure get_mouse_state_size(var size:word);
begin
regs.ax:=$15;
intr($33,regs);
size:=regs.bx;
end;
procedure save_mouse_driver_state(address:pointer);
begin
with regs do begin
ax:=$16;
es:=seg(address^);
dx:=ofs(address^);
end;
intr($33,regs);
end;
procedure restore_mouse_driver_state(address:pointer);
begin
with regs do begin
ax:=$17;
es:=seg(address^);
dx:=ofs(address^);
end;
intr($33,regs);
end;
procedure set_mouse_page(page:word);
begin
regs.ax:=$1d;
regs.bx:=page;
intr($33,regs);
end;
procedure get_mouse_page(var page:word);
begin
regs.ax:=$1e;
intr($33,regs);
page:=regs.bx;
end;
procedure reset_mouse_software(var installed:boolean;var no_buttons:word);
begin
regs.ax:=$21;
intr($33,regs);
installed:=regs.ax=$ffff;
no_buttons:=regs.bx;
end;
procedure get_mouse_info(var ver:str6;var port,IRQ:byte);
var
ss:str6;
begin
regs.ax:=$24;
intr($33,regs);
with regs do
begin
str(bh,ver);str(bl,ss);
ver:=ver+'.'+ss;
port:=ch;IRQ:=cl;
end;
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
procedure Paint_drow(g:byte);
begin
setfillstyle(1,g);
bar(2,405,110,430);setfillstyle(1,2);
bar(5,411,30,432);outtextxy(35,419,'Paint');
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
bar(1,320,120,460);outtextxy(35,330,'SEDRAK');
turn_off(1);Paint_drow(1);
repeat time;
get_mouse_status(button,x,y);
until (x<110) and (y>=433) and (x>1) and (y<458);
hide_cursor;turn_off(8);show_cursor;
repeat time;
get_mouse_status(button,x,y);
until (x>110) or (y<433) or (x<1) or (y>=458) or (button=1);
if button=1 then halt;
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
init;cleardevice;start(15);
reset_mouse(mouse_ok,button);
if not mouse_ok then halt;
show_cursor;start15;
closegraph
end.



















