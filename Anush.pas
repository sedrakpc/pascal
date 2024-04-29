  
uses Crt,Graph;                                                               
var i,d,f,xo,yo,xa,ya,xb,yb,xm,ym,r:integer; k:word;alfa:real;                
procedure linek(k:word);                                                      
begin                                                                         
             setcolor(k);                                                     
             line(xo,yo,xa,ya);                                               
             line(xa,ya,xb,yb);                                               
             line(xb,yb,xo,yo);                                               
                                                                              
end;                                                                          
begin                                                                         
     d:=0;                                                                    
     InitGraph(d,f,'');                                                       
     xm:=GetMaxX; ym:=GetMaxY; xo:=90; yo:=ym div 2-1;                        
     k:=3; r:=80;                                                             
     SetBkColor(magenta); SetColor(7);                                        
     line(0,ym div 2,xm,ym div 2);                                            
     SetColor(12);                                                            
                                                                              
     MoveTo(xo,yo);                                                           
     while xo<=xm-r-10  do  
  
     begin alfa:=0;                                                           
          while alfa<=2*pi/3 do                                               
          begin                                                               
               xa:=xo-round(r*cos(alfa));                                     
               ya:=yo-round(r*sin(alfa));                                     
               xb:=xo-round(r*cos(alfa+pi/3));                                
               yb:=yo-round(r*sin(alfa+pi/3));                                
               linek(blue);                                                   
               alfa:=alfa+pi/60; delay(6000);                                 
               linek(magenta) ;                                               
          end;                                                                
          xo:=xo+r;                                                           
                                                                              
     end;                                                                     
end.                                                                          
                                                                              
