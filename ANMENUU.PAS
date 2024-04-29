uses graph,crt;
var k,gr,gm:integer;
ch:char;
PROCEDURE GRAPHIKA;

var d,m,l,i,e:integer;p:pointer;
s1,s2:string;
begin
detectgraph(d,m);
initgraph(d,m,'');
setbkcolor(1);
setcolor(8);
rectangle(229,350,411,390);
setfillstyle(1,13);floodfill(230,351,8);
setcolor(6);
rectangle(232,370,408,388);
setcolor(8);
setcolor(15);
settextstyle(7,0,1);
outtextxy(235,348,'Please wait . . .');
setcolor(5);
for i:=1 to 176 do begin
line(232+i,370,232+i,388);
delay(10000) end;
setfillstyle(1,1);
bar(229,350,411,390);
setcolor(14);
settextstyle(7,0,4);
setfillstyle(1,1);
for i:=1 to 15 do begin
bar(80,200,560,432);delay(40000);
outtextxy(80,200,'SARGSYAN ANAHIT H621-3');
delay(30000)
end;
settextstyle(0,0,0);
setcolor(12);
s1:='―σοι©•« ­™ν«χ PASCAL —‰‹λ―λ!!!';
i:=0;
while length(s1)>0 do begin
s2:=copy(s1,1,1);
delete(s1,1,1);
outtextxy(130+8*i,350,s2);
inc(i);
end;
s1:='‘‰ ―σ‹―σ§ λ‰ο‡η«— §‰«©―σ ι‰£§‰χ F1';
i:=0;
while length(s1)>0 do begin
s2:=copy(s1,1,1);
delete(s1,1,1);
outtextxy(134+8*i,370,s2);
inc(i);
end;
readkey
end;

{__________________________________________}
procedure  xndri_lucum;
type zang=array[1..8,1..8] of real;
     vec=array[1..8] of real;
   var  a:zang;b:vec;m,n,i,j,k:byte;
   code:integer; t:boolean; ch2:char;
   s:string;  co,ss:byte; max,w:real;
   f:file of real;
   {__________________________________________}

   procedure  vek(var b1:vec;a1:zang;m1:byte);
   var l,j:byte;
   begin for j:=1 to m1 do
   b1[j]:=a1[l,j];
   end;

   {____________________________________________}

   function  sim(i2,n2:byte):integer;
   begin
   if (i2>=1) and (i2<=n2)
   then sim:=n2+1-i2 else sim:=0;end;

Begin
setcolor(15);
settextstyle(0,0,0);

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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο ANAHIT.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'ANAHIT.dat');
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
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο ANAHIT.dat ϋ©—―σ§ γ‰—―σ  §ο');

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
 begin
   repeat write('n=');readln(n); write('m='); readln(m)
   until (n>=2)and(n<=8)and(m>=2)and(m<=8);

   for i:=1 to n do
   for j:=1 to m do
   begin
        write('a[',i,',',j,']=') ; readln(a[i,j]);  end;
   for i:=1 to n div 2 do
   begin
   vek(b,a,m);
   sim(i,n);
  k:=sim(i,n);
  end; end;
{______________________________________}

setfillstyle(1,7);
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
outtextxy(315-m*30+5+(j)*55,390-n*20+5+(i)*30,s);
end;

repeat
until readkey=#27;
cleardevice;   end;


{_________________________________________}

procedure xndridrvacq;
    begin

 setfillstyle(1,1);
 floodfill(201,240,8);
 settextstyle(0,0,2);
 setcolor(4);
 outtextxy(200,150,'«‡ο• ‡ολρχ')  ;
  setcolor(green);
 settextstyle(0,0,1);

 outtextxy(100,200,'μολ› ‰« M «…§ N αυ• §νο•ρ:μ‰£‰ο―λ υ―™‰— §νο•ρ•');
 outtextxy(100,210,'ηε•« ‰λ λ‰οε•«,‰οο―ο‡ ‰λ «£λ‰οε•« ‰λ ©—« ν―£‰ο:');
 settextstyle(0,0,1);

 setcolor(4);
 outtextxy(100,250,'•οη‰— ‰ν‰λ©— ‰«‘›ο…ο‰ο')  ;
 settextstyle(0,0,1);
setcolor(4);
outtextxy(118,290,'1)');
setcolor(2);
 outtextxy(135,290,'¦νο•ρ• l-ο‡ ν―£•ρ λ‰ν―ο ιν«—:');
 setcolor(4);
 outtextxy(118,330,'2)');
setcolor(2);
 outtextxy(135,330,'‘‰ i γν«―σ§  [1,n], γ λ‰ο‡ο΅«‰—');
 outtextxy(135,350,'‰«νο―«• «ν§§ƒ ι•§‰νο• ‘•λ:');
     REPEAT UNTIL readkey=#27 END;
procedure govazd;
begin
{cleardevice;   }

    readkey
end;

procedure xndir;
begin
{cleardevice;}

    readkey
end;

procedure xndrilucum;
begin
cleardevice;

    readkey
end;

procedure menu(x1,x2,x3,x4:byte);
begin
setbkcolor(1);
settextstyle(0,0,2);

setfillstyle(1,x1);
bar(20,100,140,160);
outtextxy(30,120,'„®κ€†');

setfillstyle(1,x2);
bar(140,160,260,220);
outtextxy(160,180,'ª†”ξ');

setfillstyle(1,x3);
bar(260,220,380,280);
outtextxy(270,240,'–®ς®ς¦');

setfillstyle(1,x4);
bar(500,340,380,280);
outtextxy(400,300,'€κ€ξμ');

end;

begin
gr:=detect;
initgraph(gr,gm,'');
if graphresult <> 0 then halt;

k:=1;
repeat
cleardevice;
repeat
case k of
1:menu(2,13,13,13);
2:menu(13,2,13,13);
3:menu(13,13,2,13);
4:menu(13,13,13,2);
end;
ch:=readkey;
IF (K=1) AND (ch=#13) then begin graphika ;break end;
IF (K=2) AND (ch=#13) then begin xndridrvacq ;break end;
if(k=3)and(ch=#13)then begin xndri_lucum; break end;
if ord(ch)=77 then k:=k+1;
if ord(ch)=75 then k:=k-1;
if k=0 then k:=4;
if k=6 then k:=1;
until ord(ch)=13;
case k of
1:govazd;
2:xndir;
3:xndrilucum;
end ;
until k=4;

end.