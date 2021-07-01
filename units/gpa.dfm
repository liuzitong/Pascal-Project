object FGpa: TFGpa
  Left = 781
  Top = 327
  BorderStyle = bsNone
  Caption = 'GPA Analysis'
  ClientHeight = 375
  ClientWidth = 882
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
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 882
    Height = 39
    Align = alTop
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 4
      Top = 3
      Caption = 'Name:'
      Properties.Alignment.Horz = taRightJustify
    end
    object cxLabel2: TcxLabel
      Left = 638
      Top = 3
      Caption = 'Birthday:'
      Properties.Alignment.Horz = taRightJustify
    end
    object cxLabel4: TcxLabel
      Left = 426
      Top = 3
      Caption = 'Eye:'
      Properties.Alignment.Horz = taRightJustify
    end
    object cxDBLabel1: TcxDBLabel
      Left = 55
      Top = 3
      AutoSize = True
      DataBinding.DataField = 'Name'
      DataBinding.DataSource = DsCheck
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    end
    object cxDBLabel2: TcxDBLabel
      Left = 461
      Top = 3
      AutoSize = True
      DataBinding.DataField = 'Eye'
      DataBinding.DataSource = DsCheck
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    end
    object cxDBLabel3: TcxDBLabel
      Left = 710
      Top = 3
      AutoSize = True
      DataBinding.DataField = 'Birthday'
      DataBinding.DataSource = DsCheck
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    end
    object cxDBLabel6: TcxDBLabel
      Left = 250
      Top = 3
      AutoSize = True
      DataBinding.DataField = 'Sex'
      DataBinding.DataSource = DsCheck
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    end
    object cxLabel6: TcxLabel
      Left = 215
      Top = 3
      Caption = 'Sex:'
      Properties.Alignment.Horz = taRightJustify
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 83
    Width = 882
    Height = 244
    Align = alClient
    TabOrder = 1
    object GridTbCheck: TcxGrid
      Left = 1
      Top = 1
      Width = 880
      Height = 242
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
    Top = 327
    Width = 882
    Height = 48
    Align = alBottom
    Color = 2368548
    TabOrder = 2
    DesignSize = (
      882
      48)
    object BtRemove: TcxButton
      Left = 625
      Top = 8
      Width = 91
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Remove'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtRemoveClick
    end
    object BtRestore: TcxButton
      Left = 721
      Top = 8
      Width = 73
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Restore'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtRestoreClick
    end
    object BtGpaBaseline: TcxButton
      Left = 3
      Top = 8
      Width = 107
      Height = 33
      Caption = 'GPA-Baseline'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtGpaBaselineClick
    end
    object BtGpaFollow: TcxButton
      Left = 116
      Top = 8
      Width = 182
      Height = 33
      Caption = 'GPA-Last Three Follow-up'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtGpaFollowClick
    end
    object BtGpaSingle: TcxButton
      Left = 306
      Top = 8
      Width = 187
      Height = 33
      Caption = 'Single Field Analysis-GPA'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtGpaSingleClick
    end
    object cxButtonReturn: TcxButton
      Left = 801
      Top = 8
      Width = 75
      Height = 33
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Return'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
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
    Width = 882
    Height = 44
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 26
      Top = 3
      Width = 192
      Height = 31
      Caption = 'GPA Analysis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -31
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 4
      Top = 3
      Width = 6
      Height = 39
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
