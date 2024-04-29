program clock;
var h,m,t : integer;
begin
readln(h,m);
t := 11*(60*h+m) mod 720;
if t <> 0 then t := 720-t;
writeln(t div 11);
readln;
end.