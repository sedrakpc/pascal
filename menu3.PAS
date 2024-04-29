uses crt,graph;
label 1;
var k,z:byte;ch:char;
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
procedure menuu(x,y:integer;s1,s2,s3:string;status:byte);
var i:byte;
begin
setcolor(7);
ellipse(x,y,270,90,30,30);
rectangle(x-200,y-33,x,y+33);
setfillstyle(9,10);
floodfill(x+5,y,7);
setfillstyle(8,10);
floodfill(x-5,y,7);
setcolor(12);
setfillstyle(1,0);
bar(x-130,y-20,x-70,y+20);
settextstyle(1,0,4);
outtextxy(x-105,y-20,s3);
setcolor(7);
rectangle(x-220,y-35,x-201,y+35);
setfillstyle(9,10);
floodfill(x-215,y,7);
setfillstyle(1,11);
bar(x-223,y-35,x-221,y+35);
case status of
0:begin
for i:=20 downto 0 do begin
setfillstyle(1,0);
bar(x-265-5*i,y+36,x-224,y-36);
if i>0 then begin
setfillstyle(1,7);
bar(x-224-5*i,y+30,x-224,y-30);
delay(300);
end;
setcolor(7);
rectangle(x-243-5*i,y-35,x-224-5*i,y+35);
setfillstyle(9,10);
floodfill(x-235-5*i,y,7);
rectangle(x-253-5*i,y-25,x-244-5*i,y+25);
setfillstyle(9,10);
floodfill(x-248-5*i,y,7);
setfillstyle(1,11);
bar(x-223-5*i,y-35,x-221-5*i,y+35);
end;end;
1:begin
for i:=0 to 20 do begin
setfillstyle(1,0);
bar(x-265-5*i,y+36,x-224,y-36);
if i>0 then begin
setfillstyle(1,7);
bar(x-224-5*i,y+30,x-224,y-30);
end;
setcolor(7);
rectangle(x-243-5*i,y-35,x-224-5*i,y+35);
setfillstyle(9,10);
floodfill(x-235-5*i,y,7);
rectangle(x-253-5*i,y-25,x-244-5*i,y+25);
setfillstyle(9,10);
floodfill(x-248-5*i,y,7);
setfillstyle(1,11);
bar(x-223-5*i,y-35,x-221-5*i,y+35);
delay(300);
end;
setcolor(15);
rectangle(x-310,y-25,x-230,y+25);
setfillstyle(7,9);
floodfill(x-260,y,15);
settextstyle(0,0,0);
setcolor(15);
outtextxy(x-288,y-15,s1);
outtextxy(x-300,y,s2);
end;
2:begin
setcolor(7);
rectangle(x-243,y-35,x-224,y+35);
setfillstyle(9,10);
floodfill(x-235,y,7);
rectangle(x-253,y-25,x-244,y+25);
setfillstyle(9,10);
floodfill(x-248,y,7);
setfillstyle(1,11);
bar(x-223,y-35,x-221,y+35);
end;
end;
end;
procedure xnddrv;
begin
cleardevice;
settextstyle(0,0,0);
setcolor(4);
outtextxy(10,10,'μολ›  M*N αυ«• §νο•ρ:‰ηρ«‰—');
readkey;
cleardevice;
end;
Begin
init;
k:=1;
z:=0;
menuu(500,90,'«‡ο•',' †ολ›χ','1',1);
menuu(500,190,'«‡ο•','–―σ›―σ§','2',2);
menuu(500,290,'','„οϋ•','3',2);
menuu(500,390,'','  —χ','4',2);
repeat
case z of
1:menuu(500,90,'«‡ο•',' †ολ›χ','1',0);
2:menuu(500,190,'«‡ο•','–―σ›―σ§','2',0);
3:menuu(500,290,'','„οϋ•','3',0);
4:menuu(500,390,'','  —χ','4',0);
end;
case k of
1:menuu(500,90,'«‡ο•',' †ολ›χ','1',1);
2:menuu(500,190,'«‡ο•','–―σ›―σ§','2',1);
3:menuu(500,290,'','„οϋ•','3',1);
4:menuu(500,390,'','  —χ','4',1);
end;
z:=k;
1:repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if (k=1) and (ch=#13) then begin xnddrv;
menuu(500,90,'«‡ο•',' †ολ›χ','1',1);
menuu(500,190,'«‡ο•','–―σ›―σ§','2',2);
menuu(500,290,'','„οϋ•','3',2);
menuu(500,390,'','  —χ','4',2);goto 1; end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.