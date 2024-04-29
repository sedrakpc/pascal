program sevo;
type vec=array[1..10] of real;
     masiv=array[1..10,1..10] of real;

var i,j,n,m:byte;
    a:masiv;
    k,d:vec;
procedure sev(var a1,b1:vec;n1:byte);
var i1:byte;
    c1:real;
begin
for i:=1 to n1 do begin
c1:=a1[i1];
a1[i1]:=b1[i1];
b1[i1]:=c1;
end;
end;
procedure mutq(b2:vec;m2:byte);
var j2:byte;
begin
for j2:=1 to m2 do
readln(b2[j2]);
end;
begin
write('n=');readln(n);
write('m=');readln(m);
for i:=1 to n do
for j:=1 to m do begin
write('a[',i,j,']=');readln(a[i,j]);
end;
for j:=m div 2 to 1 do begin
for i:=1 to n do begin
k[i]:=a[i,j];
d[i]:=a[i,m-j];
end;
sev(k,d,n);
for i:=1 to n do  begin
a[i,j]:=k[i];
a[i,m-j]:=d[i];
end;
end;
for i:=1 to n do
for j:=1 to m do writeln('a[',i,j,']=',a[i,j]:3);
end.