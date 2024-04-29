uses crt,graph;
var gd,gm,size:integer;
p:pointer;
begin
gd:=detect;
initgraph(gd,gm,'');
if graphresult<>0 then begin
write('Error');readln end;
setcolor(4);cleardevice;
line(200,200,200,190); line(200,190,210,180); line(210,180,270,180);
line(270,180,280,190); line(280,190,280,200); line(280,200,200,200);
line(280,190,200,190); line(210,180,210,130); line(210,130,270,130);
line(270,130,270,180); line(210,130,200,120); line(200,120,200,100);
line(200,100,210,100); line(210,100,210,110); line(210,110,220,120);
line(220,120,230,110); line(230,110,230,100); line(230,100,250,100);
line(250,100,250,110); line(250,110,260,120); line(260,120,270,110);
line(270,110,270,100); line(270,100,280,100); line(280,100,280,120);
line(280,120,270,130);
readln
end.