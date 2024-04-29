program life;
uses crt,graph,dos;
const
   hor=100;
   ver=70;
   cell_width=8;
   cell_height=6;
   prob_factor=0.5;
var
   old_gen,new_gen:array[0..ver,0..hor] of 0..1;
   prob:real;
   ch:char;
   x_center:array[0..hor] of word;
   y_center:array[0..ver] of word;
   gen_count,radius,page:word;
   ss:string[10];
procedure init_cells;
var
   j,k:word;
begin
   gen_count:=0;
   for j:=0 to ver do
          for k:=0 to hor do
          begin
                old_gen[j,k]:=0;
                if random <= prob then
                  new_gen[j,k]:=1
                else
                  new_gen[j,k]:=0;
end;
end;
procedure next_generation;
var j,k,m,prev_j,next_j,prev_k,next_k:word;
begin
old_gen:=new_gen;
       for j:=0 to ver do
       begin
       if j=0 then
       prev_j:=ver
       else prev_j:=j-1;
       if j=ver then next_j:=0
       else next_j:=j+1;
       for k:=0 to hor do
       begin
           if k=0 then
           prev_k:=ver
           else prev_k:=k-1;
           if k=hor then next_k:=0
           else next_k:=k+1;
             m:=old_gen[prev_j,prev_k]+
             old_gen[prev_j,k]+
             old_gen[prev_j,next_k]+
             old_gen[j,prev_k]+
             old_gen[j,next_k]+
             old_gen[next_j,prev_k]+
             old_gen[next_j,k]+
             old_gen[next_j,next_k];
             if (old_gen[j,k]=1) and (m<=1) or (m>=4) then
             new_gen[j,k]:=0;
             if (old_gen[j,k]=0) and (m=3) then
             new_gen[j,k]:=1
             else new_gen[j,k]:=old_gen[j,k];
             end;end;end;
procedure init_screen;
var gd,gm:integer;
    j,k:word;
begin
    gd:=vga;gm:=vgamed;
    page:=0;
    initgraph(gd,gm,'');
    if graphresult<>grok then
    halt;
    for k:=0 to hor do
    x_center[k]:=k*cell_width+cell_width div 2;
    for j:=0 to ver do
    y_center[j]:=j*cell_height+cell_height div 2;
    radius:=4;
    end;
procedure display;
var j,k:word;
procedure rule_plane;
var j,k:word;
begin
setviewport(0,0,getmaxx,getmaxy,clipon);
setfillstyle(solidfill,blue);
bar(0,0,getmaxx,10);
setcolor(white);
outtext('Generation: ');
outtextxy(250,0,'Q: Quit');
outtextxy(450,0,'Any other key: renew');
str(gen_count,ss);outtext(ss);
setbkcolor(darkgray);
end;
begin
if gen_count<>0 then
next_generation;
inc(gen_count);
page:=1-page;
setactivepage(page);
cleardevice;
setcolor(yellow);
for j:=0 to ver do
for k:=0 to hor do
if new_gen[j,k]=1 then
circle(x_center[k],y_center[j],radius);
rule_plane;
setvisualpage(page);
end;
begin
init_screen;
repeat
       randomize;
       prob:=0.1+prob_factor*random;
       outtextxy(0,0,'conway''s Game of Life');
       writeln;
       outtextxy(0,15,'Life cells inserted at random,');
       str(prob:3:3,ss);
       outtextxy(0,30,'with probability'+ss);
       outtextxy(0,60,'Press any key to start: ');
       ch:=readkey;
       cleardevice;
       init_cells;
       repeat
             display;
             if keypressed then begin
             ch:=readkey;
             break;
             end;
             until false;
             setviewport(0,0,getmaxx,getmaxy,clipon);
             cleardevice;
             setcolor(white);
             if upcase(ch)='Q' then
             break;
             until false;
             closegraph;
             end.

