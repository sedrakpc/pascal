uses crt,graph;
label 1;
var k:byte;ch:char;
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
procedure vpage(x,y:integer;v,color:byte);
begin
setlinestyle(0,0,1);
setfillstyle(1,0);
setcolor(15);
bar(x-40,y-10,x+140,y+180);
setcolor(15);
line(x,y,x,y+160);
rectangle(x,y,x+120,y+160);
setfillstyle(1,13);
floodfill(x+100,y+90,15);
setcolor(color);
outtextxy(x-11,y+18,'1');
outtextxy(x-11,y+18+40,'2');
outtextxy(x-11,y+18+80,'3');
outtextxy(x-11,y+18+120,'4');
case v of
1:begin
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,4);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
setfillstyle(1,1);
floodfill(x-10,y+60,color);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
floodfill(x-10,y+105,color);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,color);
Setcolor(0);
outtextxy(x+35,y+70,' «‡ο•');
outtextxy(x+35,y+80,'†ολ›χ');
end;
2:begin
line(x,y+40,x-10,y+40);
line(x-10,y+40,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
setfillstyle(1,4);
floodfill(x-10,y+60,color);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x-12,y+41);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
floodfill(x-10,y+105,15);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,15);
Setcolor(0);
outtextxy(x+35,y+70,' «‡ο•');
outtextxy(x+35,y+80,'–―σ›―σ§');
end;
3:begin
line(x,y+80,x-10,y+80);
line(x-10,y+80,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
setfillstyle(1,4);
floodfill(x-10,y+105,15);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x-12,y+81);
floodfill(x-10,y+60,15);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,15);
Setcolor(0);
outtextxy(x+35,y+80,'„οϋ•');
end;
4:begin
line(x,y+120,x-10,y+120);
line(x-10,y+120,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
setfillstyle(1,4);
floodfill(x-10,y+145,15);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
floodfill(x-10,y+60,15);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x-12,y+121);
floodfill(x-10,y+105,15);
Setcolor(0);
outtextxy(x+45,y+80,'—χ');
end;
end;
end;
begin
init;
k:=1;
repeat
1:case k of
1:begin
vpage(260,170,1,15);
end;
2:begin
vpage(260,170,2,15);
end;
3:begin
vpage(260,170,3,15);
end;
4:begin
vpage(260,170,4,15);
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
if k<1 then k:=4;
if k>4 then k:=1;
delay(40000)
until ch=#27;
readln
end.
