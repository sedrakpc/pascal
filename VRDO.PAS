program vardan;
uses crt,graph;
var gd,gm,code:integer;
a,b,c,a1,b1,c1:integer;
s:string;
ch:char;
procedure XY;
begin
setcolor(15);
line(320,100,320,380);
line(180,240,460,240);
end;
procedure graphik(a,b,c:integer);
var gag:integer;
newx,newy,oldx,oldy:integer;
i:integer;
begin
oldx:=0;oldy:=0;
gag:=round((-1*b)/(2*a));
setcolor(4);
for i:=gag-80 to gag+80 do
begin
newx:=320+i;
newy:=240-(a*i*i+b*i+c) div 15*abs(a);
if (oldx<>0) and (oldy<>0) and (oldy>120) and (oldy<320)
and (newy>120) then
line(oldx,oldy,newx,newy);
oldx:=newx;
oldy:=newy;
end;
end;
begin
gd:=detect;
initgraph(gd,gm,'');
randomize;
a:=-3+random(7);
if a=0 then a:=1;
b:=10*random(5)+1;
c:=10*random(5)+1;
repeat
setfillstyle(7,1);
bar(0,0,getmaxx,getmaxy);
xy;
graphik(a,b,c);
repeat
setfillstyle(1,2);
bar(10,10,100,30);
setcolor(4);
outtextxy(20,18,'a=');
s:='';
repeat
repeat
setcolor(4);
outtextxy(40,18,s);
ch:=readkey;
until(ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54) or (ch=#55) or (ch=#56) or (ch=#57) or (ch=#13) or (ch=#45);
if ch<>#13 then s:=s+ch;
until (ch=#13);
val(s,a1,code);
if code<>0 then a1:=10;
until (a1>-4) and (a1<4);
repeat
setfillstyle(1,2);
bar(10,40,100,60);
{outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6,1<m<10)');}
setcolor(4);
outtextxy(20,48,'b=');
s:='';
repeat
repeat
setcolor(4);
outtextxy(40,48,s);
ch:=readkey;
until(ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54) or (ch=#55) or (ch=#56) or (ch=#57) or (ch=#13) or (ch=#45);
if ch<>#13 then s:=s+ch;
until (ch=#13);
val(s,b1,code);
if code<>0 then b1:=10;
until (b1>-6) and (b1<6);
repeat
setfillstyle(1,2);
bar(10,70,100,90);
{outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6,1<m<10)');}
setcolor(4);
outtextxy(20,78,'c=');
s:='';
repeat
repeat
setcolor(4);
outtextxy(40,78,s);
ch:=readkey;
until(ch=#49) or (ch=#50) or (ch=#51) or (ch=#52) or (ch=#53)
or (ch=#54) or (ch=#55) or (ch=#56) or (ch=#57) or (ch=#13) or (ch=#45);
if ch<>#13 then s:=s+ch;
until (ch=#13);
val(s,c1,code);
if code<>0 then c1:=10;
until (c1>-6) and (c1<6);
graphik(a1,b1*10,c1*10);
ch:=readkey;
until ((a1=a) and (b1=b) and (c1=c)) or (ch=#27);
end.