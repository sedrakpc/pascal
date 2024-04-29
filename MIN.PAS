Program SSs;
uses crt;
type mat=array[1..50,1..50] of integer;
var x:mat;m,i,j,p:byte;
begin
clrscr;
writeln('                              ');
write('Nermutel matrici erkarutjun@:>');
readln(m);
for i:=1 to m do
for j:=1 to m do begin
write('x[',i,',',j,']=');
readln(x[i,j]) end;
p:=0;
for i:=1 to m do
for j:=1 to m do
if x[i,j] > 0 then p:=p+x[i,j];
writeln('                     Matrici drakan tareri gumar@:',p);
write('                                Sexmeq Enter');
readln
end.