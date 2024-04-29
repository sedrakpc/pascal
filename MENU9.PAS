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
setbkcolor(0);
       setcolor(4);
     settextstyle(0,0,0);
     outtextxy(10,160,'    1. «‡ο• †ολ›χ');
     setcolor(2);
     outtextxy(110,180,'μολ› ‰« M,N ƒ«« ‘λ‰ο ‰λ •ο« ν•γ• M*N νοο‰ο γο―σ«―£');
     outtextxy(110,200,'§νο•ρ:k(1<k<=M) ƒ«« ‘•λ: ¦νο•ρ• K-ο‡ ν―£•ρ ηε λ‰—ρ«‰—')  ;
     outtextxy(110,220,'0 ο“‰χ ―σ«‰ρ―£ νοο‰ο―λ ν―£:€ον›‰— ρνρλ› §νο•ρ');
     outtextxy(110,240,'§―σ§  ―αλ―σ§ §νο•ρ• ©« νο,―ο §‰›  •ο‰« ο‰λ« νο‰ο•ρ:');
     setcolor(4);
     outtextxy(10,270,'    2.•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο');
     setcolor(2);
     outtextxy(110,290,'κ‰ν―ο• ρν‰£›‰— ―ο• ƒ―—―ο νο‰ο λιο ‰« C-•');
     outtextxy(110,310,'¦νο•ρ• l-ο‡ ν―£• νοο‰ο υ―™ο•«‰— d λ‰ν―ο• νοο‰ο―λ:');
repeat
until readkey=#27;
cleardevice;
end;
procedure   Xndlucum;
type masiv=array[0..10,0..10] of real;
     vec=array[1..10] of real;
var s:string;
ch2:char;
n,m,i,j,ss,q,k:byte;
code:integer;
a,b:masiv;
t:boolean;
min,w:real;
d:vec;
f:file of real;
procedure vector(var b1:vec;m1:byte;c1:real);
var j1:byte;
begin
for j1:=1 to m1 do
b1[j1]:=c1;
end;
procedure pox(var a2:masiv;m2,k2:byte;d2:vec);
var j2:byte;
begin
for j2:=1 to m2 do a2[k2,j2]:=d2[j2];
end;
Begin
Settextstyle(0,0,0);
setcolor(15);
repeat
cleardevice;
outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6,1<n<10)');
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
outtextxy(345,30,'k=');
repeat
setfillstyle(1,0);
bar(345,30,640,40);
outtextxy(345,30,'k=');
s:='';
repeat
repeat
outtextxy(363,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,k,code);
if code<>0 then k:=0;
until (k>1) and (k<9) and (k>1) and (k<=n);
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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Hrach.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
setcolor(0);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Hrach.dat ϋ©—―σ§ γ‰—―σ  §ο');
setcolor(4);
outtextxy(290,250,'„ο«ρσ§');
assign(f,'Hrach.dat');
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
outtextxy(290,250,'„ο«ρσ§');
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
vector(d,m,0);
for i:=n downto k do
for j:=1 to m do
a[i+1,j]:=a[i,j];
pox(a,m,k,d);
{------------------------------------}
setfillstyle(1,7);
bar(320-(m)*30,380-(n)*20,320+(m+1)*30,380+(n+1)*20);
for i:=1 to n+1 do
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
outtextxy(275-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;

repeat
until readkey=#27;
cleardevice;
end;
procedure grafika;
                                       var d,m,i:integer;
                                       begin
                                       setbkcolor(1); cleardevice;
                                       setcolor(2);setlinestyle(0,0,0);
                                       for i:= 0 to 300  do begin
                                       ellipse(20+2*i,15,0,360,20,15);delay(3000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       ellipse(619,15+2*i,0,360,20,15);delay(3000);
                                       cleardevice end;
                                       for i:=0 to 300 do begin
                                       ellipse(619-2*i,464,0,360,20,15);
                                       delay(3000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       ellipse(20,464-2*i,0,360,20,15);
                                       delay(3000);
                                       cleardevice end;
                                       for i:=0 to 150 do begin
                                       ellipse(20+4*i,15+3*i,0,360,20,15);
                                       delay(3000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       ellipse(619,464-2*i,0,360,20,15);
                                       delay(3000);
                                       cleardevice end;
                                       for i:=0 to 150 do begin
                                       ellipse(619-4*i,15+3*i,0,360,20,15);
                                       delay(3000);
                                       cleardevice end;
                                       repeat
                                       until readkey=#27;
                                       cleardevice;
                                       setcolor(0);
                                       end;
procedure menu(x,y:integer;s1,s2:string;color:byte);
var k,h:byte;
begin
setfillstyle(1,0);
bar(x-70,y-15,x+70,y+15);
k:=random(20);
h:=random(20);
setcolor(14);
setfillstyle(1,3);
bar(x-50-k,y-15,x+50+h,y+15);
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
if (k=2) and (ch=#13) then Xndlucum;
if (k=3) and (ch=#13) then grafika;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
end.