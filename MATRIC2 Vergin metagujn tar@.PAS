Program  Matric2;
Uses Crt,GRAPH;
type mat=array[1..8,1..8] of real;
     vec=array[1..8] of real;
VAR s:string; f:file of real;
   k,n,y1,l,mm,d,m,i:integer; h,bb:real;
   x:mat; c:vec; b:vec;
   y,z,x1:Integer;
   ss,sss,dd:pointer;
   q:Char;
Procedure vam(s1:string;var x1:real;var k1:integer);
Begin
k1:=0;
val(s1,x1,k1);
if length(s)>5 then k1:=1;
if (x1=0) and (length(s1)<>1) then k1:=1;
if pos('.',s1)=1 then k1:=1;
if (pos('.',s1)=2)and(pos('+',s1)=1) then k1:=1;
if pos('+',s1)=1 then k1:=1;
if (pos('-',s1)=1) and (x1=0) then k1:=1;
if (pos('.',s1)=2) and (pos('-',s1)=1) then k1:=1;
if (pos('0',s1)=1)and (x1<>0) and(pos('.',s1)=0) then k1:=1;
if (x1<0)and(pos('0',s1)=2)and (x1<>0) and(pos('.',s1)=0) then k1:=1;
if (x1<0) and (length(copy(s1,1,(pos('.',s1)-1)))>2)and(pos('.',s1)<>0)
then k1:=1;
if (x1>0) and (length(copy(s1,1,(pos('.',s1)-1)))>1)and(pos('.',s1)<>0)
then k1:=1;
if (frac(x1)=0)and(pos('.',s1)<>0) then k1:=1;
if length(s1)>7 then k1:=1;
if (pos('e',s1)<>0)or (pos('E',s1)<>0) then k1:=1;
end;
Procedure Qanak(n1:integer; c1:vec; var k1:integer);
 var i1:integer;
Begin
      k1:=0;
       For i1:=1 to n1 do
        if C1[i1]>0 then k1:=k1+1;  end;
Procedure Drakan(n2:integer; x2:vec; VAR b2:REAL);
 var i2:integer;
Begin
  For i2:=N2 DownTo 1 do
   IF x2[i2]>0 then BEGIN  b2:=x2[i2]; Break  END end;
Procedure xndir;
var k,i,j,n:integer;
Begin
setbkcolor(2); cleardevice;
repeat
outtextxy(110,20,'™âÔßØÛõâó n-è Å©´„âÈ, ØÔ 2<=n=<6');
outtextxy(255,50,'n=');
TextColor(15);
gotoxy(35,4);
setfillstyle(1,2);
floodfill(51,3,15);
readln(s);val(s,n,y1);
if (n<=2) or (n>=7) or(y1<>0)
then begin
textbackground(2);
clrscr; cleardevice end;
until (n>=2)and(n<7);
setbkcolor(2);
cleardevice;
setcolor(15);   s:='n='+s;  outtextxy(300,20,s);
For i:=1 to n do
repeat
For j:=1 to n do
Repeat
Gotoxy(37,5);
Setcolor(2);setfillstyle(1,2);
Bar(0,62,640,100); Setcolor(15);
Readln(s);
vam(s,x[i,j],y1);
IF y1<>1 then
Begin
outtextxy(240-40*n+78*j,75+50*i,s)
end;
until y1=0;
For j:=1 to n do
c[j]:=x[i,j];
qanak(n,c,k);
IF k=0 then
  Begin setfillstyle(1,2); bar(0,55+50*i,640,95+50*i) end;
until k>0;
For i:=1 to n do  begin
 For j:=1 to n do c[j]:=x[i,j]; drakan(n,c,b[i]);
 end;
setcolor(15);
For i:=1 to n do
Begin
IF frac(b[i])=0 then str(b[i]:7:0,s) else str(b[i]:7:2,s);
{circle(240-40*n+80*i,400,20);}
SetColor(4);
Outtextxy(240-40*n+65*i,405,s); Delay(6000);
SetColor(15);
end; readkey; end;
 BEGIN
  DetectGRAPH(D,M);
  InitGRAPH(D,M,'');
IF  Graphresult<>GROK  THEN
Begin
  Write('No Graph');
    readln; HALT
End;Xndir;
CloseGRAPH;
END.