procedure initVGA;
var
  GraphDriver : integer;  { The Graphics device driver }
  GraphMode   : integer;  { The Graphics mode value }
  AutoDetectPointer : pointer;
  ErrorCode   : integer;  { Reports any graphics errors }

{$F+}
function DetectVGA256 : integer;
{ Detects VGA or MCGA video cards }
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

begin
repeat

   AutoDetectPointer := @DetectVGA256;   { Point to detection routine }
    GraphDriver := InstallUserDriver('VGA256', AutoDetectPointer);
    GraphDriver := Detect;
    InitGraph(GraphDriver, GraphMode, '');
    until graphresult=grok;
end;
