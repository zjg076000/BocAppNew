object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #31995#32479#30331#24405
  ClientHeight = 196
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object SpeedButton1: TSpeedButton
    Left = 43
    Top = 155
    Width = 81
    Height = 33
    Caption = #30331#24405
    ImageIndex = 1
    ImageName = #27491#30830
    Images = vtree
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 130
    Top = 155
    Width = 81
    Height = 33
    Caption = #21462#28040
    ImageIndex = 0
    ImageName = #38169#35823
    Images = vtree
    Flat = True
    OnClick = SpeedButton2Click
  end
  object Label2: TLabel
    Left = 33
    Top = 82
    Width = 65
    Height = 15
    Caption = #30331#24405#23494#30721#65306
  end
  object Label1: TLabel
    Left = 33
    Top = 26
    Width = 65
    Height = 15
    Caption = #30331#24405#29992#25143#65306
  end
  object Panel1: TPanel
    Left = 24
    Top = 1
    Width = 217
    Height = 129
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
  end
  object EdtPass: TEdit
    Left = 104
    Top = 79
    Width = 121
    Height = 23
    BevelEdges = [beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    PasswordChar = '*'
    CanUndoSelText = True
    TabOrder = 0
  end
  object CheckBox1: TCheckBox
    Left = 104
    Top = 108
    Width = 97
    Height = 17
    Caption = #35760#20303#25105
    TabOrder = 1
    Visible = False
  end
  object EdtUser: TEdit
    Left = 104
    Top = 23
    Width = 121
    Height = 23
    BevelEdges = [beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CanUndoSelText = True
    TabOrder = 2
  end
  object vtree: TVirtualImageList
    AutoFill = True
    Images = <
      item
        CollectionIndex = 0
        CollectionName = #38169#35823
        Name = #38169#35823
      end
      item
        CollectionIndex = 1
        CollectionName = #27491#30830
        Name = #27491#30830
      end>
    ImageCollection = imgtree
    PreserveItems = True
    Width = 20
    Height = 20
    Left = 195
    Top = 114
  end
  object imgtree: TImageCollection
    Images = <
      item
        Name = #38169#35823
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000002B1494441546843ED97BF6FD34014C7BFCFC4100A823281D480C2024D
              065489810D3130C3CEC0002B3FFA0FC0C2C2C854FE02183B306560420C1DCB00
              292C80920053494568AA9C7D0FB9C491B16C9FCF6707553AAFF63B7F3FEFFBDE
              BD3BC2017FE880EB8705F8DF0E5A07AC038619B025649840E370EB4098C26EA3
              76AD3EF236CF0F31CC9BD64F4BEE8AEF8B61EB07BEE48D897F67ECC0E7452CEE
              1D773788D064F04FF6E949FB9B58CB12348D5927C26530261278D5EE8BBB4520
              8C0022E22F82FE2EC52CB7D9A7476910610C08678968611A332189CEF2C0BBA9
              0B511820497CF8F3348824F1919809333D6FF7C5AA0E446180ADC6E1A74CF21E
              91732CE98771882CF1B378C9BD23237149A78F4C01EE1339FB659005717457BC
              0CFA245A368901F304C82AA1A8B8C009C099007C22ACF91458C14C6B732BA140
              445E0830236CF234F190E8B406DE0D9DFA0FBE2D5C42E18F7243A49799282ABE
              14002D276210CCD2487C69004520CA105F2A40B058F70C9AE4BA5D00F5AC9A0F
              7A8219EF5A7DB1A25BF3F1EF8D7B20DE0BCAAD721AA09AD879C14A01C835A412
              149501610C5054BCEAD8311707728B57CF81CC0360168C9103DD86FB1184866A
              C202B44BC049C530DB268F1F2C7FF75FE4CDBED12EB475CE5D65E6C744CEA98C
              B3D0FE3E5FFFEDDD9EDE1966C7EEC4892CF96BAB2F9A7301F8D0709F39848769
              598DEFF37926B694DC234F5CD5B9A1152EA160CF875B7B4BA0A53844DA90CABE
              43F018925FEB9E870A03043607775ACFE18E033A1DB991651E0F926F713C06A3
              571F892B3A7701A31E08EBF41F08608725BF5165310A41843DC9785FFF25AEEB
              8A2F056076843854BBE380D62F0CC4669E260C20C60BEE2D87E58EEECE135DDF
              A884F208ADFA1B0B50758655EB5B075419AAFABD75A0EA0CABD6B70EA83254F5
              7BEB40D51956AD6F1D5065A8EAF7D681AA33AC5AFF0FA8CA844032F9731C0000
              000049454E44AE426082}
          end>
      end
      item
        Name = #27491#30830
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              8700000158494441546843ED975112C1301086379E710617A82BE100C511B801
              7A005CA92EE00C7816533331A63AE936BB1BE9CCF6395DDFF7FF31690CF4FC31
              3DE70715F87783DA8036404C40B7103140F2EBDA003942E2006D8018A0F7F5D1
              213B1A63E600B0BDE5E5A66971B20D7CC1BFB96F79D9C89AA4401DFE09B07FE4
              E5BA170DD4E12DD8F33DBF54DBA8F149AA81AEF09551320221F0C90884C22721
              4081FFBB0015DE2B302CA6BB01C0CA5A7BBA2F2F0BEE038B03DE2B302EA6D641
              734B70C1A31AE096E0846FFD0F8C8AEC64C0CCB824B8E15B05AA055C1212F028
              010E092978B400454212BE93408884347C67812E1231E083043012B1E083057C
              1231E149024D1260E10A06269F73A3E532C2F17942BE0FD4CF8998F0E4061CEC
              CF61172179F7DBE406DC20F7F5EABB80736C99FA0C36010938CC4C15C0A424B9
              461B904C17335B1BC0A424B9461B904C17335B1BC0A424B9A6F70DBC0096C7FB
              31EFB2FECC0000000049454E44AE426082}
          end>
      end>
    Left = 258
    Top = 128
  end
end
