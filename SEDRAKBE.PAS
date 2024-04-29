uses crt,graph;
{$i init.pas}
begin
init;
setbkcolor(random(15));cleardevice;randomize;
repeat
randomize;
setcolor(random(getmaxcolor));
Settextstyle(random(8),0,random(7));
outtextxy(random(400),random(450),'S.E.D.R.A.K');
sound(300+random(500));
delay(60000);delay(60000);delay(60000);
nosound;cleardevice;
until keypressed;
end.
