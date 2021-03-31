object Flanguage: TFlanguage
  Left = 234
  Top = 105
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'System Maintain'
  ClientHeight = 522
  ClientWidth = 736
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
  TextHeight = 31
  object LabelBbh: TLabel
    Left = 474
    Top = 296
    Width = 96
    Height = 31
    Caption = #29256#26412#21495#65306
    Visible = False
  end
  object LabelSbbhV: TLabel
    Left = 474
    Top = 256
    Width = 96
    Height = 31
    Caption = #35774#22791#21495#65306
    Visible = False
  end
  object LabelCsch: TLabel
    Left = 474
    Top = 344
    Width = 96
    Height = 31
    Caption = #26657#39564#21495#65306
    Visible = False
  end
  object Label1: TLabel
    Left = 98
    Top = 119
    Width = 207
    Height = 31
    AutoSize = False
    Caption = 'Language Select'
  end
  object Label2: TLabel
    Left = 98
    Top = 175
    Width = 199
    Height = 31
    AutoSize = False
    Caption = 'Hospital Name'
  end
  object EtYkFilter: TcxCheckBox
    Left = 98
    Top = 336
    AutoSize = False
    Caption = 'YkFilter'
    TabOrder = 0
    Visible = False
    Height = 39
    Width = 239
  end
  object GridYK3x3: TStringGrid
    Left = 490
    Top = 76
    Width = 206
    Height = 81
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 396
    Width = 129
    Height = 53
    Caption = #21319#32423#22266#20214
    Default = True
    TabOrder = 2
    Visible = False
    OnClick = BitBtn1Click
  end
  object EtCountry: TwwDBComboBox
    Left = 322
    Top = 118
    Width = 279
    Height = 37
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
    Left = 322
    Top = 174
    TabOrder = 4
    Text = 'EtHospital'
    Width = 279
  end
  object EtName2: TcxCheckBox
    Left = 98
    Top = 227
    AutoSize = False
    Caption = 'Name2'
    TabOrder = 5
    Height = 39
    Width = 239
  end
  object EtEyeMove: TcxCheckBox
    Left = 97
    Top = 281
    AutoSize = False
    Caption = 'EyeMove'
    TabOrder = 6
    Height = 39
    Width = 240
  end
  object StatusBarBottom: TStatusBar
    Left = 0
    Top = 507
    Width = 736
    Height = 15
    Panels = <>
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 65
    Align = alTop
    Color = 2368548
    TabOrder = 8
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 734
      Height = 63
      Align = alClient
      Alignment = taCenter
      Caption = 'Setup'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -48
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel4: TPanel
    Left = 87
    Top = 489
    Width = 505
    Height = 189
    ParentColor = True
    TabOrder = 9
    Visible = False
    object Panel5: TPanel
      Left = 298
      Top = 1
      Width = 206
      Height = 187
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        206
        187)
      object Label4: TLabel
        Left = 8
        Top = 32
        Width = 48
        Height = 20
        Caption = #22995#21517#65306
      end
      object Label7: TLabel
        Left = 8
        Top = 92
        Width = 48
        Height = 20
        Caption = #23494#30721#65306
      end
      object SpeedButton2: TSpeedButton
        Left = 55
        Top = 3
        Width = 24
        Height = 25
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
        Left = 90
        Top = 3
        Width = 115
        Height = 25
        DataSource = userlogoS
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbPost, nbCancel]
        ConfirmDelete = False
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 36
        Top = 61
        Width = 146
        Height = 28
        DataField = 'USERNAME'
        DataSource = userlogoS
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 36
        Top = 113
        Width = 146
        Height = 28
        DataField = 'PASSW'
        DataSource = userlogoS
        PasswordChar = '*'
        TabOrder = 2
      end
      object DBCheckBox1: TDBCheckBox
        Left = 37
        Top = 151
        Width = 108
        Height = 17
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
      Width = 297
      Height = 187
      Align = alClient
      ParentColor = True
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 295
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = #21307#29983#21015#34920
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -24
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 42
        Width = 295
        Height = 144
        Align = alClient
        DataSource = userlogoS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
    Left = 382
    Top = 404
    Width = 139
    Height = 70
    Caption = 'Save'
    TabOrder = 10
    OnClick = BtOkClick
  end
  object cxButton2: TcxButton
    Left = 548
    Top = 404
    Width = 139
    Height = 70
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
