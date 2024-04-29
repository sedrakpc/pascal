{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}
unit uobj;
INTERFACE
uses types;

 {
                Unit for  CHESS
    CopyRight Koniloff E, 2003  e_k@sbor.net
              Borland Pascal 7
                 Real-Mode
       system req,   DOS 6.22, VGA, mouse,
                     P200 or later


  данный unit служит только для
  линковки файла масок фигур с основной
  программой
 }


procedure LoadPic(var p:PByteArray);

IMPLEMENTATION
{$L pic.obj}
procedure picdat;external;


procedure LoadPic(var p:PByteArray);
begin
    p := @picdat;
end;

END.