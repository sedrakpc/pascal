uses graph,crt;
label 1;
var
   grdriver:integer;
   grmode:integer;
   errcode:integer;
   i,j,v,e,r,h:integer;
{----------------------------------------}
N2,N3,N5,N4,N,N1,N6,N7,i1,j1:integer;  ug:real;
     ch,ch1:char;

{----------------------------------------}
    Key              : Char;
    Font             : String; {SHRIVTNERI ANVANUM@ }
    Size, MyFont     : Word;
{----------------------------------------}
procedure graf;
var  m,n,i,k,j:integer;s:word;p:pointer;
begin
line(141,105,181,140);
setbkcolor(6);setcolor(15);
sound(300);delay(60000);nosound;
begin     for i:=-20 to 9 do   begin
setcolor(15);cleardevice;circle(20,40,1+i); line(79,2,150,50);
line(200,5,350,120);rectangle(455,403,462,479);   line(20,39,20,1);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);line(400,5,639,5);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);
setcolor(2); setbkcolor(6);fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);setfillstyle(1,2);
floodfill(60,400,2);setfillstyle(1,4);floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);  line(2,40,15,350);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(3000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=1 to 92 do begin setcolor(15);  cleardevice;
line(2-i,40+i,30,60); line(79,2,150,50); line(400,5,639,5);
line(200,5,350,120);rectangle(455,403,462,479);
line(30,60,30,80);line(60,80,60,100); line(20,39,20,1);   circle(20,40,10);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);
setcolor(2); setbkcolor(6);fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);line(2,40+i,15,350+i);setfillstyle(1,2);
floodfill(60,400,2);setfillstyle(1,4);floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350+i);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=92 downto 1 do  begin cleardevice;line(2-i,40+i,30,60);
line(79,2,150,50);line(200,5,350,120); rectangle(455,403,462,479);
line(30,60,30,80);line(60,80,60,100); line(20,39,20,1);   circle(20,40,10);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);line(400,5,639,5);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);
setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);ellipse(60,400,157,23,30,7);
setfillstyle(1,2);floodfill(60,400,2);
setfillstyle(1,4);floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=0 to 11 do begin cleardevice; circle(20+7*i,40-i,10);
line(20,32,20,1);
line(75,2,150,50); rectangle(455,403,462,479);
  line(200,5,350,120);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);line(400,5,639,5);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);ellipse(60,400,157,23,30,7);setfillstyle(1,2);
floodfill(60,400,2);setfillstyle(1,4);floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=0 to 10  do begin setcolor(15);
cleardevice;circle(97+2*i,29+8*i,10); line(20,32,20,1);
line(75,2,150,50); rectangle(455,403,462,479);
line(200,5,350,110);line(400,5,639,5);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);ellipse(60,400,157,23,30,7);
setfillstyle(1,2);floodfill(60,400,2);
setfillstyle(1,4);floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=0 to 14  do begin setcolor(15);
cleardevice;
circle(117+i,109-i,10);    line(400,5,639,5);
line(20,32,20,1);
line(75,2,150,50); rectangle(455,403,462,479);
line(200,5,350,110);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);
setfillstyle(1,2);
floodfill(60,400,2);
setfillstyle(1,4);
floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=0 to 72  do begin  setcolor(15);
cleardevice;circle(131+i,95+i,10);
line(20,32,20,1);          line(400,5,639,5);
line(75,2,150,50); rectangle(455,403,462,479);
   line(200,5,350,110);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);
setfillstyle(1,2);
floodfill(60,400,2);
setfillstyle(1,4);
floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=1 to 85  do begin  setcolor(15);
cleardevice;circle(203+i,167-i,10);
line(20,32,20,1);      line(400,5,639,5);
line(75,2,150,50); rectangle(455,403,462,479);
  line(200,5,350,110);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);
setfillstyle(1,2);
floodfill(60,400,2);
setfillstyle(1,4);
floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=0 to 21  do begin setcolor(15);
cleardevice;circle(288-i,82+6*i,10);
line(20,32,20,1);       line(400,5,639,5);
line(75,2,150,50); rectangle(455,403,462,479);
  line(200,5,350,110);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);setfillstyle(1,2);
floodfill(60,400,2);setfillstyle(1,4);floodfill(61,413,2);
circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=0 to 192  do begin setcolor(15);
cleardevice; circle(267+i,208-i,10);line(20,32,20,1);
line(75,2,150,50);rectangle(455,403,462,479);line(200,5,350,110);line(400,5,639,5);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);setfillstyle(1,2);floodfill(60,400,2);
setfillstyle(1,4);floodfill(61,413,2);circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000); end;
{\\\\\\\\\\\\\\\\\\\\\\\\}
begin for i:=1 to 373  do begin setcolor(15);
cleardevice;line(20,32,20,1); line(400,5,639,5);
line(75,2,150,50); rectangle(455,399,462,479);
circle(460,16+i,10);  line(200,5,350,110);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);
setcolor(2); setbkcolor(6);fillellipse(60,400,30,15);
ellipse(60,400,157,23,30,7);setfillstyle(1,2);floodfill(60,400,2);
setfillstyle(1,4);floodfill(61,413,2);circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);
line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000);  end;begin for i:=1 to 100  do begin setcolor(15);
cleardevice;line(20,32,20,1);line(75,2,150,50);rectangle(455,399+i,462,479+i);
circle(460,389+i,10);  line(200,5,350,110);
line(2,40,30,60);line(30,60,30,80);line(60,80,60,100);
line(90,100,90,120);line(120,120,120,140);line(150,140,150,160);
line(180,160,180,180);line(210,180,210,200);line(240,200,240,220);
line(270,220,270,240);line(300,240,300,260);
line(30,80,60,80);line(60,100,90,100);line(90,120,120,120);
line(120,140,150,140);line(150,160,180,160);line(180,180,210,180);
line(210,200,240,200);line(240,220,270,220);line(270,240,300,240);
line(300,260,330,260);line(330,260,330,479);
setbkcolor(6);setcolor(15);
line(70,120,70,100);line(60,120,60,140);line(100,120,100,140);
line(60,100,30,100);line(80,140,80,160);line(30,120,90,120);
line(110,140,110,160);line(30,140,120,140);line(30,160,150,160);
line(30,180,180,180);line(30,200,210,200);line(30,220,240,220);
line(30,80,30,260);line(30,240,270,240);line(220,240,220,220);
line(70,240,70,220);line(120,240,120,220);line(170,240,170,220);
line(60,160,60,180);line(100,160,100,180);line(140,160,140,180);
line(80,180,80,200);line(150,180,150,200);line(60,200,60,220);
line(110,200,110,220);line(160,200,160,220);line(200,200,200,220);
line(30,260,300,260);line(95,240,95,260); line(145,240,145,260);
line(195,240,195,260);line(240,240,240,260);setcolor(2); setbkcolor(6);
fillellipse(60,400,30,15);ellipse(60,400,157,23,30,7);setfillstyle(1,2);
floodfill(60,400,2);setfillstyle(1,4);line(400,5,639,5);
floodfill(61,413,2);circle(40,360,3);circle(80,360,3);
ellipse(32,398,180,280,10,10);line(22,398,15,350);
line(88,408,115,440);line(115,440,120,442);
line(115,440,110,442);line(50,385,40,360);line(70,385,80,360);line(45,412,35,440);
line(78,412,90,440); line(90,440,93,442);line(90,440,85,440);
line(35,440,30,440);line(35,440,40,442);
delay(1000);  end;    cleardevice;
SETCOLOR(15);begin for i:=1 to 440  do begin     CLEARDEVICE;
rectangle(10,22+2*I,17,80+2*I);    LINE(400,479,470,479);
LINE(440,479,475,445);circle(20+I,5+I,10);   DELAY(6000)
END;begin for i:=1 to 4  do begin     CLEARDEVICE;
 rectangle(10,900,17,960);    LINE(400,479,470,479);
LINE(440,479,475+I,445);circle(460,445,10);   DELAY(1000);   END;
begin for i:=1 to 450  do begin     CLEARDEVICE;
rectangle(10,900,17,960);LINE(400,479,470,479);LINE(440,479,475,445);
circle(460-I,445-I,10);   DELAY(1000);END;CLEARDEVICE;
BEGIN FOR I:=1 TO 90 DO BEGIN CLEARDEVICE;LINE(60,1,60,90);line(160,90,160,1);
CIRCLE(600-6*I,460-4*I,10);LINE(40,1,20,120);DELAY(6000); END;END;
BEGIN FOR I:=1 TO 32 DO BEGIN CLEARDEVICE;LINE(60,1,60,90);line(160,90,160,1);
CIRCLE(60,100,10);LINE(40,1,20+I,120);DELAY(6000); END;
BEGIN  FOR I:=1 TO 100 DO BEGIN CLEARDEVICE;LINE(60,1,60,90);
CIRCLE(60+I,100,10);LINE(40,1,52,120);line(160,90,160,1);
line(160,479,160,470-3*i);DELAY(1000);   cleardevice;END;
delay(60000);sound(300);delay(60000);nosound;
end;END;END;end;END;end;
END;END;END;END;END; END;END;end;end;end;end;readln end;
{++++++++++++++++++++++++++++++++++++++++++++}
procedure xndir;
begin
CLEARDEVICE;setbkcolor(4);
setcolor(7);settextstyle(0,0,2);
outtextxy(280,28,'˜ª†”î');setcolor(10);settextstyle(0,0,1);
outtextxy(5,80,'ìîê€š Œ M*N à€ô” ¦€ìî”ğ:ìˆ¢ˆî®ê ô®˜ˆ– €¨ª è¨®òªî ®î®ªğ êî€ ˆª „ìªê®ò¦ ¦€ìî”ğ”');
outtextxy(5,100,'¦ˆš€„®ò¨ª (¦”€) ˆê ô®öî€„®ò¨ª (¦”€œ) ì€îîˆî:ˆª€†îê®ò¦ Œ, ®î ¦ˆš€„®ò¨ª ˆê  ');
outtextxy(5,120,'ô®öî€„®ò¨ª ì€îîˆî ¦”ˆêª®ò¨ª è¨®òª®ò¦ àˆª „ìªê®ò¦:');
setcolor(10);
outtextxy(30,220,'®î®¬ˆ– êˆœì®î®ò¦ a-”ª €ê€è€î ì€îîˆî” ö€ª€œ: ');
setcolor(7);outtextxy(20,200,'€æ€ä”ª ˆª€šî€„”î');
outtextxy(5,150,'œ”î€æˆ– ˆìˆê¨€– ˆª€šî€„îˆî');
outtextxy(20,280,'ˆîœî®î† ˆª€šî€„”î');
setcolor(10);
outtextxy(30,300,'®î®¬ˆ– ¦€ìî”ğ®ò¦ a-”ª €ê€è€î ì€îîˆî” „ìªêˆ–® è¨€ª €¦€î:');
repeat
settextstyle(0,0,2);
setcolor(random(10));
outtextxy(40,400,'-621-3 ì”„î€ª ä®ò€î¨€ª');
settextstyle(0,0,0);
outtextxy(500,450,'EXIT-<<Enter>>')
until keypressed;
readln;
end;
{***************************************************************}
procedure tiko;
type masiv=array[1..20,1..20] of real;
     vec=array[1..20] of real;
var n,m,i,j,l,k,t1:byte;
    a:masiv;
    min,max,s1:real;
    b:vec;
    s:string;
ch2:char;
ss,co:byte;
code:integer;
t:boolean;
w:real;
f:file of real;
procedure proc(a2:masiv;n2,m2:byte;c2:real;var l2:byte);
var i2,j2:byte;
begin
for i2:=1 to n2 do
for j2:=1 to m2 do
if a2[i2,j2]=c2 then begin l2:=j2;break;end;
end;
function func(b1:vec;m1:byte;a1:real):byte;
var k1,i1:byte;
begin
k1:=0;
for i1:=1 to m1 do
if b1[i1] = a1 then k1:=k1+1;
func:=k1;
end;
begin
setcolor(15);
repeat
cleardevice;
outtextxy(190,10,'ªˆî¦®òšˆ– ¦€ìî”ğ(1<n<6,1<m<9)');
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
outtextxy(295,30,'m=');
repeat
setfillstyle(1,0);
bar(295,30,640,40);
outtextxy(295,30,'m=');
s:='';
repeat
repeat
outtextxy(313,30,s);
ch2:=readkey;
until (ch2=#48) or (ch2=#49) or (ch2=#50) or (ch2=#51) or (ch2=#52) or (ch2=#53)
or (ch2=#54) or (ch2=#55) or (ch2=#56) or (ch2=#57) or (ch2=#13) or (ch2=#46);
if ch2<>#13 then s:=s+ch2;
until (ch2=#13);
val(s,m,code);
if code<>0 then m:=0;
until (m>1) and (m<9);
setfillstyle(1,10);
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
if (copy(s,1,1)='-')  then k:=6 else k:=5;
if length(s)<k then begin
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
outtextxy(50,250,'èˆ¢¦ˆ– <Enter> ¦€ìî”ğ” ì€îîˆî Tiko.dat ú€¨–®ò¦ â€ˆ–®ò €¦€î');
readln;
assign(f,'Tiko.dat');
rewrite(f);
for i:=1 to n do
for j:=1 to m do begin
write(f,a[i,j]);
setfillstyle(1,10);
delay(6000);
delay(6000);
end;
close(f);
setcolor(0);
outtextxy(50,250,'èˆ¢¦ˆ– <Enter> ¦€ìî”ğ” ì€îîˆî Tiko.dat ú€¨–®ò¦ â€ˆ–®ò €¦€î');
setcolor(4);
outtextxy(80,250,'èˆ¢¦ˆ– <Enter> ¦€ìî”ğ” ì€îîˆî êˆîˆîğˆ–®ò €¦€î');
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
outtextxy(540,460,'EXIT-<<Esc>>');
end;
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
proc(a,n,m,max,t1);
for i:=1 to  n do begin
s1:=a[i,k];
a[i,k]:=a[i,t1];
a[i,t1]:=s1;
end;
setfillstyle(1,7);
{bar(320-(m)*30,380-(n)*20,320+(m)*30,380+(n)*20);}
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
outtextxy(280-m*30+5+(j)*55,370-n*20+5+(i)*30,s);
end;
repeat
until readkey=#27;
cleardevice;
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
      SetBkColor(4); setcolor(15);
      SetTextStyle(DefaultFont, HorizDir, 1);
      SetTextStyle(DefaultFont, HorizDir, 9);
      OutTextXY(80, 120, '„¨®ò¦î”');
     repeat
      setcolor(random(10));
      settextstyle(8,0,3);
      OutTextXY(240, 400, 'èˆ˜¦ˆ– ğ€ªœ€ğ€š èìˆ¢ª');
      sound(v);
      v:=v-70*20;
      sound(random(v));
      delay(5400);
      nosound;
     until keypressed;
     readkey;
     h:=1;
    1:settextstyle(0,0,0);
      cleardevice;
      setbkcolor(1);
      setfillstyle(solidfill,green);
      bar(100,100,540,380);
      setcolor(red);
      outtextxy(270,200,'ğ€ªœ');
      settextstyle(7,0,3);
      outtextxy(250,50,'œ®òîè€¨”ª €¬˜€ì€ªö');
      settextstyle(0,0,0);
    repeat
      setcolor(black);
      rectangle(i,j,i+160,j+15);
      outtextxy(250,220,'˜ª†î” †îê€ğö');
      outtextxy(250,250,'„î€ú”œ€œ€ª ¦€è');
      outtextxy(250,235,'˜ª†î” –®òš®ò¦');
      outtextxy(250,265,'ˆ–ö');
      ch1:=readkey;
    case ch1 of
     #80:
   begin
       setcolor(green);
       rectangle(i,j,i+160,j+15);
       j:=j+15;
        h:=h+1;
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
       h:=h-1
     end;
     end;
     if h=0 then h:=4;
     if h=5 then h:=1;
    until ch1=#13;
case h of
1:begin xndir;goto 1;end;
2:begin tiko;goto 1;end;
3:begin graf;goto 1;end;
end;
end;
end.
