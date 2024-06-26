unit lib;
INTERFACE
  uses def;
    {

                Unit for  TCHESS
     ����㧪� � �ᯮ�짮����� ����⭮� ������⥪�
    }


procedure LoadLib;
function LibLook(var game:TGame;
                    var move:TMove {�����頥�� 室}
                   ):boolean;



IMPLEMENTATION
 {$L lib.obj}
 procedure libdat;external;


  CONST
   L_W = 32;  {����� ��ப�}
   L_H = 300;  {������⢮ ��ப}

  Type
   TLib = array [0..L_H-1,0..L_W-1] of TMove;
   PLib = ^TLib;
  Var
   _lib:PLib;

{
  procedure WriteLibDamp;
  var
   x,y,index1,index2:integer;
   F:TEXT;
  begin
    Assign(F,'libdamp.dat');
    ReWrite(F);
    for y := 0 to L_H-1 do
    begin
        for x := 0 to L_W-1 do begin
            index1 := _lib^[y][x].source;
            index2 := _lib^[y][x].dest;
            if (index1 = index2) then begin
              Write(F,'  ');
            end else begin
              Write(F,glChMove[ glIndex8[index1] ]);
              Write(F,glChMove[ glIndex8[index2] ]);
            end;
            Write(F,' ');
        end;
        Writeln(F);
    end;

    Close(F);
  end;
 }

  procedure LoadLib;
  begin
     _lib := @libdat;
  end;


  function LibLook(var game:TGame;
                    var move:TMove {�����頥�� 室}
                   ):boolean;
  var
   {���न��� Y ⠡����}
   randY:array[0..L_H-1] of integer;
   n,x,y,index1,index2,tmp:integer;
  begin
      LibLook := false;
      if game.gCurr >= L_W then exit;

      {������� Y - ���ᨢ �᫠�� �� 0 �� L_H-1 �
      ��६�蠥� ��}
      for n := 0 to L_H-1 do randY[n] := n;
      Randomize;
      for n := 0 to 1000 do begin
          index1 := random(L_H); index2 := random(L_H);
          tmp := randY[index1];
          randY[index1] := randY[index2];
          randY[index2] := tmp;
      end;

      {᪠���㥬 ���ᨢ �� ��ப�� � �饬 ��ࢮ� ᮢ�������}
      for n := 0 to L_H-1 do begin
          y := randY[n];
          x := game.gCurr;
          with _lib^[y][x] do
          if source = dest then continue;

          x := x - 1;
          while (x >= 0) and
                (game.gMoves[x].data = _lib^[y][x].data) do
                x := x - 1;

         if x = -1 then begin
             move.data := _lib^[y][game.gCurr].data;
             LibLook := true;
             exit;
         end;
      end;


  end;


END.