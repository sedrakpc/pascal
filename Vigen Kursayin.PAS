 Uses Crt,Graph;
 type mat=array [1..5,1..5] of real;
var v:integer;
procedure gr;
var d,m,n:integer;
begin
detectgraph(m,n);
initgraph(m,n,'');
if graphresult<>grok then halt;
end;
procedure menu( var d:integer);
var c:char;
begin
setbkcolor(9);
cleardevice;setcolor(4); setfillstyle(1,7);
bar(270,80,360,125);
bar(240,150,330,195);
bar(270,220,360,265);
bar (240,290,330,335);
outtextxy(280,100,'1.«‡•ο');
setcolor(10);outtextxy(250,170,'2.–―σ›―σ§');
outtextxy(280,240,'3.„―λ‹‡');   outtextxy(250,310,'4.€λον');
d:=1;
repeat
c:=readkey;
if c=#0 then c:=readkey;
case c of
#72:d:=d-1;
#80:d:=d+1
end;
if d=0 then d:=4;
if d=5 then d:=1;
case d of
1: begin setcolor(4); outtextxy(280,100,'1.«‡•ο');
setcolor(10);outtextxy(250,170,'2.–―σ›―σ§');
outtextxy(280,240,'3.„―λ‹‡');   outtextxy(250,310,'4.€λον') end;
2: begin setcolor(10); outtextxy(280,100,'1.«‡•ο');
setcolor(4);outtextxy(250,170,'2.–―σ›―σ§');  setcolor(10);
outtextxy(280,240,'3.„―λ‹‡');   outtextxy(250,310,'4.€λον') end;
3:begin  setcolor(10); outtextxy(280,100,'1.«‡•ο');
outtextxy(250,170,'2.–―σ›―σ§');   setcolor(4);
outtextxy(280,240,'3.„―λ‹‡');   setcolor(10);outtextxy(250,310,'4.€λον')
end;
4:begin  setcolor(10); outtextxy(280,100,'1.«‡•ο');
outtextxy(250,170,'2.–―σ›―σ§');
outtextxy(280,240,'3.„―λ‹‡');setcolor(4);outtextxy(250,310,'4.€λον') end
end;

until c=#13 end;
procedure blojik;
var d,m,i,k:integer;  f:pointer;
begin detectgraph(d,m); initgraph(d,m,'');
 setcolor(white);line(280,300,350,300);
 sector(315,300,0,180,30,80);
 setfillstyle(1,6);sector(315,250,0,180,70,80);
 setcolor(15); setlinestyle(2,0,0); line(370,303,600,303);
 ellipse(430,283,0,360,7,11);
 circle(430,267,5);
 circle(430,255,6);   setlinestyle(0,0,0);
 line(424,300,424,290);
 line(435,300,434,290);
 line(425,265,415,260);
 line(435,265,445,260);
 line(426,250,418,235);
 line(443,235,435,250);
 d:=imagesize(413,225,450,300);
 getmem(f,d); getimage(413,225,450,300,f^);
putimage(413,225,f^,1);
repeat
for d:=25 to 180 do begin
putimage(600-d,225,f^,0) ; delay(1000) end;
for d:=180 downto 25 do begin
putimage(600-d,225,f^,0) ; delay(1000) end until keypressed;
  cleardevice
end;
procedure   xndri_lucum;
type masiv=array[1..10,1..10] of real;
var s:string;
ch2:char;
n,m,i,j,k,ss,co:byte;
code:integer;
a:masiv;
t:boolean;
max,w:real;
f:file of real;
function func(A1:masiv;b1:real;n1,m1:byte):byte;
var i1,j1,k1:byte;
begin
for i1:=1 to n1 do
for j1:=1 to m1 do
if a1[i1,j1]=b1 then k1:=i1;
func:=k1;
end;
procedure proc(var a2:masiv;s2,n2,m2:byte);
var i2,j2:byte;
begin
for j2:=s2 to m2-1 do
for i2:=1 to n2 do
a2[i2,j2]:=a2[i2,j2+1];
end;

Begin
setcolor(15);
repeat
cleardevice;
outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6,1<m<10)');
outtextxy(295,20,'n=');
s:='';
repeat
repeat
outtextxy(313,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
if code<>0 then n:=0;
until (n>1) and (n<6);
outtextxy(295,30,'m=');
repeat
setfillstyle(1,0);
bar(295,30,640,40);
outtextxy(295,30,'m=');
s:='';
repeat
repeat
outtextxy(313,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,m,code);
if code<>0 then m:=0;
until (m>1) and (m<9);
setfillstyle(1,10);
repeat
bar(320-m*30,140-n*20,320+m*30,140+n*20);
co:=0;
for i:=1 to n do
for j:=1 to m do begin
s:='';
repeat
setcolor(10);
outtextxy(328-m*30+(j-1)*55,165-n*25+(n-1)*6+(i-1)*30,s);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
t:=false;
s:='';
repeat
repeat
setcolor(4);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
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
if code<>0 then begin
if copy(s,1,1)<>'-' then t:=false;
if code=0 then begin
t:=true;w:=(-1)*w
end
end
else t:=true;
end
end
end
end
end;
if ((copy(s,1,1)<>'0') and (pos('.',s)>0) and (copy(s,length(s),1)='0'))
then t:=false
until t=true;


setcolor(14);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
a[i,j]:=w;
end;
max:=a[1,1];
ss:=1;
for i:=1 to n do
for j:=1 to m do
if a[i,j]>max then begin max:=a[i,j];ss:=j;  end;
for i:=1 to n do
for j:=1 to m do
if a[i,j]=max then co:=co+1;
until co=1;
setcolor(4);
readln;
assign(f,'Vigen.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
bar(328-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
328-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(60000);
delay(60000);
end;
close(f);
setcolor(0);
setcolor(4);
readln;
reset(f);
setcolor(14);
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
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
end;

k:=func(a,max,n,m);
proc(a,ss,n,m);
for i:=k to n-1 do
for j:=1 to m do
a[i,j]:=a[i+1,j];

setfillstyle(1,7);
bar(320-(m-1)*30,380-(n-1)*20,320+(m-1)*30,380+(n-1)*20);
for i:=1 to n-1 do
for j:=1 to m-1 do begin
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
outtextxy(315-m*30+5+(j)*55,390-n*20+5+(i)*30,s);
end;
end;

begin
gr;
repeat menu(v);
case v of
1:begin cleardevice; outtextxy(282,100,'«‡ο• β«ε');
  outtextxy(170,170,'μολ› ‰« m*n ƒ«« ‘λ‰ο ‰λ m*n §νο•ρ,');
  outtextxy(170,180,'―ο« ―σ«• §•©« §‰ §‰›…―σ©« νοο:‹§‰—');
  outtextxy(170,190,'ƒ—―-ι™‰§ ‰λ ›ο…•ο, ―ο―«χ §νο•ρ•ρ');
  outtextxy(170,200,'‰ηρ«‰« §‰›…―σ©« νοο γο―σ«―£ ν―£');
  outtextxy(170,210,'‰λ ι©―σ«: μγ‰— ινρλ› §νο•ρ:');
  outtextxy(180,230,'•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο.');
  outtextxy(170,250,'1.®ο―­‰— §νο•ρ• §‰›…―σ©« νοο• ο“‰χ:');
  outtextxy(170,260,'2.‰ηρ«‰— §νο•ρ• L-ο‡ ι©―σ«:');readln end;
2:begin cleardevice; xndri_lucum;readln end;
3:begin cleardevice; blojik;readln end;
 end;
until v=4; closegraph end.