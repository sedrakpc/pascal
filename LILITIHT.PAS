uses crt,graph;
label 1;
Type
  Vec=array[1..200] of real;
var z:byte;
 p,m,i,j:integer; c:char;
  pat,exp,x,norm:Vec;
  Q:array[1..211] of real;
  f1,f2,f3:text;
  a,s:real;t:boolean;
  f:file of real;
k:byte;ch:char;
{\\\\\\\\\\\\\\\\\\\\\\\\////////////////////}
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
bar(40+(i-1)*50,440-vek[i]*10,40+i*50,440);
rectangle(40+(i-1)*50,440-vek[i]*10,40+i*50,440);
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
assign(f,'tato1.dat');
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
minmax(x);
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
procedure norm_bashxum;
begin
restorecrtmode;
for i:=1 to 200 do   begin
if i mod 10=0 then
     begin
        write(norm[i]:5:3,'');
        writeln;

     end
else

        write(norm[i]:5:3,'  ');


end;
readln;

minmax(norm);
readln;
SetGraphMode(GetGraphMode);
end;
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
procedure vpage(x,y:integer;v,color:byte);
begin
setlinestyle(0,0,1);
setfillstyle(1,0);
setcolor(15);
bar(x-40,y-10,x+140,y+180);
setcolor(15);
line(x,y,x,y+160);
rectangle(x,y,x+120,y+160);
setfillstyle(1,13);
floodfill(x+100,y+90,15);
setcolor(color);
outtextxy(x-11,y+18,'1');
outtextxy(x-11,y+18+40,'2');
outtextxy(x-11,y+18+80,'3');
outtextxy(x-11,y+18+120,'4');
case v of
1:begin
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,4);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
setfillstyle(1,1);
floodfill(x-10,y+60,color);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
floodfill(x-10,y+105,color);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,color);
Setcolor(0);
outtextxy(x+35,y+70,' «‡ο•');
outtextxy(x+35,y+80,'†ολ›χ');
end;
2:begin
line(x,y+40,x-10,y+40);
line(x-10,y+40,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
setfillstyle(1,4);
floodfill(x-10,y+60,color);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x-12,y+41);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
floodfill(x-10,y+105,15);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,15);
Setcolor(0);
outtextxy(x+35,y+70,' «‡ο•');
outtextxy(x+35,y+80,'–―σ›―σ§');
end;
3:begin
line(x,y+80,x-10,y+80);
line(x-10,y+80,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
setfillstyle(1,4);
floodfill(x-10,y+105,15);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x-12,y+81);
floodfill(x-10,y+60,15);
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
floodfill(x-10,y+145,15);
Setcolor(0);
outtextxy(x+35,y+80,'„οϋ•');
end;
4:begin
line(x,y+120,x-10,y+120);
line(x-10,y+120,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
setfillstyle(1,4);
floodfill(x-10,y+145,15);
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,1);
floodfill(x-10,y+10,color);
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
floodfill(x-10,y+60,15);
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x-12,y+121);
floodfill(x-10,y+105,15);
Setcolor(0);
outtextxy(x+45,y+80,'—χ');
end;
end;
end;

begin
init;

{nor vektori stacum}
assign(f,'lilit.dat');
reset(f);
for i:=1 to 200 do
read(f,x[i]);
close(f);

for i:=1 to 211 do
    if (i<=200) then q[i]:=x[i] else q[i]:=x[i-200];
  for i:=1 to 200 do
    begin
      s:=0;
      for j:=i to i+11 do s:=s+q[j];

      exp[i]:=sqrt((-1/4)*ln(x[i]));
      {logaritmakan bashxum}
      norm[i]:=(15)+(3.2)*(s-6);
    end;
     assign(f1,'patahakan.txt');
  WRFILE(f1,x);
  assign(f2,'exp.txt');
  WRFILE(f2,exp);
  assign(f3,'norm.txt');
  WRFILE(f3,norm);


k:=1;
repeat
1:case k of
1:begin
vpage(260,170,1,15);
end;
2:begin
vpage(260,170,2,15);
end;
3:begin
vpage(260,170,3,15);
end;
4:begin
vpage(260,170,4,15);
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
if (k=1) and (ch=#13) then begin pat_bashxum  end;
if (k=2) and (ch=#13) then begin exp_bashxum  end;
if (k=3) and (ch=#13) then begin norm_bashxum  end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(40000)
until ch=#27;
readln
end.
