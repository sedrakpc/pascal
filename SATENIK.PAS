program s_1;
type zang=array[1..6,1..6] of integer;
type vec=array[1..6] of integer;
var m,n,k,j,i,jj:integer;  a:zang;b:vec;
{----------------------------------------------}
procedure pox(var a1:integer;var b1:integer);
var k1:integer;
 begin
k1:=b1; b1:=a1; a1:=k1;
end;

procedure vek(n2:integer; var b2:vec);
var j:integer;
begin
for j:=1 to n2 do begin
write('b2[',j,']='); read(b2[j]);
end;                 end;

begin
repeat write('m=');readln(m); write('n=');  readln(n)
until (n>=2)and(n<=6)and(m>=2)and(m<=6);
repeat write('k=');readln(k); write('jj=');readln(jj)
until(k>=1)and(k>jj)and(jj<=m);

for i:=1 to m do
begin
vek(n,b);
for j:=1 to n do
a[i,j]:=b[j];end;
for j:=1 to n do
pox(a[i,jj],a[i,k]);
for i:= 1 to m do
for j:=1 to n do
 write  ( a[i,j] );end.


