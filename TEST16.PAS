uses dos,crt;
var ch:char;
regs:registers;
ext:boolean;
function exreadkey(var extended_code:boolean):char;
begin
regs.ah:=$10;
intr($16,regs);
extended_code:=(regs.al=0) or (regs.al>127);
if keypressed then
exreadkey:=chr(regs.ah)
else
exreadkey:=chr(regs.al);
end;
begin
repeat
ch:=exreadkey(ext);
writeln(ch,' ',ext,' ',ord(ch))
until ch=#27;
end.
