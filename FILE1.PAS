uses crt;
var f:file of string;
i,j,k:integer;
x,y,z:string;
begin randomize;
x:='asssssssssssdsdghdafjfdakfgkdasghfljkdhafjkdhfkjfahflkdh';
y:='sdajkggaklfdsjdfklsajg;sdfjkgfdkhgskfdhkkkhskhshk';
z:='hkljhalkghjfhjgfkaghkjlfghkljfghkljfdhgl;sfghkl;fsdglkg';
assign(f,'c:\tp\Sedrak.set');
rewrite(f);
for i:=1 to 30000 do
for i:=1 to 30000 do write(f,x,y,z);
close(f);
end.




