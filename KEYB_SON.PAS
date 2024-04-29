uses crt,dos;
var
k_s_b:byte absolute $40:$17;
num,caps,scroll:boolean;
old_num,old_caps,old_scroll:boolean;
loop,j:byte;
k:integer;
const
max=51;
procedure get_leds_status(var n,c,s:boolean);
begin
s:=true;
if (k_s_b and $10)=0 then s:=false;
n:=true;
if (k_s_b and $20)=0 then n:=false;
c:=true;
if (k_s_b and $40)=0 then c:=false;
end;
procedure set_leds_status(var n,c,s:boolean);
var
reg:registers;
begin
if s then
k_s_b:=k_s_b or $10
else k_s_b:=k_s_b and not $10;
if n then
k_s_b:=k_s_b or $20
else k_s_b:=k_s_b and not $20;
if c then
k_s_b:=k_s_b or $40
else k_s_b:=k_s_b and not $40;
reg.ax:=$0200;
intr($16,reg);
end;
procedure keyb_song(tone:integer;j:byte);
const
melody:array[0..max,1..2] of integer=(
(0,     0),(1046,200),(1046,200),(1174,400),(1046,400),
(1398,400),(1318,800),(1046,200),(1046,200),(1174,400),
(1046,400),(1568,400),(1398,800),(1046,200),(1046,200),
(2092,400),(1760,400),(1398,400),(1318,400),(1174,800),
(1864,200),(1864,200),(1760,400),(1398,400),(1568,400),
(1398,800),(1046,200),(1046,200),(1174,400),(1046,400),
(1398,400),(1318,800),(1046,200),(1046,200),(1174,400),
(1046,400),(1568,400),(1398,800),(1046,200),(1046,200),
(2092,400),(1760,400),(1398,400),(1318,400),(1174,800),
(1864,200),(1864,200),(1760,400),(1398,400),(1568,400),
(1398,800),(0,    0));
begin
sound(melody[tone][1]);
delay(melody[tone][2]);
delay(60000);
delay(10000);
if melody[tone][2]=400 then delay(50000)
else
if melody[tone][2]=600 then delay(15000)
else
if melody[tone][2]=800 then delay(60000);
{if j=7 then delay(60000); }
nosound;
end;
begin
get_leds_status(old_num,old_caps,old_scroll);
num:=false;
caps:=false;
scroll:=false;
loop:=0;
k:=0;j:=0;
randomize;
repeat
keyb_song(k,j);
j:=j+1;
if j>7 then j:=0;
k:=(k+1) mod max;
loop:=random(4);
case loop of
0:scroll:=false;
1:num:=true;
2:begin
num:=false;
caps:=true;
end;
3:begin
caps:=false;
scroll:=true;
end;
end;
set_leds_status(num,caps,scroll);
until keypressed;
set_leds_status(old_num,old_caps,old_scroll);
end.