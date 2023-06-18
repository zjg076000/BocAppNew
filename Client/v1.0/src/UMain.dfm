inherited FMain: TFMain
  Caption = 'FMain'
  PixelsPerInch = 96
  TextHeight = 15
  inherited Pnl_TopToolbar: TPanel
    inherited SpeedButton1: TSpeedButton
      ExplicitLeft = 1030
      ExplicitTop = 6
    end
  end
  inherited PageControl1: TRzPageControl
    ExplicitLeft = 80
    ExplicitTop = 175
    FixedDimension = 25
    inherited TabSheet1: TRzTabSheet
      inherited Panel6: TPanel
        inherited lsv_Main: TListView
          LargeImages = imglistlistview
          SmallImages = imglistlistview
          StateImages = imglistlistview
          ExplicitLeft = 1
        end
      end
    end
  end
  inherited MainMenu1: TMainMenu
    Left = 384
    Top = 192
  end
  inherited img_tab: TImageCollection
    Left = 976
    Top = 272
  end
  inherited imglist_Tab: TVirtualImageList
    Left = 976
    Top = 216
  end
  inherited imglistlistview: TVirtualImageList
    Left = 978
    Top = 356
  end
  inherited imglistview: TImageCollection
    Left = 981
    Top = 413
  end
  inherited imgmenu: TImageCollection
    Left = 976
    Top = 65520
  end
  inherited imglistmenu: TVirtualImageList
    Left = 968
    Top = 33
  end
  inherited img_btn: TImageCollection
    Left = 976
    Top = 96
  end
  inherited imglist_btn: TVirtualImageList
    Left = 976
    Top = 153
  end
end
