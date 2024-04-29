var f1,f2:text;
i,n,k:integer;   s:string;
begin
     assign(f1,'dd.dat');rewrite(f1);
assign(f2,'dd1.dat');rewrite(f2);
writeln('n=');read(n);
for i:=1 to n+1 do
begin
     readln(s);writeln(f1,s); end;
writeln('k=');read(k);
for i:=1 to k+1 do
begin
     readln(s);writeln(f2,s); end;
close(f1);close(f2);reset(f2);
append(f1);
while not  eof(f2) do begin
readln(f2,s);
if copy(s,length(s),1)='n' then writeln(f1,s);
end;
close(f1);close(f2);
reset(f1);
while not  eof(f1) do begin
readln(f1,s);writeln(s);end;
readln
end.
