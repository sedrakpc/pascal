program Tato;
uses crt,graph;
var i:byte;
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
{\\\\\\\\\\\\\\\\\\////////////////}
procedure nkar1(x,y:integer;color:byte);
begin
setfillstyle(1,color);
setcolor(color);
bar(x+35,y+8,x+45,y+62);
bar(x+25,y+30,x+35,y+35);bar(x+20,y+25,x+30,y+30);
bar(x+15,y+20,x+25,y+25);bar(x+20,y+15,x+30,y+20);
bar(x+25,y+10,x+35,y+15);bar(x+45,y+10,x+55,y+15);
bar(x+50,y+15,x+60,y+20);bar(x+55,y+20,x+65,y+25);
bar(x+45,y+35,x+55,y+40);bar(x+50,y+40,x+60,y+45);
bar(x+55,y+45,x+65,y+50);bar(x+50,y+50,x+60,y+55);
bar(x+45,y+55,x+55,y+60);bar(x+25,y+55,x+35,y+60);
bar(x+20,y+50,x+30,y+55);bar(x+15,y+45,x+25,y+50);
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure nkar2(x,y:integer;color:byte);
begin
setfillstyle(1,color);
setcolor(color);
line(x+35,y+60,x+45,y+60);line(x+35,y+60,x+35,y+40);
line(x+45,y+60,x+45,y+40);line(x+15,y+40,x+35,y+40);
line(x+45,y+40,x+65,y+40);line(x+65,y+40,x+40,y+15);
line(x+15,y+40,x+40,y+15);floodfill(x+40,y+35,color);
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure nkar3(x,y:integer;color:byte);
begin
setcolor(8);setfillstyle(1,8);
line(x+10,y+35,x+40,y+10);line(x+40,y+10,x+70,y+35);
line(x+70,y+35,x+40,y+60);line(x+10,y+35,x+40,y+60);
line(x+15,y+35,x+40,y+15);line(x+40,y+15,x+65,y+35);
line(x+65,y+35,x+40,y+55);line(x+15,y+35,x+40,y+55);
floodfill(x+12,y+35,8);
setfillstyle(1,color);floodfill(x+40,y+35,8);
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure nkar4(x,y:integer;color:byte);
begin
setcolor(0);setfillstyle(1,14);
circle(x+40,y+35,30);circle(x+40,y+35,29);
floodfill(x+40,y+35,0);setfillstyle(1,0);
circle(x+25,y+25,3);floodfill(x+25,y+25,0);
circle(x+55,y+25,3);floodfill(x+55,y+25,0);
ellipse(x+40,y+30,230,310,20,20);
ellipse(x+40,y+30,230,310,30,16);
floodfill(x+40,y+47,0);
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure nkar5(x,y:integer;color:byte);
begin
setcolor(1);setfillstyle(1,1);
ellipse(x+40,y+35,110,340,30,30);
ellipse(x+50,y+25,140,310,27,27);
floodfill(x+20,y+35,1);
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure block(x,y:integer);
begin
setfillstyle(1,14);
setcolor(2);
rectangle(x,y,x+80,y+70);floodfill(x+1,y+1,2);
line(x-5,y+5,x,y);line(x-5,y+75,x,y+70);
line(x-5,y+5,x-5,y+75);floodfill(x-3,y+30,2);
line(x+75,y+75,x+80,y+70);line(x-5,y+75,x+75,y+75);
floodfill(x+30,y+72,2);
end;
procedure blocks;
begin
           {                  Bloks                      }
block(180,100);block(280,100);block(380,100);
block(180,190);block(280,190);block(380,190);
block(180,290);block(280,290);block(380,290);
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
procedure deg(x,y:integer;nkar,col:byte);
var j:word;
begin
setfillstyle(1,15);floodfill(x+1,y+1,2);
for j:=1 to 9 do begin
case nkar of
1:nkar1(x,y,col);
2:nkar2(x,y,col);
3:nkar3(x,y,col);
4:nkar4(x,y,col);
5:nkar5(x,y,col);
end;
setfillstyle(1,14);
bar(x+1,y+1,x+80-8*j,y+70-7*j);delay(60000-j*3000);
setfillstyle(1,15);
bar(x+1,y+1,x+79,y+69) end;
case nkar of
1:nkar1(x,y,col);
2:nkar2(x,y,col);
3:nkar3(x,y,col);
4:nkar4(x,y,col);
5:nkar5(x,y,col);
end;
end;
procedure degback(x,y:integer;nkar,col:byte);
var j:byte;
begin
for j:=9 downto 1 do begin
case nkar of
1:nkar1(x,y,col);
2:nkar2(x,y,col);
3:nkar3(x,y,col);
4:nkar4(x,y,col);
5:nkar5(x,y,col);
end;
setfillstyle(1,14);
bar(x+1,y+1,x+80-8*j,y+70-7*j);delay(60000-j*2000);
setfillstyle(1,15);
bar(x+1,y+1,x+79,y+69) end;
setfillstyle(1,14);
bar(x+1,y+1,x+79,y+69)
end;


procedure start;
var ch,ch1,ch2,ch3:char;b,c,co:array[1..9] of byte;
b1,b2,b3,bc1,bc2,bc3,count,i,a1,a2,a3:byte;t,t1:boolean;
x:integer;
begin
randomize;
for i:=1 to 3 do c[i]:=random(13)+1;
b1:=random(5)+1;
repeat b2:=random(5)+1;
until b2<>b1;
repeat b3:=random(5)+1;
until (b3<>b1) and (b3<>b2);
bc1:=0;bc2:=0;bc3:=0;
for i:=1 to 9 do begin
repeat t:=false;
case random(3)+1 of
1:begin if bc1<3 then begin b[i]:=b1;bc1:=bc1+1;t:=true end;end;
2:begin if bc2<3 then begin b[i]:=b2;bc2:=bc2+1;t:=true end;end;
3:begin if bc3<3 then begin b[i]:=b3;bc3:=bc3+1;t:=true end;end;
end;
until t=true;
end;
repeat
count:=0;
repeat
ch:=readkey;
count:=count+1;
case count of
1:begin ch1:=ch;val(ch,a1,x);end;
2:begin ch2:=ch;val(ch,a2,x);end;
3:begin ch3:=ch;val(ch,a3,x);end;
end;
if (count=2) then begin  blocks;
case ch3 of
#49:deg(180,290,b[a2],co[a2]);
#50:deg(280,290,b[a2],co[a2]);
#51:deg(380,290,b[a2],co[a2]);
#52:deg(180,190,b[a2],co[a2]);
#53:deg(280,190,b[a2],co[a2]);
#54:deg(380,190,b[a2],co[a2]);
#55:deg(180,100,b[a2],co[a2]);
#56:deg(280,100,b[a2],co[a2]);
#57:deg(380,100,b[a2],co[a2]);
end;

end
else
if (count=3) and ((b[a1]<>b[a2]) or (b[a2]<>b[a3])) then
begin
case ch1 of
#49:degback(180,290,b[a1],co[a1]);
#50:degback(280,290,b[a1],co[a1]);
#51:degback(380,290,b[a1],co[a1]);
#52:degback(180,190,b[a1],co[a1]);
#53:degback(280,190,b[a1],co[a1]);
#54:degback(380,190,b[a1],co[a1]);
#55:degback(180,100,b[a1],co[a1]);
#56:degback(280,100,b[a1],co[a1]);
#57:degback(380,100,b[a1],co[a1]);
end;
case ch2 of
#49:degback(180,290,b[a2],co[a2]);
#50:degback(280,290,b[a2],co[a2]);
#51:degback(380,290,b[a2],co[a2]);
#52:degback(180,190,b[a2],co[a2]);
#53:degback(280,190,b[a2],co[a2]);
#54:degback(380,190,b[a2],co[a2]);
#55:degback(180,100,b[a2],co[a2]);
#56:degback(280,100,b[a2],co[a2]);
#57:degback(380,100,b[a2],co[a2]);
end;end;
case ch of
#49:begin if b[1]=b1 then co[1]:=c[1];if b[2]=b2 then co[1]:=c[2];
if b[3]=b3 then co[1]:=c[3];deg(180,290,b[1],co[1]);end;
#50:begin if b[2]=b1 then co[2]:=c[1];if b[2]=b2 then co[2]:=c[2];
if b[2]=b3 then co[2]:=c[3];deg(280,290,b[2],co[1]);end;
#51:begin if b[3]=b1 then co[3]:=c[1];if b[3]=b2 then co[3]:=c[2];
if b[3]=b3 then co[3]:=c[3];deg(380,290,b[3],co[3]);end;
#52:begin if b[4]=b1 then co[4]:=c[1];if b[4]=b2 then co[4]:=c[2];
if b[4]=b3 then co[4]:=c[3];deg(180,190,b[4],co[4]);end;
#53:begin if b[5]=b1 then co[5]:=c[1];if b[5]=b2 then co[5]:=c[2];
if b[5]=b3 then co[5]:=c[3];deg(280,190,b[5],co[5]);end;
#54:begin if b[6]=b1 then co[6]:=c[1];if b[6]=b2 then co[6]:=c[2];
if b[6]=b3 then co[6]:=c[3];deg(380,190,b[6],co[6]);end;
#55:begin if b[7]=b1 then co[7]:=c[1];if b[7]=b2 then co[7]:=c[2];
if b[7]=b3 then co[7]:=c[3];deg(180,100,b[7],co[7]);end;
#56:begin if b[8]=b1 then co[8]:=c[1];if b[8]=b2 then co[8]:=c[2];
if b[3]=b3 then co[8]:=c[3];deg(280,100,b[8],co[8]);end;
#57:begin if b[9]=b1 then co[9]:=c[1];if b[9]=b2 then co[9]:=c[2];
if b[9]=b3 then co[9]:=c[3];deg(380,100,b[9],co[9]);end;
end
until (count=3) or (ch=#27)
until ch=#27;
end;
                     {\\\\\\\\\\\\\\\\\\////////////////}
begin init;cleardevice;
setbkcolor(1);blocks;
start;
end.




































