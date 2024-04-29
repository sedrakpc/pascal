unit hash;
INTERFACE
uses def;

Type
 THItem = record
   hKey:LongInt;
   hDepth:byte;
   hMove:TMove;
   hPiece:byte;
 end;
 PHItem = ^THItem;

Const
  HItemSize = 8;
  HBankCount = 4096;
  HBanks = 8;
  HSize  = (HBankCount * HBanks);

Type
 THBank = array[0..HBankCount-1] of THitem;
 PHBank = ^THBank;

var hTable:array[0..HBanks-1] of PHBank;
var hKeys:array[0..3, 0..7, 0..63] of LongInt;



procedure hReset;
procedure hInsert(key:LongInt; move:TMove; piece,depth:integer);
function hLook(key:LongInt; var move:TMove; var piece:integer):boolean;
procedure WriteHashDamp;

IMPLEMENTATION

const firstInit:boolean = true;

procedure hReset;
var
 x,y,z,n:integer;
begin
if firstInit then
begin
  firstInit := false;
  {Randomize;}
  for z := 0 to 3 do for y := 0 to 7 do for x := 0 to 63 do
  begin
     hKeys[z,y,x] := LongInt(Random($FFFF-1))  xor
                     (LongInt(Random($FFFF-1))  shl 15);
  end;

  for n := 0 to HBanks-1 do begin
    GetMem(hTable[n], sizeof(THBank));
  end;
end;

  for n := 0 to HBanks-1 do
    FillChar(hTable[n]^,  sizeof(THBank), 0);
end;


function BankNumber(key:LongInt):LongInt;
begin
   BankNumber := (key and ( LongInt(HSize)-1))  shr 12;
end;

function ItemNumber(key:LongInt):LongInt;
begin
   ItemNumber := (key and ( LongInt(HSize)-1))  and ( LongInt(HBankCount)-1);
end;

function hLook(key:LongInt; var move:TMove; var piece:integer):boolean;
begin
    hLook := false;
    with hTable[BankNumber(key)]^ [ItemNumber(key)] do
    begin
      if hPiece = 0 then exit;
      if hKey <> key then exit;
      move.data := hMove.data;
      piece := hPiece;
      hLook := true;
    end;
end;


procedure hInsert(key:LongInt; move:TMove; piece,depth:integer);
begin

    with hTable[BankNumber(key)]^ [ItemNumber(key)] do
    begin
      if hDepth > depth then exit;
      hPiece := piece;
      hKey := key;
      hMove.data := move.data;
      hDepth := depth;
    end;
end;

procedure WriteHashDamp;
var
 empty,full:LongInt;
 F:TEXT;
 n,j:integer;
begin


   empty := 0; full := 0;
   for n := 0 to HBanks-1 do for j := 0 to HBankCount-1 do
   with hTable[n]^[j] do
   begin
     if hPiece = 0 then inc(empty)
      else inc(full);
   end;

   Assign(F, 'HashDamp.dat');
   Rewrite(F);
   Writeln(F, 'hash damp: empty - ', empty,' full - ', full);
   Close(F);

end;

END.