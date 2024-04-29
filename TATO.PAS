program ht_lab_2;
uses crt,graph;
label 1;
type vek=array[1..100] of byte;
var a,b,x,y,z:vek;i,j,an,bn,zn,k,amg:byte;
aa,bb:set of byte;s1:string;ch:char;t,t1,t2:boolean;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]}
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
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]}
procedure asd(x,y:vek;n:byte;var z:vek;var zn:byte);
var i,j:byte;t:boolean;
begin z[1]:=x[1];zn:=1;
for i:=1 to n do begin t:=true;
for j:=1 to zn do begin
if z[j]=x[i] then begin t:=false;break end;
if t=true then begin zn:=zn+1;z[zn]:=x[i] end;
end;end;
for i:=1 to n do begin t:=true;
for j:=1 to zn do begin
if z[j]=y[i] then begin t:=false;break end;
if t=true then begin zn:=zn+1;z[zn]:=y[i] end;
end;end;
end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure andr(x,y,z:vek;n,zn:byte;var t:boolean);{Andradarceliutjun}
var i,j:byte;zt:boolean;
begin t:=true;
for i:=1 to zn do begin
zt:=false;
for j:=1 to n do
if (z[j]=x[i]) and (z[j]=y[i]) then begin zt:=true;break end;
if zt=true then continue
else begin t:=false;break;end;
end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure hamat(x,y:vek;n:byte;var t:boolean);{Hamatexeli}
var zt:boolean;i,j:byte;
begin t:=true;
for i:=1 to n do begin
zt:=false;
for j:=1 to n do
if (x[i]=y[j]) and (y[i]=x[j]) then begin zt:=true;break end;
if zt=true then continue
else begin t:=false;break;end;
end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure poxan(x,y,z:vek;n,zn:byte;var t:boolean);{poxanceliutjun}
var i,j,k:byte;t1,t2:boolean;
begin t:=true;
for i:=1 to zn do begin t1:=true;
for j:=1 to zn do begin t2:=false;
for k:=1 to n do
if (x[k]=z[i]) and (y[k]=z[j]) then begin t2:=true;break;end;
if t2=true then continue
else begin t1:=false;break;end;
end;
if t1=true then continue
else begin t:=false;break;end;
end;
end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure functia(x:vek;n:byte;var t:boolean);{Function}
var i,j,k:byte;
begin  t:=true;
for i:=1 to n do  begin  k:=0;
for j:=1 to n do if x[i]=x[j] then k:=k+1;
if k>1 then begin t:=false;break;end;
end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure arta(x,z:vek;n,zn:byte;var t:boolean);{Artapatkerum}
var i,j:byte;t1:boolean;
begin t:=true;
if zn<>n then t:=false
else begin
for i:=1 to zn do begin t1:=false;
for j:=1 to n do if z[i]=x[j] then begin t1:=true;break;end;
if t1=true then continue
else begin t:=false;break;end;
end;end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure vrad(x,z:vek;n,zn:byte;var t:boolean);{Veradrumrum}
var i,j:byte;t1:boolean;
begin t:=true;
if zn<>n then t:=false
else begin
for i:=1 to zn do begin t1:=false;
for j:=1 to n do if z[i]=x[j] then begin t1:=true;break;end;
if t1=true then continue
else begin t:=false;break;end;
end;end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
procedure verad(x,z:vek;n,zn:byte;var t:boolean);{Veradrumrum}
var i,j:byte;t1:boolean;
begin t:=true;
if zn<>n then t:=false
else begin
for i:=1 to zn do begin t1:=false;
for j:=1 to n do if z[i]=x[j] then begin t1:=true;break;end;
if t1=true then continue
else begin t:=false;break;end;
end;end;end;
{[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]}
begin
init;randomize;
restorecrtmode;
textbackground(15);textcolor(0);clrscr;gotoxy(15,1);
write('Mutqagrel erktox axjusaki erkarutjun@:>');
gotoxy(54,1);read(amg);
clrscr;gotoxy(13,1);
write('A bazmutjan erkarutjun@:>');read(an);aa:=[];bb:=[];
for i:=1 to an do begin
gotoxy(10,1+i);write('A[',i,']=');read(a[i]);aa:=aa+[a[i]];end;
gotoxy(53,1);write('B bazmutjan erkarutjun@:>');read(bn);
for i:=1 to bn do begin
gotoxy(50,1+i);write('B[',i,']=');read(B[i]);bb:=bb+[b[i]];end;
delay(60000);delay(60000);delay(60000);
setgraphmode(getgraphmode);setbkcolor(0);setcolor(15);
settextstyle(2,0,4);
1:j:=1;;cleardevice;line(80,1,640,1);
for i:=1 to 2 do line(1,22*i,640,22*i);
for i:=1 to 7 do line(80*i,1,80*i,43);
outtextxy(85,5,'Andradarceli');outtextxy(170,5,'Hamatexeli');
outtextxy(255,5,'Poxanceli');outtextxy(340,5,'Funckcia');
outtextxy(406,5,'Artapatkerum');outtextxy(500,5,'Vradrum');
outtextxy(575,5,'Veradrum');
Settextstyle(2,0,4);Setcolor(white);
{[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]}
repeat
s1:='';
for i:=1 to amg do begin
repeat
k:=random(9);
until k in aa;
x[i]:=k;
if i=amg then s1:=s1+chr(ord(48+k))
else s1:=s1+chr(ord(48+k))+' '
end;
outtextxy(1,(j+1)*10+j,s1);
{[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]}
s1:='';
for i:=1 to amg do begin
repeat
k:=random(9);
until k in bb;
y[i]:=k;
if i=amg then s1:=s1+chr(ord(48+k))
else s1:=s1+chr(ord(48+k))+' '
end;
outtextxy(1,(j+2)*10+j,s1);
andr(x,y,A,amg,an,t);
if t=true then outtextxy(110,15+j*11,'+')
else outtextxy(110,15+j*11,'-');
hamat(x,y,amg,t);
if t=true then outtextxy(200,15+j*11,'+')
else outtextxy(200,15+j*11,'-');
asd(x,y,amg,z,zn);
poxan(x,y,z,amg,zn,t);
if t=true then outtextxy(285,15+j*11,'+')
else outtextxy(285,15+j*11,'-');
functia(x,amg,t);
if t=true then outtextxy(370,15+j*11,'+')
else outtextxy(370,15+j*11,'-');
arta(x,A,amg,an,t);
if t=true then begin outtextxy(445,15+j*11,'+');t1:=true;end
else outtextxy(445,15+j*11,'-');
vrad(Y,B,amg,bn,t);
if t=true then begin outtextxy(520,15+j*11,'+');t2:=true;end
else outtextxy(520,15+j*11,'-');
if (t1=true) and (t2=true) then outtextxy(605,15+j*11,'+')
else outtextxy(605,15+j*11,'-');
j:=j+2;
until j=3;
{[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]}
repeat
ch:=readkey;
until (ch=#27) or (ch=#13);
if ch=#13 then goto 1;
end.







