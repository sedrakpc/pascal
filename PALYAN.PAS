uses crt,dos,graph;
label 1;
var i:byte;
{---------------------------------------------------}


procedure menusound(Hz,temp:word);
begin
sound(hz);
delay(temp);
nosound
end;

{----------------------------------------------------}

procedure clock;
var GD,GM,EC:integer;
d,r,rn,z,r1,r2,rr,k,x1,x2,y1,y2,x01,y01,x02,y02,m:integer;
xasp,yasp,q,w,e,f:word;
begin
cleardevice;setbkcolor(cyan);
setcolor(15);line(1,480,40,430);
line(40,430,10,370);line(10,370,60,300);
line(10,370,50,350);line(50,350,120,300);
line(60,300,20,200);line(50,350,150,450);
line(20,200,70,210);line(10,370,50,400);
line(40,430,70,470);line(70,210,90,180);
line(20,200,68,210);line(60,300,100,250);
line(60,300,130,280);line(100,250,130,200);
repeat
x1:=getmaxx div 2;
y1:=getmaxy div 2;
getaspectratio(xasp,yasp);
r:=round(3*getmaxy*yasp/8/xasp);
r1:=round(0.9*r);
r2:=round(0.95*r);
circle(x1,y1,r);
circle(x1,y1,round(1.02*r));
setfillstyle(1,blue+blink);
floodfill(300,200,15);
{setcolor(15); line(10,10,150,100);
line(10,10,20,50);line(20,50,150,100);
setfillstyle(1,7);
floodfill(25,50,15);
setcolor(15); line(10,470,150,380);
line(10,470,20,430);line(20,430,150,380);
setfillstyle(1,7);
floodfill(25,430,15);
setcolor(15); line(630,10,490,100);
line(630,10,620,50);line(620,50,490,100);
setfillstyle(1,7);
floodfill(615,50,15);}
setcolor(5);
for k:=0 to 59 do begin
if k mod 5=0 then rr:=r1
else rr:=r2;
x01:=x1+round(rr*sin(2*pi*k/60));
y01:=y1-round(rr*xasp*cos(2*pi*k/60)/yasp);
x2:=x1+round(r*sin(2*pi*k/60));
y2:=y1-round(r*xasp*cos(2*pi*k/60)/yasp);
line(x01,y01,x2,y2);
end;
setlinestyle(solidln,0,thickwidth);
gettime(q,w,e,f);
r:=12*e;z:=q*60+w;m:=12*w;rn:=0;
repeat
if not keypressed then
begin
if r=0 then m:=w*12;
if m=0 then z:=q*60+w;
x2:=x1+round(1*r1*sin(2*pi*r/60/12));
y2:=y1-round(1*r1*xasp*cos(2*pi*r/60/12)/yasp);
x02:=x1+round(0.90*r1*sin(2*pi*m/60/12));
y02:=y1-round(0.90*r1*xasp*cos(2*pi*m/60/12)/yasp);
x01:=x1+round(0.65*r1*sin(2*pi*z/60/12));
y01:=y1-round(0.65*r1*xasp*cos(2*pi*z/60/12)/yasp);
setcolor(15);
line(x1,y1,x2,y2);
setcolor(15);
line(x1,y1,x02,y02);
line(x1,y1,x01,y01);
outtextxy(292,340,'Quartz');rn:=r;
if r<59*12 then begin
repeat
gettime(q,w,e,f);
r:=e*12;m:=w*12;delay(5);
until r>rn;end
else begin r:=0;delay(50000);
delay(50000);end;
setcolor(blue);
line(x1,y1,x01,y01);
line(x1,y1,x02,y02);
line(x1,y1,x2,y2);end;
until keypressed;
until readkey=#27;
cleardevice;
end;
{---------------------------------------------}

procedure xndir;
begin
cleardevice;
settextstyle(0,0,2);
setcolor(15);
outtextxy(265,10,'program');
readkey;
cleardevice;
end;

{------------------------------------------}

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

{------------------------------------------}
procedure gr;
var i1,m1:integer;ch:char;y1,k1,n1,x1:real;
begin
setbkcolor(0);
setcolor(15);
settextstyle(0,0,2);
cleardevice;

outtextxy(200,160,'˜«‡•ï 575');
settextstyle(0,0,1);setcolor(15);
outtextxy(20,190,'ìïë›  M*N áõ• §íï•ñ:¦íï•ñ• ©« í¯£•ñ çå, ¯ï ƒ£ñ›  §•©« ');
outtextxy(20,200,'‰«í ï“‰÷ ¯ó«‰ñ¯£ íïï‰ï•ñ ë‰—ñ«‰— 1 ï“‰÷ ¯ó«‰ñ£ íïï‰ï¯ë í¯£: ˆ‘‰');
outtextxy(20,210,'©‡ã•é• í¯£ á, ã §íï•ñ ‘¯£«‰— «õ¯õ¯™: €ïí›‰— éíñë› §ï•ñ:');
settextstyle(0,0,2); setcolor(15);
outtextxy(200,240,'ˆ«‘›ï…ï‰ï');
settextstyle(0,0,1);   setcolor(15);
outtextxy(20,270,'1. œ•‹§‰— ‰«‘›ï…•ï, ¯ï ë‰ï‡ï¡«• true ï“‰÷, ‰‘‰ ë‰í¯ï• íïï‰ï•');
outtextxy(20,280,'÷« Ÿëéï ‰ N-•,Ÿç ‡‰ã÷¯ó§` false:');
outtextxy(20,290,'2. œ‹§‰— ‰«‘›ï…•ï ¯ï q-ï‡ í¯£• íïï‰ï õ¯™ï•«• b ë‰í¯ï• íïï‰ï¯ë:');

k1:=0;
repeat
repeat
for i1:=20 to 620 do
begin
y1:=70+70*sin(i1+k1);
x1:=410+70*cos(i1+k1);
putpixel(i1,round(y1),10);
putpixel(i1,round(x1),10)
end;
delay(1000);
for i1:=20 to 620 do
begin
y1:=70+70*sin(i1+k1);
x1:=410+70*cos(i1+k1);
putpixel(i1,round(y1),0);
putpixel(i1,round(x1),0)
 end;
k1:=k1+3.14/180;
until keypressed;
ch:=readkey;
until ch=#13;
k1:=0;
m1:=0;
repeat
repeat
m1:=m1+1;
for i1:=0 to 640 do
begin
y1:=230+80*sin(i1+k1);
n1:=230+20*sin(i1+k1)/cos(i1+k1);
x1:=230+80*cos(i1+k1);
putpixel(i1,round(y1),0);
putpixel(i1,round(n1),0);
putpixel(i1,round(x1),0)
end;
k1:=k1+3.14/180;
if m1=400 then break;
until keypressed;
if m1=400 then
break;
ch:=readkey;
until ch=#13;
end;
{----------------------------------------}

procedure aaa;
begin
cleardevice;
repeat
until readkey=#27;
cleardevice;
end;

{------------------------------------------}


  PROCEDURE GOVAZD;



        var  K,i,j,gd,gm:integer;
       P6,P5,P4,P3,P2,P1,P,p7:pointer;
       Size6,Size5,Size4,Size3,Size2,Size1,Size:word;

     BEGIN
         Gd:=detect;
        initgraph(Gd,Gm,'');
    if  graphresult  <> GROK  then
        Halt(1);
        cleardevice;
        setbkcolor(11);
        setcolor(7);  SETFILLSTYLE(1,15);
        arc(80,90,170,0,40);
        arc(150,100,180,40,30);
        arc(88,92,70,170,50);
        arc(122,72,10,130,40);
        arc(172,58,15,150,20);
        arc(210,62,15,160,20);
        arc(200,92,150,20,20);
        arc(230,72,220,92,20);
        floodfill(150,100,7);
        size:=imagesize(38,31,250,130);
        getmem(p,size);
        getimage(38,31,250,130,p^);
        putimage(350,15,p^,xorput);
        setfillstyle(1,2);
        bar(0,400,640,480);
        setfillstyle(1,9);
        bar(0,270,640,400);
        setcolor(7);
        ellipse(80,300,0,120,30,20);
        ellipse(120,330,0,130,20,10);
        ellipse(50,350,20,120,30,10);
        ellipse(150,320,30,110,40,20);
        ellipse(230,310,40,130,30,20);
        ellipse(230,380,40,130,30,20);
        ellipse(140,390,40,130,30,20);
        ellipse(400,310,50,130,30,20);
        ellipse(305,290,40,130,30,20);
        ellipse(450,330,40,130,30,20);
        ellipse(430,380,40,130,30,20);
        ellipse(490,350,40,130,30,20);
        ellipse(550,370,10,130,30,20);
        ellipse(580,320,40,130,30,20);
        ellipse(520,310,40,130,30,20);
        setcolor(10);
        setfillstyle(1,10);
        ellipse(320,330,0,360,100,40);
        floodfill(340,320,10);

     {  setcolor(6);
       ellipse(310,160,180,0,25,10);
       line(229,270,285,160);
       line(335,160,385,270);
       moveto(229,270);
       lineto(385,270);
       setfillstyle(1,6);
       floodfill(300,200,6);
      setcolor(14);
      }
          for i:=1 to 20 do
          begin
                 ellipse(315,182,340-2*i,180+2*i+10,40+3*i,25+2*i);
                 sound(random(20*i));
                 delay(5000);
                 nosound;
                 delay(5000);
          end;



             for i:=1 to 10 do
          begin
                 ellipse(335,192,40-10*i,110+3*i,25+2*i,35+2*i);
                 ellipse(280,192,80-5*i,140+i*10,25+2*i,35+2*i);
                 line(308,170,255+10*i,100);
                 sound(random(20*i));
                 delay(5000);
                 nosound;
                 delay(5000);

          end;

        for i:=1 to 25 do
     begin
   {       moveto(280,340);
          setcolor(2);
         lineto(280+random(40),340+random(40));
           moveto(280,340);
        lineto(240+random(40),300+random(40));
          moveto(280,340);
       lineto(240+random(40),340+random(40));
          moveto(280,340);
        lineto(280+random(40),300+random(40));
    }
    {      moveto(360,330);
          setcolor(2);
         lineto(360+random(40),330+random(40));
           moveto(360,330);
        lineto(320+random(40),290+random(40));
          moveto(360,330);
       lineto(320+random(40),330+random(40));
          moveto(360,330);
        lineto(360+random(40),290+random(40));}
          end;

               setcolor(8);
                 setfillstyle(1,8);
            ellipse(300,285,270,90,10,50);
            line(300,335,330,335);
            line(300,235,330,235);
            ellipse(330,285,90,270,10,50);
          {›ç• ¯›£}
                setfillstyle(1,6);
            floodfill(315,300,8);
{------------------------ã—§------------------------}
             for i:=1 to 60 do
        begin
                 moveto(315,230);
          setcolor(2);
         lineto(315+random(45),230+random(45));
           moveto(315,230);
        lineto(270+random(45),185+random(45));
          moveto(315,230);
       lineto(270+random(45),230+random(45));
          moveto(315,230);
        lineto(315+random(45),185+random(45));
        end;

{--------------çå•« ¥¯óí•-------------------}

        setfillstyle(1,11);
        bar(90,340,200,260);
        setcolor(14);
        setfillstyle(1,14);
        circle(150,300,15);
        floodfill(160,310,14);
        setcolor(4);
        setfillstyle(1,4);
        circle(152,295,3);
        floodfill(153,296,4);
        setcolor(4);
        moveto(178,300);
        lineto(162,292);
        moveto(178,300);
        lineto(162,307);
        setcolor(14);
        setfillstyle(1,14);
        ellipse(128,324,0,360,30,15);
        floodfill(140,330,14);
        setcolor(4);
        ellipse(134,320,205,10, 15,10);
        setcolor(14);
        ellipse(130,321,195,10,10,8);
        setcolor(4);
        ellipse(122,320,225,10,15,10);
        setcolor(14);
        ellipse(118,319,180,5,10,10);
        setcolor(14);
        moveto(92,305);
        lineto(105,328);
        setcolor(14);
        moveto(92,305);
        lineto(105,314);
        floodfill(100,313,14);
        setcolor(1);
        moveto(128,324);
        setfillstyle(1,10);
        bar(128,200,200,242);
        lineto(128,200);
        outtextxy(130,215,'_621_3');

{--------------çå•« ­ï“¯ó§-------------------}

        size2:=imagesize(90,199,400,340);

        getmem(P2,size2);
        getimage(90,199,200,340,P2^);
        putimage(90,199,P2^,xorput);
        setfillstyle(1,9);
        bar(90,340,200,260);
        setcolor(7);


        ellipse(80,300,0,120,30,20);
        ellipse(120,330,0,130,20,10);
        ellipse(50,350,20,120,30,10);
        ellipse(150,320,30,110,40,20);
        ellipse(230,310,40,130,30,20);
        ellipse(230,380,40,130,30,20);
        ellipse(140,390,40,130,30,20);
        ellipse(400,310,50,130,30,20);
        ellipse(305,290,40,130,30,20);
          setfillstyle(1,11);
        bar(92,199,200,269);



        for i:=0  to  100 do
     begin  putimage(i,128,P2^,NORMALput);
            sound(1000*i);
              delay(1000);
              nosound;
             putimage(i,128,P2^,NORMALput);
     end;
        putimage(100,128,P2^,NORMALput);

{-----------------‰ïï¯ï‡ ›¯óí•-----------------}
          setcolor(14);
        setfillstyle(1,14);
        circle(100,300,8);
        floodfill(105,302,14);
        setcolor(4);
        setfillstyle(1,4);
        circle(102,298,2);
        floodfill(103,299,4);
        setcolor(4);
        moveto(113,304);
        lineto(108,298);
        moveto(113,304);
        lineto(106,306);
        setcolor(14);
        setfillstyle(1,14);
        ellipse(90,314,0,360,15,7);
        floodfill(100,318,14);
        setcolor(4);
        ellipse(92,312,150,0,8,3);
        ellipse(90,315,190,0,7,3);
{--------------‰ïï¯ï‡ ›¯óí•• ã¯á•---------------}
            for i:=1 to 8 do
        begin
                  moveto(75,308);
          setcolor(14);
         lineto(75+random(8),308+random(8));
           moveto(75,308);
        lineto(67+random(8),300+random(8));
          moveto(75,308);
       lineto(67+random(8),308+random(8));
          moveto(75,308);
        lineto(75+random(8),300+random(8));
        end;

{--------------‰ïï¯ï‡ ›¯óí•• ­ï“¯ó§---------------}
         size4:=imagesize(67,291,114,322);
        getmem(P4,size4);
        getimage(64,291,114,322,P4^);
        putimage(64,291,P4^,xorput);
        setfillstyle(1,9);
        bar(64,291,114,322);

        setcolor(7);
        ellipse(450,330,40,130,30,20);
        ellipse(430,380,40,130,30,20);
        ellipse(490,350,40,130,30,20);
        ellipse(550,370,10,130,30,20);
        ellipse(580,320,40,130,30,20);
        ellipse(520,310,40,130,30,20);

        for i:=20  to  130 do
     begin  putimage(i,314,P4^,NORMALput);
              sound(100000*i);
              delay(1000);
              nosound;
             putimage(i,314,P4^,NORMALput);
       end;
          putimage(130,314,P4^,NORMALput);
{------------------‰ïï¯ï‡ ›¯óí•-------------------}
           setcolor(14);
        setfillstyle(1,14);
        circle(100,300,8);
        floodfill(105,302,14);
        setcolor(4);
        setfillstyle(1,4);
        circle(102,298,2);
        floodfill(103,299,4);
        setcolor(4);
        moveto(113,304);
        lineto(108,298);
        moveto(113,304);
        lineto(106,306);
        setcolor(14);
        setfillstyle(1,14);
        ellipse(90,314,0,360,15,7);
        floodfill(100,318,14);
        setcolor(4);
        ellipse(92,312,150,0,8,3);
        ellipse(90,315,190,0,7,3);

                for i:=1 to 8 do
        begin
                  moveto(75,308);
          setcolor(14);
         lineto(75+random(8),308+random(8));
           moveto(75,308);
        lineto(67+random(8),300+random(8));
          moveto(75,308);
       lineto(67+random(8),308+random(8));
          moveto(75,308);
        lineto(75+random(8),300+random(8));
        end;

         size6:=imagesize(67,291,114,322);
         getmem(P6,size6);
        getimage(64,291,114,322,P6^);
        putimage(64,291,P6^,xorput);
        setfillstyle(1,9);
        bar(64,291,114,322);
        setcolor(7);
        ellipse(450,330,40,130,30,20);
        ellipse(430,380,40,130,30,20);
        ellipse(490,350,40,130,30,20);
        ellipse(550,370,10,130,30,20);
        ellipse(580,320,40,130,30,20);
        ellipse(520,310,40,130,30,20);

        for i:=20  to  130 do
     begin  putimage(i,280,P6^,NORMALput);
              sound(100000*i);
              delay(1000);
              nosound;
             putimage(i,280,P6^,NORMALput);
       end;
          putimage(130,280,P6^,NORMALput);
{------------------à¯ïï¯ï‡ ›¯óí•------------------}

        setfillstyle(1,11);
        bar(439,340,555,260);
        setcolor(14);
        setfillstyle(1,14);
        circle(490,300,15);
        floodfill(500,310,14);
        setcolor(4);
        setfillstyle(1,4);
        circle(487,296,3);
        floodfill(488,297,4);
        setcolor(4);
        moveto(462,296);
        lineto(478,290);
        moveto(462,296);
        lineto(478,305);
        setcolor(14);
        setfillstyle(1,14);
        ellipse(512,324,0,360,30,15);
        floodfill(520,330,14);
        setcolor(4);
        ellipse(505,320,190,0, 15,10);
        setcolor(14);
        ellipse(509,321,220,0,10,8);
        setcolor(4);
        ellipse(518,320,170,8,15,10);
        setcolor(14);
        ellipse(520,319,180,20,12,10);

        setcolor(14);
        moveto(552,305);
        lineto(535,314);
        setcolor(14);
        moveto(552,305);
        lineto(535,334);
        setcolor(1);
        floodfill(544,312,14);
        setcolor(1);
        moveto(512,324);
        setfillstyle(1,2);
        bar(440,200,512,242);
        lineto(512,200);
        outtextxy(441,213,'â€–¨€ª ');
        outtextxy(460,224,'€î„”ª€');

         size1:=imagesize(439,199,555,340);

        getmem(P1,size1);
        getimage(439,199,555,340,P1^);
        putimage(439,199,P1^,xorput);
        setfillstyle(1,9);
        bar(439,340,555,260);
        setcolor(7);
        ellipse(450,330,40,130,30,20);
        ellipse(430,380,40,130,30,20);
        ellipse(490,350,40,130,30,20);
        ellipse(550,370,10,130,30,20);
        ellipse(580,320,40,130,30,20);
        ellipse(520,310,40,130,30,20);
        setfillstyle(1,11);
        bar(439,269,555,260);

        for i:=590  downto  420 do
     begin  putimage(i,128,P1^,NORMALput);
              sound(1000*i);
              delay(1000);
              nosound;
             putimage(i,128,P1^,NORMALput);
       end;
         putimage(420,128,P1^,NORMALput);
{----------------------ë‰ñ‰ïï¯ï‡ ›¯óí•------------------------}

           setcolor(14);
        setfillstyle(1,14);
        circle(490,300,10);
        floodfill(495,305,14);
        setcolor(4);
        setfillstyle(1,4);
        circle(487,297,2);
        floodfill(488,298,4);
        setcolor(4);
        moveto(470,298);
        lineto(480,295);
        moveto(470,298);
        lineto(480,305);
        setcolor(14);
        setfillstyle(1,14);
        ellipse(509,316,0,360,20,10);
        floodfill(520,322,14);
        setcolor(4);
        ellipse(505,313,150,0,10,5);
        ellipse(512,316,190,0,8,5);

              for i:=1 to 10 do
        begin
                  moveto(530,308);
          setcolor(14);
         lineto(530+random(10),308+random(10));
           moveto(530,308);
        lineto(520+random(10),298+random(10));
          moveto(530,308);
       lineto(520+random(10),308+random(10));
          moveto(530,308);
        lineto(530+random(10),298+random(10));
        end;


         size3:=imagesize(469,289,545,327);


        getmem(P3,size3);
        getimage(469,289,545,327,P3^);
        putimage(469,289,P3^,xorput);
        setfillstyle(1,9);
        bar(469,289,545,327);
        setcolor(7);
        ellipse(450,330,40,130,30,20);
        ellipse(430,380,40,130,30,20);
        ellipse(490,350,40,130,30,20);
        ellipse(550,370,10,130,30,20);
        ellipse(580,320,40,130,30,20);
        ellipse(520,310,40,130,30,20);

       for i:=590  downto  425 do
     begin  putimage(i,315,P3^,NORMALput);
              sound(10000*i);
              delay(1000);
              nosound;
            putimage(i,315,P3^,NORMALput);
       end;
          putimage(425,315,P3^,NORMALput);
{----------------Ÿ•«…‰ïï¯ï‡ ›¯óí•------------------}

            setfillstyle(1,11);
        bar(469,289,543,327);
        setcolor(14);
        setfillstyle(1,14);
        circle(490,300,10);
        floodfill(495,305,14);
        setcolor(4);
        setfillstyle(1,4);
        circle(487,297,2);
        floodfill(488,298,4);
        setcolor(4);
        moveto(470,298);
        lineto(480,295);
        moveto(470,298);
        lineto(480,305);
        setcolor(14);
        setfillstyle(1,14);
        ellipse(509,316,0,360,20,10);
        floodfill(520,322,14);
        setcolor(4);
        ellipse(505,313,150,0,10,5);
        ellipse(512,316,190,0,8,5);

              for i:=1 to 10 do
        begin
                  moveto(530,308);
          setcolor(14);
         lineto(530+random(10),308+random(10));
           moveto(530,308);
        lineto(520+random(10),298+random(10));
          moveto(530,308);
       lineto(520+random(10),308+random(10));
          moveto(530,308);
        lineto(530+random(10),298+random(10));
        end;


         size5:=imagesize(469,289,540,327);


        getmem(P5,size5);
        getimage(469,289,540,327,P5^);
        putimage(469,289,P5^,xorput);
        setfillstyle(1,9);
        bar(469,289,543,327);
        setcolor(7);
        ellipse(450,330,40,130,30,20);
        ellipse(430,380,40,130,30,20);
        ellipse(490,350,40,130,30,20);
        ellipse(550,370,10,130,30,20);
        ellipse(580,320,40,130,30,20);
        ellipse(520,310,40,130,30,20);

        for i:=590  downto  540 do
     begin  putimage(i,231,P5^,NORMALput);
              sound(100000*i);
              delay(1000);
              nosound;
             putimage(i,231,P5^,NORMALput);
       end;
          putimage(540,231,P5^,NORMALput);




        readkey

  END;

{-------------------------------------------}
procedure menu;
var k,i:integer;ch:char;
begin
lowvideo;
randomize;
k:=1;
repeat
setbkcolor(0);
for i:=1 to 10000 do
begin lowvideo;
putpixel(240+random(160),180+random(120),1);
{setlinestyle(solidln,0,thickwidth); }
end;
setcolor(1);
line(0,0,240,180);
line(640,0,400,180);
line(640,480,400,300);
line(0,480,240,300);
LINE(0,0,0,480);
LINE(636,0,636,480);
LINE(100,77,100,403);
LINE(536,77,536,403);
LINE(166,127,166,353);
LINE(470,127,470,353);
LINE(210,161,210,319);
LINE(426,161,426,319);
LINE(0,96,240,204);
LINE(400,204,636,96);
LINE(0,192,240,228);
line(400,228,636,192);
line(0,288,240,252);
line(400,252,636,288);
line(0,384,240,276);
line(400,276,636,384);
setfillstyle(11,1);
floodfill(2,7,1);
floodfill(635,7,1);
floodfill(2,193,1);
floodfill(635,193,1);
floodfill(2,385,1);
floodfill(635,385,1);
floodfill(101,193,1);
floodfill(535,193,1);
floodfill(101,290,1);
floodfill(535,290,1);
floodfill(169,160,1);
floodfill(467,160,1);
floodfill(169,250,1);
floodfill(467,250,1);
floodfill(169,320,1);
floodfill(467,320,1);
floodfill(239,225,1);
floodfill(401,225,1);
floodfill(239,254,1);
floodfill(401,254,1);
lowvideo;
setfillstyle(10,1);
floodfill(10,1,1);
floodfill(10,479,1);
repeat
setcolor(4);settextstyle(0,0,1);
setlinestyle(solidln,0,1);
case k of
1:begin setcolor(2);
outtextxy(265,220,'˜«‡ï• —¯ó›¯ó§');
outtextxy(265,240,'   „ïû•');
outtextxy(265,260,'     ˆ—÷');
setcolor(10);
outtextxy(265,200,'˜«‡ï• ‡ïë›÷');
end;
2:begin setcolor(2);
outtextxy(265,200,'˜«‡ï• ‡ïë›÷');
outtextxy(265,240,'   „ïû•');
outtextxy(265,260,'     ˆ—÷');
setcolor(10);
outtextxy(265,220,'˜«‡ï• —¯ó›¯ó§');
end;
3:begin setcolor(2);
outtextxy(265,200,'˜«‡ï• ‡ïë›÷');
outtextxy(265,220,'˜«‡ï• —¯ó›¯ó§');
outtextxy(265,260,'     ˆ—÷');
setcolor(10);
outtextxy(265,240,'   „ïû•');
end;
4:begin
setcolor(2);
outtextxy(265,200,'˜«‡ï• ‡ïë›÷');
outtextxy(265,220,'™«‡ï• —¯ó›¯ó§');
outtextxy(265,240,'   „ïû•');
setcolor(10);
outtextxy(265,260,'     ˆ—÷');
end;
end;



repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
menusound(390,50000);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;



if (k=4) and (ch=#13) then halt;if (k=5) and (ch=#13) then begin clock; break end;
if (k=1) and (ch=#13) then begin gr;break end;
if (k=2)  and (ch=#13)  then begin aaa; break end;
if (k=3) and (ch=#13) then begin govazd; break end;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000);
until ch=#27;
until ch=#27;
end;

{-------------------------------------------}

begin
init;
menu;
 end.