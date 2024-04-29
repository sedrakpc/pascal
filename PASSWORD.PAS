uses crt;
label 1,2;
var s1,hc,s2:string;i,j:byte;
ch,ww:char;
f1:text;
begin j:=0;assign(f1,'pas.txt');reset(f1);
1:textmode(co80);highvideo;s2:='';
textbackground(0);textcolor(green);clrscr;s1:='';gotoxy(15,10);
write('enter current password:');
for i:=1 to 6 do
begin
ch:=readkey;gotoxy(37+i,10);write('*');
s1:=s1+ch;
end;
readkey;
s2:='';assign(f1,'pas.txt');reset(f1);
readln(f1,s2);
if s1=s2 then
begin
clrscr; gotoxy(15,10);write('enter new password:');rewrite(f1);
for i:=1 to 6 do
begin
ww:=readkey;gotoxy(33+i,10);
write('*');write(f1,ww);
end ;
readkey;
close(f1);
end
else
begin clrscr;gotoxy(15,10);
write('password is wrong');j:=j+1;delay(60000);
delay(60000);delay(60000);
if j<3 then goto 1
else  goto 2;end;

2:end.