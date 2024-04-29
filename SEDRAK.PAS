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
delay(60000);delay(60000);delay(60000);cleardevice;
until keypressed;
end.
