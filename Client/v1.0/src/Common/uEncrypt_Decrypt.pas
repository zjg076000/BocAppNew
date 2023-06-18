unit uEncrypt_Decrypt;

interface

uses SysUtils;

const XorKey: array[0..7] of Byte = ($B2, $09, $AA, $55, $93, $6D, $84, $47);

//通过密钥Key加密
function EncryptString(Source, Key: string): string;
function UnEncryptString(Source, Key: string): string;

//异或加密
function Enc(str: string): string;
function Dec(str: string): string;


implementation

function EncryptString(Source, Key: string): string;
var
  KeyLen,KeyPos,Offset,SrcPos,SrcAsc,Range: integer;
  Dest: string;
begin
  KeyLen := Length(Key);
  if KeyLen = 0 then
    Key := 'delphi';
  KeyPos := 0;
  Range := 256;
  randomize;
  Offset := random(Range);
  Dest := format('%1.2x', [Offset]);
  for SrcPos := 1 to Length(Source) do
  begin
    SrcAsc := (Ord(Source[SrcPos]) + Offset) mod 255;
    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    Dest := Dest + format('%1.2x', [SrcAsc]);
    Offset := SrcAsc;
  end;
  result := Dest;
end;

function UnEncryptString(Source, Key: string): string;
var
  KeyLen,KeyPos,Offset,SrcPos,SrcAsc,TmpSrcAsc: integer;
  Dest: string;
begin
  KeyLen := Length(Key);
  if KeyLen = 0 then
    Key := 'delphi';
  KeyPos := 0;
  Offset := strtoint('$' + copy(Source, 1, 2));
  SrcPos := 3;
  repeat
    SrcAsc := strtoint('$' + copy(Source, SrcPos, 2));
    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= Offset then
      TmpSrcAsc := 255 + TmpSrcAsc - Offset
    else
      TmpSrcAsc := TmpSrcAsc - Offset;
    Dest := Dest + chr(TmpSrcAsc);
    Offset := SrcAsc;
    SrcPos := SrcPos + 2;
  until
    SrcPos >= Length(Source);
  result := Dest;
end;

function Enc(str: string): string;
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(str) do
  begin
    Result := Result + IntToHex(Byte(str[i]) xor XorKey[j], 2);
    j := (j + 1) mod 8;
  end;
end;

function Dec(str: string): string;
var
  i, j: Integer;
begin
  Result := '';
  j := 0;
  for i := 1 to Length(str) div 2 do
  begin
    Result := Result + Char(StrToInt('$' + Copy(str, i * 2 - 1, 2)) xor
    XorKey[j]);
    j := (j + 1) mod 8;
  end;
end;

end.
