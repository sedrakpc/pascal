uses crt,graph;
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
procedure drvacq;
begin
cleardevice;
settextstyle(0,0,0);
setcolor(9);
outtextxy(130,120,'«‡ο• ‡ολ›χ');
settextstyle(0,0,0);
setcolor(15);
outtextxy(130,140,'  μολ›  M*N αυ«• §νο•ρ:¦νο•ρ• §•');
outtextxy(130,160,'υ―χο…―σ©« νοο γο―σ«―£ ι©―σ«•ρ ηε «―ο ι©―σ«');
outtextxy(130,180,'λ‰—ρ«‰—,―ο• ƒ―—―ο νοο‰ο §««―σ§ ‰« υ―χο…―σ©« νοο');
outtextxy(130,200,'γο―σ«―£ ν―£• ‰ν:€ον›‰— ινρλ› §νο•ρ:');
setcolor(5);
outtextxy(130,240,'•οη‰— ‰ν‰σ©— ‰«‘›ο…ο‰ο.');
Setcolor(15);
outtextxy(130,260,'  1.®ο―­‰— λ‰ν―ο• υ―χο…―σ©« νοο• ο“‰χ,');
outtextxy(130,280,'  2.¦νο•ρ• k-ο‡ ι©« νοο‰ο υ―™ο•«‰— b λ‰ν―ο• νοο‰ο―λ:');
repeat
until readkey=#27;
cleardevice;
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
var ch:char;
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
cleardevice;
setbkcolor(0);
settextstyle(0,0,0);
end;
procedure lucum;
type zang=array[1..10,1..10] of real;
     vec=array[1..100] of real;
   var  a:zang;
     var i,j,n,m,k,p,co:byte;
     code:integer;
     w,min:real;
     s:string;
     ch2:char;
     b,c:vec;
     t:boolean;
     f:file of real;
     {//////////// Function \\\\\\\\\\\\\\\\}
Function minl(b1:vec;n1:byte):real;
var i1:byte;
min:real;
begin
min:=b1[1];
for i1:=1 to n1 do
if b1[i1]<min then min:=b1[i1];
minl:=min;
end;
      {/////////// Procedure \\\\\\\\\\\\\\\\}
Procedure  pox(var a2:zang;k2,n2:byte;b2:vec);
var i2:byte;
begin
for i2:=1 to n2 do a2[i2,k2]:=b2[i2];
end;
{///////////////////\\\\\\\\\\\\\\\}
begin
setbkcolor(2);
cleardevice;
setcolor(1);
repeat
cleardevice;
outtextxy(100,10,'«‡ο―σ§ ‰«χ «‰ο§―σ›‰— §νο•ρ• αυ(1<n,m<6)');
outtextxy(285,20,'n=');
s:='';
repeat
repeat
outtextxy(300,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
until (n>1) and (n<6);

outtextxy(285,30,'m=');
repeat
setfillstyle(1,2);
bar(285,30,640,40);
outtextxy(285,30,'m=');
s:='';
repeat
repeat
outtextxy(300,30,s);
ch2:=readkey;
until (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,m,code);
until (m>1) and (m<6);

repeat
setfillstyle(1,1);
bar(320-m*30,140-n*20,320+m*30,140+n*20-2*n);
{------------------------------------------}

for i:=1 to n do
for j:=1 to m do begin
s:='';
repeat
setcolor(1);
outtextxy(335-m*30+(j-1)*55+2,165-n*25+(n-1)*6+(i-1)*30+1,s);
t:=false;
s:='';
repeat
repeat
setcolor(4);
outtextxy(335-m*30+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51)
or (ch2=#52) or (ch2=#53)or (ch2=#54) or (ch2=#55) or
(ch2=#56) or (ch2=#57) or(ch2=#46) or (ch2=#45) or(ch2=#13);
if (copy(s,1,1)='-')  then k:=6 else k:=5;
if length(s)<k then begin
if ch2<>#13 then s:=s+ch2 end
until (ch2=#13);
if pos(s,'-')<>0 then t:=false
else
begin
if (((copy(s,1,2)='-0') and (length(s)=2))
or ((copy(s,1,2)='-0') and (copy(s,3,1)<>'.'))
or ((copy(s,1,2)='-0') and (copy(s,length(s),1)='0')))
then t:=false
else begin
if (copy(s,1,1)='0') and (length(s)=1) then begin
val(s,w,code);t:=true end else begin
if (
((copy(s,1,1)='0') and (copy(s,2,1)<>'.')) or
((copy(s,1,1)='0') and (copy(s,length(s),1)='0'))
or (copy(s,length(s),1)='.'))
then t:=false
else begin
if (copy(s,1,1)='.') or (copy(s,1,2)='-.') then t:=false
else   begin
val(s,w,code);
if code=0 then
t:=true
else t:=false;
end
end
end
end
end;
if ((copy(s,1,1)<>'0') and (pos('.',s)>0) and (copy(s,length(s),1)='0'))
then t:=false
until t=true;
setcolor(15);
val(s,w,code);
outtextxy(335-m*30+(j-1)*55,160-n*25+5+(n-1)*6+(i-1)*30,s);
a[i,j]:=w;
end;
co:=0;
for i:=1 to n do
for j:=1 to m do
b[(i-1)*m+j]:=a[i,j];
min:=minl(b,m*n);
for i:=1 to n do
for j:=1 to m do
if a[i,j]=min then co:=co+1;
until co=1;
setcolor(4);
outtextxy(70,240,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Lilit.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'Lilit.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,1);
bar(320-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
320-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(6000);
delay(6000);
end;
close(f);
setcolor(2);
outtextxy(70,240,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Lilit.dat ϋ©—―σ§ γ‰—―σ  §ο');

setcolor(1);
outtextxy(100,240,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
readln;
reset(f);
for i:=1 to n do
for j:=1 to m do begin
read(f,a[i,j]);
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
setcolor(4);
outtextxy(330-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
setcolor(15);
outtextxy(330-m*30+5+(j-1)*55,160-n*25+5+(n-1)*6+(i-1)*30,s);
end;
{\\\\\\\\\\\\\\\\\\\\\\///////////////////}
for i:=1 to n do
for j:=1 to m do b[(i-1)*m+j]:=a[i,j];
min:=minl(b,n*m);
for i:=1 to n do
for j:=1 to m do
if a[i,j]=min then
begin
p:=i;k:=j;
break;
end;
if m>=n then for i:=1 to n do c[i]:=a[p,i]
else
for i:=1 to n do if i>m then c[i]:=0 else c[i]:=a[p,i];
for j:=m+1 downto k+1 do
begin for i:=1 to n do b[i]:=a[i,j-1];
pox(a,j,n,b);end;
pox(a,k,n,c);
m:=m+1;
{//////////////////////\\\\\\\\\\\\\\\\\\\}

setfillstyle(1,11);
bar(320-m*30,380-n*20,320+m*30,380+n*20);
for i:=1 to n do
for j:=1 to m do begin
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
setcolor(15);
outtextxy(330-m*30+5+(j-1)*55,400-n*20+5+(i-1)*30,s);
end;
setcolor(2);
outtextxy(100,240,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
setcolor(1);
outtextxy(200,240,'†―σοι …—―σ §ο ι‰£§‰χ <Esc>');
repeat
until readkey=#27;
cleardevice;
setbkcolor(0);
end;
begin
init;
k:=1;
repeat
case k of
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
if (k=1) and (ch=#13) then drvacq;
if (k=2) and (ch=#13) then lucum;
if (k=3) and (ch=#13) then graphika;
if k<1 then k:=4;
if k>4 then k:=1;
delay(40000)
until ch=#27;
end.
