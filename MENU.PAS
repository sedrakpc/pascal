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
{setbkcolor(1);      }
cleardevice;
setcolor(4);
     settextstyle(0,0,0);
     outtextxy(10,160,'    1. «‡ο• †ολ›χ');
     setcolor(2);
     outtextxy(110,180,'μολ› ‰« N ‰λ M ƒ«« ‘λ‰ο ‰λ •ο« ν•γ• N*M νοο‰ο γο―σ«―£');
     outtextxy(110,200,'§νο•ρ:θν«— σ νγ‰— «―ο λ‰ν―ο,―ο• B[i] νο‰ο λιο ‰«');
     outtextxy(110,220,'i-ο‡ ν―£• νο‰ο•ρ υ―χο…―σ©«•«:');
     setcolor(4);
     outtextxy(10,270,'    2.•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο');
     setcolor(2);
     outtextxy(110,290,'®ο―­‰— λ‰ν―ο• υ―χο…―σ©« νο:');
     outtextxy(110,310,'¦νο•ρ• l-ο‡ ν―£•ρ λ‰ν―ο ιν«—:');
     setcolor(15);
repeat
until readkey=#27;
cleardevice;
end;
procedure grafika;
var d,m,i:integer;
begin
setbkcolor(1);cleardevice;
setcolor(2);setlinestyle(0,0,1);
setfillstyle(1,15);
for i:=0 to 300 do begin
rectangle(0+2*i,0,39+2*i,30);delay(1000);
cleardevice end;
for i:=0 to 225 do begin
rectangle(600,0+2*i,639,29+2*i);delay(1000);
cleardevice end;
for i:=0 to 300 do begin
rectangle(600-2*i,450,639-2*i,479);
delay(1000);
cleardevice end;
for i:=0 to 225 do begin
rectangle(0,450-2*i,40,479-2*i);
delay(1000);
cleardevice end;
for i:=0 to 150 do begin
rectangle(0+4*i,0+3*i,39+4*i,29+3*i);
delay(1000);
cleardevice end;
for i:=0 to 225 do begin
rectangle(600,450-2*i,639,479-2*i);
delay(1000);
cleardevice end;
for i:=0 to 150 do begin
rectangle(600-4*i,0+3*i,639-4*i,29+3*i);
delay(1000);
cleardevice end;
for i:=0 to 80 do begin cleardevice;
fillellipse(320,240,4*i,3*i);
delay(1000);
         end;
for i:=80 downto 0 do begin
cleardevice;fillellipse(320,240,4*i,3*i);
delay(1000) end;
setfillstyle(1,2);
for i:=0 to 80 do begin
bar(320-4*i,240-3*i,320+4*i,240+3*i);
delay(1000);end;
for i:=79 downto 0 do begin
setfillstyle(1,1);
bar(320-4*(i+1),240-3*(i+1),320+4*(i+1),240+3*(i+1));
setfillstyle(1,2);
bar(320-4*i,240-3*i,320+4*i,240+3*i);
delay(10000);end;
repeat
until readkey=#27;
setbkcolor(0);cleardevice;
end;
procedure lucum;
type masiv=array[1..10,1..10] of real;
     vec=array[1..10] of real;
var s:string;
ch2:char;
n,m,i,j,ss,q,co,min:byte;
code:integer;
a:masiv;
t:boolean;
w:real;
b,k,d:vec;
f:file of real;
procedure vekct(a1:masiv;m1,l1:byte;var d1:vec);
var j1:byte;
begin
for j1:=1 to m1 do d1[j1]:=a1[l1,j1];
end;
function minval(d2:vec;m2:byte):real;
var j2:byte;min2:real;
begin
min2:=d2[1];
for j2:=1 to m2 do
if d2[j2]<min2 then min2:=d2[j2];
minval:=min2;
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
bar(320-m*30,140-n*20,320+m*30,140+n*20);
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
if (copy(s,1,1)='-')  then q:=6 else q:=5;
if length(s)<q then begin
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

setcolor(4);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Vlad.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'Vlad.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
bar(328-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
328-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(6000);
delay(6000);
end;
close(f);
setcolor(0);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Vlad.dat ϋ©—―σ§ γ‰—―σ  §ο');

setcolor(4);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
readln;
reset(f);
setcolor(14);
for i:=1 to n do
for j:=1 to m do begin
read(f,w);
a[i,j]:=w;
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
{------------------------------------}
for i:=1 to n do
begin
vekct(a,m,i,d);
b[i]:=minval(d,m);
end;
{------------------------------------}
setfillstyle(1,7);
bar(320-(n)*30,380-20,320+(n)*30,380+20);
for j:=1 to n do
begin
str(b[j]:5:3,s);
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
outtextxy(275-n*30+5+(j)*55,380,s);
end;
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
menu(320,200,' «‡ο•','–―σ›―σ§',2);
menu(320,250,'','„οϋ•',2);
menu(320,300,'','  —χ',2);
end;
2:begin
menu(320,150,' «‡ο•','†ολ›χ',2);
menu(320,200,' «‡ο•','–―σ›―σ§',4);
menu(320,250,'','„οϋ•',2);
menu(320,300,'','  —χ',2);
end;
3:begin
menu(320,150,' «‡ο•','†ολ›χ',2);
menu(320,200,' «‡ο•','–―σ›―σ§',2);
menu(320,250,'','„οϋ•',4);
menu(320,300,'','  —χ',2);
end;
4:begin
menu(320,150,' «‡ο•','†ολ›χ',2);
menu(320,200,' «‡ο•','–―σ›―σ§',2);
menu(320,250,'','„οϋ•',2);
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
if (k=2) and (ch=#13) then lucum;
if (k=3) and (ch=#13) then grafika;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.