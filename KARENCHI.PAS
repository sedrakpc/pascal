uses crt,graph;
var i,j,r,d,x,y:integer;
procedure klor(x:integer;y:integer;r:integer;col:word;line_col:word);
begin
 setcolor(col);
 setfillstyle(1,col);
 pieslice(x,y,0,360,r);
 setcolor(line_col);
 circle(x,y,r);
end;
begin
 clrscr;
 d:=detect;
 initgraph(d,r,'');
 if graphresult<>grOk then
 begin write(graphErrorMsg(Graphresult)); halt end;
 setbkcolor(white);
 x:=getmaxx div 2;
 y:=getmaxy div 2;
 r:=50;
 klor(x-r+5,y+2*r+15,20,0,7);   {left leg}
 klor(x,y+r+23,r+15,0,7);       {bottom}
 klor(x+r,y+2*r+25,20,0,7);     {right leg}
 klor(x-r+5,y-15,15,0,7);       {left hand}
 klor(x,y,r,0,7);               {middle}
 klor(x,y-r-20,r-15,0,7);       {head}
 setfillstyle(1,6);
 pieslice(x-r+2,y-r+15,30,40,r);{nose}
 klor(x+7,y-r-23,5,8,0);        {right eye}
 klor(x-17,y-r-25,5,8,0);       {left eye}
 {------Caxavel-----}
 moveto(x+r,y+2*r+50);
 setcolor(8);
 setlinestyle(0,0,3);
 lineto(x+r,y-2*r-35);
 moveto(x+r,y-2*r);
 lineto(x+r+16,y-2*r-25);
 moveto(x+r,y-2*r+10);
 lineto(x+r-20,y-2*r-15);
 {-------------------}
 setlinestyle(0,0,1);
 klor(x+r,y,15,0,7);            {right hand}
 repeat
  for i:=1 to 25 do
  for j:=1 to 25 do
  begin
   setcolor(7);
   if odd(i) then
    outtextxy(25*i-15,25*j-15,'*')
   else outtextxy(25*i-15,25*j-5,'*')
  end;
 delay(10000);
 for i:=1 to 25 do
  for j:=1 to 25 do
  begin
   setcolor(0);
   if odd(i) then
    outtextxy(25*i-15,25*j-15,'*')
   else outtextxy(25*i-15,25*j-5,'*')
  end;
 {for i:=1 to 5 do
 delay(50000);}
 for i:=1 to 25 do
  for j:=1 to 25 do
  begin
   setcolor(7);
   if odd(i) then
    outtextxy(25*i-15,25*j-5,'*')
   else outtextxy(25*i-15,25*j-15,'*')
  end;
  delay(10000);
 for i:=1 to 25 do
  for j:=1 to 25 do
  begin
   setcolor(0);
   if odd(i) then
    outtextxy(25*i-15,25*j-5,'*')
   else outtextxy(25*i-15,25*j-15,'*')
  end;
 until keypressed;
 readln;
 closegraph;
end.