uses crt,graph;
{$i init.pas}
begin
init;
Setcolor(red);
rectangle(10,15,320,175);
Setcolor(green);
circle((320+10) div 2,(175+15) div 2,40);
line(10,15,320,175);
line(10,175,320,15);
readln;
closegraph;
end.
