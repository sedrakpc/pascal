uses crt;
type
 BB=array[1..2,1..8] of REAL;
 BBBB=array[1..2,1..8] of integer;BBB1=array[0..90] of integer;
 BBB=array[1..8] of integer;BBBBB=array[0..90] of real;
 CONST A:BB=((0.08,0.045,0.052,0.02,0.1,0.015,0.035,0.08),
             (0.012,0.03,0.09,0.041,0.065,0.08,0.07,0.61));
 CONST C:BBBB=((14,7,9,10,12,6,5,8),
               (8,6,11,5,9,8,7,13));
 CONST P:BBB=(10,7,15,8,12,6,14,18);
 VAR
 f8,w,w2,w3,w4,w5,w6,w7,f1,f2,f3,f4,f5,f6,f7,w8:bbbbb;X:BBB1;S:REAL;
 b1,b2,MAX,MIN,d,e,r,g,h,j,k,l,m,n,v,q,o,i,u:integer;xx,x1,x2:bbb;
{*********************}
function minimumk(u:bbbbb;k:integer;g:integer):integer;
var min:real;v:integer;
begin
v:=k;min:=u[k];
FOR I:=k+1 TO g DO
IF u[i]<min THEN begin min:=u[i];v:=i;end;
minimumk:=v;
end;
{*********************}
function minimum(u:bbbbb;k:integer;g:integer):real;
var min:real;
begin
min:=u[k];
FOR I:=k+1 TO g DO
IF u[i]<min THEN min:=u[i];
minimum:=min;
end;
{***************************************}
BEGIN
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(7);
n:=8;b1:=40;b2:=50;
write('n=8   b1=40    b2=50');writeln;writeln;writeln;
write('a        ');for i:=1 to n do
begin write(a[1,i]:2:3,' ');end;
writeln;write('         ');for i:=1 to n do
begin write(a[2,i]:2:3,' ');end;
writeln;writeln;
write('c        ');for i:=1 to n do
begin write(c[1,i],'  ');end;
writeln;write('          ');for i:=1 to n do
begin write(c[2,i],'  ');end;
writeln;writeln;writeln;write('p        ');for i:=1 to n do
begin write(p[i],'  ');end;
readkey;
{11111111111111111111111111111111111111111111}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(15);
write('x1    w(z1)');writeln;writeln;
j:=1;e:=p[1];s:=0;
for i:=0 to e do
begin x[i]:=i;
w[i]:=s+c[1,j]*(1-exp(a[1,j]*(p[j]-x[i])))+c[2,j]*(1-exp(a[2,j]*x[i]));
w[i]:=minimum(w,0,i);s:=w[i];
end;writeln;
for i:=0 to e do
begin write(x[i],'    ');write(w[i]:2:2);writeln;end;
readkey;
{2222222222222222222222222222222222222222}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(14);
write('x2    w(z2)');writeln;writeln;
for i:=0 to e do f1[i]:=w[i];
j:=2;e:=p[1]+p[2];
for i:=0 to e do
x[i]:=i;
{/////////////}
for i:=0 to e do
begin r:=0;
while r<=i do begin l:=i-r;
f2[r]:=f1[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}
w2[i]:=minimum(f2,0,i);
end;writeln;
for i:=0 to e do
begin write(x[i],'    ');write(w2[i]:2:2);writeln;end;
readkey;
{3333333333333333333333333333333333333333}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(15);
write('x3    w(z3)');writeln;writeln;
for i:=0 to e do f2[i]:=w2[i];
j:=3;e:=p[1]+p[2]+p[3];
s:=0;
for i:=0 to e do
x[i]:=i;
{/////////////}
for i:=0 to e do
begin r:=0;
while r<=i do begin l:=i-r;
f3[r]:=f2[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}
w3[i]:=minimum(f3,0,i);
end;writeln;
for i:=0 to e do
begin write(x[i],'    ');write(w3[i]:2:2);writeln;end;
readkey;
{4444444444444444444444444444444444444444}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(14);
write('x4    w(z4)');writeln;writeln;
for i:=0 to e do f3[i]:=w3[i];
j:=4;e:=p[1]+p[2]+p[3]+p[4];
s:=0;
for i:=0 to e do
x[i]:=i;
{/////////////}
for i:=0 to e do
begin r:=0;
while r<=i do begin l:=i-r;
f4[r]:=f3[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}
w4[i]:=minimum(f4,0,i);
end;writeln;
for i:=0 to e do
begin write(x[i],'    ');write(w4[i]:2:2);writeln;end;
readkey;
{555555555555555555555555555555555555555}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(15);
write('x5    w(z5)');writeln;writeln;
for i:=0 to e do f4[i]:=w4[i];
j:=5;e:=p[1]+p[2]+p[3]+p[4]+p[5];
s:=0;
for i:=0 to e do
x[i]:=i;
{/////////////}
for i:=0 to e do
begin r:=0;
while r<=i do begin l:=i-r;
f5[r]:=f4[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}
w5[i]:=minimum(f5,0,i);
end;writeln;
for i:=0 to e do
begin if i<=45 then begin
write(x[i],'    ');write(w5[i]:2:2);writeln;
end  else begin  gotoxy(30,i-45);write(x[i],'    ');write(w5[i]:2:2);end;
end;
readkey;
{666666666666666666666666666666666666666}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(14);
write('x6    w(z6)');writeln;writeln;
for i:=0 to e do f5[i]:=w5[i];
j:=6;e:=p[1]+p[2]+p[3]+p[4]+p[5]+p[6];
s:=0;
for i:=0 to e do
x[i]:=i;
{/////////////}
for i:=0 to e do
begin r:=0;
while r<=i do begin l:=i-r;
f6[r]:=f5[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}
w6[i]:=minimum(f6,0,i);
end;writeln;
for i:=0 to e do
begin if i<=45 then begin
write(x[i],'    ');write(w6[i]:2:2);writeln;
end  else begin  gotoxy(30,i-45);write(x[i],'    ');write(w6[i]:2:2);end;
end;
readkey;
{7777777777777777777777777777777777777777}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(15);
write('x7    w(z7)');writeln;writeln;
for i:=0 to e do f6[i]:=w6[i];
j:=7;e:=p[1]+p[2]+p[3]+p[4]+p[5]+p[6]+p[7];
for i:=0 to e do
x[i]:=i;
{/////////////}
for i:=0 to e do
begin r:=0;
while r<=i do begin l:=i-r;
f7[r]:=f6[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}
w7[i]:=minimum(f7,0,i);
end;writeln;
for i:=0 to e do
begin if i<=45 then begin
write(x[i],'    ');write(w7[i]:2:2);writeln;
end  else begin  gotoxy(30,i-45);write(x[i],'    ');write(w7[i]:2:2);end;
end;
readkey;
{88888888888888888888888888888888888}
CLRSCR;TEXTBACKGROUND(0);TEXTCOLOR(14);
write('w(',90,')');writeln;writeln;
for i:=0 to e do f7[i]:=w7[i];
j:=8;e:=p[1]+p[2]+p[3]+p[4]+p[5]+p[6]+p[7]+p[8];
for i:=0 to e do
x[i]:=i;
{/////////////}
i:=e;
r:=0;
while r<=i do begin l:=i-r;
f8[r]:=f7[l]+c[1,j]*(1-exp(a[1,j]*(p[j]-x[r])))+c[2,j]*(1-exp(a[2,j]*x[r]));
r:=r+1;end;
{/////////////}writeln;
s:=0;
s:=minimum(f8,0,i);xx[8]:=minimumk(f8,0,i);
write(s:2:2);writeln;writeln;writeln;
textcolor(12);write('X8*=');write(xx[8]);

READKEY;
END.