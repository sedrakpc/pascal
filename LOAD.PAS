uses crt,graph;
type mat=array[1..50,1..50] of integer;
var x:mat;m,i,j,p:integer;
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
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure loading;
var k:byte;s:string;
begin
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);delay(60000);
delay(60000);delay(60000);
settextstyle(4,0,10);outtextxy(140,100,'T.i.k.o');
setcolor(13);
line(120,350,520,350);line(120,370,520,370);
setfillstyle(1,13);
k:=0;settextstyle(1,0,1);s:='';
bar(120,350,120+5*k,370);
outtextxy(280,390,'Loading ...');
settextstyle(2,0,7);
str(k,s);s:=s+' %';setcolor(15);
outtextxy(300,348,s);delay(random(30000)+20000);
repeat
setcolor(0);outtextxy(300,348,s);
k:=k+random(5);
if k>100 then k:=100;setcolor(13);
bar(120,350,120+4*k,370);str(k,s);s:=s+' %';
setcolor(15);settextstyle(2,0,7);
outtextxy(300,348,s);
delay(random(30000)+20000);
until k=100;
end;
begin
init;loading;
restorecrtmode;
clrscr;
writeln('                                    Tigran');
write('Nermutel matrici erkarutjun@:>');
readln(m);
for i:=1 to m do
for j:=1 to m do begin
write('x[',i,',',j,']=');
readln(x[i,j]) end;
p:=0;
for i:=1 to m do
for j:=1 to m do
p:=p+x[i,j];
writeln('                             Matrici tareri gumar@:',p);
write('                                Sexmeq Enter');
readln;
setgraphmode(getgraphmode);
cleardevice; delay(60000);
delay(60000);
delay(60000); delay(60000);
delay(60000); delay(60000);
delay(60000);delay(60000);
settextstyle(1,0,10);
setcolor(4);
outtextxy(200,150,'E');
delay(60000);delay(60000);delay(60000);
outtextxy(280,150,'N');
delay(60000);delay(60000);delay(60000);
outtextxy(360,150,'D');
delay(60000);delay(60000);delay(60000);
outtextxy(440,150,'.');
delay(60000);delay(60000);delay(60000);
delay(60000);
closegraph
end.