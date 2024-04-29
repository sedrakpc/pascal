Uses graph,crt;
{-----------------------------------------}
Type vector=array[1..100]of integer;
type vec=array[1..100]of char;
var  x,y,r,e,m1,ex,cv,d,ey,m,x1,y1,u,x2,y2,t,n,i,j,k,dr:integer;
     q,g,kl,lk,pl:vector;p,s,s1,s2,s3,z:string;x9:vec; b,xz,c:char;
{------------------------------------}
procedure menu;
begin
 detectgraph(dr,m);initgraph(dr,m,'c:\bp\bgi');
k:=graphresult;grapherrormsg(k);if k<>0 then begin
write(grapherrormsg(k)); halt end;

setbkcolor(1);cleardevice;
setfillstyle(1,4);
textcolor(6);

rectangle(240,30,400,80);
floodfill(245,35,15);

rectangle(240,120,400,170);
floodfill(245,125,15);

rectangle(240,210,400,260);
floodfill(245,215,15);

outtextxy(300,50,'Game');
outtextxy(300,140,'About');
outtextxy(304,230,'Exit');
end ;
{------------------------------------------}
procedure car(x3,y3:integer);
begin
setlinestyle(0,0,1);
setcolor(9);
setfillstyle(1,4);

rectangle(x3,y3-4,x3+170,y3+55);
rectangle(x3+2,y3-2,x3+168,y3+53);
floodfill(x3+1,y3-3,9);
end;
{-----------------------------------------}
procedure enter;
begin
     setbkcolor(blue);
     textcolor(yellow);
     x1:=34;
     y1:=37;
     x2:=598;
     y2:=420;
     write('The number of Circles-':45);readln(n);
     if n>9 then
     begin
     writeln;
     writeln('Its very hard for you':48);
     writeln('Hl@ tapov Esc exi stuc':48);end
     else begin
     write('Playar 1 - ');readln(s);
     write('Player 2 - ');readln(z);end;
     readln;
     p:=s;
end;
{-----------------------------------------}
procedure point(b:char);
begin
   if (ex=g[i]*10+5)and(ey=q[i]*10+5) then
      begin
          if (ord(c)=ord(b))then
            begin
               outtextxy(g[i]*10+2,q[i]*10+2,b);
               k:=k+1;
            end
          else
               begin
               outtextxy(g[i]*10+2,q[i]*10+2,c);
               kl[u]:=g[i]*10+5;
               lk[u]:=q[i]*10+5;
               pl[u]:=i;
               u:=u+1;
               end;
      end;
end;
{------------------------------------------}
procedure error;
begin
          setcolor(3);
     for i:=1 to u-1 do
      begin
       {if (q[i]<>0) then
        begin  }
           str(pl[i],s1);
           outtextxy(kl[i]-3,lk[i]-13,s1);
           delay(65000);delay(65000);end
           {else begin
           str(pl[i],s1);
           outtextxy(kl[i]-3,lk[i]+13,s1);
           delay(65000);delay(65000);end;
      end;                               }
end;
{------------------------------------------}
procedure ord;
begin
      c:=readkey;
 for i:=1 to n do
     point(x9[i]);
end;
{------------------------------------------}
procedure circl;
begin
      for i:= 1 to n do
          begin
          sound(700);delay(1000);nosound;
          circle(g[i]*10+5,q[i]*10+5,5);
          delay(65500);delay(65000);
           end;
end;
{----------------------------------------}
procedure about;
begin
repeat
begin
     cleardevice;
     directvideo:=false;
     x:=detect;
     initgraph(x,y,'');
     e:=graphresult;
if   e<>grok then
     writeln(grapherrormsg(e))
     else
begin
     directvideo:=false;
     x:=detect;
     initgraph(x,y,' ');
     setbkcolor(blue);
     outtextxy(200,200,'Put your advertisement hear');
     outtextxy(410,420,'E-mail:Troyan@freenet.am');
     outtextxy(465,430,'Arsen Hakobyan');
     outtextxy(220,460,'All Rights Reserved');
     end;
     c:=readkey;
end until c=#27;
end;
{----------------------------------------}
procedure allcirkles;
begin
    for i:= 1 to n do
        begin
         setcolor(15);
         circle(g[i]*10+5,q[i]*10+5,5);
        end;
end;
{----------------------------------------------}
procedure cur(x3,y3:integer;guyn:integer);
begin
setlinestyle(0,0,1);
setcolor(guyn);
setfillstyle(1,12);
circle(x3,y3,5);
end;
{---------------------------------------------}
procedure game;
BEGIN
repeat
begin
     closegraph;
     directvideo:=false;
     x:=detect;
     initgraph(x,y,'');
     e:=graphresult;
if   e<>grok then
     writeln(grapherrormsg(e))
     else
begin

     enter;

     if n>9 then break;

for j:=1 to 2 do
     begin
     directvideo:=false;
     x:=detect;
     initgraph(x,y,' ');
     setbkcolor(blue);
     u:=1;
     writeln(P:40);
     setcolor(14);
     setfillstyle(1,8);
     rectangle(30,35,600,420);
     floodfill(29,34,14);
     setviewport(x1,y1,x2,y2,clipon);
     setcolor(white);
     cv:=k;
     k:=0;
        x9[1]:='1';x9[2]:='2';x9[3]:='3';
        x9[4]:='4';x9[5]:='5';x9[6]:='6';
        x9[7]:='7';x9[8]:='8';x9[9]:='9';

           c:=readkey;
    randomize;
      for i:=1 to n do
         begin
          g[i]:=random(57-1);
          q[i]:=random(36-1);
         end;

          circl;p:=z;
 ex:=5;ey:=5;
 cur(ex,ey,12);
repeat
 begin
 repeat
     c:=readkey;
case c of
#72:begin if ey>5then begin
    cur(ex,ey,16);allcirkles;ey:=ey-10;cur(ex,ey,12);end;end;
#80:begin if ey<370 then begin
    cur(ex,ey,16);allcirkles;ey:=ey+10;cur(ex,ey,12);end;end;
#75:begin if ex>5 then begin
    cur(ex,ey,16);allcirkles;ex:=ex-10;cur(ex,ey,12);end;end;
#77:begin if ex<550 then begin
    cur(ex,ey,16);allcirkles;ex:=ex+10;cur(ex,ey,12);end;end;
 end
until c=#13;
      ord;
end;
until c=#32;
      error;delay(65000);delay(65000);delay(65000);
end
end;
repeat
c:=readkey;
begin
    cleardevice;
    directvideo:=false;
    x:=detect;
    initgraph(x,y,' ');
    setbkcolor(blue);
  if cv<k then
     begin
      str(k,s1);str(cv,s2);
         str(n,s3);
         outtextxy(20,20,'The number of circles =');
         outtextxy(205,20,s3);
         outtextxy(150,100,'C O N G R A T U L A T I O N S');
         outtextxy(160,130,z);
         outtextxy(250,130,'You are a winner !');
         outtextxy(250,160,'Your result is-');
         outtextxy(385,160,s1);
         outtextxy(150,330,'Y O U    L O S E !');
         outtextxy(160,380,s);
         outtextxy(255,380,'Your result is-');
         outtextxy(385,380,s2);
       end;
      if cv>k then
        begin
         str(cv,s1);
         str(k,s2);
         str(n,s3);
         outtextxy(20,20,'The number of circles =');
         outtextxy(205,20,s3);
         outtextxy(150,100,'C O N G R A T U L A T I O N S ! ! !');
         outtextxy(160,180,s);
         outtextxy(250,180,'you are a winner !');
         outtextxy(250,200,'your result is-');
         outtextxy(385,200,s1);
         outtextxy(150,330,'Y O U    L O S E  ');
         outtextxy(160,380,z);
         outtextxy(255,380,'your result is-');
         outtextxy(385,380,s2);
        end;
     if cv=k then
      begin
        str(cv,s1);
        str(n,s3);
        outtextxy(20,20,'The number of circles =');
        outtextxy(205,20,s3);
        outtextxy(250,250,'We have no winner');
        outtextxy(255,310,'Your result is-');
        outtextxy(380,310,s1);
      end;
end
   until c=#27;
end; until c=#27;
end;
{--------------------------------------------}
BEGIN
 d:=detect;
     InitGraph(d,m,'');
     e:=graphresult;
     if e<>grOK then
        writeln(grapherrormsg(e))
        else
            begin

            ex:=235;ey:=120;
            menu;
car(ex,ey);
repeat
      c:=readkey;
case c of
#72:
begin
 if ey>30 then
  begin
     ey:=ey-90;
     setfillstyle(1,1);
     floodfill(ex,40,15);
     floodfill(ex,130,15);
     floodfill(ex,220,15);
     floodfill(ex,310,15);
     car(ex,ey);
    if ey=30 then car(ex,ey);
      sound(450);delay(1000);nosound;
   end;
       xz:=readkey;
if xz=#13 then begin sound(450);delay(1000);nosound;

case ey of
30:begin
     game;
     ex:=235;ey:=120;
     menu;
   end;
120: begin
     about;
     menu;
     end;
210: c:=#1032;
end;end;end;
#80:
begin if ey<150 then
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
30:begin
       game;
       ex:=235;ey:=120;
       menu;
   end;
120:begin
     about;
     menu;
     end;
210:c:=#1032;
end end end end
until c=#1032; closegraph;
end;
end.