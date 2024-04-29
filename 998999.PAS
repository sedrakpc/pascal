                                       uses graph,crt;
                                       var d,m,i:integer;
                                       begin detectgraph(d,m);
                                       initgraph(d,m,'');
                                       if graphresult<>grok then halt;
                                       setbkcolor(1); cleardevice;
                                       setcolor(2);setlinestyle(0,0,0);
                                       for i:= 0 to 300  do begin
                                       ellipse(20+2*i,15,0,360,20,15);delay(5000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       ellipse(619,15+2*i,0,360,20,15);delay(5000);
                                       cleardevice end;
                                       for i:=0 to 300 do begin
                                       ellipse(619-2*i,464,0,360,20,15);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       ellipse(20,464-2*i,0,360,20,15);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 150 do begin
                                       ellipse(20+4*i,15+3*i,0,360,20,15);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 225 do begin
                                       ellipse(619,464-2*i,0,360,20,15);
                                       delay(5000);
                                       cleardevice end;
                                       for i:=0 to 150 do begin
                                       ellipse(619-4*i,15+3*i,0,360,20,15);
                                       delay(5000);
                                       cleardevice end;
                                       readln;closegraph
                                       end.
