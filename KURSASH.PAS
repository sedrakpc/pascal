type ham=array[1..20,1..20] of integer;
     vec=array[1..20] of integer;
     tat=array[1..20,1..20] of integer;
     var a2:ham;
     b:vec;
     a:tat;
     i,j,i1,j1,n,m,k1,i2,j2,k,l:integer;
     min,max,s:integer;
     t:byte;
    function qan(b1:vec;n1:integer;a1:real):byte;
    begin
    k1:=0;
    for i1:=1 to n1 do
    if b1[i1]=a1 then k1:=k1+1;
    qan:=k1
    end;
   procedure han(a2:tat;n2,m2:integer;c2:integer;var l2:byte);
   begin
   for i2:=1 to n2 do
   for j2:=1 to m2 do
   if a2[i2,j2]=c2 then l2:=j2;
   end;
begin
write('n=');read(n);
write('m=');read(m);
for i:=1 to n do
for j:=1 to m do
begin
write('a[',i,j,']=');readln(a[i][j]); end ;
max:=a[1,1];
for i:=1 to n do
for j:=1 to m do
if a[i,j]>max then begin max:=a[i,j];
end;
min:=a[1,1];
for i:=1 to n do
for j:=1 to m do
if a[i,j]<min then begin min:=a[i,j];
end;
for i:=1 to n do  begin
for j:=1 to m do
b[i]:=a[i,j];
l:=qan(b,n,min);
if l=1 then begin k:=j;break;end
end;
han(a,n,m,max,t);
for i:=1 to n do
begin
s:=a[i,l];
a[i,l]:=a[i,t];
a[i,t]:=s;
end;
writeln;
for i:=1 to n do
for j:=1 to m do
writeln(a[i,j]);
readln
end.