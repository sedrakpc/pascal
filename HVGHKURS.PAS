
{$n+}                 PROGRAM  HVGH;
USES CRT,  GRAPH;
const   c1=55; c2=5;
       al=1.5;
var  d,m,i,j,k,a,b,l,t,o,z,q:integer;
     f,r,h,m1,m2,m3,m4,v,h1,m11,v1,v2,v3,v4,h12,h4,h3,h2:array [0..100] of real;
     f11,f1: array [0..60,0..60] of real;
     gumx,gumf, gumy,max,max1,hq,gh,z4,z3,z2,z1,gh1,gh2,gh3,gh4:real;
     fg,fg1,fg2,fg3,fg4,hq1,hq2,hq3,hq4,lmd:real;
     s:string;

begin
d:=detect;
initgraph(d,m,'d:\tp\bgi');
if graphresult<>grok then halt(1);
setbkcolor(15);
setcolor(8);
lmd:=0.001;
a:=80; b:=20;
for i:= 0 to 29 do begin
line(a,b,a+220,b);
b:=b+15;  end;
a:=80;  b:=20;
for i:= 0 to 29  do begin
line(a+260,b,a+480,b);
b:=b+15;  end;
line(80,20,80,455);
line(100,20,100,455);
line(200,20,200,455);
line(250,20,250,455);
line(300,20,300,455);
line(340,20,340,455);
line(360,20,360,455);
line(460,20,460,455);
line(510,20,510,455);
line(560,20,560,455);
b:=37;
for i:=0 to 27 do  begin
str(i,s);
outtextxy(85,b,s);
b:=b+15; end;
b:=27;
for i:=28 to 55 do  begin
str(i,s);
outtextxy(345,b,s);
b:=b+15; end;
outtextxy(110,27,'max(r(x,y))');
outtextxy(210,27,'x(z1)');
outtextxy(260,27,'y(z1)');
setcolor(8);

a:=37;
for i:=0 to 27 do begin
l:=1;
for j:=1 to c2+1 do  begin
f[l]:=4*(1-exp(i*ln(1.01-exp(-al/(i+j)))))-lmd*(j);
l:=l+1; end;
max:=f[1];  h[i]:=1;
for l:=1 to c2+1 do  begin
if max<f[l]  then  begin
max:=f[l]; h[i]:=l; end;end;
r[i]:=max; m1[i]:=i;
max1:=r[0];
h1[0]:=h[0];
m11[0]:=m1[0];
for t:=0 to i do begin
if r[t]>max1 then  max1:=r[t];
v[i]:=max1; h1[i]:=h[t]; m11[i]:=m1[t]; end;
str(v[i]:2:2,s);
outtextxy(110,a,s);
str(h1[i]:2:0,s);
outtextxy(260,a,s);
str(m11[i]:2:0,s);
outtextxy(210,a,s);
a:=a+15;   end;
a:=27;
for i:=28 to c1 do begin
l:=1;
for j:=1 to c2+1 do  begin
f[l]:=4*(1-exp(i*ln(1.01-exp(-al/(i+j)))))-lmd*(j);
l:=l+1; end;
max:=f[1];  h[i]:=1;
for l:=1 to c2+1 do  begin
if max<f[l]  then  begin
max:=f[l]; h[i]:=l; end;end;
r[i]:=max; m1[i]:=i;
max1:=r[0];
h1[0]:=h[0];
m11[0]:=m1[0];
for t:=0 to i do begin
if r[t]>max1 then  max1:=r[t];
v[i]:=max1; h1[i]:=h[t]; m11[i]:=m1[t]; end;
str(v[i]:2:2,s);
outtextxy(370,a,s);
str(h1[i]:2:0,s);
outtextxy(510,a,s);
str(m11[i]:2:0,s);
outtextxy(470,a,s);
a:=a+15;   end;
readkey;
{***********2 axjusak********************}
cleardevice;
setbkcolor(15);
setcolor(8);
a:=80; b:=20;
for i:= 0 to 29 do begin
line(a,b,a+220,b);
b:=b+15;  end;
a:=80;  b:=20;
for i:= 0 to 29  do begin
line(a+260,b,a+480,b);
b:=b+15;  end;
line(80,20,80,455);
line(100,20,100,455);
line(200,20,200,455);
line(250,20,250,455);
line(300,20,300,455);
line(340,20,340,455);
line(360,20,360,455);
line(460,20,460,455);
line(510,20,510,455);
line(560,20,560,455);
b:=37;
for i:=0 to 27 do  begin
str(i,s);
outtextxy(85,b,s);
b:=b+15; end;
b:=27;
for i:=28 to 55 do  begin
str(i,s);
outtextxy(345,b,s);
b:=b+15; end;
outtextxy(110,27,'f2(z2)');
outtextxy(210,27,'x(z2)');
outtextxy(260,27,'y(z2)');
setcolor(8);
a:=37;
for i:=0 to 27 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=5*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v[i-z];
end; end;
max:=f11[0,1];  h12[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if f11[z,j]>max  then  begin
max:=f11[z,j];   m1[i]:=z;
h12[i]:=j;   v1[i]:=max;
end;  end; end;
str(v1[i]:2:2,s);
outtextxy(110,a,s);
str(h12[i]:2:0,s);
outtextxy(260,a,s);
str(m1[i]:2:0,s);
outtextxy(210,a,s);
a:=a+15;    end;
a:=27;
for i:=28 to c1 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=5*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v[i-z];
end;  end;
max:=f11[0,1]; h12[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if  f11[z,j]>max  then  begin
max:=f11[z,j]; m1[i]:=z;
h12[i]:=j;
v1[i]:=max;
end;  end;   end;
str(v1[i]:2:2,s);
outtextxy(370,a,s);
str(h12[i]:2:0,s);
outtextxy(510,a,s);
str(m1[i]:2:0,s);
outtextxy(470,a,s);
a:=a+15;    end;

readkey;
{***********3 axjusak********************}
cleardevice;
setbkcolor(15);
setcolor(8);a:=80; b:=20;
for i:= 0 to 29 do begin
line(a,b,a+220,b);
b:=b+15;  end;
a:=80;  b:=20;
for i:= 0 to 29  do begin
line(a+260,b,a+480,b);
b:=b+15;  end;
line(80,20,80,455);
line(100,20,100,455);
line(200,20,200,455);
line(250,20,250,455);
line(300,20,300,455);
line(340,20,340,455);
line(360,20,360,455);
line(460,20,460,455);
line(510,20,510,455);
line(560,20,560,455);
b:=37;
for i:=0 to 27 do  begin
str(i,s);
outtextxy(85,b,s);
b:=b+15; end;
b:=27;
for i:=28 to 55 do  begin
str(i,s);
outtextxy(345,b,s);
b:=b+15; end;
outtextxy(110,27,'f3(z3)');
outtextxy(210,27,'x(z3)');
outtextxy(260,27,'y(z3)');
setcolor(8);
a:=37;
for i:=0 to c1 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=0;  end; end;
for i:=0 to 27 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=6*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v1[i-z];
end; end;
max:=f11[0,1];  h2[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if max<f11[z,j]  then  begin
max:=f11[z,j];   m2[i]:=z;
h2[i]:=j;  end;
v2[i]:=max;    end;  end;
str(v2[i]:2:2,s);
outtextxy(110,a,s);
str(h2[i]:2:0,s);
outtextxy(260,a,s);
str(m2[i]:2:0,s);
outtextxy(210,a,s);
a:=a+15;   end;
a:=27;
for i:=28 to c1 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=6*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v1[i-z];
end; end;
max:=f11[0,1];  h2[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if max<f11[z,j]  then  begin
max:=f11[z,j];  m2[i]:=z;
h2[i]:=j;  end;
v2[i]:=max;
end;  end;
str(v2[i]:2:2,s);
outtextxy(370,a,s);
str(h2[i]:2:0,s);
outtextxy(510,a,s);
str(m2[i]:2:0,s);
outtextxy(470,a,s);
a:=a+15;   end;
readkey;
{***********4 axjusak********************}
cleardevice;
setbkcolor(15);
setcolor(8);
a:=80; b:=20;
for i:= 0 to 29 do begin
line(a,b,a+220,b);
b:=b+15;  end;
a:=80;  b:=20;
for i:= 0 to 29  do begin
line(a+260,b,a+480,b);
b:=b+15;  end;
line(80,20,80,455);
line(100,20,100,455);
line(200,20,200,455);
line(250,20,250,455);
line(300,20,300,455);
line(340,20,340,455);
line(360,20,360,455);
line(460,20,460,455);
line(510,20,510,455);
line(560,20,560,455);
b:=37;
for i:=0 to 27 do  begin
str(i,s);
outtextxy(85,b,s);
b:=b+15; end;
b:=27;
for i:=28 to 55 do  begin
str(i,s);
outtextxy(345,b,s);
b:=b+15; end;
outtextxy(110,27,'f4(z4)');
outtextxy(210,27,'x(z4)');
outtextxy(260,27,'y(z4)');
setcolor(8);
a:=37;
for i:=0 to 27 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=4*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v2[i-z];
end; end;
max:=f11[0,1];  h3[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if max<f11[z,j]  then  begin
max:=f11[z,j];   m3[i]:=z;
h3[i]:=j;  end;    v3[i]:=max;
end;  end;
str(v3[i]:2:2,s);
outtextxy(110,a,s);
str(h3[i]:2:0,s);
outtextxy(260,a,s);
str(m3[i]:2:0,s);
outtextxy(210,a,s);
a:=a+15;   end;
a:=27;
for i:=28 to c1 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=4*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v2[i-z];
end; end;
max:=f11[0,1]; h3[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if max<f11[z,j]  then  begin
max:=f11[z,j];   m3[i]:=z;
h3[i]:=j;  end;  v3[i]:=max;
end;  end;
str(v3[i]:2:2,s);
outtextxy(370,a,s);
str(h3[i]:2:0,s);
outtextxy(510,a,s);
str(m3[i]:2:0,s);
outtextxy(470,a,s);
a:=a+15;   end;
readkey;
{***********5 axjusak********************}
cleardevice;
setbkcolor(15);
setcolor(8);
a:=80; b:=20;
for i:= 0 to 29 do begin
line(a,b,a+220,b);
b:=b+15;  end;
a:=80;  b:=20;
for i:= 0 to 29  do begin
line(a+260,b,a+480,b);
b:=b+15;  end;
line(80,20,80,455);
line(100,20,100,455);
line(200,20,200,455);
line(250,20,250,455);
line(300,20,300,455);
line(340,20,340,455);
line(360,20,360,455);
line(460,20,460,455);
line(510,20,510,455);
line(560,20,560,455);
b:=37;
for i:=0 to 27 do  begin
str(i,s);
outtextxy(85,b,s);
b:=b+15; end;
b:=27;
for i:=28 to 55 do  begin
str(i,s);
outtextxy(345,b,s);
b:=b+15; end;
outtextxy(110,27,'f5(z5)');
outtextxy(210,27,'x(z5)');
outtextxy(260,27,'y(z5)');
setcolor(8);
a:=37;
for i:=0 to 27 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=6*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v3[i-z];
end; end;
max:=f11[0,1]; h4[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if max<f11[z,j]  then  begin
max:=f11[z,j];  m4[i]:=z;
v4[i]:=max;   h4[i]:=j;
end;  end;   end;
str(v4[i]:2:2,s);
outtextxy(110,a,s);
str(h4[i]:2:0,s);
outtextxy(260,a,s);
str(m4[i]:2:0,s);
outtextxy(210,a,s);
a:=a+15;   end;
a:=27;
for i:=28 to c1 do begin
for j:=1 to c2+1 do  begin
f1[i,j]:=6*(1-exp(i*ln(1.1-exp(-al/(i+j)))))-lmd*(j);
end;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
f11[z,j]:=f1[z,j]+v3[i-z];
end  end;
max:=f11[0,1];  h4[i]:=1;
for z:=0 to i do begin
for j:=1 to c2+1 do begin
if max<f11[z,j]  then  begin
max:=f11[z,j];  m4[i]:=z;
h4[i]:=j;  end;  v4[i]:=max;
end;  end;
str(v4[i]:2:2,s);
outtextxy(370,a,s);
str(h4[i]:2:0,s);
outtextxy(510,a,s);
str(m4[i]:2:0,s);
outtextxy(470,a,s);
a:=a+15;   end;
readkey;
cleardevice;
setbkcolor(15);
setcolor(8);
max:=v4[1];
for i:=0 to c1 do begin
if v4[i]>max then begin
max:=v4[i]; gh:=m4[i] ; hq:=h4[i];
fg:=max; end; end;
str(max:2:2,s);
outtextxy(100,100,s);
str(gh:2:0,s);
outtextxy(100,120,s);
str(hq:2:0,s);
outtextxy(100,140,s);
z4:=c1-gh;
for i:=0 to c1 do begin
if i=z4  then begin gh1:=m3[i];  hq1:=h3[i];
fg1:=v3[i];end;  end;
str(fg1:2:2,s);
outtextxy(200,100,s);
str(gh1:2:0,s);
outtextxy(200,120,s);
str(hq1:2:0,s);
outtextxy(200,140,s);
z3:=z4-gh1;
for i:=0 to c1 do begin
if i=z3  then begin  gh2:=m2[i];
hq2:=h2[i];  fg2:=v2[i]; end;  end;
str(fg2:2:2,s);
outtextxy(300,100,s);
str(gh2:2:0,s);
outtextxy(300,120,s);
str(hq2:2:0,s);
outtextxy(300,140,s);
z2:=z3-gh2;
for i:=0 to c1 do begin
if i=z2  then begin  gh3:=m1[i];
hq3:=h12[i];  fg3:=v1[i];  end;  end;
str(fg3:2:2,s);
outtextxy(400,100,s);
str(gh3:2:0,s);
outtextxy(400,120,s);
str(hq3:2:0,s);
outtextxy(400,140,s);
z1:=z2-gh3;
for i:=0 to c1 do begin
if i=z1  then begin  gh4:=m11[i];
hq4:=h1[i];  fg4:=v[i];  end;  end;
str(fg4:2:2,s);
outtextxy(500,100,s);
str(gh4:2:0,s);
outtextxy(500,120,s);
str(hq4:2:0,s);
outtextxy(500,140,s);
outtextxy(40,100,'fi');
outtextxy(40,120,'x');
outtextxy(40,140,'y');
outtextxy(240,200,'gumx=55');
gumy:=hq+hq1+hq2+hq3+hq4;
str(gumy:2:0,s);
outtextxy(240,220,'gumy='+s);
gumf:=fg+fg1+fg2+fg3+fg4;
str(gumf:2:2,s);
outtextxy(240,240,'gumf='+s);
gumx:=gh+gh1+gh2+gh3+gh4;
str(gumx:2:0,s);
outtextxy(240,200,'gumx='+s);

readkey;

end.
{$n-}