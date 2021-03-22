object FDiagnosis2: TFDiagnosis2
  Left = 716
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Diagnosis'
  ClientHeight = 627
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 899
    Height = 191
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object EtDiagnosis: TcxMemo
      Left = 1
      Top = 1
      Align = alClient
      TabOrder = 0
      Height = 189
      Width = 897
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 576
    Width = 899
    Height = 51
    Align = alBottom
    TabOrder = 1
    object BtOk: TcxButton
      Left = 10
      Top = 5
      Width = 100
      Height = 40
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object BtCancel: TcxButton
      Left = 120
      Top = 5
      Width = 100
      Height = 40
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 191
    Width = 899
    Height = 385
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object EtType: TcxTabControl
      Left = 1
      Top = 1
      Width = 897
      Height = 35
      Align = alTop
      TabIndex = 0
      TabOrder = 0
      Tabs.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10')
      OnChange = EtTypeChange
      ClientRectBottom = 35
      ClientRectRight = 897
      ClientRectTop = 31
      object cxLabel1: TcxLabel
        Left = 345
        Top = 0
        AutoSize = False
        Caption = 'Delta:'
        Properties.Alignment.Horz = taRightJustify
        Transparent = True
        Height = 24
        Width = 66
      end
    end
    object Grid: TcxGrid
      Left = 1
      Top = 36
      Width = 897
      Height = 348
      Align = alClient
      DragKind = dkDock
      DragMode = dmAutomatic
      TabOrder = 1
      object GridDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = GridDBTableView1CellDblClick
        DataController.DataSource = DsTerm
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ImmediateEditor = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.GroupByBox = False
        object GridDBTableView1Number: TcxGridDBColumn
          DataBinding.FieldName = 'Number'
          Width = 30
          IsCaptionAssigned = True
        end
        object GridDBTableView1V0: TcxGridDBColumn
          DataBinding.FieldName = 'V0'
          Width = 80
        end
        object GridDBTableView1V1: TcxGridDBColumn
          DataBinding.FieldName = 'V1'
          Width = 80
        end
        object GridDBTableView1V2: TcxGridDBColumn
          DataBinding.FieldName = 'V2'
          Width = 80
        end
        object GridDBTableView1V3: TcxGridDBColumn
          DataBinding.FieldName = 'V3'
          Width = 80
        end
        object GridDBTableView1V4: TcxGridDBColumn
          DataBinding.FieldName = 'V4'
          Width = 80
        end
        object GridDBTableView1V5: TcxGridDBColumn
          DataBinding.FieldName = 'V5'
          Width = 80
        end
        object GridDBTableView1V6: TcxGridDBColumn
          DataBinding.FieldName = 'V6'
          Width = 80
        end
        object GridDBTableView1V7: TcxGridDBColumn
          DataBinding.FieldName = 'V7'
          Width = 80
        end
        object GridDBTableView1V8: TcxGridDBColumn
          DataBinding.FieldName = 'V8'
          Width = 80
        end
        object GridDBTableView1V9: TcxGridDBColumn
          DataBinding.FieldName = 'V9'
          Width = 80
        end
        object GridDBTableView1V10: TcxGridDBColumn
          DataBinding.FieldName = 'V10'
          Width = 600
        end
      end
      object GridLevel1: TcxGridLevel
        GridView = GridDBTableView1
      end
    end
    object EtDelta: TcxComboBox
      Left = 415
      Top = 0
      ParentFont = False
      Properties.Items.Strings = (
        ','
        ';'
        ' '
        ':')
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 2
      Text = ','
      Width = 51
    end
  end
  object TbTerm: TwwTable
    Active = True
    DatabaseName = 'lw'
    Filter = 'Type=1'
    Filtered = True
    TableName = 'term.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 85
    Top = 91
  end
  object DsTerm: TwwDataSource
    DataSet = TbTerm
    Left = 85
    Top = 146
  end
  object Timer1: TTimer
    Left = 311
    Top = 207
  end
end
