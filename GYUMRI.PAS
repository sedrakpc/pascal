uses crt,graph;
label 1;
Type
  Vec=array[1..200] of real;
var k,z:byte;ch:char;
 p,m,i,j:integer; c:char;
  pat,exp,x,weyb:Vec;
  Q:array[1..211] of real;
  f1,f2,f3:text;
  a,s:real;t:boolean;
  f:file of real;
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
procedure WRFILE(var f:text;X:VEC);
var
  i:integer;
  t:boolean;
begin
  rewrite(f);
  for i:=1 to 200 do
    begin
      t:=false;
      if (i mod 10 = 0) then t:=true;
      if t=false then write(f,X[i]:2:3,'    ');
      if t=true then writeln(f,X[i]:2:3,'    ')
    end;
  close(f)
end;
procedure minmax(v:vec);
var i,j,k:byte;
max,min,mij:real;
vek:array[1..10] of byte;
begin
max:=v[1];
min:=v[1];
for i:=2 to 200 do begin
if v[i]<min then min:=v[i];
if v[i]>max then max:=v[i];
end;
clrscr;
writeln('max=',max:1:3);
writeln('min=',min:1:3);
mij:=(max-min)/10;
writeln('mijakayq=(max-min)/10=',mij:1:3);
for i:=1 to 10 do begin
k:=0;
for j:=1 to 200 do begin
if (v[j]>=min+(i-1)*mij) and (v[j]<=min+i*mij) then k:=k+1;
if (i=10) and (v[j]=max) then k:=k+1;
end;
vek[i]:=k;
end;
for i:=1 to 10 do writeln(i,') ',vek[i]);
readln;
SetGraphMode(GetGraphMode);
cleardevice;
{setcolor(15);}
line(20,440,600,440);
line(40,20,40,460);
setfillstyle(1,4);
for i:=1 to 10 do begin
bar(40+(i-1)*30,440-vek[i]*4,40+i*30,440);
rectangle(40+(i-1)*30,440-vek[i]*4,40+i*30,440);
end;
readln;
cleardevice;
{setcolor(15);}
line(20,440,600,440);
line(40,20,40,460);
k:=0;
for i:=1 to 10 do  begin
k:=k+vek[i];
setfillstyle(1,3+i);
fillellipse(50*(i-1)+40,440-k*2,4,4);
if i<10 then line(50*(i-1)+40,440-k*2,50*(i)+40,440-(k+vek[i+1])*2);
end;
end;
procedure pat_bashxum;

begin
restorecrtmode;
assign(f,'karen.dat');
reset(f);
for i:=1 to 200 do  begin
read(f,x[i]);
if i mod 10=0 then
     begin
        write(x[i]:1:3,'  ');
        writeln;
     end
else
        write(x[i]:1:3,'  ');
end;
close(f);
readln;
SetGraphMode(GetGraphMode);
end;
{-----here starts the program-------}
procedure exp_bashxum;
begin
restorecrtmode;
for i:=1 to 200 do   begin
if trunc(exp[i]) div 10<1  then write(' ');
if i mod 10=0 then
     begin
        write(exp[i]:1:3,'');
        writeln;
     end
else
        write(exp[i]:1:3,'  ');
end;
readln;
minmax(exp);
readln;
SetGraphMode(GetGraphMode);
end;
procedure weyb_bashxum;
begin
restorecrtmode;
for i:=1 to 200 do   begin
if i mod 10=0 then
     begin
        write(weyb[i]:5:3,'');
        writeln;

     end
else

        write(weyb[i]:5:3,'  ');


end;
readln;

minmax(weyb);
readln;
SetGraphMode(GetGraphMode);
end;

Begin
init;
{nor vektori stacum}
assign(f,'karen.dat');
reset(f);
for i:=1 to 200 do
read(f,x[i]);
close(f);

for i:=1 to 212 do
    if (i<=200) then q[i]:=x[i] else q[i]:=x[i-200];
  for i:=1 to 200 do
    begin
      s:=1;
       for j:=i to i+12 do s:=s+q[j];

      exp[i]:=-1/1.8*ln(x[i]);
      weyb[i]:=sqrt((-1/10)*ln(x[i]));
    end;
     assign(f1,'patahakan.txt');
  WRFILE(f1,x);
  assign(f2,'exponencial.txt');
  WRFILE(f2,exp);
  assign(f3,'Weybul.txt');
  WRFILE(f3,weyb);
pat_bashxum;
exp_bashxum;
weyb_bashxum;

end.