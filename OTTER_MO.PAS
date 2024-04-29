uses crt,graph,mouse;
const masks:array[0..1,0..15] of word=(
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
ocur:array[0..1,0..15] of word=(
($f87f,$e01f,$c78f,$8fc7,
$9fe7,$1fe3,$1fe3,$3fe3,
$3ff3,$1fe3,$1fe3,$9fe7,
$8fc7,$c78f,$e01f,$f87f),
($0780,$1fe0,$3870,$7038,
$6018,$e01c,$e01c,$c00c,
$c00c,$e01c,$e01c,$6018,
$7038,$3870,$1fe0,$0780));
var adres:pointer;size:word;
bool:boolean;button:byte;
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
begin
init;
setbkcolor(0);
show_cursor;
get_mouse_state_size(size);
getmem(adres,size);
save_mouse_driver_state(adres);
readln;
hide_cursor;
set_graph_cursor_shape(4,0,@arow);
show_cursor;
readln;
hide_cursor;
set_graph_cursor_shape(4,0,@ocur);
show_cursor;
readln;
set_graph_cursor_shape(4,0,@masks);
show_cursor;
readln;
hide_cursor;
reset_mouse(bool,button);
restore_mouse_driver_state(adres);
show_cursor;
readln
end.