unit BaseRoute;

{$ifdef fpc}
{$mode delphi}
{$endif}

interface

uses
{$IFDEF fpc}
  classes, sysutils,
{$ELSE}
  system.classes, system.sysutils,
{$ENDIF}
  Jsonresult,
  jsons,
  Horse;


Type

 TBase=class
   public
    class procedure  Route;
 end;

implementation



{ TBase }

Procedure OnStatus(aReq:THorseRequest;aRes:THorseResponse);
begin
 aRes.ContentType('text/html')
      .send(Format('<H1>Service Horse version  %s  - ver Pro Horse </H1>' ,[THorse.Version]));

end;

Procedure OnJson(aReq:THorseRequest;aRes:THorseResponse);
begin
 aRes.ContentType('text/Json')
      .send(TJsonResult.new.Message('ddddd')
      );

end;

class procedure TBase.Route;
begin
 THorse.Get('/',OnStatus);
 THorse.Get('/',OnJson);

end;

end.
