{$s+}
program gcd;
uses crt;
var
n,m,nn,mm:longint;
depth:word;
function gcd_rec(m,n:longint):longint;
begin inc(depth);
if n=0 then gcd_rec:=m
else if m<n then gcd_rec:=gcd_rec(n,m)
else gcd_rec:=gcd_rec(m-n,n);
end;
begin
clrscr;
depth:=0;
write('A=');readln(mm);
write('B=');readln(nn);
write('Amenamet @ndanur bashanararn=',gcd_rec(mm,nn));
gotoxy(39,50);
readln
end.