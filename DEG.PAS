procedure deg(x,y:integer);
begin
delay(10000);del(x-10,y-10,x+90,y+80);
setfillstyle(1,14);
setcolor(2);
rectangle(x,y,x+75,y+70);floodfill(x+1,y+1,2);
line(x-3,y+5,x,y);line(x-3,y+75,x,y+70);
line(x-3,y+5,x-3,y+74);floodfill(x-2,y+30,2);
line(x+73,y+75,x+75,y+70);line(x-3,y+75,x+73,y+75);
floodfill(x+30,y+72,2);
delay(10000);del(x-10,y-10,x+90,y+80);
setfillstyle(1,14);
setcolor(2);
rectangle(x,y,x+75,y+70);;floodfill(x+1,y+1,2);
line(x+3,y+75,x,y+70); line(x+78,y+75,x+75,y+70);
line(x+3,y+75,x+78,y+75);floodfill(x+5,y+72,2);
line(x+78,y+5,x+75,y);line(x+78,y+5,x+78,y+75);
floodfill(x+76,y+30,2);
{delay(10000);del(x-10,y-10,x+90,y+80);
setfillstyle(1,14);
 }