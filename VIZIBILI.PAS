uses crt,graph;
label 1;
var k:byte;ch:char;
procedure init;
var GD,GM,EC:integer;
begin
GD:=detect;
initgraph(GD,GM,'c:\bp\bgi');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
end;
procedure vpage(x,y:integer;v,color,b:byte);
begin
setlinestyle(0,0,1);
setcolor(15);
rectangle(x,y,x+120,y+160);
case v of
1:begin
line(x,y,x-10,y);
line(x-10,y,x-15,y+5);
line(x-15,y+5,x-15,y+40);
line(x-15,y+40,x,y+45);
setfillstyle(1,color);
floodfill(x-10,y+10,15);
end;
2:begin
if v=b then begin
line(x,y+40,x-10,y+40);
line(x-10,y+40,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);
end
else begin
line(x-12,y+42,x-15,y+45);
line(x-15,y+45,x-15,y+80);
line(x-15,y+80,x,y+85);  end;
setfillstyle(1,color);
floodfill(x-10,y+60,15);
end;
3:begin
if v=b then begin
line(x,y+80,x-10,y+80);
line(x-10,y+80,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
end
else begin
line(x-12,y+82,x-15,y+85);
line(x-15,y+85,x-15,y+120);
line(x-15,y+120,x,y+125);
end;
setfillstyle(1,color);
floodfill(x-10,y+105,15);
end;
4: begin
if v=b then begin
line(x,y+120,x-10,y+120);
line(x-10,y+120,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
end
else begin
line(x-12,y+122,x-15,y+125);
line(x-15,y+125,x-15,y+155);
line(x-15,y+155,x,y+160);
end;
setfillstyle(1,color);
floodfill(x-10,y+145,15);
end;

end;
end;
begin
init;
k:=1;
repeat
1:case k of
1:begin
vpage(260,170,1,4,1);
vpage(260,170,2,1,0);
vpage(260,170,3,1,0);
vpage(260,170,4,1,0);
end;
2:begin
vpage(260,170,2,4,1);
vpage(260,170,1,1,0);
vpage(260,170,3,1,0);
vpage(260,170,4,1,0);
end;
3:begin
vpage(260,170,3,4,1);
vpage(260,170,1,1,0);
vpage(260,170,2,1,0);
vpage(260,170,4,1,0);
end;
4:begin
vpage(260,170,4,4,1);
vpage(260,170,1,1,0);
vpage(260,170,2,1,0);
vpage(260,170,3,1,0);
end;
end;
repeat
ch:=readkey
until (ch=#72) or (ch=#80) or (ch=#27) or (ch=#13);
case ch of
#72:k:=k-1;
#80:k:=k+1;
end;
if (k=4) and (ch=#13) then halt;
if k<1 then k:=4;
if k>4 then k:=1;
delay(5000)
until ch=#27;
readln
end.
