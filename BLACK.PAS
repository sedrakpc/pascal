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
begin
init;
setbkcolor(2);
setcolor(8);
setlinestyle(0,0,0);
line(4,4,50,150);
readln
end.
