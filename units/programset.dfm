object FProgram: TFProgram
  Left = 0
  Top = 0
  Width = 1348
  Height = 688
  Color = 2368548
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 640
    Width = 1348
    Height = 48
    Align = alBottom
    TabOrder = 0
    Visible = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1348
    Height = 640
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    Color = 10526880
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 290
      Height = 640
      Align = alLeft
      Caption = 'Panel4'
      ParentColor = True
      TabOrder = 0
      object EtPtName: TwwDBGrid
        Left = 1
        Top = 103
        Width = 288
        Height = 256
        Selected.Strings = (
          'Name'#9'40'#9'Program')
        IniAttributes.Delimiter = ';;'
        TitleColor = 10526880
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Ctl3D = False
        DataSource = DsPt
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = #24494#36719#38597#40657
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        LineColors.DataColor = 10526880
        LineColors.HighlightColor = 10526880
        LineColors.ShadowColor = 10526880
        LineColors.FixedColor = 10526880
        IndicatorIconColor = clBtnFace
        FooterColor = 10526880
        FooterCellColor = 10526880
        PaintOptions.AlternatingRowColor = clWindow
        PaintOptions.ActiveRecordColor = clWindow
      end
      object Panel6: TPanel
        Left = 1
        Top = 359
        Width = 288
        Height = 280
        Align = alBottom
        Caption = 'Panel6'
        ParentBackground = True
        ParentColor = True
        TabOrder = 1
        object PcReport: TcxPageControl
          Left = 1
          Top = 1
          Width = 286
          Height = 278
          ActivePage = cxTabSheet1
          Align = alClient
          Color = 10526880
          ParentColor = False
          Style = 7
          TabOrder = 0
          ClientRectBottom = 277
          ClientRectLeft = 1
          ClientRectRight = 285
          ClientRectTop = 21
          object cxTabSheet1: TcxTabSheet
            Caption = 'Strategy'
            ImageIndex = 0
            object cxDBCheckBox1: TcxDBCheckBox
              Left = 5
              Top = 15
              Caption = 'Strategy0'
              DataBinding.DataField = 'Strategy0'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Style.LookAndFeel.Kind = lfUltraFlat
              StyleDisabled.LookAndFeel.Kind = lfUltraFlat
              StyleFocused.LookAndFeel.Kind = lfUltraFlat
              StyleHot.LookAndFeel.Kind = lfUltraFlat
              TabOrder = 0
              Width = 271
            end
            object cxDBCheckBox2: TcxDBCheckBox
              Left = 5
              Top = 43
              Caption = 'Strategy1'
              DataBinding.DataField = 'Strategy1'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 1
              Width = 271
            end
            object cxDBCheckBox3: TcxDBCheckBox
              Left = 5
              Top = 71
              Caption = 'Strategy2'
              DataBinding.DataField = 'Strategy2'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 2
              Width = 271
            end
            object cxDBCheckBox4: TcxDBCheckBox
              Left = 5
              Top = 244
              Caption = 'Strategy3'
              DataBinding.DataField = 'Strategy3'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 3
              Visible = False
              Width = 271
            end
            object cxDBCheckBox5: TcxDBCheckBox
              Left = 5
              Top = 128
              Caption = 'Strategy10'
              DataBinding.DataField = 'Strategy10'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 4
              Width = 271
            end
            object cxDBCheckBox6: TcxDBCheckBox
              Left = 5
              Top = 157
              Caption = 'Strategy11'
              DataBinding.DataField = 'Strategy11'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 5
              Width = 271
            end
            object cxDBCheckBox14: TcxDBCheckBox
              Left = 5
              Top = 185
              Caption = 'Strategy12'
              DataBinding.DataField = 'Strategy12'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 6
              Width = 271
            end
            object cxDBCheckBox16: TcxDBCheckBox
              Left = 5
              Top = 214
              Caption = 'Strategy13'
              DataBinding.DataField = 'Strategy13'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 7
              Visible = False
              Width = 271
            end
          end
          object cxTabSheet2: TcxTabSheet
            Caption = 'Report'
            ImageIndex = 1
            object cxDBCheckBox7: TcxDBCheckBox
              Left = 5
              Top = 15
              Caption = 'Report0'
              DataBinding.DataField = 'Report0'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = '0'
              TabOrder = 0
              Width = 271
            end
            object cxDBCheckBox8: TcxDBCheckBox
              Left = 5
              Top = 45
              Caption = 'Report1'
              DataBinding.DataField = 'Report1'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = '0'
              TabOrder = 1
              Width = 271
            end
            object cxDBCheckBox9: TcxDBCheckBox
              Left = 5
              Top = 75
              Caption = 'Report2'
              DataBinding.DataField = 'Report2'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = '0'
              TabOrder = 2
              Width = 271
            end
            object cxDBCheckBox10: TcxDBCheckBox
              Left = 5
              Top = 106
              Caption = 'Report3'
              DataBinding.DataField = 'Report3'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = '0'
              TabOrder = 3
              Width = 271
            end
          end
          object cxTabSheet3: TcxTabSheet
            Caption = 'Option'
            ImageIndex = 2
            object cxDBCheckBox11: TcxDBCheckBox
              Left = 10
              Top = 5
              Caption = 'Gray Tone'
              DataBinding.DataField = 'Gray'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 0
              Width = 271
            end
            object cxDBCheckBox12: TcxDBCheckBox
              Left = 10
              Top = 35
              Caption = 'GHT'
              DataBinding.DataField = 'GHT'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 1
              Width = 271
            end
            object cxDBCheckBox13: TcxDBCheckBox
              Left = 10
              Top = 65
              Caption = 'Dev'
              DataBinding.DataField = 'Dev'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 2
              Width = 271
            end
            object cxDBCheckBox15: TcxDBCheckBox
              Left = 10
              Top = 96
              Caption = 'EyeMove'
              DataBinding.DataField = 'EyeMove'
              DataBinding.DataSource = DsPt
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              TabOrder = 3
              Width = 271
            end
          end
        end
      end
      object TabType: TcxPageControl
        Left = 1
        Top = 1
        Width = 288
        Height = 102
        ActivePage = cxTabSheet8
        Align = alTop
        Color = 10526880
        LookAndFeel.Kind = lfOffice11
        MultiLine = True
        ParentBackground = False
        ParentColor = False
        Style = 7
        TabOrder = 2
        OnChange = TabTypeChange
        ClientRectBottom = 101
        ClientRectLeft = 1
        ClientRectRight = 287
        ClientRectTop = 39
        object cxTabSheet4: TcxTabSheet
          Caption = 'Threshold'
          ImageIndex = 0
        end
        object cxTabSheet5: TcxTabSheet
          Caption = 'Screen'
          ImageIndex = 1
        end
        object cxTabSheet6: TcxTabSheet
          Caption = 'Special'
          ImageIndex = 2
        end
        object cxTabSheet7: TcxTabSheet
          Caption = 'Custom'
          ImageIndex = 3
        end
        object cxTabSheet8: TcxTabSheet
          Caption = 'Move'
          ImageIndex = 4
        end
        object cxTabSheet9: TcxTabSheet
          Caption = 'MoveCustom'
          ImageIndex = 5
        end
      end
    end
    object Panel5: TPanel
      Left = 1123
      Top = 0
      Width = 225
      Height = 640
      Align = alRight
      Caption = 'Panel5'
      ParentColor = True
      TabOrder = 1
      Visible = False
      object PaPt: TPanel
        Left = 1
        Top = 584
        Width = 223
        Height = 55
        Align = alBottom
        TabOrder = 0
        object BtDeleteDot: TcxButton
          Left = 114
          Top = 5
          Width = 100
          Height = 40
          Caption = 'Delete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BtDeleteDotClick
        end
        object BtInsertDot: TcxButton
          Left = 10
          Top = 5
          Width = 100
          Height = 40
          Caption = 'Insert'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BtInsertDotClick
        end
      end
      object EtDotNum: TPanel
        Left = 1
        Top = 1
        Width = 223
        Height = 25
        Align = alTop
        TabOrder = 1
      end
      object GridXY: TwwDBGrid
        Left = 1
        Top = 26
        Width = 223
        Height = 558
        Selected.Strings = (
          'Id'#9'3'#9' '
          'X'#9'8'#9'X'
          'Y'#9'8'#9'Y')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        Ctl3D = False
        DataSource = DsPtXY
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = [dgEnterToTab]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -15
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnKeyUp = GridXYKeyUp
      end
    end
    object Panel7: TPanel
      Left = 290
      Top = 0
      Width = 648
      Height = 640
      Align = alClient
      Caption = 'Panel7'
      Color = clWindowFrame
      ParentBackground = True
      TabOrder = 2
      object EtXYP: TPanel
        Left = 1
        Top = 1
        Width = 646
        Height = 45
        Align = alTop
        Caption = '(0,0)'
        Color = 2368548
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -21
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnMouseDown = EtXYPMouseDown
        object Label1: TLabel
          Left = 10
          Top = 8
          Width = 55
          Height = 21
          Caption = 'Step:'
          Color = 2368548
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -21
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object EtGrid: TcxSpinEdit
          Left = 72
          Top = 5
          ParentFont = False
          Properties.MaxValue = 30.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -21
          Style.Font.Name = #24494#36719#38597#40657
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          Value = 1
          Width = 65
        end
        object cxLabel1: TcxLabel
          Left = 450
          Top = 5
          Caption = 'Step:'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
        end
        object EtXY: TcxLabel
          Left = 146
          Top = 5
          Caption = '(-90'#65292'-10'#65289
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindow
          Style.Font.Height = -21
          Style.Font.Name = #24494#36719#38597#40657
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
      end
      object Panel8: TPanel
        Left = 1
        Top = 46
        Width = 646
        Height = 593
        Align = alClient
        Color = 5329233
        TabOrder = 1
        object ImagePt: TImage
          Left = 1
          Top = 1
          Width = 644
          Height = 591
          Align = alClient
          ParentShowHint = False
          ShowHint = True
          OnMouseDown = ImagePtMouseDown
          OnMouseMove = ImagePtMouseMove
          OnMouseUp = ImagePtMouseUp
        end
        object EtRect: TShape
          Left = 25
          Top = 20
          Width = 65
          Height = 65
          Brush.Style = bsClear
          Enabled = False
          Pen.Style = psDot
          Visible = False
        end
      end
    end
    object Panel1: TPanel
      Left = 938
      Top = 0
      Width = 185
      Height = 640
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 3
      object btNew: TcxButton
        Left = 13
        Top = 18
        Width = 158
        Height = 56
        Action = DataSetInsert1
        TabOrder = 0
        Colors.Default = 14803425
      end
      object BtParam: TcxButton
        Left = 13
        Top = 190
        Width = 158
        Height = 56
        Caption = 'Parameter'
        TabOrder = 1
        OnClick = BtParamClick
        Colors.Default = 14803425
      end
      object BtDelete: TcxButton
        Left = 13
        Top = 248
        Width = 158
        Height = 56
        Action = DataSetDelete1
        TabOrder = 2
        Colors.Default = 14803425
      end
      object BtClear: TcxButton
        Left = 13
        Top = 305
        Width = 158
        Height = 56
        Caption = 'Clear'
        TabOrder = 3
        OnClick = BtClearClick
        Colors.Default = 14803425
      end
      object BtCopy: TcxButton
        Left = 13
        Top = 363
        Width = 158
        Height = 56
        Caption = 'Copy'
        TabOrder = 4
        OnClick = BtCopyClick
        Colors.Default = 14803425
      end
      object BtCricle: TcxButton
        Left = 13
        Top = 420
        Width = 158
        Height = 56
        Caption = 'Circle'
        TabOrder = 5
        OnClick = BtCricleClick
        Colors.Default = 14803425
      end
      object BtRect: TcxButton
        Left = 13
        Top = 478
        Width = 158
        Height = 51
        Caption = 'Rectangle'
        TabOrder = 6
        OnClick = BtRectClick
        Colors.Default = 14803425
      end
      object BtXy: TcxButton
        Left = 21
        Top = 646
        Width = 158
        Height = 47
        Caption = 'X-Y'
        TabOrder = 7
        Visible = False
        OnClick = BtXyClick
      end
      object BtUnLock: TcxButton
        Left = 11
        Top = 602
        Width = 145
        Height = 47
        Caption = 'UnLock'
        TabOrder = 8
        Visible = False
        OnClick = BtUnLockClick
      end
      object BtTestPT: TcxButton
        Left = 11
        Top = 630
        Width = 145
        Height = 47
        Caption = 'Show Program'
        TabOrder = 9
        Visible = False
        OnClick = BtTestPTClick
      end
      object btCancel: TcxButton
        Left = 13
        Top = 75
        Width = 158
        Height = 56
        Action = DataSetCancel1
        TabOrder = 10
        Colors.Default = 14803425
      end
      object btSave: TcxButton
        Left = 13
        Top = 133
        Width = 158
        Height = 56
        Action = DataSetPost1
        TabOrder = 11
        Colors.Default = 14803425
      end
      object BitBtn1: TcxButton
        Left = 13
        Top = 534
        Width = 158
        Height = 51
        Caption = #22266#20214#21319#32423
        TabOrder = 12
        OnClick = BitBtn1Click
        Colors.Default = 14803425
      end
    end
  end
  object TbPt: TwwTable
    Active = True
    AfterInsert = TbPtAfterInsert
    BeforePost = TbPtBeforePost
    AfterPost = TbPtAfterPost
    BeforeDelete = TbPtBeforeDelete
    AfterDelete = TbPtAfterDelete
    AfterScroll = TbPtAfterScroll
    DatabaseName = 'lw'
    Filter = 'Type=3'
    Filtered = True
    TableName = 'pt.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 280
    Top = 150
  end
  object DsPt: TwwDataSource
    DataSet = TbPt
    Left = 280
    Top = 205
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 280
    Top = 265
  end
  object ActionList: TActionList
    Left = 230
    Top = 275
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = 'New'
      DataSource = DsPt
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = 'Delete'
      DataSource = DsPt
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'Save'
      DataSource = DsPt
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = 'Cancel'
      DataSource = DsPt
    end
  end
  object TbPtXY: TwwTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'lw'
    TableName = 'ptxy.db'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 350
    Top = 150
  end
  object DsPtXY: TwwDataSource
    DataSet = TbPtXY
    Left = 350
    Top = 205
  end
  object TbPtCopy: TwwTable
    DatabaseName = 'lw'
    TableName = 'pt.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 350
    Top = 265
  end
  object OpenDialogBin: TOpenDialog
    Filter = 'Bin|*.bin'
    Title = #25171#24320#22266#20214#25991#20214#23436#25104#21319#32423
    Left = 556
    Top = 145
  end
end
