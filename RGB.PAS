uses crt,graph;
var k:integer;p:fillpatterntype;
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
{procedure rgbpalet;
begin
Setrgbpalette(15,255,128,0);
end;}
begin
init;
repeat
Setrgbpalette(0,random(256),random(256),random(256));
delay(60000);delay(60000);delay(60000);
until keypressed;
end.