program HSI;
{$N+,E+}

{ Copyright (c) 1987,89 Borland International }


{ illustrates conversion of Hue-Saturation-Intensity to Red-Green-Blue }

uses
  Dos, Crt, Graph;
type
  ColorValue     = record
                     Rvalue, Gvalue, Bvalue : byte;
                   end;
  VGAPaletteType = array[0..255] of ColorValue;

{$IFOPT N+}
  Float = double;
{$ELSE}
  Float = real;
{$ENDIF}

procedure VGASetAllPalette(var P : VGAPaletteType);
var
  Regs : Registers;
begin
  with Regs do
  begin
    AX := $1012;
    BX := 0;
    CX := 256;
    ES := Seg(P);
    DX := Ofs(P);
  end;
  Intr($10, Regs);
end; { VGASetAllPalette }

procedure Hsi2Rgb(H, S, I : Float; var C : ColorValue);
var
  T : Float;
  Rv, Gv, Bv : Float;
begin
  T := 2 * Pi * H;
  Rv := 1 + S * Sin(T - 2 * Pi / 3);
  Gv := 1 + S * Sin(T);
  Bv := 1 + S * Sin(T + 2 * Pi / 3);
  T := 63.999 * I / 2;
  with C do
  begin
    Rvalue := trunc(Rv * T);
    Gvalue := trunc(Gv * T);
    Bvalue := trunc(Bv * T);
  end;
end; { Hsi2Rgb }

procedure Wait;
var
  Ch : char;
begin
  repeat until KeyPressed;
  Ch := ReadKey;
  if Ch = #0 then
    Ch := ReadKey;
end;

{$F+}
function DetectVGA256 : integer;
var
  DetectedDriver : integer;
  SuggestedMode  : integer;
begin
  DetectGraph(DetectedDriver, SuggestedMode);
  if (DetectedDriver = VGA) or (DetectedDriver = MCGA) then
    DetectVGA256 := 0        { Default video mode = 0 }
  else
    DetectVGA256 := grError; { Couldn't detect hardware }
end; { DetectVGA256 }
{$F-}

var
  H, S, I : Float;
  X, Y, Z : integer;
  C       : ColorValue;
  P       : VGAPaletteType;
  Xx, Yy  : integer;
  Jj      : integer;
  K       : integer;

  AutoDetectPointer : pointer;
  Driver, Mode : integer;
  ErrorCode : integer;
begin
  ClrScr;
  writeln('Hue-Saturation-Intensity to Red-Green-Blue Conversion Example');
  writeln('Copyright (c) 1987,1989 Borland International Inc.');
  writeln;
  DirectVideo := false;
  AutoDetectPointer := @DetectVGA256; { Point to detection routine }
  Driver := InstallUserDriver('VGA256', AutoDetectPointer);
  Driver := Detect;
  InitGraph(Driver, Mode, '');
  ErrorCode := GraphResult;
  if ErrorCode <> grOK then
  begin
    Writeln('Error: ', GraphErrorMsg(ErrorCode));
    Halt;
  end;

{ create grey scale }
  for Z := 0 to 15 do
    with P[Z] do
    begin
      Rvalue := Z * 4;
      Gvalue := Z * 4;
      Bvalue := Z * 4;
    end;

{ create HSI spectrum }
  for X := 0 to 3 do      { four different intensities }
    for Y := 0 to 2 do    { three different saturations }
      for Z := 0 to 19 do { twenty different hues }
      begin
        { determine H,S,I between 0 and 1 }
        H := Z / 20;
        S := (Y+1) / 3;
        I := (X+1) / 4;
        { calculate and store R,G,B values }
        Hsi2Rgb(H, S, I, C);
        P[16+Z+20*Y+60*X] := C;
      end;

  VGASetAllPalette(P);
  { draw grey scale }
  for X := 0 to 15 do
  begin
    Xx := 200;
    Yy := X * 8;
    for Jj := 0 to 7 do
    begin
      SetFillStyle(SolidFill, 15-X);
      Bar(Xx, Yy+Jj, Xx+7, Yy+Jj+7);
    end;
  end;

  { draw spectrum }
  for Z := 0 to 19 do
    for X := 0 to 3 do
      for Y := 0 to 2 do
      begin
        K := 16+Z+20*Y+60*X;
        Xx := 8*X+40*(Z mod 5);
        Yy := 8*Y+32*(Z div 5);
        SetFillStyle(SolidFill, K);
        Bar(Xx, Yy, Xx+7, Yy+7);
      end;

  Wait;
  CloseGraph;
end.