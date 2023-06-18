//此单元用于控制托盘图标行为
unit uTrayIcon;
 
interface
 
uses SysUtils, Classes, Windows, Forms, Messages, ExtCtrls, Menus;
 
type
  TTrayIcon = class(TDataModule)
  private
    FHideIconWhenShow: Boolean;
  private
    MainForm    : TForm;
    AllowClose  : Boolean;
    WindowState : TWindowState;
    MenuItemShow: TMenuItem;
    MenuItemHide: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemCutCreen: TMenuItem;
    MenuItemALLCreen: TMenuItem;
    PopupMenu   : TPopupMenu;
    FTrayIcon   : ExtCtrls.TTrayIcon;
    OriginAppMinimize   : procedure(Sender: TObject) of object;
    OriginFormCloseQuery: procedure(Sender: TObject; var CanClose: Boolean) of object;
    OriginFormResize    : procedure(Sender: TObject) of object;
    procedure AppMinimize(Sender: TObject);
    procedure FormResize (Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrayClick  (Sender: TObject);
    procedure MenuItemShowClick(Sender: TObject);
    procedure MenuItemHideClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemCutCreenClick(Sender: TObject);
    procedure MenuItemALLCreenClick(Sender: TObject);
    procedure SetHideIconWhenShow(Value: Boolean);
    function  ForceForegroundWindow(hWnd: THandle): Boolean;
  public
    property  HideIconWhenShow: Boolean write SetHideIconWhenShow;
    procedure ShowApp;
    procedure HideApp;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;
 
var TrayIcon: TTrayIcon;
 
implementation
 
{$R *.dfm}

uses  UMain;
 
constructor TTrayIcon.Create(AOwner: TComponent);
begin
  inherited;
  FHideIconWhenShow := False;

  MainForm    := Application.MainForm;
 // MainForm    :=Application.frmmain;
  WindowState := MainForm.WindowState;

  OriginAppMinimize := Application.OnMinimize;
  OriginFormResize  := MainForm.OnResize;
  OriginFormCloseQuery   := MainForm.OnCloseQuery;

  Application.OnMinimize := AppMinimize;
  MainForm.OnResize      := FormResize;
  MainForm.OnCloseQuery  := FormCloseQuery;




  MenuItemShow := TMenuItem.Create(Self);
  MenuItemHide := TMenuItem.Create(Self);
  MenuItemExit := TMenuItem.Create(Self);

  MenuItemCutCreen := TMenuItem.Create(Self);
  MenuItemAllCreen := TMenuItem.Create(Self);

  MenuItemShow.Caption := '显示';
  MenuItemHide.Caption := '隐藏';
  MenuItemExit.Caption := '退出';
  MenuItemCutCreen.Caption := '区域截屏';
  MenuItemAllCreen.Caption := '全屏截图';
 // MenuItemCutCreen.ShortCut:= ShortCut(Word('Z'), [ssCtrl]);
  MenuItemShow.OnClick := MenuItemShowClick;
  MenuItemHide.OnClick := MenuItemHideClick;
  MenuItemExit.OnClick := MenuItemExitClick;
   // 绑定事件
  MenuItemCutCreen.OnClick :=MenuItemCutCreenClick;
  MenuItemALLCreen.OnClick :=MenuItemALLCreenClick;

  PopupMenu := TPopupMenu.Create(Self);
  PopupMenu.Items.Add(MenuItemShow);
  PopupMenu.Items.Add(MenuItemHide);
  PopupMenu.Items.Add(MenuItemExit);
  //区域截屏
  PopupMenu.Items.Add(MenuItemCutCreen);
  PopupMenu.Items.Add(MenuItemALLCreen);


  FTrayIcon := ExtCtrls.TTrayIcon.Create(Self);
  FTrayIcon.Visible   := True;
  FTrayIcon.OnClick   := TrayClick;
  FTrayIcon.PopupMenu := PopupMenu;
 
  AllowClose := False;
end;
 
destructor TTrayIcon.Destroy;
begin
  Application.OnMinimize := OriginAppMinimize;
  MainForm.OnResize      := OriginFormResize;
  MainForm.OnCloseQuery  := OriginFormCloseQuery;
  inherited;
end;
 
procedure TTrayIcon.TrayClick(Sender: TObject);
begin
  if MainForm.WindowState = wsMinimized then
    MenuItemShowClick(Sender)
  else
    MenuItemHideClick(Sender);
end;
 
procedure TTrayIcon.AppMinimize(Sender: TObject);
begin
  if Assigned(OriginAppMinimize) then
    OriginAppMinimize(Sender);
  FTrayIcon.Visible := True;
  MainForm.Hide;
end;
 
procedure TTrayIcon.ShowApp;
begin
  MenuItemShowClick(nil);
end;
 
procedure TTrayIcon.HideApp;
begin
  MenuItemHideClick(nil);
end;
 
procedure TTrayIcon.FormResize(Sender: TObject);
begin
  if Assigned(OriginFormResize) then
    OriginFormResize(Sender);
  if MainForm.WindowState <> wsMinimized then
    WindowState := MainForm.WindowState;
end;
 
procedure TTrayIcon.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not AllowClose then
  begin
    CanClose := False;
    MenuItemHideClick(Sender);
  end
  else
  begin
    if Assigned(OriginFormCloseQuery) then
      OriginFormCloseQuery(Sender, CanClose);
  end;
end;
 
procedure TTrayIcon.MenuItemShowClick(Sender: TObject);
begin
  if MainForm.WindowState = wsMinimized then
  begin
    MainForm.Show;
    MainForm.WindowState := WindowState;;
  end;
  if FHideIconWhenShow then
  begin
    FTrayIcon.Visible := False;
  end;
  ForceForegroundWindow(MainForm.Handle);
end;
 
procedure TTrayIcon.MenuItemHideClick(Sender: TObject);
begin
  if MainForm.WindowState <> wsMinimized then
  begin
    if Assigned(OriginAppMinimize) then
      OriginAppMinimize(Sender);
    FTrayIcon.Visible := True;
    MainForm.Hide;
    MainForm.WindowState := wsMinimized;
  end;
end;
 
procedure TTrayIcon.SetHideIconWhenShow(Value: Boolean);
begin
  FHideIconWhenShow := Value;
  if (MainForm.WindowState <> wsMinimized) then
  begin
    FTrayIcon.Visible := (not Value);
  end;
end;
 
procedure TTrayIcon.MenuItemExitClick(Sender: TObject);
begin
  AllowClose := True;
  MainForm.Close;
end;

procedure TTrayIcon.MenuItemALLCreenClick(Sender: TObject);
begin
  // frmcapture.Timer1.Enabled := true;
end;

procedure TTrayIcon.MenuItemCutCreenClick(Sender: TObject);
begin
 // AllowClose := True;
 // MainForm.Close;
//  frmQcapture.timer1.enabled:=true;
end;

function TTrayIcon.ForceForegroundWindow(hWnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  if GetForegroundWindow = hWnd then
    Result := True
  else
  begin
    Result := False;
    ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
    ThisThreadID := GetWindowThreadPRocessId(hWnd, nil);
    if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
    begin
      BringWindowToTop(hWnd);
      SetForegroundWindow(hWnd);
      AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
      Result := (GetForegroundWindow = hWnd);
    end;
    if not Result then
    begin
      SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
      SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
        SPIF_SENDCHANGE);
      BringWindowToTop(hWnd);
      SetForegroundWindow(hWnd);
      SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
    end;
    Result := (GetForegroundWindow = hWnd);
  end;
end;
 
end.