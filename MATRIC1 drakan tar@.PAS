uses CRT,Graph;
type vec = array [1..20] of integer;
var  Gd, Gm, Index: Integer;
     Key:Char;
     hashivStr:string;
     Menu:array[1..4] of string;

procedure Pahanj;
     Begin
     SetFillStyle(1,13);
     Bar(1,1,640,480);
     SetTextStyle(0, 0, 1);
     SetFillStyle(1,11); Bar(150,75,500,157);
     OutTextXY(250,81, '  ª†”ξ 7  ');
     OutTextXY(155,91, '   μολ›   N §ƒ―£ε ‘•λ ‰λ NxN νοο ');
     OutTextXY(150,104,'  γο―σ«―£  §νο•ρ: ‹§‰— X  λ‰ν―ο• ');
     OutTextXY(150,114,' ινρ§« ‰λ ον›§« —…―ο•‘§• ƒ—―-ι™‰§«');
     OutTextXY(150,124,'  ‰λ ›ο…•ο, ―ο• i-ο‡ νοο‰ο λιο ‰«');
     OutTextXY(150,134,'       νολ›  §νο•ρ•  i-ο‡   ν―£• ');
     OutTextXY(150,144,'           §‰›…―σ©«  νοο•«:    ');
     repeat until KeyPressed;
     End;
procedure Xntir;
var i,j,n,M:integer;
    OutStr:string;
         Y:array[1..20,1..20] of integer; X,C:vec;
        function Mutq(X,Y,Size,Color,TxColor:integer):Integer;
        var StatusChar:char;
            OutStr,TestStr:String;
            OutInt:integer;
            I:integer;
                  Begin
            OutStr := '';
            setColor(TxColor);
            setFillStyle(1,Color);
            bar(X,Y,X+Size*8,Y+10);
             while true do
                  Begin
            StatusChar := Readkey;
         if keypressed then
            StatusChar := Readkey;
         if (47 < ord(StatusChar)) and
            (ord(StatusChar) < 58) and (length(OutStr) < Size) then
            OutStr := OutStr + StatusChar;
         if (StatusChar = '-') and (length(OutStr) = 0) then
            OutStr := '-';
         if (StatusChar = #8) and (length(OutStr) > 0) then
            OutStr := copy(OutStr,1,length(OutStr)-1);
            bar(X,Y,X+Size*8,Y+10);
            outTextXY(X,Y,OutStr);
         if StatusChar = #13 Then
                    Begin
            val(OutStr,OutInt,I);
            str(OutInt,TestStr);
     if    (OutStr = TestStr) and (OutStr <> '')
     then
           Break
     else
     Begin
           bar(X,Y,X+Size*8,Y+10);
           OutStr := '';
     End;

     End;
     End;
           Mutq:=OutInt;
     End;
  function Max(M:integer):integer;
   var p,q,j:integer;
     Begin
     p:=Y[i,1];
     q:=1;
     for j:=1 to n do
     If p<Y[M,j] Then
     Begin
         p:=Y[M,j];
         q:=j;
     End;
         Max:=q;
     End;

     Begin

     SetTextStyle(0, 0, 1);
     SetFillStyle(1,2);
     Bar(1,1,640,480);
     SetFillStyle(1,15);
     Bar(1,444,640,460);
     OutTextXY(300,10,'N=');
     setcolor(1);
     OutTextXY(10,450,'           «‡ο―σ§  ‰§ ‘•λ «‰ο§―σ›‰—―σρ ‰ν― ι‰™§‰χ ENTER ιν‰£«');
  repeat
       n:=Mutq(320,10,1,2,6);
       If (n>1) and (n<6) Then
         Break;
     until false;
     for i:=1 to n do
       Begin
       for j:=1 to n do
         C[j]:=Mutq(265-trunc(70*(n/2))+70*j,25+i*35,4,2,7);
       for j:=1 to n do
         Y[i,j]:=C[j];

       End; setcolor(13);
     for i:=1 to n do
       x[i]:=Y[i,Max(i)];
     for i:=1 to n do
       Begin
       str(X[i],OutStr);
       outTextXY(320+trunc(70*(n/2)),25+i*35,OutStr);
       End;
     repeat until KeyPressed;

     End;

begin
  Gd := Detect;
  InitGraph(Gd, Gm, '');pahanj;xntir;
  ReadLn;
  CloseGraph;
end.
