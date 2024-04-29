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
line(280,190,200,190); line(220,180,230,170); line(230,170,230,140);
line(230,140,250,140); line(250,140,250,170); line(250,170,260,180);
line(230,140,220,130); line(220,130,220,110); line(220,110,230,100);
line(230,100,250,100); line(250,100,260,110); line(260,110,260,130);
line(260,130,250,140);
size:=imagesize(100,100,280,200);
getmem(p,size);
getimage(100,100,280,200,p^);
putimage(300,300,p,);
readln
end.