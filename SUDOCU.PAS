program Sudoku;
uses crt,graph;
type vec=array[1..6] of byte;
var d,m,code:integer;
i,j,k,l,count:byte;
ch:char;
s,s1:string;
x,y,ox,oy:byte;
ma:array[1..6,1..6] of byte;
ba,na,dm:vec;
t,t1:boolean;
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
floodfill(px,py,col);
end;
procedure das(var masiv:vec);
var i,j,m:byte;
begin
for i:=1 to 6 do
for j:=1 to 6 do
if masiv[j]>masiv[j+1] then begin
m:=masiv[j];masiv[j]:=masiv[j+1];
masiv[j+1]:=m;
end;
end;
procedure xarn(var masiv:vec);
var i,j,k,m:byte;
begin
for k:=1 to 50 do begin
i:=random(6)+1;
j:=random(6)+1;
m:=masiv[j];masiv[j]:=masiv[i];
masiv[i]:=m;
end;
end;
procedure preview;
begin
for i:=1 to 6 do
for j:=1 to 6 do
begin
settextstyle(0,0,3);
str(ma[i,j],s);
if ma[i,j]<>0 then outtextxy(130+72*(j-1),50+70*(i-1),s);
end;
end;

begin
initgraph(d,m,'');
cleardevice;
setbkcolor(1);
for i:= 1 to 6 do
dm[i]:=i;
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

setcolor(4);
rectangle(101,25,539,445);
for i:=1 to 5 do begin
line(101+73*i,25,101+73*i,445);
line(101,25+70*i,539,25+70*i);
end;
for i:=1 to 6 do ma[random(6)+1,random(6)+1]:=0;
preview;
x:=random(6)+1;
y:=random(6)+1;
ox:=0;
oy:=0;
repeat
move(x,y,ox,oy,4);
ox:=x;
oy:=y;
repeat
ch:=readkey;
until (ch=#77) or (ch=#75) or (ch=#72) or (ch=#80) or (ch=#27) or
(ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54) or (ch=#13);
if (ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54)
then if ma[y,x]=0 then begin val(ch,ma[y,x],code);
preview;
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
until ch=#27;
end.