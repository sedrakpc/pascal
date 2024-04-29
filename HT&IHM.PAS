uses crt,graph;
label 1;
Type
  Vec=array[1..200] of real;
var k,z:byte;ch:char;
 p,m,i,j:integer; c:char;
  pat,veyb,x,logn:Vec;
  newkey,oldkey:byte;
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
bar(40+(i-1)*30,440-vek[i]*5,40+i*30,440);
rectangle(40+(i-1)*30,440-vek[i]*5,40+i*30,440);
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
assign(f,'sedrak.dat');
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
procedure veyb_bashxum;
begin
restorecrtmode;
for i:=1 to 200 do   begin
if trunc(veyb[i]) div 10<1  then write(' ');
if i mod 10=0 then
     begin
        write(veyb[i]:1:3,'');
        writeln;
     end
else
        write(veyb[i]:1:3,'  ');
end;
readln;
minmax(veyb);
readln;
SetGraphMode(GetGraphMode);
end;
procedure logn_bashxum;
begin
restorecrtmode;
for i:=1 to 200 do   begin
if i mod 10=0 then
     begin
        write(logn[i]:5:3,'');
        writeln;

     end
else

        write(logn[i]:5:3,'  ');


end;
readln;

minmax(logn);
readln;
SetGraphMode(GetGraphMode);
end;
procedure dors(x,y:integer;k:byte;str:string);   {nemu}
var i:byte;
nx,ny:integer;
begin
case k of
0:begin
setcolor(8);
setfillstyle(1,8);
setlinestyle(0,0,1);
rectangle(x-110,y-30,x,y+30);
floodfill(x-50,y,8);
rectangle(x,y-30,x+110,y+30);
floodfill(x+50,y,8);
setfillstyle(1,0);
bar(x-107,y-27,x-1,y+27);
bar(x+107,y+27,x+1,y-27);
setcolor(2);
setfillstyle(1,2);
line(x-70,y-27,x-107,y+10);
line(x-32,y-27,x-86,y+27);
line(x-70,y-27,x-32,y-27);
line(x-107,y+10,x-107,y+27);
line(x-107,y+27,x-86,y+27);
floodfill(x-70,y-24,2);
line(x-1,y-18,x-46,y+27);
line(x-1,y-18,x-46,y+27);
line(x-1,y+20,x-8,y+27);
line(x-1,y-18,x-1,y+19);
line(x-46,y+27,x-8,y+27);
floodfill(x-10,y,2);
line(x+46,y-27,x+1,y+18);
line(x+8,y-27,x+1,y-20);
line(x+1,y-19,x+1,y+17);
line(x+46,y-27,x+8,y-27);
floodfill(x+10,y,2);
line(x+32,y+27,x+86,y-27);
line(x+70,y+27,x+107,y-10);
line(x+70,y+27,x+32,y+27);
line(x+107,y-10,x+107,y-27);
line(x+107,y-27,x+86,y-27);
floodfill(x+70,y+24,2);
end;
1:begin
for i:=1 to 4 do
begin
{cleardevice; }
setfillstyle(1,0);
bar(x-200,y-40,x+200,y+40);

i:=i*4;
setcolor(8);
setfillstyle(1,8);
setlinestyle(0,0,1);
rectangle(x-110-5*i,y-30,x-5*i,y+30);
floodfill(x-50-5*i,y,8);
rectangle(x+5*i,y-30,x+110+5*i,y+30);
floodfill(x+50+5*i,y,8);
setfillstyle(1,0);
bar(x-107-5*i,y-27,x-1-5*i,y+27);
bar(x+107+5*i,y+27,x+1+5*i,y-27);
setcolor(2);
setfillstyle(1,2);
line(x-70-5*i,y-27,x-107-5*i,y+10);
line(x-32-5*i,y-27,x-86-5*i,y+27);
line(x-70-5*i,y-27,x-32-5*i,y-27);
line(x-107-5*i,y+10,x-107-5*i,y+27);
line(x-107-5*i,y+27,x-86-5*i,y+27);
floodfill(x-70-5*i,y-24,2);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y+20,x-8-5*i,y+27);
line(x-1-5*i,y-18,x-1-5*i,y+19);
line(x-46-5*i,y+27,x-8-5*i,y+27);
floodfill(x-10-5*i,y,2);
line(x+46+5*i,y-27,x+1+5*i,y+18);
line(x+8+5*i,y-27,x+1+5*i,y-20);
line(x+1+5*i,y-19,x+1+5*i,y+17);
line(x+46+5*i,y-27,x+8+5*i,y-27);
floodfill(x+10+5*i,y,2);
line(x+32+5*i,y+27,x+86+5*i,y-27);
line(x+70+5*i,y+27,x+107+5*i,y-10);
line(x+70+5*i,y+27,x+32+5*i,y+27);
line(x+107+5*i,y-10,x+107+5*i,y-27);
line(x+107+5*i,y-27,x+86+5*i,y-27);
floodfill(x+70+5*i,y+24,2);
setfillstyle(1,8);
bar(x-80,y-25,x+80,y+25);

outtextxy(x-70,y,str);
delay(3000);
i:=i div 4;
end;
end;
2:begin
for i:=4 downto 0 do
begin
{cleardevice; }
setfillstyle(1,0);
bar(x-200,y-40,x+200,y+40);
i:=i*4;
setcolor(8);
setfillstyle(1,8);
setlinestyle(0,0,1);
rectangle(x-110-5*i,y-30,x-5*i,y+30);
floodfill(x-50-5*i,y,8);
rectangle(x+5*i,y-30,x+110+5*i,y+30);
floodfill(x+50+5*i,y,8);
setfillstyle(1,0);
bar(x-107-5*i,y-27,x-1-5*i,y+27);
bar(x+107+5*i,y+27,x+1+5*i,y-27);
setcolor(2);
setfillstyle(1,2);
line(x-70-5*i,y-27,x-107-5*i,y+10);
line(x-32-5*i,y-27,x-86-5*i,y+27);
line(x-70-5*i,y-27,x-32-5*i,y-27);
line(x-107-5*i,y+10,x-107-5*i,y+27);
line(x-107-5*i,y+27,x-86-5*i,y+27);
floodfill(x-70-5*i,y-24,2);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y-18,x-46-5*i,y+27);
line(x-1-5*i,y+20,x-8-5*i,y+27);
line(x-1-5*i,y-18,x-1-5*i,y+19);
line(x-46-5*i,y+27,x-8-5*i,y+27);
floodfill(x-10-5*i,y,2);
line(x+46+5*i,y-27,x+1+5*i,y+18);
line(x+8+5*i,y-27,x+1+5*i,y-20);
line(x+1+5*i,y-19,x+1+5*i,y+17);
line(x+46+5*i,y-27,x+8+5*i,y-27);
floodfill(x+10+5*i,y,2);
line(x+32+5*i,y+27,x+86+5*i,y-27);
line(x+70+5*i,y+27,x+107+5*i,y-10);
line(x+70+5*i,y+27,x+32+5*i,y+27);
line(x+107+5*i,y-10,x+107+5*i,y-27);
line(x+107+5*i,y-27,x+86+5*i,y-27);
floodfill(x+70+5*i,y+24,2);
{setfillstyle(1,0);
bar(x-250,y-40,x-111,y+350);
bar(x+111,y-40,x+250,y+350); }
delay(3000);
i:=i div 4;
end;
end;
end;
end;
Begin
init;
assign(f,'sedrak.dat');
reset(f);
for i:=1 to 200 do
read(f,x[i]);
close(f);

  for i:=1 to 200 do
    begin
     { exp(12.6+1.6*x[i]);}
      veyb[i]:=sqrt((-1/6)*ln(x[i]));
      {logaritmakan normal bashxum}
      logn[i]:=exp(14.4+2.4*x[i]);
    end;
     assign(f1,'patahakan.txt');
  WRFILE(f1,x);
  assign(f2,'veyb.txt');
  WRFILE(f2,veyb);
  assign(f3,'logn.txt');
  WRFILE(f3,logn);
newkey:=1;
oldkey:=0;
repeat
{ dors(320,100,0,'™«‡ο• ‡ολ›χ');   }
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');
repeat
case oldkey of
1:dors(320,100,2,'');
2:dors(320,200,2,'');
3:dors(320,300,2,'');
4:dors(320,400,2,'');
end;
case newkey of
1:dors(320,100,1,'βν« ƒ­™―σ§');
2:dors(320,200,1,' κ‰©ƒ―σ—• ƒ­™―σ§');
3:dors(320,300,1,'–ω….«―ο§— ƒ­™―σ§');
4:dors(320,400,1,'        —χ');
end;
oldkey:=newkey;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:newkey:=newkey-1;
#80:newkey:=newkey+1;
end;
if (newkey=4) and (ch=#13) then halt;
if (newkey=3) and (ch=#13) then begin logn_bashxum;oldkey:=0;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');end;
if (newkey=1) and (ch=#13) then begin pat_bashxum;oldkey:=0;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');end;
if (newkey=2) and (ch=#13) then begin veyb_bashxum;oldkey:=0;
cleardevice;
dors(320,100,0,'');
dors(320,200,0,'');
dors(320,300,0,'');
dors(320,400,0,'');end;
if newkey<1 then newkey:=4;
if newkey>4 then newkey:=1;
delay(5000)
until ch=#27;
until true;

end.