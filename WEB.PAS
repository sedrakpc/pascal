uses crt,graph,graphs;
var i:word;
begin
open_graph;
cleardevice;
repeat
setbkcolor(0);
setcolor(15);
line(0,0,getmaxx,getmaxy);
delay(10000);
line(0,getmaxy,getmaxx,0);
delay(10000);
line(0,getmaxy div 2,getmaxx,getmaxy div 2);
delay(10000);
line(getmaxx div 2,0,getmaxx div 2,getmaxy);
delay(10000);
for i:=2 to 20 do
begin
circle(getmaxx div 2,getmaxy div 2,getmaxy div i);
delay(5000-15*i);
end;
until keypressed;
readln;
close_graph;
end.







