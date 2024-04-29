uses crt,graph;
var d,r,r1,r2,rr,k,x1,x2,y1,y2,x01,y01:integer;
xasp,yasp:word;
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
x1:=getmaxx div 2;
y1:=getmaxy div 2;
getaspectratio(xasp,yasp);
r:=round(3*getmaxy*yasp/8/xasp);
r1:=round(0.9*r);
r2:=round(0.95*r);
circle(x1,y1,r);
circle(x1,y1,round(1.02*r));
for k:=0 to 59 do begin
if k mod 5=0 then rr:=r1
else rr:=r2;
x01:=x1+round(rr*sin(2*pi*k/60));
y01:=y1-round(rr*xasp*cos(2*pi*k/60)/yasp);
x2:=x1+round(r*sin(2*pi*k/60));
y2:=y1-round(r*xasp*cos(2*pi*k/60)/yasp);
line(x01,y01,x2,y2);
end;
setwritemode(xorput);
setlinestyle(solidln,0,thickwidth);
r:=0;
repeat
for k:=0 to 59 do
if not keypressed then
begin
x2:=x1+round(0.85*r1*sin(2*pi*r/60/12));
y2:=y1-round(0.85*r1*xasp*cos(2*pi*r/60/12)/yasp);
x01:=x1+round(r2*sin(2*pi*k/60));
y01:=y1-round(2*xasp*cos(2*pi*k/60)/yasp);
line(x1,y1,x2,y2);
line(x1,y1,x01,y01);
delay(100);
line(x1,y1,x01,y01);
line(x1,y1,x2,y2);
inc(r);
if r=12*60 then r:=0;
end
until keypressed;
if readkey=#0 then k:=ord(readkey);
closegraph
end.



