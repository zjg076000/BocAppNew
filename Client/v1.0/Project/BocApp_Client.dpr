program BocApp_Client;

uses
  Vcl.Forms,
  vcl.Dialogs,
  winapi.Windows,
  UBaseMain in '..\src\BaseTemple\UBaseMain.pas' {FBaseMain},
  DockUtils in '..\src\Common\DockUtils.pas',
  UCommon in '..\src\Common\UCommon.pas',
  UStyle in '..\src\Common\UStyle.pas',
  UMain in '..\src\UMain.pas' {FMain},
  uTrayIcon in '..\src\Common\uTrayIcon.pas' {TrayIcon: TDataModule},
  UnLogin in '..\src\UnLogin.pas' {FrmLogin},
  uEncrypt_Decrypt in '..\src\Common\uEncrypt_Decrypt.pas',
  UData in '..\src\Common\UData.pas' {DmData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmData, DmData);
  Application.CreateForm(TFrmLogin, FrmLogin);

 // ucommon.delay(2000);
 // showmessage('µÈ´ýµÇÂ¼');
  if UCommon.IsLogin=true then
   begin
    ucommon.delay(1000);
     FrmLogin.close;
    Application.CreateForm(TFMain, FMain);


    Application.CreateForm(TTrayIcon, TrayIcon);

   end ;
 //  else
   //  Application.Terminate;
     Application.Run;
end.
