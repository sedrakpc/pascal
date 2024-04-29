uses crt,graph;
const t=1000;
type mat=array[1..10,1..10]of real;
     vec=array[1..10]of real;
var max,min,s,p,pmax,pmin,fe,fr:real;
    b,a,ck,fa:vec;
    xx:mat;
    d,r,e,i,k,j,n,kn,m,h,l,z,cod,u,pop,fi,ft,fk,fs,fp,fl:integer;
    c,pn,pk,pan:char;
    tox,tox1:string;
    f:file of real;


   function fmax(fn:integer;fa:vec):real;
   var fj:integer; max1:real;
   begin max1:=fa[1];
   for fj:=2 to fn do  if fa[fj]>max1 then
   max1:=fa[fj]; fmax:=max1 end;

      function fmin(fn:integer;fa:vec):integer;
      var fi,fk:integer; min:real;
      begin min:=fa[1]; fk:=1;
      for fi:=2 to fn do if fa[fi]<min
      then begin min:=fa[fi];fk:=fi;end;fmin:=fk end;

    procedure menu(a,s,v,d:integer);
     begin
      setcolor(a);outtextxy(290,175,'«‡•ο');
      setcolor(s);outtextxy(285,200,'–―σ›―σ§');
      setcolor(v);outtextxy(287,225,'„―λ‹‡');
      setcolor(d);outtextxy(299,250,'—χ');
     end;

{	      procedure elq(color:integer);
	       begin
		setcolor(color);
		outtextxy(10,470,'—χ• §ο ι‰£§‰χ Esc');
	       end;}

  procedure nist(nista,nistb,nistc:integer);
  begin
   setcolor(14);
   moveto(260,125);lineto(420,125);lineto(400,190);
   lineto(240,190);lineto(260,125);
   moveto(240,190);lineto(250,300);lineto(410,300);lineto(400,190);
   moveto(420,125);lineto(430,235);lineto(410,300);
   setfillstyle(1,nista);floodfill(300,130,14);
   setfillstyle(1,nistb);floodfill(300,280,14);
   setfillstyle(1,nistc);floodfill(420,230,14);
  end;

  procedure kub(kuba,kubb,kubc:integer);
  begin
   setbkcolor(1);setcolor(14);
   bar3d(240,160,400,320,20,true);
   setfillstyle(1,kuba);floodfill(300,150,14);
   setfillstyle(1,kubb);floodfill(300,300,14);
   setfillstyle(1,kubc);floodfill(410,250,14);
  end;
  procedure teq(teqa,teqb,teqc:integer);
  begin
   setcolor(14);
   moveto(250,135);lineto(410,135);lineto(390,250);
   lineto(230,250);lineto(250,135);
   moveto(230,250);lineto(250,310);lineto(410,310);lineto(390,250);
   moveto(410,135);lineto(430,195);lineto(410,310);
   setfillstyle(1,teqa);floodfill(300,150,14);
   setfillstyle(1,teqb);floodfill(300,300,14);
   setfillstyle(1,teqc);floodfill(410,250,14);
  end;
       procedure aa;
       begin
	cleardevice;setbkcolor(7);setcolor(8);
	setlinestyle(0,0,3);
	moveto(180,400);lineto(180,105);
	lineto(435,105);lineto(435,381);
	ellipse(190,400,270,269,10,20);
	ellipse(435,400,270,90,10,20);
	moveto(190,420);lineto(435,420);setlinestyle(0,0,0);
	setcolor(8);
	setfillstyle(1,1);floodfill(200,200,8);
	moveto(190,380);lineto(435,380);
	setfillstyle(1,8);floodfill(190,400,8);
	setcolor(1);ellipse(190,400,270,269,8,18);
	setfillstyle(1,1);floodfill(190,400,1);
	moveto(182,400);lineto(182,384);
	setcolor(8);
	setfillstyle(1,7);floodfill(10,10,8);
	moveto(183,389);lineto(198,389);
	setcolor(1);moveto(180,105);
	lineto(307,70);lineto(435,105);
	setcolor(8);
	setlinestyle(0,0,3);
	moveto(306,74);lineto(313,60);
	pieslice(313,60,1,360,2);
	setcolor(14);
     outtextxy(200,150,' μολ› ‰« n ƒ«« ‘•λ ‰σ ');
     outtextxy(200,160,'nxn νοο γο―σ«―£ z §νο•-');
     outtextxy(200,170,'ρ: ‹§‰— b λ‰ν―ο• ινρ§«');
     outtextxy(200,180,'‰σ ον›§« —…―ο•‘§• ƒ—―-');
     outtextxy(200,190,'ι™‰§« ‰σ ›ο…•ο, ―ο• b[i]-');
     outtextxy(200,200,'ο‡ νοο‰ο λιο ‰« i-ο‡');
     outtextxy(200,210,'ν―£• §‰›…―σ©« ‰σ υ―χο…―σ©«');
     outtextxy(200,220,'νοο‰ο• §•ε‰σ «› νοο‰ο•');
     outtextxy(200,230,'§•ε•« χη―σι©•«•«:');
     outtextxy(200,240,' «‘‡ολ―σ§ , ―ο §‰« §• ν―-');
     outtextxy(200,250,'£―σ§  §•©« §‰ §‰›…―σ©«');
     outtextxy(200,260,'‰σ §‰ υ―χο…―σ©« νοο');
     outtextxy(200,280,' κ‰ν―ο• υ―χο…―σ©« νοο• -');
     outtextxy(200,290,'§ο:');
     outtextxy(200,310,' κ‰ν―ο• §‰›…―σ©« νοο:');
     setcolor(14);
     outtextxy(10,460,'—χ• §ο ι‰£§‰χ Enter');

   repeat c:=readkey;
   until ord(c)=13;
   end;
procedure bb;
 begin
 textmode(3);textbackground(1);clrscr;
 window(24,2,58,2);textbackground(8);clrscr;
 window(23,1,57,1);textbackground(4);clrscr;
 textcolor(14);gotoxy(2,1);
 write('ª‰ο§―σ›‰— §νο•ρ• αυ 2<N<9 N=');
 gotoxy(33,1);clreol;
 pn:=readkey;val(pn,n,kn);
 while (ord(pn)<51)or(ord(pn)>56) do
  begin
   window(5,3,75,4);textbackground(1);clrscr;
   textcolor(14);gotoxy(13,1);
   sound(330);delay(t);nosound;
   write(' ‰ο «‰ο§―σ›› νοο α• ƒλοο―σ§ n-• γ©§«•«');
   readkey;clrscr;
   window(23,1,57,1);textbackground(4);clrscr;
   textcolor(14);gotoxy(2,1);
   write('ª‰ο§―σ›‰— §νο•ρ• αυ 2<n<9 n=');

   pn:=readkey;val(pn,n,kn);end;
   write(n);
   pan:=readkey;
    while ord(pan)<>13 do
     begin if ord(pan)=8 then
      begin
       gotoxy(33,1);clreol;
       pn:=readkey;val(pn,n,kn);
	while (ord(pn)<51)or(ord(pn)>56) do
	 begin
	  window(5,3,75,4);textbackground(1);clrscr;
	  textcolor(14);gotoxy(13,1);
	  sound(330);delay(t);nosound;
	  write(' ‰ο «‰ο§―σ›› νοο α• ƒλοο―σ§ n-• γ©§«•«');
	  readkey;clrscr;

	  pn:=readkey;val(pn,n,kn)
	 end;

	window(23,1,57,1);textbackground(4);clrscr;
	textcolor(14);gotoxy(2,1);
	write('ª‰ο§―σ›‰— §νο•ρ• αυ 2<n<9 n=');
	gotoxy(33,1);
	write(n);
	pan:=readkey
      end
    else pan:=readkey
   end;

  window(18,22,65,25);textbackground(1);clrscr;
  textcolor(9);
  gotoxy(1,1);write('•­‰ρ‰ύχ, ―ο §νο•ρ• ©―σοχ«α©―σο ν―£―σ§ γ‰νχ');
  gotoxy(1,2);write('  —•«• §‰ §‰›…―σ©« ‰σ §‰ υ―χο…―σ©« νοο:');
  window(1,3,79,4);textbackground(1);clrscr;
  textcolor(14);gotoxy(2,1);
  write('¦νο•ρ• νοο‰ο γν«―σ§ ‰« -999.99,999.99 §•ε©χ•« (-999.99<x[i,j]<999.99)');
  window(42-4*n,13-n,42+4*n,13+n);
  textbackground(8);clrscr;
  window(40-4*n,12-n,40+4*n,12+n);
  textbackground(6);clrscr;
  textcolor(1);
  for i:=1 to n do
   repeat
   for j:=1 to n do
    begin
     repeat
      gotoxy(2+8*j-7,2*i);clreol;
      readln(tox);val(tox,xx[i,j],cod);pop:=0;
      if (copy(tox,1,1)='+')
      or(copy(tox,1,1)='.')
      or(copy(tox,length(tox),1)='.')
      or(copy(tox,1,2)='-.')
      or(copy(tox,1,2)='-0')and(copy(tox,3,1)<>'.')
      or(length(tox)>1)and(tox[1]='0')and(copy(tox,1,2)<>'0.')
      or(pos('.',tox)=length(tox)-1)and(copy(tox,pos('.',tox),2)='.0')
      or(pos('.',tox)=length(tox)-2)and(copy(tox,pos('.',tox),3)='.00')
      or(length(tox)>2)and(pos('.',tox)=length(tox)-2)and(copy(tox,(pos('.',tox)+2),1)='0')
      or(pos('.',tox)=2)and(length(tox)>4)
      or(copy(tox,1,1)='-')and(pos('.',tox)=3)and(length(tox)>5)
      or(pos('.',tox)=3)and(length(tox)>5)
      or(copy(tox,1,1)='-')and(pos('.',tox)=4)and(length(tox)>6)
      or(pos('.',tox)=4)and(length(tox)>6)
      or(copy(tox,1,1)='-')and(pos('.',tox)=5)and(length(tox)>7)
      or(tox[1]<>'-')and(pos('.',tox)<>2)and(pos('.',tox)<>3)and(pos('.',tox)<>4)and(length(tox)>3)
      or(tox[1]='-')and(pos('.',tox)<>3)and(pos('.',tox)<>4)and(pos('.',tox)<>5)and(length(tox)>4)
      then pop:=1
     until (cod=0)and(pop=0);
    fa[j]:=xx[i,j];
    end;
    pmax:=fa[1];pmin:=fa[1];ft:=0;fk:=1;fs:=1;fp:=0;fl:=0;fe:=fa[1];fr:=0.01;
  for fi:=2 to n do
  if fa[fi]>=pmax then
  begin fk:=fi;if fa[fi]=pmax then begin ft:=fi; if ft=2 then fr:=fa[2] end
  else pmax:=fa[fi];end
  else if fa[fi]<=pmin then
  begin fs:=fi;if fa[fi]=pmin then fp:=fi else pmin:=fa[fi];end;
  begin if (fk<>ft)and(fp<>fs)and(abs(fk-fs)>1)and(fe<>fr)
  then fl:=fl+1;end;

   until fl>0;
  window(18,22,65,25);textbackground(1);clrscr;

  window(1,3,79,4);textbackground(1);clrscr;
  textcolor(14);
  gotoxy(12,1);
  write('θ‰£§‰χ Enter, ―ογ‰ι‹• §νο•ρ• νοο‰ο …ο• D:\Boom ϋ©—• §‰ε');
 repeat
  c:=readkey;
 until ord(c)=13;

  assign(f,'d:\boom');
  rewrite(f);
  for i:=1 to n do
  for j:=1 to n do
  write(f,xx[i,j]);close(f);
  window(40-4*n,12-n,40+4*n,12+n);
  textbackground(6);clrscr;textcolor(1);

 window(5,3,75,4);textbackground(1);
 clrscr;gotoxy(9,1);textcolor(14);
 write('θ‰£§‰χ Enter, ―ογ‰ι‹• §νο•ρ• νοο‰ο ο‡ D:\Boom ϋ©—•ρ');
 repeat c:=readkey;
 until ord(c)=13;

 window(5,3,75,4);textbackground(1);
 clrscr;gotoxy(21,1);
 write('ϊ©—•ρ ο‡―σ§  §νο•ρ• νοο‰ο');
 window(40-4*n,12-n,40+4*n,12+n);
 textbackground(6);clrscr;
 textcolor(1);
 assign(f,'d:\boom');
 reset(f);

  for i:=1 to n do
  for j:=1 to n do
  read(f,xx[i,j]);
  close(f);
     for i:=1 to n do
     for j:=1 to n do
     begin
       str(xx[i,j]:4:2,tox1);
       if(copy(tox1,(length(tox1)),1)='0')then
	 delete(tox1,(length(tox1)),1);
       if(copy(tox1,(length(tox1)-1),2)='.0')then
	 delete(tox1,(length(tox1)-1),2);
       gotoxy(2+8*j-7,2*i);writeln(tox1);
       sound(262+100*j*i);delay(t);nosound;
     end;


  textcolor(14);
  h:=0;l:=0;
for i:=1 to n do
begin s:=0;z:=0;
for j:=1 to n do
begin a[j]:=xx[i,j];end;
max:=fmax(n,a);l:=fmin(n,a);
for j:=1 to n do
begin if xx[i,j]=max then h:=j;end;
if h>l then
for m:=l+1 to h-1 do
begin s:=s+sqr(xx[i,m]);z:=z+1;end
else
for m:=h+1 to l-1 do
begin s:=s+sqr(xx[i,m]);z:=z+1;end;
b[i]:=sqrt(s/z);
window(10*i+1,24,11+10*i-4,24);
    textbackground(8);clrscr;
    window(10*i,23,10+10*i-4,23);
    textbackground(5);clrscr;
    gotoxy(1,1);

write(b[i]:4:2);
end;

     window(5,3,60,4);textbackground(1);
     textcolor(14);clrscr;gotoxy(24,1);
     write('—χ• §ο ι‰£§‰χ Enter ιν‰£«');
 repeat c:=readkey;
 until ord(c)=13;
 end;

procedure cc;
begin
cleardevice;
settextstyle(0,0,1);
delay(60*t);
kub(4,2,3);
settextstyle(0,0,1);
outtextxy(280,210,'―σοι©•«');
outtextxy(285,235,'­™ν«χ');
delay(60*t);delay(30*t);cleardevice;
nist(4,2,3);
delay(60*t);delay(30*t);cleardevice;
teq(4,2,3);
delay(60*t);delay(30*t);cleardevice;
kub(5,4,3);
settextstyle(3,0,2);
outtextxy(260,220,'Turbo Pascal');
delay(60*t);delay(30*t);cleardevice;
nist(5,4,3);
delay(60*t);delay(30*t);cleardevice;
teq(5,4,3);
delay(60*t);delay(30*t);cleardevice;
kub(6,5,3);
settextstyle(0,0,1);
outtextxy(280,220,'ην©«');
outtextxy(294,240,'―ιο―λ');
delay(60*t);delay(30*t);cleardevice;
nist(6,5,3);
delay(60*t);delay(30*t);cleardevice;
teq(6,5,3);
delay(60*t);delay(30*t);cleardevice;
kub(2,6,3);
settextstyle(5,0,1);
outtextxy(284,220,'H 521-3');
delay(60*t);delay(30*t);cleardevice;
nist(2,6,3);
delay(60*t);delay(30*t);cleardevice;
teq(2,6,3);
delay(60*t);delay(30*t);cleardevice;
kub(4,2,3);
settextstyle(0,0,1);
outtextxy(280,210,'―σοι©•«');
outtextxy(285,235,'­™ν«χ');
delay(60*t);delay(30*t);cleardevice;
nist(4,2,3);
delay(60*t);delay(30*t);cleardevice;
teq(4,2,3);
delay(60*t);delay(30*t);cleardevice;
kub(5,4,3);
settextstyle(3,0,2);
outtextxy(260,220,'Turbo Pascal');
delay(60*t);delay(30*t);cleardevice;
nist(5,4,3);
delay(60*t);delay(30*t);cleardevice;
teq(5,4,3);
delay(60*t);delay(30*t);cleardevice;
kub(6,5,3);
settextstyle(0,0,1);
outtextxy(280,220,'ην©«');
outtextxy(294,240,'―ιο―λ');
delay(60*t);delay(30*t);cleardevice;
nist(6,5,3);
delay(60*t);delay(30*t);cleardevice;
teq(6,5,3);
delay(60*t);delay(30*t);cleardevice;
kub(2,6,3);
settextstyle(5,0,1);
outtextxy(284,220,'H 521-3');
delay(60*t);delay(30*t);cleardevice;
nist(2,6,3);
delay(60*t);delay(30*t);cleardevice;
teq(2,6,3);
delay(60*t);delay(30*t);cleardevice;
kub(4,2,3);
settextstyle(0,0,1);
outtextxy(280,210,'―σοι©•«');
outtextxy(285,235,'­™ν«χ');
setcolor(14);
outtextxy(10,460,'—χ• §ο ι‰£§‰χ Enter');
repeat c:=readkey;
until ord(c)=13;
end;

procedure kanch;

begin
d:=detect;initgraph(d,r,'');e:=graphresult;
setbkcolor(0);cleardevice;setcolor(14);
rectangle(250,150,370,285);
setfillstyle(9,8);floodfill(10,10,14);
setlinestyle(0,0,3);
line(0,0,250,150);line(0,480,250,285);
line(370,150,640,0);line(370,285,640,480);
setlinestyle(0,0,1);
begin
menu(14,4,4,4);k:=1;
repeat c:=readkey;
if ord(c)=72 then k:=k-1;
if ord(c)=80 then k:=k+1;
if (k=0) and (ord(c)=72) then k:=4;
if (k=5) and (ord(c)=80) then k:=1;

 case k of
  1:menu(14,4,4,4);
  2:menu(4,14,4,4);
  3:menu(4,4,14,4);
  4:menu(4,4,4,14);
 end;
until ord(c)=13;
  begin
      if (k=1)and(ord(c)=13) then
       repeat
	 aa;
   until ord(c)=13;
   if (k=2)and(ord(c)=13) then
       repeat
	 bb;
   until ord(c)=13;
   if (k=3)and(ord(c)=13) then
       repeat
	 cc;
   until ord(c)=13;
  end;
end;


end;
begin
 d:=detect; initgraph(d,r,'');
 e:=graphresult;
repeat kanch until k=4;
end.