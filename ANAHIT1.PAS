type zang=array[1..8,1..8] of real;
     vec=array[1..8] of real;
   var  a:zang;b:vec;m,n,i,j,k:byte;

   {__________________________________________}

   procedure  vek(var b1:vec;a1:zang;m1:byte);
   var l,j:byte;
   begin for j:=1 to m1 do
   b1[j]:=a1[l,j];
   end;

   {____________________________________________}

   function  sim(i2,n2:byte):integer;
   begin
   if (i2>=1) and (i2<=n2)
   then sim:=n2+1-i2 else sim:=0;end;

   {______________________________________________}

   begin
   repeat write('n=');readln(n); write('m='); readln(m)
   until (n>=2)and(n<=8)and(m>=2)and(m<=8);

   for i:=1 to n do
   for j:=1 to m do
   begin
        write('a[',i,',',j,']=') ; readln(a[i,j]);  end;
   for i:=1 to n div 2 do
   begin
   vek(b,a,m);
   sim(i,n);
  k:=sim(i,n);
  for j:=1 to m do   begin
  b[j]:=a[i,j];
  a[i,j]:=a[k,j];
  a[k,j]:=b[j];
  end; end;
  for i:=1 to n do
  for j:=1 to m do
  writeln(a[i,j]:0:0);  end.


