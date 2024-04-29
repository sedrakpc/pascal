uses crt,dos,graph;
label 1;
var i:byte;
{\\\\\\\\\\\\\\\\\\\\\//////////////////////}
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
procedure clock;
var GD,GM,EC:integer;
d,r,rn,z,r1,r2,rr,k,x1,x2,y1,y2,x01,y01,x02,y02,m:integer;
xasp,yasp,q,w,e,f:word;
begin
cleardevice;setbkcolor(0);
setcolor(15);
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
cleardevice;
setbkcolor(11);
end;
procedure clearsmile;
begin
setcolor(11);
setfillstyle(1,11);
bar(210,180,260,280);
end;
procedure smile(x,y:integer);
begin
setlinestyle(1,1,11);
setcolor(8);
circle(x,y,8);
setfillstyle(1,14);
floodfill(x,y,8);
setcolor(8);
ellipse(x,y+1,200,340,5,3);
putpixel(x-5,y+2,8);
putpixel(x+5,y+2,8);
circle(x-3,y-2,1);
circle(x+3,y-2,1);
putpixel(x-3,y-2,8);
putpixel(x+3,y-2,8);
end;
procedure menusound(Hz,temp:word);
begin
sound(hz);
delay(temp);
nosound
end;
procedure menu;
var k:integer;t:boolean;ch:char;
begin
t:=false;
lowvideo;
{setfillstyle(9,11);
floodfill(1,1,15);
setbkcolor(11);
setcolor(4);settextstyle(0,0,1); }
k:=1;
setbkcolor(11);
repeat
{setbkcolor(11);}
setcolor(4);settextstyle(0,0,1);
setlinestyle(solidln,0,1);
case k of
1:begin setcolor(4);
outtextxy(265,220,'«‡ο• —―σ›―σ§');
outtextxy(265,240,'„οϋ•');
outtextxy(265,260,'—χ');setcolor(13);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
smile(250,205);
end;
2:begin setcolor(4);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
outtextxy(265,240,'„οϋ•');
outtextxy(265,260,'—χ');
setcolor(13);
outtextxy(265,220,'«‡ο• —―σ›―σ§');
smile(250,225);
end;
3:begin setcolor(4);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
outtextxy(265,220,'«‡ο• —―σ›―σ§');
outtextxy(265,260,'—χ');
setcolor(13);
outtextxy(265,240,'„οϋ•');
smile(250,245);
end;
4:begin
setcolor(4);
outtextxy(265,200,'«‡ο• ‡ολ›χ');
outtextxy(265,220,'«‡ο• —―σ›―σ§');
outtextxy(265,240,'„οϋ•');
setcolor(13);
outtextxy(265,260,'—χ');
smile(250,265);
end;
end;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
{if (ch=#72) or (ch=#80)  then }
menusound(1900,20000);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if (k=3) and (ch=#13) then clock;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000);
clearsmile
until ch=#27;
end;
{\\\\\\\\\\\\\\\\\\\\\\\////////////////////}
begin
init;
menu;
end.