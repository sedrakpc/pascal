uses crt,graph,mouse,graphs;
var mouse_ok:boolean;
count,x,y,x1,y1:word;
button:byte;
begin
open_graph;
cleardevice;
randomize;
reset_mouse(mouse_ok,button);
if not mouse_ok then halt;
show_cursor;
repeat
x1:=random(560);
y1:=random(460);hide_cursor;
cleardevice;
setfillstyle(1,15);
bar(x1,y1,x1+75,y1+15);
setcolor(0);
outtextxy(x1+4,y1+4,'Cllic Me');
setlinestyle(1,0,1);
line(x1+2,y1+2,x1+2,y1+13);
line(x1+2,y1+2,x1+73,y1+2);
line(x1+73,y1+2,x1+73,y1+13);
line(x1+73,y1+13,x1+2,y1+13);

show_cursor;
repeat
get_mouse_status(button,x,y);
until (x>x1-2) and (y>y1-2) and (x<x1+77) and (y<y1+17);
until keypressed;
end.