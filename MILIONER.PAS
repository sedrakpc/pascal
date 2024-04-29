uses crt,graph;
label 1;
var i,j,harc,q,g,color,rq,z:byte;
c:char;
k,p,m:integer;t:boolean;
temp:word;
s1,s2,s3,s4,H1,H2,H3:string;
x:array[1..10] of byte;
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
procedure monitor(k,x,y:integer;color1,color2:byte;s1,s2:string);
begin
setcolor(4);
line(x-28,y-62,x+28,y-62);
line(x-29,y-20,x-29,y-62);
line(x+29,y-20,x+29,y-62);
line(x-29,y-20,x+29,y-20);
line(x-32,y-66,x+32,y-66);
line(x-33,y-15,x-33,y-66);
line(x+33,y-15,x+33,y-66);
ellipse(x,y-32,237,304,60,20);
setfillstyle(1,8);
floodfill(x,y-15,4);
ellipse(x,y-12,180,360,14,10);
ellipse(x,y-5,140,40,25,14);
setfillstyle(11,8);
floodfill(x,y,4);
setfillstyle(1,color2);
floodfill(x,y-25,4);
setcolor(15);
settextstyle(0,0,0);
outtextxy(x-19,y-50,s1);
outtextxy(x-28+k,y-40,s2);
end;
procedure smallbar(x,y:integer;color:byte;s1,s2:string);
begin
setcolor(9);
line(x-50,y,x+150,y);
line(x-50,y+40,x+150,y+40);
line(x-70,y+20,x-50,y);
line(x-70,y+20,x-50,y+40);
line(x+170,y+20,x+150,y);
line(x+170,y+20,x+150,y+40);
line(x-130,y+20,x-70,y+20);
line(x+170,y+20,x+230,y+20);
setfillstyle(1,color);
floodfill(x,y+20,9);
setcolor(14);
outtextxy(x-50,y+18,s2);
outtextxy(x-40,y+18,'.');
setcolor(15);
outtextxy(x-30,y+18,s1);
end;
procedure bigbar(s1,s2,s3:string);
begin
setcolor(9);
line(50,360,590,360);
line(50,300,590,300);
line(50,300,20,330);
line(50,360,20,330);
line(0,330,20,330);
line(590,300,620,330);
line(590,360,620,330);
line(620,330,640,330);
setcolor(15);
OUTTEXTXY(100,310,s1);
OUTTEXTXY(100,325,s2);
OUTTEXTXY(100,340,s3);
end;
procedure extrasmallbar(h:byte);
var i:byte;
s1:string;
begin
for i:=1 to 200
do begin
setcolor(0);
line(660-(i-1),100,850-(i-1),100);
setcolor(9);
line(660-i,100,850-i,100);
delay(1000);
end;
setcolor(9);
line(610,100,640,100);
for i:=1 to 13 do begin
setcolor(0);
line(480,100+(i-1),570,100+(i-1));
line(480,100-(i-1),570,100-(i-1));
line(460,100,480,100+(i-1));
line(460,100,480,100-(i-1));
line(590,100,570,100+(i-1));
line(590,100,570,100-(i-1));
setcolor(9);
line(480,100+i,570,100+i);
line(480,100-i,570,100-i);
line(460,100,480,100+i);
line(460,100,480,100-i);
line(590,100,570,100+i);
line(590,100,570,100-i);
delay(10000);
end;
setcolor(2);
outtextxy(490,97,' ορ #');
str(h,s1);
outtextxy(547,97,s1);
end;
procedure harceribaza(z:byte);
begin
case z of

{-------------------Harceri Baza-------------------}

1:begin
s1:='H 621-1';
s2:='H 655-3';
s3:='H 620-2';
s4:='H 621-3';
h1:='';
h2:='®ο«  §‰ο ™§ƒ• §ο';
h3:='';
rq:=4;
end;
2: begin
s1:='®γν•«';
s2:='¦…«•ι«';
s3:='¦«©―σ«';
s4:='ψγ‰ον•λ';
h1:='';
h2:='”«αγ•ι• •­―£ ιοχ  λ•«α‰ιν―ο';
h3:='';
rq:=3;
end;
3: begin
s1:='Ctrl+Esc';
s2:='Alt+Enter';
s3:='Ctrl+z';
s4:='Alt+F4';
h1:='';
h2:='®ο ιν‰£«‰ο• §‡ο―σ‘©―σ««  λιο Windows ιν‰£«•«';
h3:='';
rq:=1;
end;
4: begin
s1:='ο«';
s2:='¦«•';
s3:='θν‰£«­ο';
s4:='μγ•α';
h1:='';
h2:='§ο…α• ―ο ιοχ• ν  …―ο…';
h3:='';
rq:=2;
end;


{-------------------Harceri Baza-------------------}
end;
end;
begin
init;
1:setbkcolor(0);
cleardevice;
k:=1;
p:=1;
m:=5;
repeat
case p of
1:begin monitor(5,320,150,4,1,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,0,'','  —χ  ');
monitor(0,220,250,4,0,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,0,'','„οϋ•');
end;
2:begin
monitor(5,320,150,4,0,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,0,'','  —χ  ');
monitor(0,220,250,4,1,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,0,'','„οϋ•');
end;
3:begin
monitor(5,320,150,4,0,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,0,'','  —χ  ');
monitor(0,220,250,4,0,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,1,'','„οϋ•');
end;
4:begin
monitor(5,320,150,4,0,'«‡ο•','‡ολ›χ');
monitor(0,320,350,4,1,'','  —χ  ');
monitor(0,220,250,4,0,'«‡ο•','—―σ›―σ§');
monitor(0,420,250,4,0,'','„οϋ•');
end;
end;
repeat
c:=readkey;
until (c=#77) or (c=#75) or (c=#80) or (c=#72) or (c=#27) or (c=#13);
if (p=4) and (c=#13) then halt;
if (p=3) and (c=#13) then break;
case c of
#72:begin k:=k-1;m:=5;end;
#80:begin k:=k+1;m:=5;end;
#75:begin m:=m-1;k:=5;end;
#77:begin m:=m+1;k:=5;end;
end;
if m=4 then m:=1;
if m=6 then m:=2;
if k=6 then k:=2;
if k=4 then k:=1;
if (m>2) and (m<>5) then m:=1;
if (m<1) and (m<>5) then m:=2;
if (k>2) and (k<>5) then k:=1;
if (k<1) and (k<>5) then k:=2;
if (k=5) and (m=2) then p:=3;
if (k=5) and (m=1) then p:=2;
if (m=5) and (k=2) then p:=4;
if (m=5) and (k=1) then p:=1;
until (c=#27);

randomize;
temp:=60000;
harc:=0;
for i:=1 to 10 do x[i]:=0;
repeat
harc:=harc+1;
repeat
z:=random(4)+1;
until (z<>x[1]) and (z<>x[2]) and (z<>x[3]) and (z<>x[4]) and
(z<>x[5]) and (z<>x[6]) and (z<>x[7]) and (z<>x[8])
and (z<>x[9]) and (z<>x[10]);
x[harc]:=z;
harceribaza(z);
k:=1;
m:=1;
p:=1;
cleardevice;
extrasmallbar(harc);
bigbar(h1,h2,h3);
repeat
case p of
1:begin
smallbar(120,370,7,S1,'A');
smallbar(120,420,0,s2,'B');
smallbar(420,370,0,s3,'C');
smallbar(420,420,0,s4,'D');
end;
2:
begin
smallbar(120,370,0,s1,'A');
smallbar(120,420,7,s2,'B');
smallbar(420,370,0,s3,'C');
smallbar(420,420,0,s4,'D');
end;
3:
begin
smallbar(120,370,0,s1,'A');
smallbar(120,420,0,s2,'B');
smallbar(420,370,7,s3,'C');
smallbar(420,420,0,s4,'D');
end;
4:
begin
smallbar(120,370,0,s1,'A');
smallbar(120,420,0,s2,'B');
smallbar(420,370,0,s3,'C');
smallbar(420,420,7,s4,'D');
end;
end;
repeat
c:=readkey;
until (c=#77) or (c=#75) or (c=#80) or (c=#72) or (c=#27) or (c=#13);
case c of
#72:k:=k-1;
#80:k:=k+1;
#75:m:=m-1;
#77:m:=m+1;
end;
if m>2 then m:=1;
if m<1 then m:=2;
if k>2 then k:=1;
if k<1 then k:=2;
if (k=1) and (m=1) then p:=1;
if (k=2) and (m=1) then p:=2;
if (m=2) and (k=2) then p:=4;
if (m=2) and (k=1) then p:=3;
until (c=#27) or (c=#13);
if c=#27 then goto 1;
if p=rq then begin
case rq of
1:
begin
for i:=1 to 10 do begin
smallbar(120,370,g,s1,'A');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);
end;
end;
2:begin
for i:=1 to 10 do begin
smallbar(120,420,g,s2,'B');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);
end;end;
3:begin
for i:=1 to 10 do begin
smallbar(420,370,g,s3,'C');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);

end;
end;
4:begin
for i:=1 to 10 do begin
smallbar(420,420,g,s4,'D');
if i mod 2 =0 then g:=0
else g:=10;
delay(temp);
  end;end;
end;
end
else begin
case rq of
1:smallbar(120,370,10,s1,'A');
2:smallbar(120,420,10,s2,'B');
3:smallbar(420,370,10,s3,'C');
4:smallbar(420,420,10,s4,'D');
end;
case p of
1:
begin
for i:=1 to 10 do begin
smallbar(120,370,g,s1,'A');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);
end;
end;
2:begin
for i:=1 to 10 do begin
smallbar(120,420,g,s2,'B');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);
end;end;
3:begin
for i:=1 to 10 do begin
smallbar(420,370,g,s3,'C');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);

end;
end;
4:begin
for i:=1 to 10 do begin
smallbar(420,420,g,s4,'D');
if i mod 2 =0 then g:=0
else g:=4;
delay(temp);
  end;end;

end;
end;
until (harc=4) or (p<>rq);
cleardevice;
settextstyle(0,0,2);
Setcolor(4);
if p=rq then
for i:=1 to 15 do  begin
Setcolor(random(14)+1);
outtextxy(210,200,'†―σχ £‘‰ρ•');
delay(temp);
end

else begin
outtextxy(210,200,'†―σχ γονλ‰ρ•χ');
delay(temp);delay(temp);delay(temp);
delay(temp);delay(temp);delay(temp);
end;


end.
