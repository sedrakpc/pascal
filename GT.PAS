uses graph,crt;
var
m,n,i:integer;
begin
initgraph(m,n,'');
repeat
for i:=1 to 40 do
begin
settextstyle(0,0,1);
setcolor(15);
outtextxy(45*i,0,'*');
outtextxy(10+38*i,40,'* ');
outtextxy(20+42*i,80,'*  ');
outtextxy(-10+44*i,120,'*  ');
outtextxy(-20+47*i,160,'*  ');
outtextxy(-35+48*i,200,'*  ');
outtextxy(-10+45*i,240,'* ');
outtextxy(-31+49*i,280,'*  ');
outtextxy(-20+44*i,320,'* ');
outtextxy(-12+40*i,360,'*  ');
outtextxy(20+40*i,400,'*  ');
outtextxy(-12+40*i,440,'*  ');

end;
delay(60000);delay(60000);delay(60000);delay(60000);delay(60000);

for i:=1 to 650 do
begin
setcolor(black);
outtextxy(45*i,0,'*');
outtextxy(10+38*i,40,'* ');
outtextxy(20+42*i,80,'*  ');
outtextxy(-10+44*i,120,'*  ');
outtextxy(-20+47*i,160,'*  ');
outtextxy(-35+48*i,200,'*  ');
outtextxy(-10+45*i,240,'* ');
outtextxy(-31+49*i,280,'*  ');
outtextxy(-20+44*i,320,'* ');
outtextxy(-12+40*i,360,'*  ');
outtextxy(20+40*i,400,'*  ');
outtextxy(-12+40*i,440,'*  ');
end;
for i:=1 to 650 do
begin
setcolor(15);
outtextxy(50*i,0,'*');
outtextxy(-5+38*i,40,'* ');
outtextxy(-20+42*i,80,'*  ');
outtextxy(10+44*i,120,'*  ');
outtextxy(20+47*i,160,'*  ');
outtextxy(5+48*i,200,'*  ');
outtextxy(-15+45*i,240,'* ');
outtextxy(-51+49*i,280,'*  ');
outtextxy(-20+44*i,320,'* ');
outtextxy(-32+40*i,360,'*  ');
outtextxy(0+40*i,400,'*  ');
outtextxy(-32+40*i,440,'*  ');
end;
delay(60000);delay(60000);delay(60000);delay(60000);delay(60000);
for i:=1 to 650 do
begin
setcolor(black);
outtextxy(50*i,0,'*');
outtextxy(-5+38*i,40,'* ');
outtextxy(-20+42*i,80,'*  ');
outtextxy(10+44*i,120,'*  ');
outtextxy(20+47*i,160,'*  ');
outtextxy(5+48*i,200,'*  ');
outtextxy(-15+45*i,240,'* ');
outtextxy(-51+49*i,280,'*  ');
outtextxy(-20+44*i,320,'* ');
outtextxy(-32+40*i,360,'*  ');
outtextxy(0+40*i,400,'*  ');
outtextxy(-32+40*i,440,'*  ');
end;
for i:=1 to 40 do
begin
settextstyle(0,0,1);
setcolor(15);
outtextxy(45*i,0,'*');
outtextxy(10+38*i,40,'* ');
outtextxy(20+42*i,80,'*  ');
outtextxy(-10+44*i,120,'*  ');
outtextxy(-20+47*i,160,'*  ');
outtextxy(-35+48*i,200,'*  ');
outtextxy(-10+45*i,240,'* ');
outtextxy(-31+49*i,280,'*  ');
outtextxy(-20+44*i,320,'* ');
outtextxy(-12+40*i,360,'*  ');
outtextxy(20+40*i,400,'*  ');
outtextxy(-12+40*i,440,'*  ');

end;


until keypressed;

end.