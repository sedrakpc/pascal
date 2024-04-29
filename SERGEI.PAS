uses crt,graph;
var  y:array[1..10,0..60] of real;x:array[1..10,0..60] of integer;
xo:array[1..10] of integer; yo:array[1..10] of real;
max,yy,s1:real;maxx,z,xx,i,b,n,j,k,d,r,e,ss:integer;s:string;
begin

d:=detect;
initgraph(d,r,'d:\bp\bgi');
e:=graphresult;
if e<>0 then begin write(grapherrormsg(e));halt end;


setbkcolor(15);setcolor(1);

b:=50;
n:=9;

for z:=0 to b do
begin
max:=0;maxx:=0;
for xx:=0 to z do
begin
yy:=5*(1-0.64*exp(xx*ln(0.64)));
if yy>max  then begin max:=yy;maxx:=xx end;
end;
y[1,z]:=max;
x[1,z]:=maxx;
end;



{for i:=1 to z do begin
str(y[1,i]:4:5,s);outtextxy(70,30+8*i,s);
str(x[1,i],s);outtextxy(200,30+8*i,s) end; }


for i:=2 to n-1 do       begin

for z:=0 to b do
begin
max:=0;maxx:=0;
for xx:=0 to z do
begin
if i=2 then yy:=10*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if i=3 then yy:=8*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if i=4 then yy:=4*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if i=5 then yy:=3*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if i=6 then yy:=7*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if i=7 then yy:=6*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if i=8 then yy:=5*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if yy>max then begin max:=yy;maxx:=xx end;
end;
y[i,z]:=max;
x[i,z]:=maxx;
end;                         end;


i:=n;max:=0;maxx:=0;
for xx:=0 to b do
begin
z:=b;
yy:=9*(1-0.64*exp(xx*ln(0.64)))+y[i-1,z-xx];
if yy>max then begin max:=yy;maxx:=xx end;
end;

ss:=0;
xo[n]:=maxx;yo[n]:=2*(1-0.64*exp(xo[n]*ln(0.64)));
ss:=ss+xo[n];

for i:=n-1 downto 1 do  begin
xo[i]:=x[i,b-ss];
if i=1 then yo[i]:=5*(1-0.64*exp(xo[i]*ln(0.64)));
if i=2 then yo[i]:=10*(1-0.64*exp(xo[i]*ln(0.64)));
if i=3 then yo[i]:=8*(1-0.64*exp(xo[i]*ln(0.64)));
if i=4 then yo[i]:=4*(1-0.64*exp(xo[i]*ln(0.64)));
if i=5 then yo[i]:=3*(1-0.64*exp(xo[i]*ln(0.64)));
if i=6 then yo[i]:=7*(1-0.64*exp(xo[i]*ln(0.64)));
if i=7 then yo[i]:=6*(1-0.64*exp(xo[i]*ln(0.64)));
if i=8 then yo[i]:=5*(1-0.64*exp(xo[i]*ln(0.64)));
ss:=ss+xo[i];
end;


for j:=1 to n-1 do
begin
setfillstyle(1,15);bar(1,1,640,480);
outtextxy(15,20,'z');outtextxy(70,20,'fi(z)');outtextxy(200,20,'x(z)');
for i:=0 to b do begin
str(i,s);outtextxy(15,30+8*i,s);
str(y[j,i]:4:5,s);outtextxy(70,30+8*i,s);
str(x[j,i],s);outtextxy(200,30+8*i,s) end;
readkey
end;

setfillstyle(1,15);bar(1,1,640,480);
outtextxy(15,20,'z');outtextxy(70,20,'fi(z)');outtextxy(200,20,'x(z)');
str(max:4:5,s);outtextxy(70,30,s);outtextxy(15,30,'50');
str(maxx,s);outtextxy(200,30,s);
readkey;

{xo[1]:=8;yo[1]:=5*(1-0.64*exp(xo[1]*ln(0.64)));
xo[2]:=10;yo[2]:=10*(1-0.64*exp(xo[2]*ln(0.64)));
xo[3]:=9;yo[3]:=8*(1-0.64*exp(xo[3]*ln(0.64)));
xo[4]:=8;yo[4]:=4*(1-0.64*exp(xo[4]*ln(0.64)));
xo[5]:=7;yo[5]:=3*(1-0.64*exp(xo[5]*ln(0.64)));
xo[6]:=9;yo[6]:=7*(1-0.64*exp(xo[6]*ln(0.64)));
xo[7]:=4;yo[7]:=2*(1-0.64*exp(xo[7]*ln(0.64)));     }


setfillstyle(1,15);bar(1,1,640,480);s1:=0;
outtextxy(100,200,'xi');outtextxy(100,250,'Ii');
for i:=1 to n do    begin  str(xo[i],s);outtextxy(100+50*i,200,s);
s1:=s1+yo[i];str(yo[i]:4:2,s);outtextxy(100+50*i,250,s);
end;

str(s1:4:2,s);outtextxy(150,350,s);

readkey;

end.

























uses crt,graph;
var f:file of real;hav,l,l1,ff:real;d,r,e,k,j:integer;s:string;
begin   randomize;
d:=detect;
initgraph(d,r,'d:\bp\bgi');
e:=graphresult;
cleardevice;setbkcolor(green);
setcolor(1);
line(50,100,50,450);
line(30,400,500,400);
assign(f,'d:\dd3.dat');reset(f);seek(f,0);
read(f,hav);ff:=hav;seek(f,200);read(f,hav);l:=hav;
l1:=l/10;k:=0;j:=0;
seek(f,0);
while not eof(f) do
begin
read(f,hav);k:=k+1;
if hav>ff+l1 then begin l1:=l1+l/10;
j:=j+30;
setcolor(4);setfillstyle(1,3+random(14));
bar(100+j,400-5*(k-1),129+j,400);
str(k,s);outtextxy(110+j,410,s);
k:=0;
end;
{write(er:4:3);write('  '); }
end;
j:=j+30;setfillstyle(1,3+random(15));bar(100+j,400-5*(k-2),129+j,400);
str(k-1,s);outtextxy(110+j,410,s);
readln;
end.



uses crt;
var f:file of real;c:char;a,n,i,csh:integer;k,s:real;
begin
clrscr;
{randomize;}
write('n=');gotoxy(3,1);readln(n);
{write('cshtutyun-');gotoxy(11,2);readln(csh);}
writeln;
s:=0;
assign(f,'d:\dd2.dat');rewrite(f);
for i:=1 to n do  begin
repeat a:=random({csh}999);k:=a/{csh}1000;s:=s+k;delay(4);until a<>0;
write(k:4:3);write(' ');write(f,k);
end;
close(f);
writeln;writeln((s/n):4:3);
repeat c:=readkey until ord(c)=27;
end.











uses crt,graph;
var f:file of real;hav,l,l1,ff:real;d,r,e,k,j:integer;s:string;
begin   randomize;
d:=detect;
initgraph(d,r,'d:\bp\bgi');
e:=graphresult;
cleardevice;setbkcolor(green);
setcolor(1);
line(50,100,50,450);
line(30,400,500,400);
assign(f,'d:\dd4.dat');reset(f);seek(f,0);
read(f,hav);ff:=hav;seek(f,200);read(f,hav);l:=hav;
l1:=l/10;k:=0;j:=0;
seek(f,0);
while not eof(f) do
begin
read(f,hav);k:=k+1;
if hav>ff+l1 then begin l1:=l1+l/10;
j:=j+30;
setcolor(4);setfillstyle(1,1+random(14));
bar(100+j,400-5*(k-1),129+j,400);
str(k,s);outtextxy(110+j,410,s);
k:=0;
end;
{write(er:4:3);write('  '); }
end;
j:=j+30;setfillstyle(1,1+random(15));bar(100+j,400-5*(k-2),129+j,400);
str(k-1,s);outtextxy(110+j,410,s);
readln;
end.





















