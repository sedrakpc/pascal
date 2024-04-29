Program X_And_O;
uses crt,graph,dos;
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
{[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]}
procedure Entname;
var s,s1,s2:string;ch:char;i:byte;
Tar:set of char;
begin
setbkcolor(1);
setcolor(2);setfillstyle(1,2);
bar(220,190,420,250);
setcolor(1);setfillstyle(1,1);
bar(260,220,370,240);
setcolor(4);
outtextxy(235,200,'¦¯óí÷…ï‰÷ ¡‰ï «¯ó«');
i:=0;
tar:=['a'..'z','A'..'Z','_'];
s:='';s1:='';
setcolor(7);setfillstyle(1,7);
bar(262,225,310,238);setcolor(4);
outtextxy(265,230,'€«¯ó«');
s2:='€«¯ó«';
repeat
ch:=readkey;
if (ch=#13) and (s2='€«¯ó«') then break else s2:='';
if (ch in tar) and (i<=12) then begin s:=s+ch;i:=i+1 end;
if (ch=#8) and (i>0) then begin s1:=copy(s,1,length(s)-1);s:=s1;i:=i-1 end;
setcolor(1);setfillstyle(1,1);
bar(260,220,370,240);setcolor(4);
outtextxy(265,230,s);
until (ch=#13) and (i>0);
end;
begin
init;
entname;
readln
end.
