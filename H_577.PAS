program H_577;
var f:file of integer;
  x,min,k,n,i:integer;
Begin
    assign(f,'c:\bp\bin\sdworks\sdfile\H_577.dat');
    rewrite(f);write('n='); read(n); for i:=1 to n do
Begin
    read(x);write(f,x) end;
    close(f); reset(f);
    read(f,min);
    k:=filepos(f);
    while not eof(f) do
Begin
     read(f,x
     ); if x<min then
Begin
     min:=x;k:=filepos(f) end
                             end;
     seek(f,k);truncate(f);
     close(f);
     reset(f);
     while not eof(f) do
Begin read(f,x);
     write(x:5) end;close(f)
                         end.