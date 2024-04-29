program tasho;
var c:char;
begin
repeat
read(c);
writeln(ord(c));
until c = #27;
end.