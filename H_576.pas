var f:file of real;
    x,max:real;
    i,n,k:integer;
Begin
    assign(f,'c:\aa1\aa5\d\dat');
    rewrite(f); read(n); for i:=1 to 2*n+1 do
Begin
    read(x);write(f,x) end;
    close(f); reset(f);
    read(f,max);
    k:=filepos(f)-1;
    while not eof(f) do
Begin
     read(f,x); if x>max then
Begin
     max:=x;k:=filepos(f)-1 end
                             end;
     n:=filesize(f)div 2;
     seek(f,n);read(f,x);
     seek(f,k);write(f,x);
     seek(f,n);write(n,max);
     close(f);
     reset(f);
     while not eof(f) do
Begin read(f,x);
     write(x) end;close(f)
                         end.