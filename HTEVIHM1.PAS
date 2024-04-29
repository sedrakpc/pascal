uses crt,graph;
label 1;
var i,j:byte;
m,n:real;ch:char;
f:file of real;
a:array[1..10,1..20] of real;
begin
textbackground(1);
textcolor(7);
clrscr;
assign(f,'lilit.dat');
m:=0/1;n:=1/1;
randomize;
1:for i:=1 to 10 do
for j:=1 to 20 do begin
repeat
a[i,j]:=random;
until (a[i,j]<>m) and (a[i,j]<>n);
end;
clrscr;
rewrite(f);
writeln;writeln;
writeln;write('          ');
for i:=1 to 10 do
for j:=1 to 20 do begin
write(a[i,j]:1:3,' ');
write(f,a[i,j]);
if j mod 10=0 then begin
writeln;write('          ');
end;end;
writeln;
close(f);
repeat
ch:=readkey;
until (ch=#13) or (ch=#27);
if ch=#27 then halt;
if ch=#13 then goto 1;
end.