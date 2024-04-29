uses crt;
var i:byte;
f:file of real;
k:array[1..200] of real;
begin
clrscr;
randomize;
assign(f,'karen.dat');
rewrite(f);
for i:=1 to 200 do begin
k[i]:=random;
write(k[i]:1:3,' ');
write(f,k[i]);
if i mod 10 =0 then writeln;
end;
close(f);
readln
end.