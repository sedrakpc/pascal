var f:text;s:string;
begin
assign(f,'sam.sys');rewrite(f);
readln(s);writeln(f,s);
s:='pentium';writeln(f,s);
close(f);end.