object FParam: TFParam
  Left = 149
  Top = 107
  BorderStyle = bsNone
  Caption = 'Param Setting'
  ClientHeight = 545
  ClientWidth = 987
  Color = 15790320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 987
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      987
      70)
    object BtOk: TcxButton
      Left = 639
      Top = 8
      Width = 120
      Height = 57
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = BtOkClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object BtCancel: TcxButton
      Left = 804
      Top = 8
      Width = 120
      Height = 57
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 474
    Width = 987
    Height = 1
    Align = alBottom
    Color = 16749107
    TabOrder = 1
  end
  object Page: TPageControl
    Left = 0
    Top = 52
    Width = 987
    Height = 422
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      BorderWidth = 1
      Caption = 'Common'
      object cxLabel4: TcxLabel
        Left = 29
        Top = 10
        Caption = 'Range'
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 29
        Top = 188
        Caption = 'Stimulation Color'
        Transparent = True
      end
      object EtStimulus_Color: TcxComboBox
        Left = 233
        Top = 188
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Stimulation Color0'
          'Stimulation Color1')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Height = 36
        Width = 155
      end
      object cxLabel6: TcxLabel
        Left = 29
        Top = 99
        Caption = 'Strategy'
        Transparent = True
      end
      object EtStrategy: TcxComboBox
        Left = 233
        Top = 99
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Strategy0'
          'Strategy1'
          'Strategy2'
          'Strategy3'
          'Strategy10'
          'Strategy11')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Height = 36
        Width = 155
      end
      object cxLabel7: TcxLabel
        Left = 520
        Top = 100
        Caption = 'Fixation Mode'
        Transparent = True
      end
      object EtFixation_Mode: TcxComboBox
        Left = 771
        Top = 98
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Center Point'
          'Small Diamond')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 8
        Height = 36
        Width = 155
      end
      object EtAlarm_Mode: TcxComboBox
        Left = 771
        Top = 184
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Alarm Only'
          'Alarm And Pause')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 10
        Height = 36
        Width = 155
      end
      object cxLabel8: TcxLabel
        Left = 520
        Top = 188
        Caption = 'Eye Move Alarm Mode'
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 520
        Top = 56
        Caption = 'Short Wave Detect'
        Transparent = True
      end
      object EtSF: TcxComboBox
        Left = 771
        Top = 55
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Off'
          'On')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Height = 36
        Width = 155
      end
      object cxLabel17: TcxLabel
        Left = 520
        Top = 13
        Caption = 'Center point detection'
        Transparent = True
      end
      object EtFovea: TcxComboBox
        Left = 771
        Top = 13
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Off'
          'On')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 6
        Height = 36
        Width = 155
      end
      object cxLabel14: TcxLabel
        Left = 29
        Top = 232
        Caption = 'Blackground Color'
        Transparent = True
      end
      object EtBackground_Color: TcxComboBox
        Left = 233
        Top = 233
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'White')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Text = 'White'
        Height = 36
        Width = 155
      end
      object cxLabel30: TcxLabel
        Left = 29
        Top = 54
        Caption = 'Dot Number'
        Transparent = True
      end
      object EtDot_Number: TcxTextEdit
        Left = 233
        Top = 54
        AutoSize = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Height = 36
        Width = 155
      end
      object EtInit_Strategy: TcxComboBox
        Left = 233
        Top = 144
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Age Related'
          'Automatic Threshold'
          'Single Stimulus')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Height = 36
        Width = 155
      end
      object cxLabel34: TcxLabel
        Left = 29
        Top = 143
        Caption = 'The initial strategy'
        Transparent = True
      end
      object cxLabel13: TcxLabel
        Left = 520
        Top = 144
        Caption = 'Fixation Loss Monitor'
        Transparent = True
      end
      object EtFixation_Monitor: TcxComboBox
        Left = 771
        Top = 141
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Off'
          'On')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Height = 36
        Width = 155
      end
      object EtRange: TcxTextEdit
        Left = 233
        Top = 10
        AutoSize = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 36
        Width = 155
      end
      object LbStrategy: TListBox
        Left = 405
        Top = 253
        Width = 121
        Height = 44
        ItemHeight = 21
        TabOrder = 22
        Visible = False
      end
      object cxLabel2: TcxLabel
        Left = 29
        Top = 277
        Caption = 'Auto Delay'
        Transparent = True
      end
      object EtDelay_Mode: TcxComboBox
        Left = 233
        Top = 279
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'On'
          'Off')
        Properties.OnChange = EtDelay_ModePropertiesChange
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 24
        Text = 'On'
        Width = 156
      end
      object cxLabel15: TcxLabel
        Left = 29
        Top = 322
        Caption = 'Delay Time'
        Transparent = True
      end
      object EtLightSpinEdit: TSpinEdit
        Left = 232
        Top = 323
        Width = 85
        Height = 31
        Hint = #38388#38548#26102#38388
        Increment = 50
        MaxValue = 40000
        MinValue = 100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        Value = 500
      end
      object cxCheckBoxBlind: TcxCheckBox
        Left = 770
        Top = 237
        Caption = 'blind test'
        State = cbsChecked
        TabOrder = 27
        Width = 157
      end
      object EtJgSpinEdit: TSpinEdit
        Left = 232
        Top = 323
        Width = 83
        Height = 31
        Hint = #38388#38548#26102#38388
        Increment = 50
        MaxValue = 4000
        MinValue = 500
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        Value = 1000
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Control'
      ImageIndex = 1
      object cxLabel11: TcxLabel
        Left = 24
        Top = 10
        Caption = 'Hold Time'
        Transparent = True
      end
      object EtHold_Time: TcxTextEdit
        Left = 251
        Top = 10
        AutoSize = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 29
        Width = 177
      end
      object cxLabel12: TcxLabel
        Left = 24
        Top = 54
        Caption = 'Delay Time'
        Transparent = True
      end
      object EtDelay_Time: TcxTextEdit
        Left = 251
        Top = 54
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Width = 177
      end
      object cxLabel21: TcxLabel
        Left = 24
        Top = 99
        Caption = 'Blind Stimulation DB'
        Transparent = True
      end
      object EtFixation_Value: TcxTextEdit
        Left = 251
        Top = 99
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Width = 177
      end
      object cxLabel22: TcxLabel
        Left = 497
        Top = 189
        Caption = 'Rx1'
        Transparent = True
      end
      object cxLabel23: TcxLabel
        Left = 497
        Top = 233
        Caption = 'Rx2'
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 497
        Top = 277
        Caption = 'Rx3'
        Transparent = True
      end
      object EtRx: TcxComboBox
        Left = 780
        Top = 146
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Off'
          'On')
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 21
        Width = 176
      end
      object cxLabel26: TcxLabel
        Left = 24
        Top = 143
        Caption = 'False Pos Cycle'
        Transparent = True
      end
      object cxLabel27: TcxLabel
        Left = 24
        Top = 188
        Caption = 'False Neg Cycle'
        Transparent = True
      end
      object cxLabel28: TcxLabel
        Left = 24
        Top = 232
        Caption = 'Fixation Loss Cycle'
        Transparent = True
      end
      object cxLabel36: TcxLabel
        Left = 497
        Top = 102
        Caption = 'Environment Light Error'
        Transparent = True
      end
      object cxLabel37: TcxLabel
        Left = 497
        Top = 58
        Caption = 'Background Light Intensity'
        Transparent = True
      end
      object EtFalse_POS_Cycle: TcxTextEdit
        Left = 251
        Top = 143
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Width = 176
      end
      object EtFalse_NEG_Cycle: TcxTextEdit
        Left = 251
        Top = 188
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 10
        Width = 176
      end
      object EtFixation_Cycle: TcxTextEdit
        Left = 251
        Top = 232
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 11
        Width = 176
      end
      object EtEB_Light_sv: TcxTextEdit
        Left = 780
        Top = 102
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 14
        Width = 176
      end
      object EtB_Light_sv: TcxTextEdit
        Left = 780
        Top = 58
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 13
        Width = 176
      end
      object EtSF_Number: TcxTextEdit
        Left = 251
        Top = 277
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 12
        Width = 176
      end
      object cxLabel19: TcxLabel
        Left = 24
        Top = 277
        Caption = 'Short Wave Number'
        Transparent = True
      end
      object EtRx3: TcxTextEdit
        Left = 780
        Top = 277
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 25
        Width = 176
      end
      object cxLabel10: TcxLabel
        Left = 497
        Top = 146
        Caption = 'Rx'
        Transparent = True
      end
      object EtRx2: TcxTextEdit
        Left = 780
        Top = 233
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 23
        Width = 176
      end
      object EtRx1: TcxTextEdit
        Left = 780
        Top = 189
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 22
        Width = 176
      end
      object EtInit_Value: TcxTextEdit
        Left = 780
        Top = 15
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 26
        Width = 176
      end
      object cxLabel1: TcxLabel
        Left = 497
        Top = 15
        Caption = 'Single St Init Value'
        Transparent = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 52
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 39
      Top = 5
      Width = 234
      Height = 46
      Caption = 'Param Setting'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -35
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 6
      Top = 5
      Width = 9
      Height = 44
      BevelOuter = bvNone
      Color = 9748078
      TabOrder = 0
    end
  end
  object TbPt: TwwTable
    Active = True
    DatabaseName = 'lw'
    Filter = 'Name='#39'30-2'#39
    Filtered = True
    TableName = 'pt.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 259
    Top = 46
  end
end
