{$A+,B-,D+,E+,F-,G+,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 64000,0,655360}
unit types;
{
 типы данных

}
INTERFACE

TYPE
  TByteArray = array[0..$FFFF-500] of byte;
  PByteArray = ^TByteArray;


IMPLEMENTATION
END.