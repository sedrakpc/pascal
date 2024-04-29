uses crt,graph;
var d,e,n,k,color:integer;p:palettetype;
 s:string;
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
begin
init;
setlinestyle(solidln,0,thickwidth);
getpalette(p);
{for color:=0 to p.size-1 do
begin
setcolor(color);  delay(20000);
line(getmaxx div 3,color*10,2*getmaxx div 3,color*10);
end;    }
for  e:=0 to p.size-1 do  begin
n:=random(128);
setpalette(e,n);
str(n,s);
outtextxy(100,100,s);
delay(20000);

end;
closegraph;
end.