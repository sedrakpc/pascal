Program HVGH_Artyom;
uses crt,graph;
Type mat=array[1..3,1..10]of real;
     vec=array[0..85]of real;
var
   a,b,c:mat;
   fi,fi1,f1,f2,fi2,f3,fi3,f4,fi4,f5,fi5,f6,fi6:vec;
   bb:array[1..10]of integer;
   min,min1,min2,min3,min4,min5,min6,t:real;
   a1,a2,m,n,z,i,j,t1,t2,t3,t4,t5,t6,h,hh:integer;
   s,s1,s2,s3:string;
   f:array[0..82,0..9]of real;
   x:array[0..82,0..9]of integer;
   y1,y2:array[0..10]of integer;
procedure graphik;
var d,r,e:integer;
begin
randomize;
d:=detect;
InitGraph(d,r,'D:\BP\BGI');
e:=GraphResult;
If e <> 0 Then
Begin
Writeln('è˜€– Œ',GraphErrorMsg(e));
Writeln;
Halt end end;
Function Q(aa,bbb,cc:real;j:integer):real;
begin
      Q:=aa*j+bbb*j*j+cc;
end;
begin
graphik;
setbkcolor(15);cleardevice;setcolor(1);
a1:=80;a2:=50;n:=10;m:=2;
a[1,1]:=0.1;a[1,2]:=0.04;a[1,3]:=0.07;a[1,4]:=0.1;a[1,5]:=0.08;
a[1,6]:=0.07;a[1,7]:=0.1;a[1,8]:=0.09;a[1,9]:=0.1;a[1,10]:=0.15;
a[2,1]:=0.08;a[2,2]:=0.09;a[2,3]:=0.08;a[2,4]:=0.09;a[2,5]:=0.07;
a[2,6]:=0.06;a[2,7]:=0.1;a[2,8]:=0.08;a[2,9]:=0.07;a[2,10]:=0.14;
c[1,1]:=15;c[1,2]:=10;c[1,3]:=18;c[1,4]:=14;c[1,5]:=10;
c[1,6]:=17;c[1,7]:=9;c[1,8]:=8;c[1,9]:=16;c[1,10]:=9;
c[2,1]:=14;c[2,2]:=18;c[2,3]:=12;c[2,4]:=10;c[2,5]:=8;
c[2,6]:=15;c[2,7]:=8;c[2,8]:=14;c[2,9]:=10;c[2,10]:=9;
bb[1]:=15;bb[2]:=20;bb[3]:=10;bb[4]:=13;bb[5]:=17;bb[6]:=12;
bb[7]:=13;bb[8]:=7;bb[9]:=15;bb[10]:=8;
for i:=0 to 82 do
for j:=0 to 10  do
begin
     f[i,j]:=0;x[i,j]:=0;
end;
h:=0;
for i:=1 to 9 do
 begin
   h:=h+bb[i];
for z:=0 to 80 do
    begin
      for j:=0 to z do
	fi[j]:=c[1,i]*(1+exp(a[1,i]*j))+c[2,i]*(1+exp(a[2,i]*(bb[i]-j)))+f[z-j,i-1];
   min:=fi[0];
      for j:=1 to z do
       if min>fi[j] then min:=fi[j];
      f[z,i]:=min;
      for j:=0 to z do
       if min=fi[j] then begin t1:=j;j:=z end;
      x[z,i]:=t1;
      if z<40 then begin
      outtextxy(100,15,'fi(z)');
      str(f[z,i]:4:2,s);outtextxy(100,30+10*z,s);
      outtextxy(170,15,'x(z)');
      str(x[z,i],s);outtextxy(100+70,30+10*z,s); end
      else
      begin
      outtextxy(250,15,'fi(z)');
      str(f[z,i]:4:2,s);outtextxy(200+50,30+10*z-400,s);
      outtextxy(320,15,'x(z)');
      str(x[z,i],s);outtextxy(200+50+70,30+10*z-400,s); end
    end;
    readkey; cleardevice;
  end; i:= 10; cleardevice;
  for j:=0 to 80 do
	fi1[j]:=c[1,i]*(1+exp(a[1,i]*j))+c[2,i]*(1+exp(a[2,i]*(bb[i]-j)))+f[z-j,i-1];
  min:=fi1[0];
  for j:=1 to 80 do
    begin
      if min>fi1[j] then min:=fi1[j];
    end;
  f[bb[10],i]:=min;
  for j:=0 to 80 do
    if f[bb[10],i]=fi1[j] then begin t1:=j;j:=z end;
  x[bb[10],i]:=t1;
  outtextxy(20,20,'fi(z)');
  str(f[bb[10],i]:4:2,s);outtextxy(80,20,s);
  outtextxy(20,40,'x(z)');
  str(t1,s);outtextxy(80,40,s);
  readkey;cleardevice;
 t:=f[bb[10],i];t2:=t1;
 y1[i]:=t2;y2[i]:=bb[i]-t2;
 for i:=9 downto 1 do
  begin
    y1[i]:=x[a1-t2,i];
    t2:=t2+y1[i];
    y2[i]:=bb[i]-y1[i];
    t:=t+f[a1-t2,i];
  end;

 for i:=1 to 10 do
   begin
   outtextxy(160,120,'x(z)');
     str(y1[i],s);outtextxy(180+30*i,120,s);
     outtextxy(160,140,'I(z)');
     outtextxy(240,140,'1');
     str(y2[i],s);outtextxy(180+30*i,140,s);
   end;
 str(t:4:2,s);outtextxy(230,180,'š€˜è = '+s);
repeat until keypressed
END.