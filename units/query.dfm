object FQuery: TFQuery
  Left = 0
  Top = 0
  Width = 1188
  Height = 573
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1
    Height = 573
    Align = alLeft
    Color = 16749107
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 1187
    Height = 573
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 531
      Width = 1185
      Height = 41
      Align = alBottom
      TabOrder = 0
      object BtReport: TcxButton
        Left = 5
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Report'
        TabOrder = 0
        OnClick = BtReportClick
      end
      object BtDelete: TcxButton
        Left = 250
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Delete'
        TabOrder = 1
        OnClick = BtDeleteClick
      end
      object BtOther: TcxButton
        Left = 170
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Recheck'
        TabOrder = 2
        OnClick = BtOtherClick
      end
      object BtShowOrigin: TcxButton
        Left = 330
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Show Origin'
        TabOrder = 3
        OnClick = BtShowOriginClick
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 1185
      Height = 530
      Align = alClient
      Caption = 'Panel7'
      TabOrder = 1
      object PaEdits: TPanel
        Left = 1
        Top = 1
        Width = 265
        Height = 528
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          Left = 0
          Top = 36
          Width = 265
          Height = 492
          Align = alClient
          Caption = 'Panel6'
          TabOrder = 0
          object Panel8: TPanel
            Left = 1
            Top = 1
            Width = 263
            Height = 295
            Align = alTop
            TabOrder = 0
            object cxLabel1: TcxLabel
              Left = 0
              Top = 5
              Caption = 'Name:'
            end
            object cxLabel3: TcxLabel
              Left = 0
              Top = 145
              Caption = 'Describe:'
            end
            object cxLabel4: TcxLabel
              Left = 0
              Top = 25
              Caption = 'Number:'
            end
            object cxDBLabel1: TcxDBLabel
              Left = 45
              Top = 5
              DataBinding.DataField = 'Name'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 21
              Width = 205
            end
            object cxDBLabel2: TcxDBLabel
              Left = 45
              Top = 25
              DataBinding.DataField = 'Number'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 21
              Width = 205
            end
            object cxDBLabel3: TcxDBLabel
              Left = 1
              Top = 165
              Align = alBottom
              DataBinding.DataField = 'Describe'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 129
              Width = 261
            end
            object cxLabel2: TcxLabel
              Left = 0
              Top = 45
              Caption = 'Age:'
            end
            object cxDBLabel4: TcxDBLabel
              Left = 45
              Top = 45
              DataBinding.DataField = 'Age'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 21
              Width = 205
            end
            object cxLabel5: TcxLabel
              Left = 0
              Top = 65
              Caption = 'Eye:'
            end
            object cxDBLabel5: TcxDBLabel
              Left = 45
              Top = 65
              DataBinding.DataField = 'Eye'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 21
              Width = 205
            end
            object cxLabel6: TcxLabel
              Left = 0
              Top = 90
              Caption = 'Program:'
            end
            object cxDBLabel6: TcxDBLabel
              Left = 45
              Top = 90
              DataBinding.DataField = 'Program'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 21
              Width = 205
            end
            object cxDBLabel7: TcxDBLabel
              Left = 45
              Top = 115
              DataBinding.DataField = 'Strategy'
              DataBinding.DataSource = DsCheck
              ParentColor = False
              Style.BorderStyle = ebs3D
              Style.Color = clWhite
              Height = 21
              Width = 205
            end
            object cxLabel7: TcxLabel
              Left = 0
              Top = 115
              Caption = 'Strategy:'
            end
          end
          object Panel10: TPanel
            Left = 1
            Top = 296
            Width = 263
            Height = 195
            Align = alClient
            TabOrder = 1
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 265
          Height = 36
          Align = alTop
          TabOrder = 1
        end
      end
      object Panel9: TPanel
        Left = 266
        Top = 1
        Width = 918
        Height = 528
        Align = alClient
        Caption = 'Panel9'
        TabOrder = 1
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 916
          Height = 35
          Align = alTop
          TabOrder = 0
          object BtQuery: TcxButton
            Left = 360
            Top = 5
            Width = 41
            Height = 26
            Caption = 'Query'
            TabOrder = 0
            OnClick = BtQueryClick
            LookAndFeel.NativeStyle = False
          end
          object EtQuery: TEdit
            Left = 5
            Top = 5
            Width = 351
            Height = 21
            TabOrder = 1
            OnChange = EtQueryChange
          end
          object EtAccord: TRadioGroup
            Left = 438
            Top = 1
            Width = 477
            Height = 33
            Align = alRight
            Columns = 6
            ItemIndex = 1
            Items.Strings = (
              'All'
              'Today'
              'Yesterday'
              'Month'
              'quarterly'
              'Year')
            TabOrder = 2
            OnClick = EtAccordClick
          end
        end
        object Panel11: TPanel
          Left = 1
          Top = 509
          Width = 916
          Height = 18
          Align = alBottom
          TabOrder = 1
        end
        object DbGrid: TcxGrid
          Left = 1
          Top = 36
          Width = 916
          Height = 473
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object DbGridDBTableView1: TcxGridDBTableView
            OnDblClick = DbGridDBTableView1DblClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DsCheck
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.AlwaysShowEditor = True
            OptionsSelection.CellSelect = False
            object DbGridDBTableView1Number: TcxGridDBColumn
              DataBinding.FieldName = 'Number'
            end
            object DbGridDBTableView1Name: TcxGridDBColumn
              DataBinding.FieldName = 'Name'
            end
            object DbGridDBTableView1Sex: TcxGridDBColumn
              DataBinding.FieldName = 'Sex'
            end
            object DbGridDBTableView1Birthday: TcxGridDBColumn
              DataBinding.FieldName = 'Birthday'
            end
            object DbGridDBTableView1Age: TcxGridDBColumn
              DataBinding.FieldName = 'Age'
            end
            object DbGridDBTableView1Eye: TcxGridDBColumn
              DataBinding.FieldName = 'Eye'
            end
            object DbGridDBTableView1Vision0: TcxGridDBColumn
              DataBinding.FieldName = 'Vision0'
            end
            object DbGridDBTableView1Pressure0: TcxGridDBColumn
              DataBinding.FieldName = 'Pressure0'
            end
            object DbGridDBTableView1Pupil0: TcxGridDBColumn
              DataBinding.FieldName = 'Pupil0'
            end
            object DbGridDBTableView1Vision1: TcxGridDBColumn
              DataBinding.FieldName = 'Vision1'
            end
            object DbGridDBTableView1Pressure1: TcxGridDBColumn
              DataBinding.FieldName = 'Pressure1'
            end
            object DbGridDBTableView1Pupil1: TcxGridDBColumn
              DataBinding.FieldName = 'Pupil1'
            end
            object DbGridDBTableView1Doctor: TcxGridDBColumn
              DataBinding.FieldName = 'Doctor'
            end
            object DbGridDBTableView1Program: TcxGridDBColumn
              DataBinding.FieldName = 'Program'
            end
            object DbGridDBTableView1Strategy: TcxGridDBColumn
              DataBinding.FieldName = 'Strategy'
            end
            object DbGridDBTableView1Date: TcxGridDBColumn
              DataBinding.FieldName = 'Date'
            end
            object DbGridDBTableView1Time: TcxGridDBColumn
              DataBinding.FieldName = 'Time'
            end
          end
          object DbGridLevel1: TcxGridLevel
            GridView = DbGridDBTableView1
          end
        end
      end
    end
  end
  object DsCheck: TwwDataSource
    DataSet = TbCheck
    Left = 465
    Top = 140
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 465
    Top = 205
  end
  object TbCheck: TwwTable
    Active = True
    AfterDelete = TbCheckAfterDelete
    DatabaseName = 'lw'
    Filter = 'State=2 or State=3'
    Filtered = True
    OnFilterRecord = TbCheckFilterRecord
    TableName = 'check.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 465
    Top = 90
  end
end
