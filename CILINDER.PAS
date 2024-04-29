uses crt,graph,graphs;
var i:word;
begin
open_graph;
cleardevice;
readln;
repeat
setbkcolor(0);
setcolor(15);
for i:=2 to 16 do
begin
circle(getmaxx div 2,getmaxy div 2,getmaxy div i);
if i<>16 then begin
line(getmaxx div 2-getmaxy div i,getmaxy div 2,getmaxx div 2-getmaxy div (i+1),getmaxy div 2);
line(getmaxx div 2+getmaxy div i,getmaxy div 2,getmaxx div 2+getmaxy div (i+1),getmaxy div 2);
line(getmaxx div 2,getmaxy div 2-getmaxy div i,getmaxx div 2,getmaxy div 2-getmaxy div (i+1));
line(getmaxx div 2,getmaxy div 2+getmaxy div i,getmaxx div 2,getmaxy div 2+getmaxy div (i+1));
line(getmaxx div 2-round(sqrt(2)/2*(getmaxy div i)),getmaxy div 2-round(sqrt(2)/2*(getmaxy div i)),
getmaxx div 2-round(sqrt(2)/2*(getmaxy div (i+1))),getmaxy div 2-round(sqrt(2)/2*(getmaxy div (i+1))));
line(getmaxx div 2-round(sqrt(2)/2*(getmaxy div i)),getmaxy div 2+round(sqrt(2)/2*(getmaxy div i)),
getmaxx div 2-round(sqrt(2)/2*(getmaxy div (i+1))),getmaxy div 2+round(sqrt(2)/2*(getmaxy div (i+1))));
line(getmaxx div 2+round(sqrt(2)/2*(getmaxy div i)),getmaxy div 2-round(sqrt(2)/2*(getmaxy div i)),
getmaxx div 2+round(sqrt(2)/2*(getmaxy div (i+1))),getmaxy div 2-round(sqrt(2)/2*(getmaxy div (i+1))));
line(getmaxx div 2+round(sqrt(2)/2*(getmaxy div i)),getmaxy div 2+round(sqrt(2)/2*(getmaxy div i)),
getmaxx div 2+round(sqrt(2)/2*(getmaxy div (i+1))),getmaxy div 2+round(sqrt(2)/2*(getmaxy div (i+1))));
end;
delay(50000);
end;
until keypressed;
readln;
close_graph;
end.







