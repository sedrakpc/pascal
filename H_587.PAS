program H_587;
var f1,f2,f3:file of real;
x1,x2:real;
n,i:byte;
begin
assign(f1,'s1.set');assign(f2,'s2.set');assign(f3,'s3.set');
rewrite(f1);rewrite(f2);rewrite(f2);
readln(n);
for i:=1 to n do begin readln(x1);write(f1,x1) end;close(f1);
for i:=1 to n do begin readln(x2);write(f2,x2) end;close(f2);
reset(f1);reset(f2);reset(f3);
for i:=1 to n do begin
read(f1,x1);read(f2,x2);
if x1>x2 then write(f3,x1) else
if x2>x1 then write(f3,x2)
end;
close(f1);close(f2);close(f3);
reset(f3);
while not eof(f3) do begin
read(f3,x1);write(x1,' ') end;close(f3);
readln
end.