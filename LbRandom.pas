unit LbRandom;

interface

uses
  SysUtils, Dos;

procedure RandomBytes(var buff; len: DWORD);
function RandomString(len: DWORD): string;


implementation

uses
  Classes;

{ -------------------------------------------------------------------------- }
procedure RandomBytes(var buff; len: DWORD);
var
  Index: DWORD;
begin

  for Index := 0 to len - 1 do
  begin
    TByteArray(buff)[Index] := Random(256);
  end;
end;

function RandomString(len: DWORD): string;
const
  localLb64Table: array of char = (#65, #66, #67, #68, #69,
    #70, #71, #72, #73, #74, #75, #76, #77, #78, #79,
    #80, #81, #82, #83, #84, #85, #86, #87, #88, #89,
    #90, #97, #98, #99, #100, #101, #102, #103, #104, #105,
    #106, #107, #108, #109, #110, #111, #112, #113, #114, #115,
    #116, #117, #118, #119, #120, #121, #122, #48, #49, #50,
    #51, #52, #53, #54, #55, #56, #57);
var
  Index: DWORD;
begin

  Result := '';
  for Index := 1 to len do
  begin
    Result += localLb64Table[Random(High(localLb64Table))];
  end;
end;

initialization

  Randomize;  

end.
