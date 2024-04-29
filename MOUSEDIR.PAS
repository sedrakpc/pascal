PROGRAM MouseTextDemo;
  uses crt, graph, dos;
  {$I global.ini}
  {$I goodies.ini}
  {$I mouse.ini}

TYPE
  path_record = RECORD
                  count : word;
                  paths : ARRAY[1..3] OF lstring;
                END;
  path_pointer = ^path_record;

CONST
  frame_attribute = 7;
  character_attribute = 112;
  column_width = 14;

  dir_frame : rect = (
    upper_left : (x : 4; y : 4);
    lower_right : (x : 76; y : 22));

  dir_area : rect = (
    upper_left : (x : 5; y : 5);
    lower_right : (x : 75; y : 21));

  dir_window : rect = (
    upper_left : (x : 12; y : 7);
    lower_right : (x : 70; y : 19));

  path_const : path_record = (
    count : 3;
    paths : ('c:\*.*', 'c:\*.exe', 'c:\*.com'));


VAR
  selection : lstring;
  err : word;

  PROCEDURE PickFile(path : path_pointer);
  VAR
    i : word;
  BEGIN
    FOR i := 1 TO path^.count DO
      BEGIN
        selection := '';
        err := DirToScreen(path^.paths[i], True);
        IF err = not_finished THEN
          BEGIN
            MyGotoXY(1, 1);
            MyWrite('More....');
            WHILE err = not_finished DO
              BEGIN
                selection := GetMouseSelection(dir_window);
                IF selection <> '' THEN Exit;
                Fill(dir_area, character_attribute); { clear window }
                err := DirToScreen('', False);
                IF err <> not_finished THEN
                  BEGIN
                    MyGotoXY(1, 1);
                    MyWrite('        '); { Kill "More..." }
                  END;
              END;
          END;
      END;
    selection := GetMouseSelection(dir_window);
  END;

BEGIN
  DirectVideo := False; { make Turbo use BIOS }
  InitPage(1); { Go to next text page in display }
  ClrScr;      { clear it }
  Frame(dir_frame, frame_attribute); { frame the window }
  Fill(dir_area, character_attribute); { fill the window with background }
  InitColumnWrite(dir_window, column_width); { Initialize columns }
  PickFile(@path_const); { selection = user choice of files found in path }
  RestorePage; { restore original page }

  { comment out one of the next two lines. }
  IF selection <> '' THEN {SetKeyBuffer(selection); }
     write('Selection is ',selection);

END.
