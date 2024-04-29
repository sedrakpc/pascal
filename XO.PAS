uses crt,graph;
{$i init.pas}
var i,j,c,z:byte;
begin
init;i:=4;
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
end.
