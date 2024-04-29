uses graph,crt;
var
   grdriver:integer;
   grmode:integer;
   errcode:integer;
   i,j,v,e,r:integer;
{----------------------------------------}
N2,N3,N5,N4,N,N1,N6,N7,i1,j1:integer;  ug:real;
     ch:char;

{----------------------------------------}
    Key              : Char;
    Font             : String; {SHRIVTNERI ANVANUM@ }
    Size, MyFont     : Word;
{----------------------------------------}
procedure tiko;
type masiv=array[1..20,1..20] of integer;
     vec=array[1..20] of integer;
var n,m,i,j,l,k,t:byte;
    a:masiv;
    min,max,s:integer;
    b:vec;
procedure proc(a2:masiv;n2,m2:byte;c2:integer;var l2:byte);
var i2,j2:byte;
begin
for i2:=1 to n2 do
for j2:=1 to m2 do
if a2[i2,j2]=c2 then begin l2:=j2;break;end;
end;
function func(b1:vec;m1:byte;a1:integer):byte;
var k1,i1:byte;
begin
k1:=0;
for i1:=1 to m1 do
if b1[i1] = a1 then k1:=k1+1;
func:=k1;
end;
begin
write('n=');read(n);
write('m=');read(m);
for i:=1 to n do
for j:=1 to m do
begin
write('a[',i,',',j,']=');readln(a[i,j]);end;
min:=a[1,1];
for i:=1 to n do
for j:=1 to m do
if a[i,j]<min then min:=a[i,j];
max:=a[1,1];
for i:=1 to n do
for j:=1 to m do
if a[i,j]>max then max:=a[i,j];
writeln('min=',min);
writeln('max=',max);
for j:=1 to m do begin
for i:=1 to n do b[i]:=a[i,j];
l:=func(b,n,min);
if l=1 then k:=j;
end;

proc(a,n,m,max,t);
writeln('k=',k);
writeln('t=',t);   
for i:=1 to  n do begin
s:=a[i,k];
a[i,k]:=a[i,t];
a[i,t]:=s;
end;
for i:=1 to n do
for j:=1 to m do
writeln(a[i,j]);
readln;
end;

begin
   e:=0;
   grdriver:=detect;
   initgraph(grdriver,grmode,'c:\tp\bgi');
   errcode:=graphresult;
   if errcode=grok then
      begin
   i:=240; j:=215;
   settextstyle(7,0,5);
   v:=1050;
{---------------------------------------------------------}
 {     begin  randomize;N5:=detect; N6:=N2 div 2; N7:=N3 div 2;
{ InitGraph(N5,N4,'z:\tp7\bgi'); }
 N2:=GetMaxX; N3:=GetMaxY;
 Repeat
 Until Keypressed; ch:=ReadKey;

 N1:=N2 div 7;
 for i1:=1 to N2 do begin
 j1:=i1 div N1+9; BEGIN
 SOUND(1000);
 DELAY(500);
 SOUND(1000);
 DELAY(50);   NOSOUND;
 END;
setcolor(j1);Line(i1,0,i1,N3);end;  ch:=ReadKey;


        Cleardevice;

  SetBkColor(4); {èçìåíåíèå öâåòà ôîíà }
                setcolor(15);

      SetTextStyle(DefaultFont, HorizDir, 1);
      SetTextStyle(DefaultFont, HorizDir, 9);
      OutTextXY(80, 120, '„¨®ò¦î”');
     repeat
      setcolor(random(10));
      settextstyle(8,0,3);
      OutTextXY(240, 400, 'èˆ˜¦ˆ– ð€ªœ€ð€š èìˆ¢');
      sound(v);
      v:=v-70*20;
      sound(random(v));
      delay(5400);
      nosound;
     until keypressed;
      settextstyle(0,0,0);
      cleardevice;
      setbkcolor(1);

      setfillstyle(solidfill,green);
      bar(100,100,540,380);
      setcolor(red);
      outtextxy(270,200,'ð€ªö');
      settextstyle(7,0,3);
      outtextxy(250,50,'œ®òîè€¨”ª €¬˜€ì€ªö');
      settextstyle(0,0,0);
    repeat
      setcolor(black);
      rectangle(i,j,i+160,j+15);
      outtextxy(250,220,'˜ª†î” †îê€ðö');
      outtextxy(250,250,'†ˆâ” „î€ú”œ€');
      outtextxy(250,235,'˜ª†î” –®òš®ò¦');
      outtextxy(250,265,'†®òîè „€–');
    case readkey of
     #80:
  begin
       setcolor(green);
       rectangle(i,j,i+160,j+15);
       j:=j+15;
       if j=275 then j:=215;
       setcolor(black);
       rectangle(i,j,i+160,j+15);
  end;
     #72:
     begin
       setcolor(green);
       rectangle(i,j,i+160,j+15);
       j:=j-15;
       if j=200 then j:=260;
       setcolor(black);
       rectangle(i,j,i+160,j+15);
     end;


     end;
    until readkey=#13;

 begin
     cleardevice;          setcolor(6);
  if j=215 then
   readln;
 end;
      begin    cleardevice;    setcolor(6);
         if j=230 then
          outtextxy(10,10,'ggg');    readln ;
      end;
       begin    cleardevice;    setcolor(6);
         if j=245 then
          outtextxy(10,10,'hsmik');    readln ;
      end;
   end;
  end.