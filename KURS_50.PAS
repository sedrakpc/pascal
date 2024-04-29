program kurs;
uses graph, crt;
{-----------------------------------------}
var
  v,l,xz,c:char;
  ex,ey,k,m,dr:integer;

{------------------------------------}
procedure kanc;
begin
 detectgraph(dr,m);initgraph(dr,m,'c:\bp\bgi');
k:=graphresult;grapherrormsg(k);if k<>0 then begin
write(grapherrormsg(k)); halt end;
{--------------------------------------}
setbkcolor(1);cleardevice;
setfillstyle(1,4);
textcolor(6);

rectangle(240,30,400,80);
floodfill(245,35,15);
{-----------------------------}
rectangle(240,120,400,170);
floodfill(245,125,15);
{-----------------------------}
rectangle(240,210,400,260);
floodfill(245,215,15);
{------------------------------}
rectangle(240,300,400,350);
floodfill(245,345,15);

outtextxy(277,50,'«‡ο• ν‰χιν');
outtextxy(280,140,' –―σ›―σ§');
outtextxy(305,320,'—χ');
outtextxy(309,230,'£');
end ;
{------------------------------------------}

procedure car(x3,y3:integer);
begin

setlinestyle(0,0,1);
setcolor(9);
setfillstyle(1,12);

rectangle(x3,y3-4,x3+170,y3+55);
rectangle(x3+2,y3-2,x3+168,y3+53);
floodfill(x3+1,y3-3,9);
end;
{-----------------------------------------}

procedure text;
begin
closegraph;
textmode(co80);
textbackground(1);clrscr;
textcolor(13);
textbackground(4);
window(5,3,75,23);
clrscr;


gotoxy(28,2);
write('«‡ο•  ν‰χιν');

textcolor(13);
gotoxy(13,5);
write(' μολ›  n §ƒ―£ε ‘•λ σ nx2n νοο γο―σ«―£ §νο•ρ:');
gotoxy(11,6);
write('‹§‰— ƒ—―-ι™‰§ σ ›ο…•ο,―ο― ΅‰λυ―™• ©«γ‰ι ―ο,');
gotoxy(11,7);
write('§νο•ρ• ηε•« ι©―σ« ‡ιλ―ολ› —•«• ¥§« ο…―λ ');
gotoxy(11,10);
write('1 ‹§‰— ‰«‘›ο…•ο, ―ο ―ο―­―σ§  b λ‰ν―ο• υ―χο…―σ©«');
gotoxy(11,11);
write('νοο• §ο:');
gotoxy(11,13);
write('2 ‹§‰— ‰«‘›ο…•ο, ―ο υ―™• §νο•ρ• l-ο‡ σ k-ο‡ ν―£‰ο');
end;

{-----------------------------------------------------}
{=====================================================}
procedure inter;
 type masiv=array[1..10,1..10] of real;
     vec=array[1..10] of real;
 var s:string;
     ch2:char;
     n,m,i,j,q,minn,k:byte;
     code:integer;
     a:masiv;
     t:boolean;
     w:real;
     b:vec;
     f:file of real;
 function min(b1:vec;n1:byte):byte;
var i1,k1:byte;
    m1:real;
begin
m1:=b1[1];k1:=1;
for i1:=1 to n1 do
if (b1[i1]<m1) then begin m1:=b1[i1];k1:=i1;end;
min:=k1;
end;
procedure pox(var a2:masiv;n2,c2,d2:byte);
var j2:byte;
    k2:real;
begin
for j2:=1 to n2 do begin
k2:=a2[c2,j2];
a2[c2,j2]:=a2[d2,j2];
a2[d2,j2]:=k2;
end;
end;
Begin
setcolor(15);
setbkcolor(1);
repeat
cleardevice;
outtextxy(190,10,'ª‰ο§―σ›‰— §νο•ρ• αυ(1<n<6)');
outtextxy(295,20,'n=');
s:='';
repeat
repeat
outtextxy(313,20,s);
ch2:=readkey;
until(ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,n,code);
if code<>0 then n:=0;
until (n>1) and (n<6);
m:=2*n;
setfillstyle(1,10);

bar(320-m*30,140-n*20,320+m*30,140+n*20);
for i:=1 to n do
for j:=1 to m do begin
s:='';
repeat
setcolor(10);
outtextxy(328-m*30+(j-1)*55,165-n*25+(n-1)*6+(i-1)*30,s);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
t:=false;
s:='';
repeat
repeat
setcolor(4);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51)
or (ch2=#52) or (ch2=#53)or (ch2=#54) or (ch2=#55) or
(ch2=#56) or (ch2=#57) or(ch2=#46) or (ch2=#45) or(ch2=#13);
if (copy(s,1,1)='-')  then q:=6 else q:=5;
if length(s)<q then begin
if ch2<>#13 then s:=s+ch2 end
until (ch2=#13);
if pos(s,'-')<>0 then t:=false
else
begin
if (((copy(s,1,2)='-0') and (length(s)=2))
or ((copy(s,1,2)='-0') and (copy(s,3,1)<>'.'))
or ((copy(s,1,2)='-0') and (copy(s,length(s),1)='0')))
then t:=false
else begin
if (copy(s,1,1)='0') and (length(s)=1) then begin
val(s,w,code);t:=true end else begin
if (
((copy(s,1,1)='0') and (copy(s,2,1)<>'.')) or
((copy(s,1,1)='0') and (copy(s,length(s),1)='0'))
or (copy(s,length(s),1)='.'))
then t:=false
else begin
if (copy(s,1,1)='.') or (copy(s,1,2)='-.') then t:=false
else   begin
val(s,w,code);
if code<>0 then begin
if copy(s,1,1)<>'-' then t:=false;
if code=0 then begin
t:=true;w:=(-1)*w
end
end
else t:=true;
end
end
end
end
end;
if ((copy(s,1,1)<>'0') and (pos('.',s)>0) and (copy(s,length(s),1)='0'))
then t:=false
until t=true;


setcolor(14);
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
a[i,j]:=w;
end;

setcolor(4);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Mno.dat ϋ©—―σ§ γ‰—―σ  §ο');
readln;
assign(f,'Mno.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
bar(328-m*30+5+(j-1)*55-5,160-n*25+5+(n-1)*6+(i-1)*30-5,
328-m*30+5+(j-1)*55+50,160-n*25+5+(n-1)*6+(i-1)*30+10);
delay(6000);
delay(6000);
end;
close(f);
setcolor(0);
outtextxy(50,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο Mno.dat ϋ©—―σ§ γ‰—―σ  §ο');

setcolor(4);
outtextxy(80,250,'θ‰£§•ο <Enter> §νο•ρ• νοο‰ο λ‰ο«‘‰ορ‰—―σ  §ο');
readln;
reset(f);
setcolor(14);
for i:=1 to n do
for j:=1 to m do begin
read(f,w);
a[i,j]:=w;
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
outtextxy(328-m*30+5+(j-1)*55+2,160-n*25+5+(n-1)*6+(i-1)*30+1,s);
end;
{------------------------------------}

for i:=1 to n do b[i]:=a[i,1];
for i:=1 to n-1 do
for j:=1 to n-1 do
if b[j]<b[j+1] then begin w:=b[j];b[j]:=b[j+1];b[j+1]:=w;end;
for i:=1 to n do  begin
minn:=min(b,n+1-i);
for j:=1 to n do
if a[j,1]=b[minn] then begin k:=j;break;end;
pox(a,2*n,i,k);
end;
{------------------------------------}
setfillstyle(1,7);
bar(320-(m)*30,380-(n)*20,320+(m)*30,380+(n)*20);
for i:=1 to n do
for j:=1 to m do begin
str(a[i,j]:5:3,s);
repeat
t:=true;
if   ((pos('.',s)>0) and ( copy(s,length(s),1)='0'))
then begin delete(s,length(s),1);t:=false;end
until t=true;
if pos('.',s)=length(s) then delete(s,length(s),1);
repeat
t:=true;
if  ((pos('.',s)=0) and ( copy(s,1,1)='0') and (length(s)>1))
then begin delete(s,1,1);t:=false;end
until t=true;
setcolor(15);
outtextxy(290-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;

    repeat until readkey=#27;
   end;
{=====================================================}
{-----------------------------------------------------}
{=====================================================}
procedure xax;
var size,l,y,d,m,e,i,n,a,code,z,h,p,k,time:integer;
x:array[0..25] of char;
dd,c:char;
s1,s:string;
saucer:pointer;
t:boolean;
{\\\\--------------------/////}
procedure Tar(b:char);
begin

            randomize;
            a:=random(500);
            outtextXY(a,y,b);
            size:=imagesize(a,y,a+55,y+55);
            getMem(saucer,size);

            getImage(a,y,a+55,y+55,saucer^);
            putimage(a,y,saucer^,xorput);
            repeat
            putimage(a,y,saucer^,xorPut);
            Delay(time);
            putImage(a,y,saucer^,xorput);
            y:=y+5;
            t:=false;

            if keypressed then
            begin
                 c:=readkey;
                 if c=#27 then  break;
                 if c=#32 then
                              begin
                                   settextstyle(5,0,4);
                                   outtextxy(250,150,'PAUSE');
                                   dd:=readkey;
                                   setcolor(1);
                                   outtextxy(250,150,'PAUSE');
                                   setcolor(yellow);
                                   settextstyle(8,0,2);
                              end;
                 if (ord(c)=ord(b)) or (ord(c)=ord(b)+32)
                 then  begin
                            l:=l+1;
                            t:=true;

                           if m>10 then
                         begin
                             m:=1;
                             z:=z+1;
                             time:=time-500;
                         end;
                     settextstyle(8,0,2);
                     outtextxy(28*m,265+59*z,b);
                     m:=m+1;
                     settextstyle(8,0,5);
                     sound(700);delay(1000);NoSound;
                     break;
                       end;

            end;

            until y>250;
            y:=10;
            if t=false
                      then
                          begin
                               if h>10 then
                                       begin
                                           h:=1;
                                           p:=p+1
                                       end;
                                           settextstyle(8,0,2);
                                           outtextxy(28*h+318,265+59*p,b);
                                           h:=h+1;
                                           settextstyle(8,0,5);
                                           sound(150);delay(1000);NoSound;
                                           k:=k+1;
                          end;


            end;


BEGIN
     d:=detect;
     InitGraph(d,m,'');
     e:=graphresult;
     if e<>grOK then
        writeln(grapherrormsg(e))
        else
            begin
                   x[0]:='A'; x[1]:='B'; x[2]:='C'; x[3]:='D'; x[4]:='E';
                   x[5]:='F'; x[6]:='G'; x[7]:='H'; x[8]:='I'; x[9]:='J';
                   x[10]:='K';x[11]:='L';x[12]:='M';X[13]:='N';X[14]:='O';
                   X[15]:='P';X[16]:='Q';x[17]:='R';x[18]:='S';x[19]:='T';
                   x[20]:='U';x[21]:='V';x[22]:='W';x[23]:='X';x[24]:='Y';
                   x[25]:='Z';


                   y:=10;  l:=0;k:=0;
                   setbkcolor(1);
                   {----------------------------}
                   setcolor(red);
                   settextstyle(0,0,2);
                   outtextxy(138,285,'TRUE');
                   outtextxy(430,285,'FALSE');

                   {----------------------------}
                   setlinestyle(0,0,1);
                   settextstyle(8,0,5);
                   setcolor(yellow);

                   rectangle(0,300,637,478);
                   setfillstyle(1,19);
                   line(318,300,318,478);
                   floodfill(100,450,yellow);
                   setfillstyle(1,19);
                   floodfill(500,450,yellow);

                 c:=readkey;
                   m:=1;z:=1;h:=1;p:=1;t:=false;time:=1400;
                 for i:=0 to 29 do
                 begin
                 e:=random(26);
                 Tar(x[e]);
                 if c=#27 then break;
                 end;
               str(l,s);

               str(k,s1);

            outtextxy(490,235,s1);
            outtextxy(100,235,s);
            outtextxy(70,150,'press any key to EXIT');
            sound(1500);delay(20000);nosound;
            if l=30 then
            begin
            setcolor(red);
            settextstyle(7,0,5);
            outtextxy(90,50,'CONGRATULATIONS')
            end;
            c:=readkey;
            closegraph;
            end
END;



{=====================================================}

BEGIN

ex:=235;ey:=30;
kanc;

{--------------------------------}
car(ex,ey);
repeat
c:=readkey;
case c of

#72:
begin if ey>30 then
begin
ey:=ey-90;
setfillstyle(1,1);
floodfill(ex,40,15);
floodfill(ex,130,15);
floodfill(ex,220,15);
floodfill(ex,310,15);
car(ex,ey);if ey=30 then car(ex,ey);
sound(450);delay(1000);nosound;end;
xz:=readkey;
if xz=#13 then begin sound(450);delay(1000);nosound;

case ey of
30: begin repeat text;xz:=readkey until xz=#27;if xz=#27 then

         kanc end;
120: begin
     inter;
     kanc
     end;

210:begin
         xax;
    kanc;
    end;
300: c:=#1032;

end

end;
end;

#80:
begin if ey<220 then
begin
ey:=ey+90;
setfillstyle(1,1);
floodfill(ex,40,15);
floodfill(ex,130,15);
floodfill(ex,220,15);
floodfill(ex,310,15);
car(ex,ey);
if ey=310 then car(ex,ey);
sound(450);delay(1000);nosound;
xz:=readkey;
if xz=#13 then
case ey of
30: begin repeat  text;xz:=readkey until xz=#27;if xz=#27 then

         kanc  end;
120: begin
     inter;
         kanc
     end;

210: begin xax;
         kanc
     end;
300: c:=#1032;
end
end
end
end
until c=#1032; closegraph   end.
