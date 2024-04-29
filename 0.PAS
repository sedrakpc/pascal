                                       uses graph,crt;
                                       var d,m,i:integer;
                                       begin detectgraph(d,m);
                                       initgraph(d,m,'');
                                       if graphresult<>grok then halt;
                                       setbkcolor(1); cleardevice;
                                       setcolor(2);setlinestyle(0,0,1);
                                       for i:= 0 to 300  do begin
                                       rectangle(0+2*i,0,39+2*i,30);delay(5000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       rectangle(600,0+2*i,639,29+2*i);delay(5000);
                                       cleardevice end;
                                       for i:=0 to 300 do begin
                                       rectangle(600-2*i,450,639-2*i,479);
                                       delay(5000);
                                       cleardevice end;
                                      for i:=0 to 225 do begin
                                       rectangle(0,450-2*i,40,479-2*i);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 150 do begin
                                       rectangle(0+4*i,0+3*i,39+4*i,29+3*i);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       rectangle(600,450-2*i,639,479-2*i);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 150 do begin
                                       rectangle(600-4*i,0+3*i,639-4*i,29+3*i);
                                       delay(5000);
                                       cleardevice end; readln;
                                       for i:=0 to 70do
                                       begin cleardevice
                                       ;

                                       ellipse(320,240,0,360,39+4*i,29+3*i);
                                       delay(5000);
                                       end ;readln end.                                       closegraph
                                       end.
