uses crt;
var ch:char;
begin
repeat
ch:=readkey;
writeln(ord(ch));
until ch=#27;
end.