program WindowsXP_bootscreen;
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
procedure loadingXP;
begin
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
delay(50000);delay(50000);delay(50000);
settextstyle(0,0,1);Setcolor(white);
outtextxy(550,455,'Microsoft');
outtextxy(10,455,'Copyright  Microsoft Corporation');
circle(288,223,5);circle(87,459,5);settextstyle(2,0,4);
outtextxy(85,452,'c');outtextxy(286,217,'R');
settextstyle(1,0,5);outtextxy(210,220,'Windows');
circle(380,240,5);settextstyle(2,0,4);
outtextxy(378,234,'R');
settextstyle(0,0,1);Setcolor(white);
outtextxy(210,220,'Microsoft');
settextstyle(1,0,4);Setcolor(4);
outtextxy(385,218,'XP');
setcolor(blue);setfillstyle(1,blue);
ellipse(315,220,0,160,20,10);
ellipse(326,185,0,160,20,10);line(296,216,307,182);
line(336,218,346,184);floodfill(325,195,1);
setcolor(4);setfillstyle(1,4);
ellipse(330,174,0,160,20,10);
ellipse(342,138,0,160,20,10);line(311,170,322,136);
line(351,172,362,138);floodfill(340,149,4);
setcolor(14);setfillstyle(1,14);
ellipse(365,220,180,340,20,10);
ellipse(376,184,180,340,20,10);line(344,220,355,183);
line(383,223,395,189);floodfill(370,200,14);
setcolor(2);setfillstyle(1,2);
ellipse(379,174,180,340,20,10);
ellipse(392,138,180,340,20,10);line(359,173,371,138);
line(398,178,411,143);floodfill(380,150,2);
setcolor(7);
line(265,350,372,350);line(265,364,372,364);
ellipse(265,357,90,270,5,7);
ellipse(372,357,270,90,5,7);
repeat
setcolor(blue);setfillstyle(1,blue);
bar(267,352,272,362);delay(30000);
bar(274,352,279,362);delay(30000);
bar(281,352,286,362);delay(30000);
for i:=1 to 12 do begin
if keypressed then halt;
setcolor(0);setfillstyle(1,0);
bar(267+(i-1)*7,352,272+(i-1)*7,362);
setcolor(blue);setfillstyle(1,blue);
bar(281+i*7,352,286+i*7,362);delay(10000);
bar(267+i*7,352,272+i*7,362);delay(10000);
bar(274+i*7,352,279+i*7,362);delay(10000);
end;
setcolor(0);setfillstyle(1,0);
for i:=13 to 15 do begin
bar(267+(i-1)*7,352,272+(i-1)*7,362);delay(20000);end;
until keypressed;
end;
begin
init;loadingXp;
end.