uses graph,crt;
{$i asd.pas}
begin
asd;
repeat
putpixel(random(640),random(480),random(16));delay(500);
until keypressed;
end.