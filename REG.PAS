program seto;
uses dos,crt;
var r:Registers;
begin
intr($12,r);
writeln(r.ax);
readln
end.