PROGRAM MouseDemo;
  {$M 16384,10000,20000 }
  uses crt, graph, dos;
  {$I global.ini }
  {$I goodies.ini }
  {$I mouse.ini }
TYPE
  poly = RECORD
           count : word;
           min_x : word;
           min_y : word;
           max_x : word;
           max_y : word;
           hot_x : word;
           hot_y : word;
           points : ARRAY[1..8] OF point;
         END;

CONST
  pencil : mouse_graphics_cursor = (
    hot_x : 5;
    hot_y : $FFFF;
    cursor_mask : (
      $F7FF,                  {1111011111111111}
      $E3FF,                  {1110001111111111}
      $C1FF,                  {1100000111111111}
      $80FF,                  {1000000011111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F,                  {0000000001111111}
      $007F                   {0000000001111111}
      );
    screen_mask : (
      $0000,                  {0000000000000000}
      $0000,                  {0000000000000000}
      $0000,                  {0000000000000000}
      $2200,                  {0010001000000000}
      $4B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $6B00,                  {0110101100000000}
      $0000                   {0000000000000000}
      ));

  cmd : mouse_graphics_cursor = (
    hot_x : 5;
    hot_y : $FFFF;
    cursor_mask : (
      $7FFF,                  {0111111111111111}
      $3FFF,                  {0011111111111111}
      $1FFF,                  {0001111111111111}
      $0FFF,                  {0000111111111111}
      $07FF,                  {0000011111111111}
      $03FF,                  {0000001111111111}
      $01FF,                  {0000000111111111}
      $00FF,                  {0000000011111111}
      $007F,                  {0000000001111111}
      $003F,                  {0000000000111111}
      $001F,                  {0000000000011111}
      $01FF,                  {0000000111111111}
      $10FF,                  {0001000011111111}
      $30FF,                  {0011000011111111}
      $F83F,                  {1111100000111111}
      $F83F                   {1111100000111111}
      );
    screen_mask : (
      $0000,                  {0000000000000000}
      $4000,                  {0100000000000000}
      $6000,                  {0110000000000000}
      $7000,                  {0111000000000000}
      $7800,                  {0111100000000000}
      $7C00,                  {0111110000000000}
      $7E00,                  {0111111000000000}
      $7F00,                  {0111111100000000}
      $7F80,                  {0111111110000000}
      $7FC0,                  {0111111111000000}
      $7C00,                  {0111110000000000}
      $4600,                  {0100011000000000}
      $0600,                  {0000011000000000}
      $0300,                  {0000001100000000}
      $0300,                  {0000001100000000}
      $0000                   {0000000000000000}
      ));

  can : mouse_graphics_cursor = (
    hot_x : 5;
    hot_y : $FFFF;
    cursor_mask : (
      $7FFF,                  {0111111111111111}
      $DFFF,                  {1101111111111111}
      $F7FF,                  {1111011111111111}
      $FC7F,                  {1111110001111111}
      $FC7F,                  {1111110001111111}
      $FC7F,                  {1111110001111111}
      $F47F,                  {1111010001111111}
      $DC7F,                  {1101110001111111}
      $7C7F,                  {0111110001111111}
      $F01F,                  {1111000000011111}
      $8001,                  {1000000000000001}
      $0000,                  {0000000000000000}
      $0000,                  {0000000000000000}
      $0000,                  {0000000000000000}
      $0000,                  {0000000000000000}
      $0000                   {0000000000000000}
      );
    screen_mask : (
      $8000,                  {1000000000000000}
      $2000,                  {0010000000000000}
      $0800,                  {0000100000000000}
      $0380,                  {0000001110000000}
      $0380,                  {0000001110000000}
      $0380,                  {0000001110000000}
      $0B80,                  {0000101110000000}
      $2380,                  {0010001110000000}
      $8380,                  {1000001110000000}
      $0FE0,                  {0000111111100000}
      $7FFE,                  {0111111111111110}
      $7FFE,                  {0111111111111110}
      $7FFE,                  {0111111111111110}
      $7FFE,                  {0111111111111110}
      $7FFE,                  {0111111111111110}
      $0000                   {0000000000000000}
      ));
  pointing_box : poly = (
    count : 8;
    min_x : 1;
    min_y : 1;
    max_x : 50;
    max_y : 35;
    hot_x : 25;
    hot_y : 30;
    points : (
      (x : 1; y : 1),
      (x : 50; y : 1),
      (x : 50; y : 25),
      (x : 30; y : 25),
      (x : 25; y : 30),
      (x : 20; y : 25),
      (x : 1; y : 25),
      (x : 1; y : 1)
      ));
  dead_y : word = 20;
  dead_x : word = 20;
  extent_x : word = 620;
  extent_y : word = 339;
  control_y : word = 100;
  paint_y : word = 110;
  fill_x = 30;
  fillc_x = 130;
  clear_x = 520;
  box_row_y = 50;
  cmd_box_x = 90;
  box_y = 20;
  color_row_y : word = 78;
  color_box_x = 37;
  text_offset_x = 10;
  text_offset_y = 6;
  no_state = 0;
  doodle = 1;
  command = 2;
  dead = 3;
VAR
  GraphDriver : Integer;
  GraphMode : Integer;
  ErrorCode : word;
  fill_color : word;
  last_pointing_box_x, last_pointing_box_y : word;
  pointing_box_present : Boolean;
  pointing_box_pt : pointer;
  iarray : ARRAY[1..10000] OF Byte;
  last_state : word;
  new_flag : Boolean;

  PROCEDURE InitMouse;
  VAR
    mouse_area : rect;
  BEGIN
    mouse_area.upper_left.x := 1;
    mouse_area.upper_left.y := 1;
    mouse_area.lower_right.x := GetMaxX;
    mouse_area.lower_right.y := GetMaxY;
    SetMouseExtentsGraph(mouse_area);
    SetMouseGraphicsCursor(@pencil);
  END;

  PROCEDURE MakeFunctionBox(x, y, width,
                            border_color,
                            background_color,
                            text_color : word;
                            lab : STRING);
  BEGIN
    SetColor(border_color);
    Rectangle(x, y, x+width, y+box_y);
    SetFillStyle(SolidFill, background_color);
    FloodFill(x+1, y+1, border_color);
    SetColor(text_color);
    OutTextXY(x+text_offset_x, y+text_offset_y, lab);
  END;

  PROCEDURE MakeScreen;
  VAR
    i : word;
  BEGIN
    ClearDevice;
    SetColor(White);
    Rectangle(dead_x, dead_y, extent_x, control_y);
    Rectangle(dead_x, paint_y, extent_x, extent_y);
    SetFillStyle(SolidFill, Red);
    FloodFill(dead_x+10, dead_y+10, White);
    SetFillStyle(SolidFill, Blue);
    FloodFill(dead_x+10, paint_y+10, White);
    MakeFunctionBox(fill_x, box_row_y, cmd_box_x,
    Yellow, LightGray, White, 'Fill');
    MakeFunctionBox(fillc_x, box_row_y, cmd_box_x,
    Yellow, LightGray, White, 'color');
    MakeFunctionBox(Clear_x, box_row_y, cmd_box_x,
    Yellow, LightGray, White, 'Clear');
    FOR i := 0 TO 15 DO
      BEGIN
        MakeFunctionBox(dead_x+1+(i*color_box_x),
        color_row_y, color_box_x,
        i, i, i, '');
      END;
  END;


  PROCEDURE EraseLastPointingBox;
  BEGIN
    IF pointing_box_present THEN
      PutImage(last_pointing_box_x, last_pointing_box_y, pointing_box_pt^, XORPut);
    pointing_box_present := False;
  END;

  PROCEDURE DrawPointingBox(x, y : word);
  BEGIN
    PutImage(x, y, pointing_box_pt^, XORPut);
    IF pointing_box_present THEN
      PutImage(last_pointing_box_x, last_pointing_box_y, pointing_box_pt^, XORPut);
    last_pointing_box_x := x;
    last_pointing_box_y := y;
    pointing_box_present := True;
  END;

  FUNCTION DetermineWindow : word;
  BEGIN
    IF (mouse_x < dead_x) OR
    (mouse_y < dead_y) THEN
      BEGIN
        DetermineWindow := dead;
        Exit;
      END;
    IF (mouse_y < paint_y) THEN
      BEGIN
        DetermineWindow := command;
        Exit;
      END;
    DetermineWindow := doodle;
  END;

  PROCEDURE Fillc;
  BEGIN
    HideCursor;
    pointing_box_present := False;
    REPEAT
      GetMousePosBut;
      IF new_mouse_position THEN
        DrawPointingBox(mouse_x, mouse_y);
    UNTIL mouse_buttons = none;
    REPEAT
      GetMousePosBut;
      IF new_mouse_position THEN
        DrawPointingBox(mouse_x, mouse_y);
    UNTIL mouse_buttons = left;
    EraseLastPointingBox;
    fill_color := GetPixel(mouse_x+pointing_box.hot_x, mouse_y+pointing_box.hot_y);
    last_state := none;
    WaitKeyUp;
  END;

  PROCEDURE SelectFillColor;
  BEGIN
    SetMouseGraphicsCursor(@can);
    WaitKeyUp;
    REPEAT GetMousePosBut UNTIL mouse_buttons = left;
    IF DetermineWindow = doodle THEN
      BEGIN
        SetFillStyle(SolidFill, fill_color);
        HideCursor;
        FloodFill(mouse_x, mouse_y, GetColor);
      END;
    WaitKeyUp;

    last_state := no_state;
  END;

  PROCEDURE ClearScreen;
  BEGIN
    HideCursor;
    MakeScreen;
    ShowCursor;
  END;


  PROCEDURE MakePointingBox;
  VAR
    Size : word;
  BEGIN
    DrawPoly(pointing_box.count, pointing_box.points[1]);
    OutTextXY(5, 5, 'Chose');
    OutTextXY(5, 15, 'Color');
    Size := ImageSize(pointing_box.min_x,
    pointing_box.min_y,
    pointing_box.max_x,
    pointing_box.max_y);
    {  GetMem(pointing_box_pt,Size); use for heap }
    pointing_box_pt := @ iarray;
    GetImage(pointing_box.min_x,
             pointing_box.min_y,
             pointing_box.max_x,
             pointing_box.max_y,
             pointing_box_pt^);
    pointing_box_present := False;
  END;

  PROCEDURE DoCommand;
  BEGIN
    IF last_state <> command THEN
      BEGIN
        SetMouseGraphicsCursor(@cmd);
        last_state := command;
      END;
    if (mouse_y > box_row_y) and (mouse_y < (box_row_y + box_y)) then
    begin
    CASE mouse_buttons OF
      left :
        BEGIN
          IF (mouse_x > fill_x) AND (mouse_x < (fill_x+cmd_box_x)) THEN
            BEGIN
              SelectFillColor;
              Exit;
            END;
          IF (mouse_x > fillc_x) AND (mouse_x < (fillc_x+cmd_box_x)) THEN
            BEGIN
              Fillc;
              Exit;
            END;
          IF (mouse_x > clear_x) AND (mouse_x < (clear_x+cmd_box_x)) THEN
            BEGIN;
              ClearScreen;
              Exit;
            END;
        END;
      END;
    END;
  END;

  PROCEDURE DoDead;
  BEGIN
    IF last_state <> dead THEN
      BEGIN
        HideCursor;
        last_state := dead
      END;
  END;                        { DoDead }

  PROCEDURE DoDoodle;
  BEGIN
    IF last_state <> doodle THEN
      BEGIN
        SetMouseGraphicsCursor(@pencil);
        last_state := doodle;
        new_flag := True;
      END;
    CASE mouse_buttons OF
      left :
        BEGIN
          IF NOT new_flag THEN
            BEGIN
              ConditionalOffCursor(GetX, GetY, mouse_x, mouse_y);
              LineTo(mouse_x, mouse_y);
              ShowCursor;
            END
          ELSE
            BEGIN
              MoveTo(mouse_x, mouse_y);
              new_flag := False;
            END;
        END;                  {left}

      right : new_flag := True;
      both :
        BEGIN
          CloseGraph;
          Exit;
        END;
    END;                      {case}
  END;                        {DoDraw}


  PROCEDURE DoMouse;
  BEGIN
    IF NOT MouseExists THEN
      BEGIN
        WriteLn('Mouse Not Installed');
        Exit;
      END;
    InitMouse;
    new_flag := True;
    graphdriver := Detect;
{    graphmode := 0;}
    InitGraph(GraphDriver, GraphMode, '');
    MakePointingBox;
    MakeScreen;
    IF NOT MouseExists THEN
      BEGIN
        CloseGraph;
        WriteLn('Mouse Not Installed');
        Exit;
      END;
    InitMouse;
    REPEAT
      GetMousePosBut;

      CASE DetermineWindow OF
        dead : DoDead;
        doodle : DoDoodle;
        command : DoCommand;
      END;
    UNTIL (mouse_buttons = both) OR KeyPressed;
    CloseGraph;
  END;

BEGIN
  DoMouse;
  WriteLn('Thank you for using MouseDemo');
END.
