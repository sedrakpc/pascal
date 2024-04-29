PROGRAM ANY;
USES CRT,GRAPH;
VAR I,J,N,D,R:INTEGER;
            K:CHAR;
             p:pointer;


PROCEDURE MENU(A,B,C,D:INTEGER);
BEGIN
SETBKCOLOR(2);
{-------------------------------miji mas1-----------------------------------}
SETTEXTSTYLE(0,0,1);

SETCOLOR(A);
CIRCLE(100,280,35);
SETFILLSTYLE(1,14);
FLOODFILL(100,280,A);
OUTTEXTXY(81,270,'ª†ξ”');
OUTTEXTXY(77,285,'†ξκ€φ');
{------------------------------tertikner1-----------------------------------}

SETFILLSTYLE(1,15);

FILLELLIPSE(50,280,15,10);      FILLELLIPSE(150,280,15,10);

FILLELLIPSE(100,230,10,15);     FILLELLIPSE(100,330,10,15);

FILLELLIPSE(58,257,13,13);      FILLELLIPSE(77,238,13,13);

FILLELLIPSE(142,257,13,13);     FILLELLIPSE(123,238,13,13);

FILLELLIPSE(58,303,13,13);      FILLELLIPSE(77,322,13,13);

FILLELLIPSE(142,303,13,13);     FILLELLIPSE(123,322,13,13);

{--------------------------------------------------------------------------}
{-------------------------------MIJI MAS2----------------------------------}

SETCOLOR(B);
CIRCLE(240,180,35);
SETFILLSTYLE(1,14);
FLOODFILL(240,180,B);
OUTTEXTXY(214,178,'„ξ€ϊ”€');
{------------------------------TERTIKNER2----------------------------------}

SETFILLSTYLE(1,15);

FILLELLIPSE(190,180,15,10);     FILLELLIPSE(290,180,15,10);

FILLELLIPSE(240,130,10,15);     FILLELLIPSE(240,230,10,15);

FILLELLIPSE(198,157,13,13);     FILLELLIPSE(217,138,13,13);

FILLELLIPSE(282,157,13,13);     FILLELLIPSE(263,138,13,13);

FILLELLIPSE(198,203,13,13);     FILLELLIPSE(217,222,13,13);

FILLELLIPSE(282,203,13,13);     FILLELLIPSE(263,222,13,13);
{--------------------------------------------------------------------------}

{--------------------------------MIJI MAS3---------------------------------}

SETCOLOR(C);
CIRCLE(380,280,35);
SETFILLSTYLE(1,14);
FLOODFILL(380,280,C);
OUTTEXTXY(363,270,'ª†ξ”');
OUTTEXTXY(355,283,'–®ς®ς¦');

{--------------------------------TERTIKNER3--------------------------------}

SETFILLSTYLE(1,15);

FILLELLIPSE(330,280,15,10);     FILLELLIPSE(430,280,15,10);

FILLELLIPSE(380,230,10,15);     FILLELLIPSE(380,330,10,15);

FILLELLIPSE(338,257,13,13);     FILLELLIPSE(357,238,13,13);

FILLELLIPSE(422,257,13,13);     FILLELLIPSE(403,238,13,13);

FILLELLIPSE(338,303,13,13);     FILLELLIPSE(357,322,13,13);

FILLELLIPSE(422,303,13,13);     FILLELLIPSE(403,322,13,13);

{--------------------------------------------------------------------------}

{--------------------------------MIJI MAS4---------------------------------}
SETCOLOR(D);
CIRCLE(520,180,35);
SETFILLSTYLE(1,14);
FLOODFILL(520,180,D);
OUTTEXTXY(493,170,'„ª€π”ªφ');
OUTTEXTXY(505,183,'μ®ςª');

{--------------------------------TERTIKNER4--------------------------------}

SETFILLSTYLE(1,15);

FILLELLIPSE(470,180,15,10);     FILLELLIPSE(570,180,15,10);

FILLELLIPSE(520,130,10,15);     FILLELLIPSE(520,230,10,15);

FILLELLIPSE(478,157,13,13);     FILLELLIPSE(497,138,13,13);

FILLELLIPSE(562,157,13,13);     FILLELLIPSE(543,138,13,13);

FILLELLIPSE(478,203,13,13);     FILLELLIPSE(497,222,13,13);

FILLELLIPSE(562,203,13,13);     FILLELLIPSE(543,222,13,13);

{--------------------------------------------------------------------------}
END;

PROCEDURE XNDRI_LUCUM;
    VAR A:ARRAY[1..10,1..10] OF INTEGER;
        Y:ARRAY[1..10] OF INTEGER;
        X:ARRAY[1..10] OF INTEGER;
        MIN,I,J,D,R,C,N:INTEGER;

BEGIN
RESTORECRTMODE;
    TEXTBACKGROUND(2);CLRSCR;
    TEXTCOLOR(14);
   gotoxy(23,1);
    WRITE('ª‰ο§―σ›‰— §νο•ρ• νοο‰ο• χ«');
   GOTOXY(37,3);
    WRITE('N=');READ(N);
   gotoxy(23,5);
    write('€©“§ «‰ο§―σ›‰χ §νο•ρ• νοο‰ο');
    window(40-3*n,10-n,40+3*n,10+n);
    textbackground(14);clrscr;
  for i:=1 to n do
  for j:=1 to n do
BEGIN
   gotoxy(3+6*i-7,2*j);
   READ(A[I,J]);
END;
   FOR I:=1 TO N DO
  Y[I]:=A[I,I];                                  {
  TEXTBACKGROUND(2); TEXTCOLOR(14);
  gotoxy(4,22);
   WRITE('„—™λ―ο «©―σ«…›• νοο‰οο« ‰«');    }
  { GOTOXY(10+5*I,10);
   for i:=1 to n do
BEGIN
   gotoxy(15,20);
   write(Y[I])
END;                   }

   R:=-1;
     FOR I:=1 TO N DO
 BEGIN  MIN:=Y[1];  R:=R+1; D:=1;
       FOR J:=1 to N-R  DO
 BEGIN
       IF Y[J]<MIN THEN
 BEGIN
       MIN:=Y[J]; D:=J
 END
 END;
           X[I]:=MIN;
          IF D<>N THEN
         FOR C:=D TO N-R-1  DO
          Y[C]:=Y[C+1];


END;
   FOR I:=1 TO N DO
    A[I,I]:=X[I];

    window(40-3*n,10-n,40+3*n,10+n);
    textbackground(14);clrscr;
    FOR I:=1 TO N DO
    FOR J:=1 TO N DO
BEGIN
   gotoxy(3+6*i-7,2*j);
   WRITE(A[I,J]);
END;


    gotoxy(45,24);
    write('Press_ESC_to_go back_to_Menu') ;
    REPEAT UNTIL readkey=#27;
  SETGRAPHMODE(GETGRAPHMODE)
    END;


PROcEDURe XNDRI_DRVACQ;
     var  k,i,n:word;
BEGIN
     setfillstyle(1,red);
     fillellipse(320,270,19,45);
     fillellipse(335,270,19,45);

     setcolor(8);
     setfillstyle(1,8);
     pieslice(327,227,360,180,15);
     pieslice(318,243,60,260,8);
     pieslice(309,267,360,360,7);
     pieslice(320,302,100,320,8);
     pieslice(337,240,360,360,8);
     pieslice(327,265,360,360,8);
     pieslice(337,296,360,360,8);
     pieslice(354,270,90,270,8);

     k:=imagesize(300,211,356,317);
    getmem(p,k);
    getimage(300,211,356,317,p^);
    cleardevice;

 SETBKCOLOR(2);
 CLEARDEVICE;
 SETCOLOR(2);
 SETFILLSTYLE(1,14);
 FILLELLIPSE(320,140,170,65);
 OUTTEXTXY(250,90,'μολ›__n_ƒ««');
 OUTTEXTXY(213,105,'‘•λ,n*n_αυ«•_§νο•ρ:');
 OUTTEXTXY(180,120,'„—™λ―ο_«©―σ«…›•_λο©•_νοο‰ο');
 OUTTEXTXY(160,135,'‡ιλ―ο‰—_¥§«_ο…―λ:');
 OUTTEXTXY(140,150,'                     μγ‰—_ινρλ›_§νο•ρ:');

 SETFILLSTYLE(1,15);
 FILLELLIPSE(150,230,70,60);
 OUTTEXTXY(120,180,'μολ›_');
 OUTTEXTXY(100,200,'λ‰ν―ο:®ο―­‰—');
 OUTTEXTXY(83,220,'«ο_§•«•§—_νοο•');
 OUTTEXTXY(89,240,'ο“‰χ:μγ‰—_©«:');


  FILLELLIPSE(490,230,72,60);
  OUTTEXTXY(460,180,'μολ›_');
  OUTTEXTXY(430,200,'§νο•ρ:μ‰£υ―™‰—');
  OUTTEXTXY(423,220,'«ο_a-ο‡_―σ_b-ο‡');
  OUTTEXTXY(429,240,'ν―£‰ο:μγ‰—_©«:');




  SETCOLOR(15);
  SETTEXTSTYLE(0,0,1);
  OUTTEXTXY(410,410,'Press_"C"_to_go_back_to_menu');
  CIRCLE(505,445,15);
  SETFILLSTYLE(1,5);
  FILLELLIPSE(500,443,1,1);
  LINE(508,443,511,443);
  ELLIPSE(505,450,180,0,6,4);
  ELLIPSE(505,453,180,0,1,6);


    for i:=1 to 360 do
     putimage(i,trunc(390-i/2),p^,0);
    for i:=1 to 55 do
     putimage(i+40,i+9,p^,0);
    for i:=1 to 170 do
     putimage(660-i,i-110,p^,0);

  REPEAT UNTIL READKEY=#99;
  cleardevice
end;


BEGIN
 d:=detect;
 initgraph(d,r,'');
 if graphresult <>grok then
begin
     write(grapherrormsg(graphresult));
     halt
end;
CLEARDEVICE;
SETBKCOLOR(green);
SETCOLOR(yellow);
FOR I:=0 TO 3 DO
BEGIN
         SETTEXTSTYLE(0,0,I);     CLEARDEVICE;
         OUTTEXTXY(100-I*I-I*I,50,'621-1');
         OUTTEXTXY(100-I*I-I*I,150,'€‘«©«_€«•');
         OUTTEXTXY(100-I*I-I*I,300,'  _ολ•ο―σ§_‰§_ ');
         OUTTEXTXY(100-I*I-I*I,350,'§‰«©―σ_');
         DELAY(65000);
END;
 SETTEXTSTYLE(0,0,1);
 OUTTEXTXY(420,410,'Press_"C"_to_continue');


  CIRCLE(505,445,15);
  SETFILLSTYLE(1,5);
  FILLELLIPSE(500,443,1,1);
  LINE(508,443,511,443);
  ELLIPSE(505,450,180,0,6,4);
  ELLIPSE(505,453,180,0,1,6);
  REPEAT UNTIL READKEY=#99;



CLEARDEVICE;

REPEAT


MENU(4,2,2,2);

N:=1;

REPEAT

K:=READKEY;

CASE K OF
    #77:BEGIN N:=N+1; IF N=5 THEN N:=1 END;
    #75:BEGIN N:=N-1; IF N=0 THEN N:=4 END END;

CASE N OF
1:MENU(4,2,2,2);
2:MENU(2,4,2,2);
3:MENU(2,2,4,2);
4:MENU(2,2,2,4)
          END
UNTIL K=#13;

CLEARDEVICE;

CASE N OF
1:BEGIN
          XNDRI_DRVACQ
  END;
2:BEGIN
        {  GRAFIKA }
  END;
3:BEGIN
         XNDRI_LUCUM
  END;
                 END
UNTIL N=4

END.