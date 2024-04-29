program game;
uses crt,graph;
var x,y:integer;
i,k,m:byte;ch,ch1:char;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
procedure init;
var GD,GM,EC:integer;
begin
GD:=detect;
initgraph(GD,GM,'');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
end;
{////////////////////\\\\\\\\\\\\\\\\\\\}
procedure clear;
begin
setcolor(0);Settextstyle(7,0,4);
outtextxy(440,5,'Exit Game');
setcolor(15);Settextstyle(7,0,1);
outtextxy(140,150,'Are you sure that you want to exit');
setfillstyle(1,15);setcolor(15);
bar(200,100,450,300);
end;
{////////////////////\\\\\\\\\\\\\\\\\\\}
procedure poly;
begin
setbkcolor(0);setcolor(15);
line(110,30,40,440);line(40,440,590,370);
line(590,370,520,70);line(520,70,110,30);
setfillstyle(15,1);floodfill(320,240,white);
end;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
procedure menu(k:byte);
begin
case k of
1:begin setfillstyle(1,2);setcolor(2);delay(5000);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,2);
setfillstyle(1,15);setcolor(15);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,15);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,15);
end;
2:begin
setfillstyle(1,2);setcolor(2);delay(5000);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,2);
setfillstyle(1,15);setcolor(15);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,15);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,15);
end;
3:begin
setfillstyle(1,2);setcolor(2);delay(1000);
line(280,235,340,230);line(340,230,355,260);
line(355,260,275,265);line(280,235,275,265);
floodfill(290,240,2);
setfillstyle(1,15);setcolor(15);delay(2000);
line(240,145,390,150);line(390,150,385,180);
line(385,180,245,185);line(240,145,245,185);
floodfill(250,155,15);
line(260,195,370,190);line(370,190,373,220);
line(373,220,250,225);line(260,195,250,225);
floodfill(260,200,15);
end;
end;
setcolor(13);Settextstyle(0,0,0);
outtextxy(285,230,'—χ');
outtextxy(250,150,'«‡ο• ‡ολ›χ');
outtextxy(270,190,'Options');
end;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
procedure newgame;
var ch:char;
begin
setcolor(13);Settextstyle(7,0,4);
outtextxy(520,5,'Menu');
repeat menu(k);
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if k<1 then k:=3;
if k>3 then k:=1;
until ch=#13;
case k of
1:begin end;
2:begin end;
3:begin
setfillstyle(1,15);setcolor(1);
bar(200,100,450,300);
setcolor(0);Settextstyle(7,0,4);
outtextxy(520,5,'Menu');
setcolor(13);Settextstyle(7,0,4);
outtextxy(440,5,'Exit Game');
setcolor(13);Settextstyle(7,0,1);
outtextxy(140,150,'Are you sure that you want to exit');m:=1;
{\\\\\\\\\\\\\\\\\\\\\\\\\\///////////////////}
repeat
case m of
1:begin
setfillstyle(1,15);setcolor(15);delay(2000);
line(294,211,335,216);line(335,216,343,238);
line(343,238,290,241);line(294,211,290,241);
floodfill(300,220,15);
setfillstyle(1,2);setcolor(2);
line(285,180,335,175);line(335,175,342,205);
line(342,205,279,208);line(285,180,279,208);
floodfill(290,190,2);
end;
2:begin setfillstyle(1,15);setcolor(15);delay(200);
line(285,180,335,175);line(335,175,342,205);
line(342,205,279,208);line(285,180,279,208);
floodfill(290,190,15);
setfillstyle(1,2);setcolor(2);
line(294,211,335,216);line(335,216,343,238);
line(343,238,290,241);line(294,211,290,241);
floodfill(300,220,2);
end;
end;
setcolor(13);Settextstyle(7,0,3);
outtextxy(295,175,'Yes');
outtextxy(298,210,'No');
repeat
ch1:=readkey
until (ch1=#72) or (ch1=#80) or (ch1=#13) or (ch1=#27);
case ch1 of
#72:m:=m-1;
#80:m:=m+1;
end;
if m<1 then m:=2;
if m>2 then m:=1;
until (ch1=#13) or (ch1=#27);
end;
end;
end;
{\\\\\\\\\\\\\\\\\\\\////////////////////}
begin
init;k:=1;poly;
repeat
newgame;
if (ch1=#13) and (m=1) then break;
repeat
if (ch1=#13) and (m=2) then begin clear;break;end;
if ch1=#27 then begin clear;break;end;
ch:=readkey;
if (k=3) and (ch1=#27) then
begin clear;break;end;
until (ch=#13);
delay(30000);
until ch=#13;
end.