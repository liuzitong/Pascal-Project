object FParam: TFParam
  Left = 404
  Top = 295
  BorderStyle = bsNone
  Caption = 'Param Setting'
  ClientHeight = 415
  ClientWidth = 752
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
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 362
    Width = 752
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      752
      53)
    object BtOk: TcxButton
      Left = 487
      Top = 6
      Width = 91
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = BtOkClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object BtCancel: TcxButton
      Left = 613
      Top = 6
      Width = 91
      Height = 44
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
    Top = 361
    Width = 752
    Height = 1
    Align = alBottom
    Color = 16749107
    TabOrder = 1
  end
  object Page: TPageControl
    Left = 0
    Top = 40
    Width = 752
    Height = 321
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      BorderWidth = 1
      Caption = 'Common'
      object cxLabel4: TcxLabel
        Left = 22
        Top = 8
        Caption = 'Range(Deg)'
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 22
        Top = 143
        Caption = 'Stimulation Color'
        Transparent = True
      end
      object EtStimulus_Color: TcxComboBox
        Left = 178
        Top = 143
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
        Height = 28
        Width = 118
      end
      object cxLabel6: TcxLabel
        Left = 22
        Top = 75
        Caption = 'Strategy'
        Transparent = True
      end
      object EtStrategy: TcxComboBox
        Left = 178
        Top = 75
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
        Height = 28
        Width = 118
      end
      object cxLabel7: TcxLabel
        Left = 396
        Top = 76
        Caption = 'Fixation Mode'
        Transparent = True
      end
      object EtFixation_Mode: TcxComboBox
        Left = 587
        Top = 75
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
        Height = 27
        Width = 119
      end
      object EtAlarm_Mode: TcxComboBox
        Left = 587
        Top = 140
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
        Height = 28
        Width = 119
      end
      object cxLabel8: TcxLabel
        Left = 396
        Top = 143
        Caption = 'Eye Move Alarm Mode'
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 396
        Top = 43
        Caption = 'Short Wave Detect'
        Transparent = True
      end
      object EtSF: TcxComboBox
        Left = 587
        Top = 42
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
        Height = 27
        Width = 119
      end
      object cxLabel17: TcxLabel
        Left = 396
        Top = 10
        Caption = 'Center point detection'
        Transparent = True
      end
      object EtFovea: TcxComboBox
        Left = 587
        Top = 10
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
        Height = 27
        Width = 119
      end
      object cxLabel14: TcxLabel
        Left = 22
        Top = 177
        Caption = 'Blackground Color'
        Transparent = True
      end
      object EtBackground_Color: TcxComboBox
        Left = 178
        Top = 178
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
        Height = 27
        Width = 118
      end
      object cxLabel30: TcxLabel
        Left = 22
        Top = 41
        Caption = 'Dot Number'
        Transparent = True
      end
      object EtDot_Number: TcxTextEdit
        Left = 178
        Top = 41
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
        Height = 28
        Width = 118
      end
      object EtInit_Strategy: TcxComboBox
        Left = 178
        Top = 110
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
        Height = 27
        Width = 118
      end
      object cxLabel34: TcxLabel
        Left = 22
        Top = 109
        Caption = 'The initial strategy'
        Transparent = True
      end
      object cxLabel13: TcxLabel
        Left = 396
        Top = 110
        Caption = 'Fixation Loss Monitor'
        Transparent = True
      end
      object EtFixation_Monitor: TcxComboBox
        Left = 587
        Top = 107
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
        Height = 28
        Width = 119
      end
      object EtRange: TcxTextEdit
        Left = 178
        Top = 8
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
        Height = 27
        Width = 118
      end
      object LbStrategy: TListBox
        Left = 309
        Top = 193
        Width = 92
        Height = 33
        ItemHeight = 16
        TabOrder = 22
        Visible = False
      end
      object cxLabel2: TcxLabel
        Left = 22
        Top = 211
        Caption = 'Auto Delay'
        Transparent = True
      end
      object EtDelay_Mode: TcxComboBox
        Left = 178
        Top = 213
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
        Width = 118
      end
      object cxLabel15: TcxLabel
        Left = 22
        Top = 245
        Caption = 'Delay Time(ms)'
        Transparent = True
      end
      object EtLightSpinEdit: TSpinEdit
        Left = 177
        Top = 246
        Width = 65
        Height = 26
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
        Left = 587
        Top = 181
        Caption = 'blind test'
        State = cbsChecked
        TabOrder = 27
        Width = 119
      end
      object EtJgSpinEdit: TSpinEdit
        Left = 177
        Top = 246
        Width = 63
        Height = 26
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
        Left = 18
        Top = 8
        Caption = 'Hold Time(ms)'
        Transparent = True
      end
      object EtHold_Time: TcxTextEdit
        Left = 191
        Top = 8
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
        Height = 22
        Width = 135
      end
      object cxLabel12: TcxLabel
        Left = 18
        Top = 41
        Caption = 'Delay Time(ms)'
        Transparent = True
      end
      object EtDelay_Time: TcxTextEdit
        Left = 191
        Top = 41
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
        Width = 135
      end
      object cxLabel21: TcxLabel
        Left = 18
        Top = 75
        Caption = 'Blind Stimulation(DB)'
        Transparent = True
      end
      object EtFixation_Value: TcxTextEdit
        Left = 191
        Top = 75
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
        Width = 135
      end
      object cxLabel22: TcxLabel
        Left = 331
        Top = 144
        Caption = 'Rx1'
        Transparent = True
      end
      object cxLabel23: TcxLabel
        Left = 331
        Top = 178
        Caption = 'Rx2'
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 331
        Top = 211
        Caption = 'Rx3'
        Transparent = True
      end
      object EtRx: TcxComboBox
        Left = 594
        Top = 111
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
        Width = 134
      end
      object cxLabel26: TcxLabel
        Left = 18
        Top = 109
        Caption = 'False Pos Cycle'
        Transparent = True
      end
      object cxLabel27: TcxLabel
        Left = 18
        Top = 143
        Caption = 'False Neg Cycle'
        Transparent = True
      end
      object cxLabel28: TcxLabel
        Left = 18
        Top = 177
        Caption = 'Fixation Loss Cycle'
        Transparent = True
      end
      object cxLabel36: TcxLabel
        Left = 331
        Top = 78
        Caption = 'Environment Light Error'
        Transparent = True
      end
      object cxLabel37: TcxLabel
        Left = 331
        Top = 44
        Caption = 'Background Light Intensity(cd/m2)'
        Transparent = True
      end
      object EtFalse_POS_Cycle: TcxTextEdit
        Left = 191
        Top = 109
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
        Width = 134
      end
      object EtFalse_NEG_Cycle: TcxTextEdit
        Left = 191
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
        TabOrder = 10
        Width = 134
      end
      object EtFixation_Cycle: TcxTextEdit
        Left = 191
        Top = 177
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
        Width = 134
      end
      object EtEB_Light_sv: TcxTextEdit
        Left = 594
        Top = 78
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
        Width = 134
      end
      object EtB_Light_sv: TcxTextEdit
        Left = 594
        Top = 44
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
        Width = 134
      end
      object EtSF_Number: TcxTextEdit
        Left = 191
        Top = 211
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
        Width = 134
      end
      object cxLabel19: TcxLabel
        Left = 18
        Top = 211
        Caption = 'Short Wave Number'
        Transparent = True
      end
      object EtRx3: TcxTextEdit
        Left = 594
        Top = 211
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
        Width = 134
      end
      object cxLabel10: TcxLabel
        Left = 331
        Top = 111
        Caption = 'Rx'
        Transparent = True
      end
      object EtRx2: TcxTextEdit
        Left = 594
        Top = 178
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
        Width = 134
      end
      object EtRx1: TcxTextEdit
        Left = 594
        Top = 144
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
        Width = 134
      end
      object EtInit_Value: TcxTextEdit
        Left = 594
        Top = 11
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
        Width = 134
      end
      object cxLabel1: TcxLabel
        Left = 331
        Top = 11
        Caption = 'Single St Init Value(dB)'
        Transparent = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 40
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 30
      Top = 4
      Width = 182
      Height = 27
      Caption = 'Param Setting'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -27
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 5
      Top = 4
      Width = 6
      Height = 33
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
