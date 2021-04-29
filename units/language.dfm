object Flanguage: TFlanguage
  Left = 658
  Top = 237
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'System Maintain'
  ClientHeight = 404
  ClientWidth = 570
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 24
  object LabelBbh: TLabel
    Left = 367
    Top = 229
    Width = 96
    Height = 24
    Caption = #29256#26412#21495#65306
    Visible = False
  end
  object LabelSbbhV: TLabel
    Left = 367
    Top = 198
    Width = 96
    Height = 24
    Caption = #35774#22791#21495#65306
    Visible = False
  end
  object LabelCsch: TLabel
    Left = 367
    Top = 266
    Width = 96
    Height = 24
    Caption = #26657#39564#21495#65306
    Visible = False
  end
  object Label1: TLabel
    Left = 76
    Top = 92
    Width = 160
    Height = 24
    AutoSize = False
    Caption = 'Language Select'
  end
  object Label2: TLabel
    Left = 76
    Top = 135
    Width = 154
    Height = 24
    AutoSize = False
    Caption = 'Hospital Name'
  end
  object EtYkFilter: TcxCheckBox
    Left = 76
    Top = 260
    AutoSize = False
    Caption = 'YkFilter'
    TabOrder = 0
    Visible = False
    Height = 30
    Width = 185
  end
  object GridYK3x3: TStringGrid
    Left = 379
    Top = 59
    Width = 160
    Height = 63
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 81
    Top = 307
    Width = 99
    Height = 41
    Caption = #21319#32423#22266#20214
    Default = True
    TabOrder = 2
    Visible = False
    OnClick = BitBtn1Click
  end
  object EtCountry: TwwDBComboBox
    Left = 249
    Top = 91
    Width = 216
    Height = 30
    ShowButton = True
    Style = csDropDown
    MapList = False
    AllowClearKey = False
    Ctl3D = False
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'English'
      'Chinese')
    ItemIndex = 0
    ParentCtl3D = False
    Sorted = False
    TabOrder = 3
    UnboundDataType = wwDefault
    OnCloseUp = EtCountryCloseUp
  end
  object EtHospital: TcxTextEdit
    Left = 249
    Top = 135
    TabOrder = 4
    Text = 'EtHospital'
    Width = 216
  end
  object EtName2: TcxCheckBox
    Left = 76
    Top = 176
    AutoSize = False
    Caption = 'Name2'
    TabOrder = 5
    Height = 30
    Width = 185
  end
  object EtEyeMove: TcxCheckBox
    Left = 75
    Top = 218
    AutoSize = False
    Caption = 'EyeMove'
    TabOrder = 6
    Height = 30
    Width = 186
  end
  object StatusBarBottom: TStatusBar
    Left = 0
    Top = 389
    Width = 570
    Height = 15
    Panels = <>
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 50
    Align = alTop
    Color = 2368548
    TabOrder = 8
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 568
      Height = 48
      Align = alClient
      Alignment = taCenter
      Caption = 'Setup'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -37
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel4: TPanel
    Left = 67
    Top = 379
    Width = 391
    Height = 146
    ParentColor = True
    TabOrder = 9
    Visible = False
    object Panel5: TPanel
      Left = 231
      Top = 1
      Width = 159
      Height = 144
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        159
        144)
      object Label4: TLabel
        Left = 6
        Top = 25
        Width = 36
        Height = 13
        Caption = #22995#21517#65306
      end
      object Label7: TLabel
        Left = 6
        Top = 71
        Width = 36
        Height = 13
        Caption = #23494#30721#65306
      end
      object SpeedButton2: TSpeedButton
        Left = 43
        Top = 2
        Width = 18
        Height = 20
        Anchors = [akTop, akRight]
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          330033333333333333003300000000003300330FFFFFFFF03300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        OnClick = SpeedButton2Click
      end
      object DBNavigator2: TDBNavigator
        Left = 70
        Top = 2
        Width = 100
        Height = 20
        DataSource = userlogoS
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 28
        Top = 47
        Width = 113
        Height = 21
        DataField = 'USERNAME'
        DataSource = userlogoS
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 28
        Top = 87
        Width = 113
        Height = 21
        DataField = 'PASSW'
        DataSource = userlogoS
        PasswordChar = '*'
        TabOrder = 2
      end
      object DBCheckBox1: TDBCheckBox
        Left = 29
        Top = 117
        Width = 83
        Height = 13
        Caption = #36229#32423#29992#25143
        DataField = 'ADMINUSER'
        DataSource = userlogoS
        TabOrder = 3
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 230
      Height = 144
      Align = alClient
      ParentColor = True
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 228
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        Caption = #21307#29983#21015#34920
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 33
        Width = 228
        Height = 110
        Align = alClient
        DataSource = userlogoS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'USERNAME'
            Title.Alignment = taCenter
            Title.Caption = #22995#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADMINUSER'
            Title.Alignment = taCenter
            Title.Caption = #36229#32423#29992#25143
            Visible = True
          end>
      end
    end
  end
  object BtSave: TcxButton
    Left = 296
    Top = 313
    Width = 107
    Height = 54
    Caption = 'Save'
    TabOrder = 10
    OnClick = BtOkClick
  end
  object cxButton2: TcxButton
    Left = 424
    Top = 313
    Width = 108
    Height = 54
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 11
    OnClick = cxButton2Click
  end
  object OpenDialogBin: TOpenDialog
    Filter = 'Bin|*.bin'
    Title = #25171#24320#22266#20214#25991#20214#23436#25104#21319#32423
    Left = 556
    Top = 145
  end
  object USERLOGOTable: TwwTable
    Active = True
    DatabaseName = 'lw'
    TableName = 'USERLOGO.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 395
    Top = 65
  end
  object userlogoS: TwwDataSource
    DataSet = USERLOGOTable
    Left = 411
    Top = 63
  end
end
