uses crt,graph;
label 1;
var k:byte;ch:char;
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
procedure disc(x,y:integer;col,gujn:byte;s1,s2:string);
begin
setcolor(15);
circle(x,y,48);
circle(x,y,10);
circle(x,y,15);
setfillstyle(1,15);
floodfill(x+12,y,15);
setfillstyle(1,col);
floodfill(x+20,y,15);
settextstyle(0,0,0);
setcolor(gujn);
outtextxy(x-20,y-28,s1);
outtextxy(x-25,y+22,s2);
setcolor(8);
settextstyle(2,0,4);
outtextxy(x-41,y-7,'Sony');
outtextxy(x+22,y-7,'DVD');
settextstyle(2,0,4);
outtextxy(x+14,y+6,'4.7GB');
end;
procedure XndDr;
begin
setbkcolor(1);
cleardevice;
setcolor(15);
settextstyle(0,0,0);
outtextxy(20,10,'               «ο ολχ §«―ογι ρ©―σ§ ');
repeat
ch:=readkey;
until ch=#27;
cleardevice;
end;
procedure Xndlt;
begin
setbkcolor(1);
cleardevice;
setcolor(15);
settextstyle(0,0,0);
outtextxy(20,10,'               «ο ―σ―σ§ §«―ογι ρ©―σ§ ');
repeat
ch:=readkey;
until ch=#27;
cleardevice;
end;
begin
init;
setbkcolor(0);
k:=1;
repeat
1:case k of
1:begin
disc(130,100,11,5,'«ο','―σ―σ§');
disc(260,200,14,4,'«ο','ολχ');
disc(390,300,14,4,'','  £');
disc(520,400,14,4,'','  χ');
end;
2:begin
disc(130,100,14,4,'«ο','―σ―σ§');
disc(260,200,11,5,'«ο','ολχ');
disc(390,300,14,4,'','  £');
disc(520,400,14,4,'','  χ');
end;
3:begin
disc(130,100,14,4,'«ο','―σ―σ§');
disc(260,200,14,4,'«ο','ολχ');
disc(390,300,11,5,'','  £');
disc(520,400,14,4,'','  χ');
end;
4:begin
disc(130,100,14,4,'«ο','―σ―σ§');
disc(260,200,14,4,'«ο','ολχ');
disc(390,300,14,4,'','  £');
disc(520,400,11,5,'','  χ');
end;
end;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if (k=1) and (ch=#13) then begin xnddr;goto 1 end;
if (k=2) and (ch=#13) then begin xndlt;goto 1 end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.

