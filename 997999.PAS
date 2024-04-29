program har;
uses crt,graph;
var i:byte;
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
cleardevice;
setbkcolor(blue);
setfillstyle(1,2);
readln;
for i:=0 to 80 do begin
bar(320-4*i,240-3*i,320+4*i,240+3*i);
delay(10000);end;
for i:=79 downto 0 do begin
setfillstyle(1,1);
bar(320-4*(i+1),240-3*(i+1),320+4*(i+1),240+3*(i+1));
setfillstyle(1,2);{or cleardevice;}
bar(320-4*i,240-3*i,320+4*i,240+3*i);
delay(10000);end;
readln
end.