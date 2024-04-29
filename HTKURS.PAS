uses graph,crt;
const tver:array[1..8]of integer=(5,18,33,23,16,2,2,1);
      laplas:array[1..9]of real=(-0.4850,-0.4331,-0.2703, 0.0119, 0.2852,
                                  0.4394, 0.4895, 0.49903,0.49993);
var x,fx,hr,pei,pas:array[1..100]of real;
    pa:array[1..9]of real;
    i,j,k,ca,e,d,r:integer;
    min,max,cal,sig,dis,mat,r1,xx,tt,xi,ep,tt1,tt2,ddx,alkes:real;
    tiv,har:integer;
    hm:string;
    f:file of real;
    cod:char;

 procedure ketayin;
   begin
    cleardevice;
    settextstyle(5,0,6);
    outtextxy(130,40,'Ketayin bashxum');setcolor(15);
    line(49,30,49,450);line(30,431,610,431);
    setcolor(15);
    moveto(49,431);tiv:=0;setlinestyle(2,0,3);
      for i:=1 to 8 do
       begin
	tiv:=tiv+trunc(tver[i]*100/100);
	lineto(24+50*i,431-tiv);
       end;
    repeat cod:=readkey;
    until ord(cod)=13;
   end;

begin
d:=detect;initgraph(d,r,'');e:=graphresult;
setbkcolor(1);cleardevice;setcolor(15);
line(49,30,49,450);line(30,431,610,431);
  assign(f,'a:\kursfile.dat');
  reset(f);
for i:=1 to 100 do
begin
  read(f,x[i]);
  end;
  close(f);
  for i:=1 to 100 do
 begin
  min:=x[i];
  for j:=i to 100 do if x[j]<min then
    begin min:=x[j];k:=j
    end;
  x[k]:=x[i];
  x[i]:=min;end;
  max:=x[1];min:=x[1];
  for i:=1 to 100 do
  begin if x[i]>max then max:=x[i] else
  if x[i]<min then min:=x[i];end;

  e:=0;cal:=min-0.1;
  settextstyle(0,0,1);
  pa[1]:=min;
while cal<=max do
begin ca:=0;
for i:=1 to 100 do
begin if(x[i]>cal)and(x[i]<=cal+(max-min)/7)then ca:=ca+1;end;
str(ca,hm);setcolor(15);
cal:=cal+(max-min)/7;
e:=e+1;setfillstyle(1,e+1);pa[e+1]:=cal;
bar(50+50*(e-1),430-trunc(300*(ca/100)/0.69),49+50*e,430);
outtextxy(70+50*(e-1),450,hm);
end;

readkey;
outtextxy(410,20,'Mat. spasum=');
outtextxy(410,40,'Dispersia=');
outtextxy(410,60,'Sigma=');
mat:=0;dis:=0;sig:=0;
for i:=1 to 100 do
mat:=mat+x[i];
mat:=mat/100;
str(mat:1:4,hm);
outtextxy(510,20,hm);
for i:=1 to 100 do
dis:=dis+sqr(x[i]-mat);
dis:=dis/99;
str(dis:1:4,hm);
outtextxy(490,40,hm);
sig:=sqrt(dis);
str(sig:1:4,hm);
outtextxy(460,60,hm);
readkey;
r1:=13.71;
for i:=1 to 400 do
begin
 xx:=1/(sig*sqrt(2*pi))*exp(-(sqr(r1-mat))/(2*sqr(sig)));
 putpixel(49+i,trunc(430-300*xx),15);
 r1:=r1+0.013825;
end;
moveto(50,431-trunc(6*fx[1]*100));
readkey;setcolor(15);


readkey;cleardevice;
outtextxy(100,5,'pi, astx');
outtextxy(200,5,'laplas');
outtextxy(240,300,'xi.qar=');
for i:=1 to 8 do
begin pas[i]:=tver[i]/100;
str(pas[i]:1:3,hm);outtextxy(100,10+10*i,hm);end;
for i:=1 to 9 do
{begin} hr[i]:=(pa[i]-mat)/sig;
{str(hr[i]:4:2k,hm);outtextxy(100,10+10*i,hm);end;}
for i:=1 to 8 do
begin pei[i]:=laplas[i+1]-laplas[i];
str(pei[i]:1:3,hm);outtextxy(200,10+10*i,hm);end;
xi:=0;
for i:=1 to 8 do
xi:=xi+(sqr(pas[i]-pei[i])/pei[i]);
xi:=100*xi;str(xi:4:3,hm);outtextxy(300,300,hm);
{*******migakayqer*********}
{--------1-in exanak-------}
ep:=sqrt(dis/100)*0.96;
tt1:=mat-ep;tt2:=mat+ep;
str(tt1:1:3,hm);outtextxy(100,200,hm);
str(tt2:1:3,hm);outtextxy(100,230,hm);
ddx:=(0.8*100+1.2)/(100*99)*sqr(dis);
tt1:=dis-ddx*0.96;tt2:=dis+ddx*0.96;
str(tt1:1:3,hm);outtextxy(100,300,hm);
str(tt2:1:3,hm);outtextxy(100,330,hm);
{******chshgrit exanak******}
alkes:=(1-0.95)/2;
str(alkes:1:3,hm);outtextxy(100,400,hm);

tt1:=7*dis/11.1;
str(tt1:1:3,hm);outtextxy(100,420,hm);
tt2:=7*dis/0.711;
str(tt2:1:3,hm);outtextxy(100,440,hm);





{repeat cod:=readkey;ketayin;
until ord(cod)=13;}

readkey;
end.