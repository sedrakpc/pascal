program int;
uses crt,graph;
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
procedure intel(x,y:integer);
begin
setcolor(1);setfillstyle(1,1);
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
begin
init;intel(220,190);
readln;
end.