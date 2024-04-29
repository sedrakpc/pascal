uses crt,graph;
{$i asd.pas}
function normrand:real;
var s:real;
i:shortint;
begin
s:=0;
for i:=1 to 12 do
s:=s+random;
normrand:=s-6.0;
end;
procedure hystogram;
var quant,y:array[1..640] of word;
i,x:integer;
begin for i:=1 to 640 do quant[i]:=0;
repeat x:=getmaxx div 2 + round(60*normrand);
quant[x]:=quant[x]+1;
y[x]:=getmaxy-quant[x];
putpixel(10+x,y[x],round(random(15)))
until y[x]<10 end;
begin randomize;asd;hystogram;readln;closegraph;
end.