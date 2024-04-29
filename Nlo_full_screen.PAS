
uses
  Crt,Graph;



procedure PutImagePlay;
{ Demonstrate the GetImage and PutImage commands }

const
  r  = 20;
  StartX = 100;
  StartY = 150;

var
  CurPort : ViewPortType;

procedure MoveSaucer(var X, Y : integer; Width, Height : integer);
var
  Step : integer;
begin
  Step := Random(2*r);
  if Odd(Step) then
    Step := -Step;
  X := X + Step;
  Step := Random(r);
  if Odd(Step) then
    Step := -Step;
  Y := Y + Step;

  { Make saucer bounce off viewport walls }
  with CurPort do
  begin
    if (x1 + X + Width - 1 > x2) then
      X := x2-x1 - Width + 1
    else
      if (X < 0) then
        X := 0;
    if (y1 + Y + Height - 1 > y2) then
      Y := y2-y1 - Height + 1
    else
      if (Y < 0) then
        Y := 0;
  end;
end; { MoveSaucer }

var
  Pausetime : word;
  Saucer    : pointer;
  X, Y      : integer;
  ulx, uly  : word;
  lrx, lry  : word;
  Size      : longint;
  I         : word;
begin
  ClearDevice;

  { PaintScreen }
  ClearDevice;
  GetViewSettings(CurPort);

  { DrawSaucer }
  Ellipse(StartX, StartY, 0, 360, r, (r div 3)+2);
  Ellipse(StartX, StartY-4, 190, 357, r, r div 3);
  Line(StartX+7, StartY-6, StartX+10, StartY-12);
  Circle(StartX+10, StartY-12, 2);
  Line(StartX-7, StartY-6, StartX-10, StartY-12);
  Circle(StartX-10, StartY-12, 2);
  SetFillStyle(SolidFill,2);
  FloodFill(StartX+1, StartY+4,15);

  { ReadSaucerImage }
  ulx := StartX-(r+1);
  uly := StartY-14;
  lrx := StartX+(r+1);
  lry := StartY+(r div 3)+3;

  case GetMaxColor of
    16:  Size := ImageSize(ulx, uly, lrx, lry);
    256: Size := (lrx-uly)*(lry-uly)+4;
    65535,32768: Size := 2*(lrx-uly)*(lry-uly)+4;
    16777: Size := 4*(lrx-uly)*(lry-uly)+4;
  end;
  GetMem(Saucer, Size);
  GetImage(ulx, uly, lrx, lry, Saucer^);
  PutImage(ulx, uly, Saucer^, XORput);               { erase image }
  { Plot some "stars" }
  for I := 1 to 1000 do
    PutPixel(Random(640), Random(480),random(15));
  X := 640 div 2;
  Y := 480 div 2;
  PauseTime := 70;

  { Move the saucer around }
  repeat
    X := (X div 8)*8;
    PutImage(X, Y, Saucer^, XORput);                 { draw image }
    Delay(20000);
    PutImage(X, Y, Saucer^, XORput);                 { erase image }
    MoveSaucer(X, Y, lrx - ulx + 1, lry - uly + 1);  { width/height }
  until KeyPressed;
  FreeMem(Saucer, size);
  readkey;
end; { PutImagePlay }
procedure init;
var GD,GM,EC:integer;
begin
GD:=detect;
initgraph(GD,GM,'c:\bp\bgi');
EC:=graphresult;
if EC <> grOK then
begin
Writeln(GraphErrorMsg(EC));
Halt(1);
end;
end;
begin { program body }
  Init;
  PutImagePlay;
  CloseGraph;
end.
