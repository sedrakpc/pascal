uses crt,graph;
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
procedure drvacq;
begin
cleardevice;
repeat
until readkey=#27;
cleardevice;
end;
procedure menu(x,y:integer;s1,s2:string;color:byte);
begin
setcolor(14);
setfillstyle(1,1);
bar(x-50,y-15,x+50,y+15);
setcolor(color);
Settextstyle(0,0,0);
outtextxy(x-30+4,y-10,s1);
outtextxy(x-25-2,y,s2);
end;
begin
init;
k:=1;
repeat
case k of
1:begin
menu(320,150,' «‡ο•','†ολ›χ',4);
menu(320,200,' «‡ο•','–―σ›―σ§',1);
menu(320,250,'','„οϋ•',1);
menu(320,300,'','  —χ',1);
end;
2:begin
menu(320,150,' «‡ο•','†ολ›χ',1);
menu(320,200,' «‡ο•','–―σ›―σ§',4);
menu(320,250,'','„οϋ•',1);
menu(320,300,'','  —χ',1);
end;
3:begin
menu(320,150,' «‡ο•','†ολ›χ',1);
menu(320,200,' «‡ο•','–―σ›―σ§',1);
menu(320,250,'','„οϋ•',4);
menu(320,300,'','  —χ',1);
end;
4:begin
menu(320,150,' «‡ο•','†ολ›χ',1);
menu(320,200,' «‡ο•','–―σ›―σ§',1);
menu(320,250,'','„οϋ•',1);
menu(320,300,'','  —χ',4);
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
if (k=1) and (ch=#13) then drvacq;

if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.