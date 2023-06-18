unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBaseMain, Vcl.Menus, Vcl.ComCtrls,
  RzTabs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.NumberBox,
  Vcl.Buttons, Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList;

type
  TFMain = class(TFBaseMain)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

end.
