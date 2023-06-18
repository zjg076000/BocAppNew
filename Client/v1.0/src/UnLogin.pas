unit UnLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImageList;

type
  TFrmLogin = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    vtree: TVirtualImageList;
    imgtree: TImageCollection;
    EdtPass: TEdit;
    CheckBox1: TCheckBox;
    EdtUser: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure WMNCPaint(var Msg: TWMNCPaint); message WM_NCPAINT;
    procedure WMNCACTIVATE(var Msg: TWMNCActivate); message WM_NCACTIVATE;
  //  procedure DrawCaptionText();
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses uEncrypt_Decrypt, udata, UMain,UCommon;
{$R *.dfm}

{procedure TFrmLogin.DrawCaptionText;
const
  captionText = '';
var
  canvas: TCanvas;
begin
  canvas := TCanvas.Create;
  try
    canvas.Handle := GetWindowDC(Self.Handle);
    with canvas do
    begin
      Brush.Style := bsClear;
      Font.Color := clMaroon;
      TextOut(Self.Width - 110, 6, captionText);
    end;
  finally
    ReleaseDC(Self.Handle, canvas.Handle);
    canvas.Free;
  end;
end;        }

procedure TFrmLogin.FormCreate(Sender: TObject);
var
  dc: hdc;
  cvs: TCanvas;
begin
 { dc := GetWindowDC(Handle); // ȡ�ô���ľ��
  cvs := TCanvas.Create;
  cvs.Handle := dc;
  cvs.Font.Size := 11; // ���������С
  cvs.Brush.Color := rgb(222, 222, 9); // ������ɫ     }
  // cvs.TextOut(100,1.'ϵͳ��¼');
end;

procedure TFrmLogin.SpeedButton1Click(Sender: TObject);
var

  stryan, user, sql, password: String;
begin

 UCommon.IsLogin:=true;

//showmessage(
// Application.ProcessMessages;
{
  user := trim(EdtUser.Text);
  sql := 'select * from t_user where usercode=''' + user + '''';
  with dm_data.FDQ do
  begin
    close;
    sql.Text := 'select * from t_user where  usercode=''' + user + '''';
    open;
  end;
  if dm_data.FDQ.RecordCount = 0 then
  begin
    showmessage('��������û���������');
    exit;
  end;

  if dm_data.FDQ.RecordCount > 0 then
  begin
    stryan := trim(dm_data.FDQ.FieldByName('passyan').Text);
    password := trim(dm_data.FDQ.FieldByName('password').Text);
    // showmessage(uEncrypt_Decrypt.EncryptString(edtPass.text,stryan));
    if uEncrypt_Decrypt.UnEncryptString(password, stryan) = trim(EdtPass.Text)
    then
    begin
      frmmain := tfrmmain.Create(Self);
      FrmLogin.Visible := false;
      FrmLogin.AlphaBlend := true; // ͸��

      FrmLogin.AlphaBlendValue := 180; // ͸����

      FrmLogin.TransparentColor := true;
      frmmain.showmodal;
    end
    else
    begin
      showmessage('����������벻��ȷ');
      exit;
    end;

  end;      }
end;

procedure TFrmLogin.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmLogin.WMNCACTIVATE(var Msg: TWMNCActivate);
begin
  inherited;
 // DrawCaptionText;
end;

procedure TFrmLogin.WMNCPaint(var Msg: TWMNCPaint);
begin
  inherited;

end;

end.
