uses crt,graph;
label 1;
var k:byte;ch:char;
aa:set of byte;
d,m,code:integer;
i,j,l,count,r1,r2,co:byte;
s,s1:string;
x,y,ox,oy:byte;
ma:array[1..6,1..6] of byte;
t,t1:boolean;
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
procedure move(mx,my,ox,oy,col:byte);
var px,py:integer;
begin
if (ox <> 0) and (oy <> 0) then
begin
px:=120+(ox-1)*73;
py:=50+(oy-1)*70;
setfillstyle(1,1);
{circle(px,py,4)     }
floodfill(px,py,col);
end;
px:=110+(mx-1)*73;
py:=40+(my-1)*70;
setfillstyle(1,10);
if ((y-1)*6+x) in aa then setfillstyle(1,7);
floodfill(px,py,col);
end;
procedure preview;
begin
for i:=1 to 6 do
for j:=1 to 6 do
begin
settextstyle(0,0,3);
setfillstyle(1,1);
bar(130+72*(j-1)-5,50+70*(i-1)-5,130+72*(j-1)+25,50+70*(i-1)+25);
if ma[i,j]>0 then begin
str(ma[i,j],s);
outtextxy(130+72*(j-1),50+70*(i-1),s);
end;
end;
end;
procedure vpage(x,y:integer;v,color:byte);
begin
setlinestyle(0,0,1);
setfillstyle(1,0);
setcolor(15);
bar(x-40,y-10,x+140,y+180);
setcolor(15);
line(x,y,x,y+160);
rectangle(x,y,x+120,y+160);
setfillstyle(1,13);
floodfill(x+100,y+90,15);
setcolor(color);
outtextxy(x-11,y+18,'1');
outtextxy(x-11,y+18+40,'2');
outtextxy(x-11,y+18+80,'3');
outtextxy(x-11,y+18+120,'4');
case v of
1:begin
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,4);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
setfillstyle(1,1);
floodfill(x-10,y+60,color);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
floodfill(x-10,y+105,color);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,color);
Setcolor(0);
outtextxy(x+35,y+70,' «‡ο•');
outtextxy(x+35,y+80,'†ολ›χ');
end;
2:begin
line(x,y+40,x-10,y+40);
line(x-10,y+40,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
setfillstyle(1,4);
floodfill(x-10,y+60,color);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x-12,y+41);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
floodfill(x-10,y+105,15);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,15);
Setcolor(0);
outtextxy(x+35,y+70,' «‡ο•');
outtextxy(x+35,y+80,'–―σ›―σ§');
end;
3:begin
line(x,y+80,x-10,y+80);
line(x-10,y+80,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
setfillstyle(1,4);
floodfill(x-10,y+105,15);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x-12,y+81);
floodfill(x-10,y+60,15);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,15);
Setcolor(0);
outtextxy(x+35,y+80,'„οϋ•');
end;
4:begin
line(x,y+120,x-10,y+120);
line(x-10,y+120,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
setfillstyle(1,4);
floodfill(x-10,y+145,15);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
floodfill(x-10,y+60,15);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x-12,y+121);
floodfill(x-10,y+105,15);
Setcolor(0);
outtextxy(x+45,y+80,'—χ');
end;
end;
end;
{-------------------------------------------}
procedure graphika;
begin
cleardevice;
setbkcolor(1);
co:=6;
x:=random(6)+1;
y:=random(6)+1;
ox:=0;
oy:=0;
repeat
repeat
t1:=true;
for i:=1 to 6 do
for j:=1 to 6 do begin
repeat
t:=true;
s1:='';
count:=0;
randomize;
ma[i,j]:=random(6)+1;
if (i>1) or (j>1) then begin
for k:=1 to j-1 do begin str(ma[i,k],s);s1:=s1+s;end;
for k:=1 to i-1 do begin str(ma[k,j],s);s1:=s1+s;end;
for k:=1 to 6 do begin
str(k,s);
if pos(s,s1)>0 then count:=count+1;
end;
if count=6 then t1:=false;
end;
if t1=true then begin
if (i>1) or (j>1) then
begin
for k:=1 to j-1 do if ma[i,j]=ma[i,k] then t:=false;
for k:=1 to i-1 do if ma[i,j]=ma[k,j] then t:=false;
end;
end;
until t=true;
end;
until t1=true;


t:=false;
setcolor(4);
rectangle(101,25,539,445);
for i:=1 to 5 do begin
line(101+73*i,25,101+73*i,445);
line(101,25+70*i,539,25+70*i);
end;
aa:=[];
for i:=1 to co do begin
repeat
r1:=random(6)+1;r2:=random(6)+1;
until not (((r1-1)*6+r2) in aa);
ma[r1,r2]:=0;
aa:=aa+[((r1-1)*6+r2)];
end;
preview;
repeat
move(x,y,ox,oy,4);
ox:=x;
oy:=y;
repeat
ch:=readkey;
until (ch=#77) or (ch=#75) or (ch=#72) or (ch=#80) or (ch=#27) or
(ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54);
if (ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54)
then if ((y-1)*6+x) in aa then begin val(ch,m,code);
ma[y,x]:=m;
move(0,0,x,y,4);
preview;
move(x,y,ox,oy,4);
t:=true;
for i:=1 to  6 do
for j:=1 to 6 do begin
for k:=1 to j-1 do if ma[i,j]=ma[i,k] then t:=false;
for k:=1 to i-1 do if ma[i,j]=ma[k,j] then t:=false;
if ma[i,j]=0 then t:=false;
end;
end;

case ch of
#77:x:=x+1;
#75:x:=x-1;
#72:y:=y-1;
#80:y:=y+1
end;
if y>6 then y:=1;
if y<1 then y:=6;
if x>6 then x:=1;
if x<1 then x:=6;
until (ch=#27) or (t=true);
co:=co+1;
until (ch=#27);
end;
begin
init;
k:=1;
repeat
1:case k of
1:begin
vpage(260,170,1,15);
end;
2:begin
vpage(260,170,2,15);
end;
3:begin
vpage(260,170,3,15);
end;
4:begin
vpage(260,170,4,15);
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
if (k=3) and (ch=#13) then graphika;
if k<1 then k:=4;
if k>4 then k:=1;
delay(40000)
until ch=#27;
end.
