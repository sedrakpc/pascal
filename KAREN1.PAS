uses crt;
var x:array[1..200] of real;
i:byte;
a:file of real;
begin
clrscr;
randomize;
for i:=1 to 200 do begin
x[i]:=random;
write(x[i]:1:3,'  ');
if i mod 10=0 then  writeln;
end;
assign(a,'Karen.dat');
rewrite(a);
for i:=1 to 200 do
write(a,x[i]);
readkey
end.
