uses crt;
var x:array[1..20,1..20] of real;
    y:array[1..20] of real;
    i,n,j:byte;
begin
   textbackground(2);clrscr;
repeat  textcolor(4);gotoxy(38,1);write('n=');readln(n)
until (n>=2) and (n<=20);
window(40-3*n,2,40+3*n,2+2*n);textbackground(10);clrscr;
for i:=1 to n do
for j:=1 to n do
begin
  if i>j then textcolor(4) else
  if i=j then textcolor(0) else
                 textcolor(11);
gotoxy(1+6*(j-1),2*i);read(x[i,j]) end;
for i:=1 to n do
begin
    y[i]:=0;
for j:=1 to n do
if x[i,j]>0 then
y[i]:=y[i]+x[i,j]
end;
window(40-3*n,4+2*n,40+3*n,6+2*n);textbackground(10);clrscr;
for i:=1 to n do
begin
gotoxy(1+6*(i-1),2);write(y[i]:5:0)
  end
;
readln;
end.


