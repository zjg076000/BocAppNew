program Service_App;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Horse,
  BaseRoute in '..\Src\BaseRoute.pas',
  JsonResult in '..\Src\JsonResult.pas';

begin
  TBase.Route;
  THorse.Listen(9095,
       procedure(aHorse:THorse)
       begin
         Writeln(Format('Service active in Port  %d',[aHorse.Port]));
        // Writeln('aaa');

       end);

end.
