uses crt,graph;
var k,i:byte;
ch:char;
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
procedure menu(x,y:integer);
var step:integer;
begin
step:=y;
setcolor(7);
line(x-50,y+130,x-50,y-16);
line(x+50,y+130,x+50,y-16);
ellipse(x,y+27,250,290,149,110);
ellipse(x,y+7,250,290,149,110);
setfillstyle(1,7);
{floodfill(x,y+130,7); }
setcolor(7);
ellipse(x,y-7,255,285,149,110);
line(x-39,y+100,x-39,y+112);
line(x+39,y+100,x+39,y+112);

setfillstyle(1,8);
{floodfill(x,y+110,7);}
setcolor(1);
line(x,y+107,x,y+115);
line(x-4,y+107,x-4,y+115);
line(x+4,y+107,x+4,y+115);
line(x+8,y+106,x+8,y+114);
line(x-8,y+106,x-8,y+114);
line(x-12,y+106,x-12,y+114);
line(x+12,y+106,x+12,y+114);
setcolor(7);
ellipse(x,y-10,254,287,149,110);
line(x+42,y-1,x+42,y+95);
line(x-42,y-1,x-42,y+95);
line(x+38,y-5,x-38,y-5);
ellipse(x-39,y-2,90,180,3,3);
ellipse(x+39,y-2,0,90,3,3);
setcolor(1);
line(x-8,y+93,x+8,y+93);
line(x-15,y+85,x-13,y+90);
line(x+15,y+85,x+13,y+90);
ellipse(x-8,y+90,190,270,4,3);
ellipse(x+8,y+90,270,360,4,3);
line(x-35,y+85,x-16,y+85);
line(x+35,y+85,x+16,y+85);
y:=y-14;
line(x-8,y+93,x+8,y+93);
line(x-15,y+85,x-13,y+90);
line(x+15,y+85,x+13,y+90);
ellipse(x-8,y+90,190,270,4,3);
ellipse(x+8,y+90,270,360,4,3);
line(x-35,y+85,x-16,y+85);
line(x+35,y+85,x+16,y+85);
y:=y-14;
line(x-8,y+93,x+8,y+93);
line(x-15,y+85,x-13,y+90);
line(x+15,y+85,x+13,y+90);
ellipse(x-8,y+90,190,270,4,3);
ellipse(x+8,y+90,270,360,4,3);
line(x-35,y+85,x-16,y+85);
line(x+35,y+85,x+16,y+85);
y:=y-14;
line(x-8,y+93,x+8,y+93);
line(x-15,y+85,x-13,y+90);
line(x+15,y+85,x+13,y+90);
ellipse(x-8,y+90,190,270,4,3);
ellipse(x+8,y+90,270,360,4,3);
line(x-35,y+85,x-16,y+85);
line(x+35,y+85,x+16,y+85);

y:=step;
setcolor(3);
outtextxy(x-31,y+89,'*');
outtextxy(x+25,y+89,'#');
outtextxy(x-2,y+83,'0');
y:=y-14;
outtextxy(x-31,y+89,'7');
outtextxy(x+25,y+89,'9');
outtextxy(x-2,y+83,'8');
y:=y-14;
outtextxy(x-31,y+89,'4');
outtextxy(x+25,y+89,'6');
outtextxy(x-2,y+83,'5');
y:=y-14;
outtextxy(x-31,y+89,'1');
outtextxy(x+25,y+89,'3');
outtextxy(x-2,y+83,'2');
y:=step;
setcolor(4);
setlinestyle(0,0,1);
ellipse(x+25,y+32,180,360,3,3);
line(x+25,y+31,x+25,y+32);
ellipse(x+25,y+31,10,160,4,4);

setcolor(2);
ellipse(x-25,y+31,270,90,3,3);
circle(x-26,y+31,1);
ellipse(x-26,y+31,91,260,4,4);
putpixel(x-26,y+31,2);
putpixel(x-27,y+27,2);

setcolor(1);
circle(x,y+19,17);
circle(x,y+19,6);
{setfillstyle(1,7);
fllodfill(x,y+19,1);}
line(x-35,y+19,x-18,y+19);
line(x+35,y+19,x+18,y+19);
setcolor(3);
circle(x-26,y+5,1);putpixel(x-26,y+5,3);
circle(x+26,y+5,1);putpixel(x+26,y+5,3);
putpixel(x+28,y-10,15);
putpixel(x+27,y-10,15);
putpixel(x+28,y-9,15);
putpixel(x+27,y-9,15);
setcolor(7);
line(x-37,y-15,x+37,y-15);
line(x-37,y-15,x-37,y-27);
line(x+37,y-15,x+37,y-27);
line(x+37,y-27,x+42,y-27);
line(x-37,y-27,x-42,y-27);
ellipse(x-44,y-17,80,180,6,10);
ellipse(x+44,y-17,0,95,6,10);
line(x-36,y-28,x-36,y-17);
line(x+36,y-28,x+36,y-17);
line(x-36,y-17,x+36,y-17);
line(x-36,y-28,x-50,y-28);
line(x+36,y-28,x+50,y-28);
line(x+50,y-28,x+50,y-145);
line(x-50,y-28,x-50,y-145);
line(x-36,y-34,x+36,y-34);
line(x-40,y-38,x-40,y-118);
line(x+40,y-38,x+40,y-118);
line(x-36,y-122,x+36,y-122);
ellipse(x-37,y-37,180,270,3,3);
ellipse(x+37,y-37,270,360,3,3);
ellipse(x-37,y-119,90,180,3,3);
ellipse(x+37,y-119,0,90,3,3);
settextstyle(2,0,4);
outtextxy(x-22,y-135,'MOTOROLA');
ellipse(x,y-42,70,109,149,110);
circle(x,y-143,6);
line(x-2,y-145,x-4,y-142);
line(x+2,y-145,x+4,y-142);
line(x+2,y-145,x,y-143);
line(x-2,y-145,x,y-143);
setcolor(1);
ellipse(x+20,y-135,50,100,20,9);
ellipse(x+19,y-134,50,100,20,9);
ellipse(x+18,y-133,50,100,20,9);
ellipse(x-20,y-135,80,130,20,9);
ellipse(x-19,y-134,80,130,20,9);
ellipse(x-18,y-133,80,130,20,9);
end;
procedure arow(x,y:integer);
begin
{-----------------Arow-left--------------------}
putpixel(x-13,y+19,3);
putpixel(x-12,y+19,3);
putpixel(x-12,y+18,3);
putpixel(x-12,y+20,3);
putpixel(x-11,y+19,3);
putpixel(x-11,y+20,3);
putpixel(x-11,y+18,3);
putpixel(x-11,y+17,3);
putpixel(x-11,y+21,3);
{-----------------Arow-right--------------------}
putpixel(x+13,y+19,3);
putpixel(x+12,y+19,3);
putpixel(x+12,y+18,3);
putpixel(x+12,y+20,3);
putpixel(x+11,y+19,3);
putpixel(x+11,y+20,3);
putpixel(x+11,y+18,3);
putpixel(x+11,y+17,3);
putpixel(x+11,y+21,3);
end;
procedure arowtb(x,y:integer;color,z:byte);
begin
case z of
{-----------------Arow-bottom----------------}
1:begin
putpixel(x,y+32,color);
putpixel(x,y+31,color);
putpixel(x-1,y+31,color);
putpixel(x+1,y+31,color);
putpixel(x,y+30,color);
putpixel(x-1,y+30,color);
putpixel(x+1,y+30,color);
putpixel(x-2,y+30,color);
putpixel(x+2,y+30,color);
end;
{-----------------Arow-top--------------------}
2:begin
putpixel(x,y+5,color);
putpixel(x,y+6,color);
putpixel(x-1,y+6,color);
putpixel(x+1,y+6,color);
putpixel(x,y+7,color);
putpixel(x-1,y+7,color);
putpixel(x+1,y+7,color);
putpixel(x-2,y+7,color);
putpixel(x+2,y+7,color);
end;
end;
end;
begin
init;
menu(320,240);
arow(320,240);
arowtb(320,240,3,1);
arowtb(320,240,3,2);
k:=1;
repeat
setcolor(4);settextstyle(0,0,1);
setfillstyle(1,0);
case k of
1:begin
bar(285,125,355,200);
outtextxy(295,160,' «‡ο•');
outtextxy(290,170,' ‡ολ›χ');
end;
2:begin
bar(285,125,355,200);
outtextxy(295,160,' «‡ο•');
outtextxy(290,170,'—―σ›―σ§');
end;
3:begin
bar(285,125,355,200);
outtextxy(295,170,'„οϋ•');
end;
4:begin
bar(285,125,355,200);
outtextxy(292,170,'  —χ');
end;
end;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:begin k:=k-1;arowtb(320,240,4,2);
delay(50000);arowtb(320,240,3,2);
end;
#80:begin k:=k+1;arowtb(320,240,4,1);
delay(50000);arowtb(320,240,3,1);
end;
end;
if (k=4) and (ch=#13) then halt;
{if (k=1) and (ch=#13) then begin xndridrv;break end; }
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000);
until ch=#27;


readln
end.