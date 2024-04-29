uses crt,graph,dos;
var GD,GM,EC:integer;
d,r,rn,z,r1,r2,rr,k,x1,x2,y1,y2,x01,y01,x02,y02,m:integer;
xasp,yasp,q,w,e,f:word;
begin
GD:=detect;
initgraph(GD,gm,'');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
repeat
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
setlinestyle(solidln,0,thickwidth);
gettime(q,w,e,f);
r:=12*e;z:=q*60+w;m:=12*w;rn:=0;
repeat
if not keypressed then
begin
if r=0 then m:=w*12;
if m=0 then z:=q*60+w;
x2:=x1+round(1*r1*sin(2*pi*r/60/12));
y2:=y1-round(1*r1*xasp*cos(2*pi*r/60/12)/yasp);
x02:=x1+round(0.90*r1*sin(2*pi*m/60/12));
y02:=y1-round(0.90*r1*xasp*cos(2*pi*m/60/12)/yasp);
x01:=x1+round(0.65*r1*sin(2*pi*z/60/12));
y01:=y1-round(0.65*r1*xasp*cos(2*pi*z/60/12)/yasp);
setcolor(15);
line(x1,y1,x2,y2);
setcolor(15);
line(x1,y1,x02,y02);
line(x1,y1,x01,y01);
outtextxy(292,340,'Quartz');rn:=r;
if r<59*12 then begin
repeat
gettime(q,w,e,f);
r:=e*12;m:=w*12;delay(5);
until r>rn;end
else begin r:=0;delay(50000);
delay(50000);end;
setcolor(0);
line(x1,y1,x01,y01);
line(x1,y1,x02,y02);
line(x1,y1,x2,y2);end;
until keypressed;
until readkey=#27;
end.