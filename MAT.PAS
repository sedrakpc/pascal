Program Karen;
uses crt;
type mat=array[1..50,1..50] of integer;
var x:mat;m,i,j,p:byte;
begin
clrscr;
writeln('                              Sedrak Dalaloyan');
write('Nermutel matrici erkarutjun@:>');
readln(m);
for i:=1 to m do
for j:=1 to m do begin
write('x[',i,',',j,']=');
readln(x[i,j]) end;
p:=x[1,1];
for i:=1 to m do
for j:=1 to m do
if x[i,j] > p then p:=x[i,j];
writeln('                             Matrici amenamet tar@:',p);
write('                                Sexmeq Enter');
readln
end.