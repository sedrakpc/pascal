var m : integer;
function isPrime(n : integer) : boolean;
var k,t : integer;
begin
if not odd(n) then begin
isPrime := (n = 2); exit;
end;
k := 3;
t := round(sqrt(n));
while (k <= t) and (n mod k <> 0) do inc(k,2);
isPrime := k > t;
end;
begin
readln(m);
writeln(isPrime(m));
readln;
end.