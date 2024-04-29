uses crt,dos,graph;
label 1;
var i:byte;
{\\\\\\\\\\\\\\\\\\\\\//////////////////////}
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
procedure aaa;
begin
cleardevice;
repeat
until readkey=#27;
cleardevice;
end;
procedure menu;
var k,i:integer;ch:char;
begin
lowvideo;
randomize;
k:=1;
repeat
setbkcolor(0);
for i:=1 to 10000 do
begin
putpixel(240+random(160),180+random(120),1);
setlinestyle(solidln,0,thickwidth);
end;
setcolor(1);
line(0,0,240,180);
line(640,0,400,180);
line(640,480,400,300);
line(0,480,240,300);
repeat
setcolor(4);settextstyle(0,0,1);
setlinestyle(solidln,0,1);
case k of
1:begin setcolor(4);
outtextxy(265,220,'«‡ο• —―σ›―σ§');
outtextxy(265,240,'   „οϋ•');
outtextxy(265,260,'     —χ');
setcolor(13);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
end;
2:begin setcolor(4);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
outtextxy(265,240,'   „οϋ•');
outtextxy(265,260,'     —χ');
setcolor(13);
outtextxy(265,220,'«‡ο• —―σ›―σ§');
end;
3:begin setcolor(4);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
outtextxy(265,220,'«‡ο• —―σ›―σ§');
outtextxy(265,260,'     —χ');
setcolor(13);
outtextxy(265,240,'   „οϋ•');
end;
4:begin
setcolor(4);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
outtextxy(265,220,'«‡ο• —―σ›―σ§');
outtextxy(265,240,'   „οϋ•');
setcolor(13);
outtextxy(265,260,'     —χ');
end;
end;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if (k=1) and (ch=#13) then begin aaa;break end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000);
until ch=#27;
until ch=#27;
end;
{\\\\\\\\\\\\\\\\\\\\\\\////////////////////}
begin
init;
menu;
end.