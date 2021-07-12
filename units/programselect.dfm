object FProgramSelect: TFProgramSelect
  Left = 484
  Top = 149
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Select Program'
  ClientHeight = 534
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    Color = 16749107
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 469
    Width = 505
    Height = 1
    Align = alBottom
    BevelOuter = bvNone
    Color = 16749107
    TabOrder = 1
  end
  object Panel6: TPanel
    Left = 0
    Top = 1
    Width = 1
    Height = 468
    Align = alLeft
    BevelOuter = bvNone
    Color = 16749107
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 470
    Width = 505
    Height = 64
    Align = alBottom
    Color = 2368548
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object BtOk: TcxButton
      Left = 172
      Top = 8
      Width = 142
      Height = 48
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object BtCancel: TcxButton
      Left = 330
      Top = 8
      Width = 143
      Height = 48
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 1
    Width = 504
    Height = 468
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 4
    object TabType: TcxTabControl
      Left = 1
      Top = 66
      Width = 502
      Height = 30
      Align = alTop
      Color = 2368548
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      LookAndFeel.Kind = lfOffice11
      ParentColor = False
      ParentFont = False
      TabIndex = 0
      TabOrder = 0
      Tabs.Strings = (
        'Threshold'
        'Screen'
        'Special'
        'Custom')
      OnChange = TabTypeChange
      ClientRectBottom = 30
      ClientRectRight = 502
      ClientRectTop = 30
    end
    object EtPtName: TcxGrid
      Left = 1
      Top = 96
      Width = 502
      Height = 371
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object EtPtNameDBTableView1: TcxGridDBTableView
        OnDblClick = EtPtNameDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DsPt
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideSelection = True
        OptionsView.GroupByBox = False
        object EtPtNameDBTableView1Name: TcxGridDBColumn
          DataBinding.FieldName = 'Name'
          OnGetDisplayText = EtPtNameDBTableView1NameGetDisplayText
          Width = 472
        end
        object EtPtNameDBTableView1Id: TcxGridDBColumn
          DataBinding.FieldName = 'Id'
          Visible = False
        end
        object EtPtNameDBTableView1Type: TcxGridDBColumn
          DataBinding.FieldName = 'Type'
          Visible = False
        end
        object EtPtNameDBTableView1State: TcxGridDBColumn
          DataBinding.FieldName = 'State'
          Visible = False
        end
        object EtPtNameDBTableView1Gray: TcxGridDBColumn
          DataBinding.FieldName = 'Gray'
          Visible = False
        end
        object EtPtNameDBTableView1GHT: TcxGridDBColumn
          DataBinding.FieldName = 'GHT'
          Visible = False
        end
        object EtPtNameDBTableView1Dev: TcxGridDBColumn
          DataBinding.FieldName = 'Dev'
          Visible = False
        end
        object EtPtNameDBTableView1Xby: TcxGridDBColumn
          DataBinding.FieldName = 'Xby'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy0: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy0'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy1: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy1'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy2: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy2'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy3: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy3'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy4: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy4'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy5: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy5'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy6: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy6'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy7: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy7'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy8: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy8'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy9: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy9'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy10: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy10'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy11: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy11'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy12: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy12'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy13: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy13'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy14: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy14'
          Visible = False
        end
        object EtPtNameDBTableView1Strategy15: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy15'
          Visible = False
        end
        object EtPtNameDBTableView1Report0: TcxGridDBColumn
          DataBinding.FieldName = 'Report0'
          Visible = False
        end
        object EtPtNameDBTableView1Report1: TcxGridDBColumn
          DataBinding.FieldName = 'Report1'
          Visible = False
        end
        object EtPtNameDBTableView1Report2: TcxGridDBColumn
          DataBinding.FieldName = 'Report2'
          Visible = False
        end
        object EtPtNameDBTableView1Report3: TcxGridDBColumn
          DataBinding.FieldName = 'Report3'
          Visible = False
        end
        object EtPtNameDBTableView1Report4: TcxGridDBColumn
          DataBinding.FieldName = 'Report4'
          Visible = False
        end
        object EtPtNameDBTableView1Report5: TcxGridDBColumn
          DataBinding.FieldName = 'Report5'
          Visible = False
        end
        object EtPtNameDBTableView1Report6: TcxGridDBColumn
          DataBinding.FieldName = 'Report6'
          Visible = False
        end
        object EtPtNameDBTableView1Report7: TcxGridDBColumn
          DataBinding.FieldName = 'Report7'
          Visible = False
        end
        object EtPtNameDBTableView1Report8: TcxGridDBColumn
          DataBinding.FieldName = 'Report8'
          Visible = False
        end
        object EtPtNameDBTableView1Report9: TcxGridDBColumn
          DataBinding.FieldName = 'Report9'
          Visible = False
        end
        object EtPtNameDBTableView1Report10: TcxGridDBColumn
          DataBinding.FieldName = 'Report10'
          Visible = False
        end
        object EtPtNameDBTableView1Report11: TcxGridDBColumn
          DataBinding.FieldName = 'Report11'
          Visible = False
        end
        object EtPtNameDBTableView1Report12: TcxGridDBColumn
          DataBinding.FieldName = 'Report12'
          Visible = False
        end
        object EtPtNameDBTableView1Report13: TcxGridDBColumn
          DataBinding.FieldName = 'Report13'
          Visible = False
        end
        object EtPtNameDBTableView1Report14: TcxGridDBColumn
          DataBinding.FieldName = 'Report14'
          Visible = False
        end
        object EtPtNameDBTableView1Report15: TcxGridDBColumn
          DataBinding.FieldName = 'Report15'
          Visible = False
        end
        object EtPtNameDBTableView1Res1: TcxGridDBColumn
          DataBinding.FieldName = 'Res1'
          Visible = False
        end
        object EtPtNameDBTableView1Res2: TcxGridDBColumn
          DataBinding.FieldName = 'Res2'
          Visible = False
        end
        object EtPtNameDBTableView1Res3: TcxGridDBColumn
          DataBinding.FieldName = 'Res3'
          Visible = False
        end
        object EtPtNameDBTableView1Res4: TcxGridDBColumn
          DataBinding.FieldName = 'Res4'
          Visible = False
        end
        object EtPtNameDBTableView1Res5: TcxGridDBColumn
          DataBinding.FieldName = 'Res5'
          Visible = False
        end
        object EtPtNameDBTableView1Res6: TcxGridDBColumn
          DataBinding.FieldName = 'Res6'
          Visible = False
        end
        object EtPtNameDBTableView1Res7: TcxGridDBColumn
          DataBinding.FieldName = 'Res7'
          Visible = False
        end
        object EtPtNameDBTableView1Res8: TcxGridDBColumn
          DataBinding.FieldName = 'Res8'
          Visible = False
        end
        object EtPtNameDBTableView1Res9: TcxGridDBColumn
          DataBinding.FieldName = 'Res9'
          Visible = False
        end
        object EtPtNameDBTableView1Res10: TcxGridDBColumn
          DataBinding.FieldName = 'Res10'
          Visible = False
        end
        object EtPtNameDBTableView1CheckData: TcxGridDBColumn
          DataBinding.FieldName = 'CheckData'
          Visible = False
        end
      end
      object EtPtNameLevel1: TcxGridLevel
        GridView = EtPtNameDBTableView1
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 502
      Height = 65
      Align = alTop
      Color = 2368548
      TabOrder = 2
      object Label1: TLabel
        Left = 40
        Top = 1
        Width = 336
        Height = 48
        Caption = 'Select Program'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -48
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object Panel7: TPanel
        Left = 6
        Top = 5
        Width = 9
        Height = 57
        BevelOuter = bvNone
        Color = 9748078
        TabOrder = 0
      end
    end
  end
  object TbPt: TwwTable
    Active = True
    DatabaseName = 'lw'
    Filter = 'Type=0'
    Filtered = True
    TableName = 'pt.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 25
    Top = 35
  end
  object DsPt: TwwDataSource
    DataSet = TbPt
    Left = 25
    Top = 90
  end
end
