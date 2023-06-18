unit UBaseMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.NumberBox,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, RzTabs,winapi.CommCtrl,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList, system.DateUtils,
  Vcl.VirtualImageList;

type
  TFBaseMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    new1: TMenuItem;
    new2: TMenuItem;
    pnlbottom: TPanel;
    Panel2: TPanel;
    lbl_Dateweek: TLabel;
    lbl_time: TLabel;
    Bevel3: TBevel;
    Panel3: TPanel;
    Bevel1: TBevel;
    btnCompute: TSpeedButton;
    btnWinWord: TSpeedButton;
    btnPaint: TSpeedButton;
    btnExcel: TSpeedButton;
    btnBackup: TSpeedButton;
    btnNotepad: TSpeedButton;
    btnsum: TSpeedButton;
    btnClock: TSpeedButton;
    btnMenuTool: TSpeedButton;
    btnMenu: TSpeedButton;
    pnl_time: TPanel;
    NumberBox1: TNumberBox;
    Panel4: TPanel;
    pnl_user: TPanel;
    Bevel4: TBevel;
    Panel1: TPanel;
    Image2: TImage;
    Pnl_TopToolbar: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnl_treeview: TPanel;
    Tree: TTreeView;
    Panel6: TPanel;
    lsv_Main: TListView;
    imglisttree: TVirtualImageList;
    imgtree: TImageCollection;
    img_tab: TImageCollection;
    imglist_Tab: TVirtualImageList;
    imglisbottom: TVirtualImageList;
    imbottom: TImageCollection;
    imglistlistview: TVirtualImageList;
    imglistview: TImageCollection;
    imgmenu: TImageCollection;
    imglistmenu: TVirtualImageList;
    img_btn: TImageCollection;
    imglist_btn: TVirtualImageList;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseMain: TFBaseMain;

implementation
  USES uStyle,UCommon;
{$R *.dfm}

procedure TFBaseMain.btnMenuClick(Sender: TObject);
begin
   if pnl_treeview.Visible = false then
    pnl_treeview.Visible := true
  else
    pnl_treeview.Visible := false;
end;

procedure TFBaseMain.FormCreate(Sender: TObject);
begin
   self.Caption:=UStyle.APPCAPTION;
   self.Font.Name:=UStyle.APPFONT_NAME;
   self.Font.Size:=UStyle.APPFONT_size;



end;

procedure TFBaseMain.FormShow(Sender: TObject);
begin
     TreeView_SetItemHeight(Tree.Handle, 30);
end;

procedure TFBaseMain.Timer1Timer(Sender: TObject);
begin
  lbl_dateweek.Caption:=Formatdatetime('YYYY/M/D',now)+' '+UCommon.GetWeek;
  lbl_time.Caption:=Formatdatetime('HH:NN:SS',now);
end;

end.
