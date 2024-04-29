Program X_And_O;
uses crt,graph,dos,mouse;
const ocur:array[0..1,0..15] of word=(
($f87f,$e01f,$c78f,$8fc7,
$9fe7,$1fe3,$1fe3,$3fe3,
$3ff3,$1fe3,$1fe3,$9fe7,
$8fc7,$c78f,$e01f,$f87f),
($0780,$1fe0,$3870,$7038,
$6018,$e01c,$e01c,$c00c,
$c00c,$e01c,$e01c,$6018,
$7038,$3870,$1fe0,$0780));
masks:array[0..1,0..15] of word=(
($e1ff,$edff,$edff,$edff,
$edff,$ec00,$edb6,$edb6,
$0db6,$6ffe,$6ffe,$6ffe,
$7fee,$7fee,$7fee,$0000),
($1e00,$1200,$1200,$1200,
$1200,$13ff,$1249,$1249,
$f249,$9001,$9001,$9001,
$8001,$8001,$8001,$ffff));
arow:array[0..1,0..15] of word=(
($7fff,$3fff,$1fff,$0fff,
$07ff,$03ff,$01ff,$00ff,
$07ff,$27ff,$73ff,$f3ff,
$f9ff,$f9ff,$ffff,$ffff),
($8000,$c000,$e000,$f000,
$f800,$fc00,$fe00,$ff00,
$f800,$d800,$8c00,$0c00,
$0600,$0600,$0000,$0000));
var name:string;mouse_ok:boolean;
x,y:word;button:byte;
procedure numlock;
var pp:byte;
begin
pp:=mem[0040:$0017] and $df;
mem[0040:$0017]:=pp;
end;
{$i init.set}
{$i entname.set}
{procedure cursor(x,y:integer;color:byte);
begin
setcolor(color);
setfillstyle(1,color);
bar(x,y,x+112,y+92);
end;}
begin
init;
reset_mouse(mouse_ok,button);
if not mouse_ok then halt;
set_graph_cursor_shape(0,0,@ocur);
entname(Name);
delay(1000);
setcolor(1);setfillstyle(1,8);
bar(149,99,491,381);
setcolor(4);
rectangle(149,99,491,381);
line(263,100,263,380);
line(377,100,377,380);
line(149,193,491,193);
line(149,287,491,287);
setcolor(10);
settextstyle(0,0,2);
outtextxy(3,440,'¦ˆª¨®”');
show_cursor;
repeat
get_mouse_status(button,x,y);
if (x<149) or (x>491) or (y<99) or (y>381) then  begin
hide_cursor;
set_graph_cursor_shape(0,0,@arow);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x>149) and (x<491) and (y>99) and (y<381);
hide_cursor;
set_graph_cursor_shape(0,0,@ocur);
show_cursor;
end;
get_mouse_status(button,x,y);
if (x>149) and (x<263) and (y>99) and (y<193)
then begin
hide_cursor;
setcolor(2);rectangle(150,100,262,192);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<149) or (x>263) or (y<99) or (y>193);
hide_cursor;
setcolor(8);rectangle(150,100,262,192);show_cursor;
end;
get_mouse_status(button,x,y);
if (x>263) and (x<377) and (y>99) and (y<193)
then begin
hide_cursor;
setcolor(2);rectangle(264,100,376,192);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<263) or (x>377) or (y<99) or (y>193);
hide_cursor;
setcolor(8);rectangle(264,100,376,192);;show_cursor;
end;
get_mouse_status(button,x,y);
if (x>377) and (x<491) and (y>99) and (y<193)
then begin
hide_cursor;
setcolor(2);rectangle(378,100,490,192);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<377) or (x>491) or (y<99) or (y>193);
hide_cursor;
setcolor(8);rectangle(378,100,490,192);;show_cursor;
end;
{///////////////////\\\\\\\\\\\\\\\\\}
get_mouse_status(button,x,y);
if (x>149) and (x<263) and (y>193) and (y<287)
then begin
hide_cursor;
setcolor(2);rectangle(150,194,262,286);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<149) or (x>263) or (y<193) or (y>287);
hide_cursor;
setcolor(8);rectangle(150,194,262,286);show_cursor;
end;
get_mouse_status(button,x,y);
if (x>263) and (x<377) and (y>193) and (y<287)
then begin
hide_cursor;
setcolor(2);rectangle(264,194,376,286);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<263) or (x>377) or (y<193) or (y>287);
hide_cursor;
setcolor(8);rectangle(264,194,376,286);;show_cursor;
end;
get_mouse_status(button,x,y);
if (x>377) and (x<491) and (y>193) and (y<287)
then begin
hide_cursor;
setcolor(2);rectangle(378,194,490,286);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<377) or (x>491) or (y<193) or (y>287);
hide_cursor;
setcolor(8);rectangle(378,194,490,286);;show_cursor;
end;
{////////////////////\\\\\\\\\\\\\\\\\}
get_mouse_status(button,x,y);
if (x>149) and (x<263) and (y>287) and (y<381)
then begin
hide_cursor;
setcolor(2);rectangle(150,288,262,380);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<149) or (x>263) or (y<287) or (y>381);
hide_cursor;
setcolor(8);rectangle(150,288,262,380);show_cursor;
end;
get_mouse_status(button,x,y);
if (x>263) and (x<377) and (y>287) and (y<381)
then begin
hide_cursor;
setcolor(2);rectangle(264,288,376,380);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<263) or (x>377) or (y<287) or (y>381);
hide_cursor;
setcolor(8);rectangle(264,288,376,380);;show_cursor;
end;
get_mouse_status(button,x,y);
if (x>377) and (x<491) and (y>287) and (y<381)
then begin
hide_cursor;
setcolor(2);rectangle(378,288,490,380);
show_cursor;
repeat
get_mouse_status(button,x,y);
until (x<377) or (x>491) or (y<287) or (y>381);
hide_cursor;
setcolor(8);rectangle(378,288,490,380);;show_cursor;
end;
until keypressed;
end.
