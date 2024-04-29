Program Karen;
type mat=array[1..50,1..50] of integer;
var x:mat;m,i,j,p:byte;k:integer;
begin write('Nermutel matrici erkarutjun@:>');
readln(m);
for i:=1 to m do
for j:=1 to m do begin
write('x[',i,',',j,']=');
readln(x[i,j]) end;
write('Nermutel k:>k=');readln(k);
p:=0;
for i:=2 to m do
for j:=1 to i-1 do
if x[i,j] mod k=0 then p:=p+1;
writeln('                         k-in bazmapatik tareri qanak@:',p);
write('                                Sexmeq Enter');
readln
end.