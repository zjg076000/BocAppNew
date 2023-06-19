program Service_App;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Horse,
  BaseRoute in '..\Src\BaseRoute.pas',
  JsonResult in '..\Src\JsonResult.pas',
  DBContext.FirDAC in '..\Src\DBContext.FirDAC.pas';

begin

TBase.Route;

 THorse.Listen(9095,
    procedure
    begin
      Writeln(Format('Service active in Port  %d', [THorse.Port]));
      Readln;
    end);




end.
