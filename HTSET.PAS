uses crt;
var i,k:byte;
ch:char;
f:file of real;
A:array[1..200] of real;
b:array[1..200] of real;
begin
textmode(co80);
textbackground(1);
clrscr;
randomize;
repeat
textcolor(4);
clrscr;
writeln;
writeln;
write('          ');
for i:=1 to 200 do begin
repeat
a[i]:=random
until (a[i]<>1) and (a[i]<>0);
write(a[i]:1:3,' ');
if i mod 10 =0 then begin writeln;write('          ') end;
end;
textcolor(2);
writeln;
write('   For new shelve press <space>                 For save and exit press <F2>');
repeat
ch:=readkey
until (ch=#32) or (ch=#60);
until ch=#60;
assign(f,'seto.dat');
rewrite(f);
for i:=1 to 200 do
write(f,a[i]);
{
writeln;
writeln;
write('          ');
for i:=1 to 200 do begin
repeat
b[i]:=random
until (b[i]<>1) and (b[i]<>0);
write(b[i]:1:3,' ');
if i mod 10 =0 then begin writeln;write('          ') end;
end;}
end.