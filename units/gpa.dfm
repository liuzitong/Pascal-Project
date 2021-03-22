object FGpa: TFGpa
  Left = 106
  Top = 127
  BorderStyle = bsNone
  Caption = 'GPA Analysis'
  ClientHeight = 687
  ClientWidth = 1281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 1281
    Height = 56
    Align = alTop
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 6
      Top = 5
      Caption = 'Name:'
      Properties.Alignment.Horz = taRightJustify
    end
    object cxLabel2: TcxLabel
      Left = 932
      Top = 5
      Caption = 'Birthday:'
      Properties.Alignment.Horz = taRightJustify
    end
    object cxLabel4: TcxLabel
      Left = 623
      Top = 5
      Caption = 'Eye:'
      Properties.Alignment.Horz = taRightJustify
    end
    object cxDBLabel1: TcxDBLabel
      Left = 80
      Top = 5
      AutoSize = True
      DataBinding.DataField = 'Name'
      DataBinding.DataSource = DsCheck
    end
    object cxDBLabel2: TcxDBLabel
      Left = 674
      Top = 5
      AutoSize = True
      DataBinding.DataField = 'Eye'
      DataBinding.DataSource = DsCheck
    end
    object cxDBLabel3: TcxDBLabel
      Left = 1038
      Top = 5
      AutoSize = True
      DataBinding.DataField = 'Birthday'
      DataBinding.DataSource = DsCheck
    end
    object cxDBLabel6: TcxDBLabel
      Left = 365
      Top = 5
      AutoSize = True
      DataBinding.DataField = 'Sex'
      DataBinding.DataSource = DsCheck
    end
    object cxLabel6: TcxLabel
      Left = 314
      Top = 5
      Caption = 'Sex:'
      Properties.Alignment.Horz = taRightJustify
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 1281
    Height = 496
    Align = alClient
    TabOrder = 1
    object GridTbCheck: TcxGrid
      Left = 1
      Top = 1
      Width = 1279
      Height = 494
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object GridTbCheckDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Append.Visible = False
        OnCanSelectRecord = GridTbCheckDBTableView1CanSelectRecord
        OnCustomDrawCell = GridTbCheckDBTableView1CustomDrawCell
        DataController.DataSource = DsCheck
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
        OptionsSelection.MultiSelect = True
        OptionsView.DataRowHeight = 46
        OptionsView.GroupByBox = False
        object GridTbCheckDBTableView1CheckData: TcxGridDBColumn
          DataBinding.FieldName = 'CheckData'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object GridTbCheckDBTableView1Date: TcxGridDBColumn
          DataBinding.FieldName = 'Date'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 120
        end
        object GridTbCheckDBTableView1Number: TcxGridDBColumn
          DataBinding.FieldName = 'Number'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object GridTbCheckDBTableView1Age: TcxGridDBColumn
          DataBinding.FieldName = 'Age'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 64
        end
        object GridTbCheckDBTableView1Eye: TcxGridDBColumn
          DataBinding.FieldName = 'Eye'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 101
        end
        object GridTbCheckDBTableView1Program: TcxGridDBColumn
          DataBinding.FieldName = 'Program'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 111
        end
        object GridTbCheckDBTableView1Strategy: TcxGridDBColumn
          DataBinding.FieldName = 'Strategy'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 174
        end
        object GridTbCheckDBTableView1MD: TcxGridDBColumn
          Caption = 'MD'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = GridTbCheckDBTableView1MDGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 107
        end
        object GridTbCheckDBTableView1PSD: TcxGridDBColumn
          Caption = 'PSD'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = GridTbCheckDBTableView1PSDGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 99
        end
        object GridTbCheckDBTableView1FL: TcxGridDBColumn
          Caption = 'Fixation Losses'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = GridTbCheckDBTableView1FLGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 143
        end
        object GridTbCheckDBTableView1FN: TcxGridDBColumn
          Caption = 'False NEG Errors'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = GridTbCheckDBTableView1FNGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 128
        end
        object GridTbCheckDBTableView1FP: TcxGridDBColumn
          Caption = 'False POS Errors'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = GridTbCheckDBTableView1FPGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 91
        end
      end
      object GridTbCheckLevel1: TcxGridLevel
        GridView = GridTbCheckDBTableView1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 617
    Width = 1281
    Height = 70
    Align = alBottom
    Color = 2368548
    TabOrder = 2
    DesignSize = (
      1281
      70)
    object BtRemove: TcxButton
      Left = 904
      Top = 12
      Width = 134
      Height = 48
      Anchors = [akTop, akRight]
      Caption = 'Remove'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtRemoveClick
    end
    object BtRestore: TcxButton
      Left = 1045
      Top = 12
      Width = 106
      Height = 48
      Anchors = [akTop, akRight]
      Caption = 'Restore'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtRestoreClick
    end
    object BtGpaBaseline: TcxButton
      Left = 5
      Top = 12
      Width = 156
      Height = 48
      Caption = 'GPA-Baseline'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtGpaBaselineClick
    end
    object BtGpaFollow: TcxButton
      Left = 170
      Top = 12
      Width = 266
      Height = 48
      Caption = 'GPA-Last Three Follow-up'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtGpaFollowClick
    end
    object BtGpaSingle: TcxButton
      Left = 447
      Top = 12
      Width = 274
      Height = 48
      Caption = 'Single Field Analysis-GPA'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtGpaSingleClick
    end
    object cxButtonReturn: TcxButton
      Left = 1162
      Top = 12
      Width = 110
      Height = 48
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Return'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = cxButtonReturnClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1281
    Height = 65
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 38
      Top = 5
      Width = 281
      Height = 58
      Caption = 'GPA Analysis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -45
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 6
      Top = 5
      Width = 9
      Height = 57
      BevelOuter = bvNone
      Color = 9748078
      TabOrder = 0
    end
  end
  object TbCheck: TwwTable
    CachedUpdates = True
    DatabaseName = 'lw'
    Filtered = True
    TableName = 'check.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 30
    Top = 90
  end
  object DsCheck: TwwDataSource
    DataSet = TbCheck
    Left = 30
    Top = 140
  end
end
