program arab_to_roman;
uses crt;
var n:word;ch:char;
procedure convert(n:word);
const no=12;index:array[0..no] of
word=(1,4,5,9,10,40,50,90,100,400,500,900,1000);
strings:array[0..no] of string[2]=
('I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M');
var i:word;
begin
if n=0 then exit;
if keypressed then halt;
if n>=index[no] then begin write(strings[no]);
n:=n-index[no];
end
else
begin
i:=no;
repeat if keypressed then halt;
dec(i);
until (n>=index[i]) and (n<index[i+1]);
write(strings[i]);
n:=n-index[i];end;
convert(n); end;
begin Textmode(3);
repeat clrscr;gotoxy(25,1);
write('Mutqagreq amboxch tiv@>:');readln(n);
gotoxy(35,2);write(n,' = ');convert(n);
gotoxy(4,25);write('For exit press <Q>');
ch:=UpCase(readkey);
if ch='Q' then break;
until False;
end.