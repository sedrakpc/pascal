uses crt;
var f:file of string;
i,j,k,l,o,p:longint;
x:string;
begin
x:='s';
assign(f,'Sedrak.set');
rewrite(f);write(f,x);
for l:=1 to 40 do begin
for p:=1 to 15 do
for o:=1 to 15 do
for k:=1 to 15 do
for i:=1 to 15 do
for i:=1 to 15 do write(f,x);
end;
close(f);
end.




