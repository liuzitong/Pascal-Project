object FParamCast: TFParamCast
  Left = 176
  Top = 283
  BorderStyle = bsNone
  Caption = 'Cast Param Setting'
  ClientHeight = 482
  ClientWidth = 786
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
    Top = 429
    Width = 786
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      786
      53)
    object BtOk: TcxButton
      Left = 553
      Top = 7
      Width = 95
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = BtOkClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object BtCancel: TcxButton
      Left = 679
      Top = 7
      Width = 94
      Height = 40
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 428
    Width = 786
    Height = 1
    Align = alBottom
    Color = 16749107
    TabOrder = 1
  end
  object Page: TPageControl
    Left = 0
    Top = 50
    Width = 786
    Height = 378
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Common'
      DesignSize = (
        778
        347)
      object cxLabel4: TcxLabel
        Left = 8
        Top = 8
        Caption = 'Range(Deg)'
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 139
        Caption = 'Stimulation Color'
        Transparent = True
      end
      object EtStimulus_Color: TcxComboBox
        Left = 174
        Top = 139
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Stimulation Color0'
          'Stimulation Color1'
          'Stimulation Color2')
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
        Width = 119
      end
      object cxLabel6: TcxLabel
        Left = 8
        Top = 73
        Caption = 'Strategy'
        Transparent = True
      end
      object EtStrategy: TcxComboBox
        Left = 174
        Top = 73
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
        Width = 119
      end
      object cxLabel7: TcxLabel
        Left = 360
        Top = 139
        Caption = 'Fixation Mode'
        Transparent = True
      end
      object EtFixation_Mode: TcxComboBox
        Left = 552
        Top = 139
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Center Point'
          'Diamond'
          'Lower Point'
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
        TabOrder = 9
        Height = 28
        Width = 118
      end
      object EtAlarm_Mode: TcxComboBox
        Left = 552
        Top = 206
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
        TabOrder = 11
        Height = 27
        Width = 118
      end
      object cxLabel8: TcxLabel
        Left = 360
        Top = 206
        Caption = 'Eye Move Alarm Mode'
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 360
        Top = 106
        Caption = 'Short Wave Detect'
        Transparent = True
      end
      object EtSF: TcxComboBox
        Left = 552
        Top = 106
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
        TabOrder = 8
        Height = 27
        Width = 118
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 172
        Caption = 'Stimulation Size'
        Transparent = True
      end
      object EtStimulus_Size: TcxComboBox
        Left = 174
        Top = 172
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Stimulation Size0'
          'Stimulation Size1'
          'Stimulation Size2'
          'Stimulation Size3'
          'Stimulation Size4')
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
        Height = 28
        Width = 119
      end
      object cxLabel17: TcxLabel
        Left = 360
        Top = 73
        Caption = 'Center point detection'
        Transparent = True
      end
      object EtFovea: TcxComboBox
        Left = 552
        Top = 73
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
        Height = 28
        Width = 118
      end
      object cxLabel14: TcxLabel
        Left = 8
        Top = 206
        Caption = 'Blackground Color'
        Transparent = True
      end
      object EtBackground_Color: TcxComboBox
        Left = 174
        Top = 206
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'White'
          'Yellow')
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
        Text = 'White'
        Height = 27
        Width = 119
      end
      object cxLabel30: TcxLabel
        Left = 8
        Top = 40
        Caption = 'Dot Number'
        Transparent = True
      end
      object EtDot_Number: TcxTextEdit
        Left = 174
        Top = 40
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
        Width = 119
      end
      object EtInit_Strategy: TcxComboBox
        Left = 174
        Top = 107
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
        Width = 119
      end
      object cxLabel34: TcxLabel
        Left = 8
        Top = 107
        Caption = 'The initial strategy'
        Transparent = True
      end
      object cxLabel13: TcxLabel
        Left = 360
        Top = 172
        Caption = 'Fixation Loss Monitor'
        Transparent = True
      end
      object EtFixation_Monitor: TcxComboBox
        Left = 552
        Top = 172
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
        TabOrder = 10
        Height = 28
        Width = 118
      end
      object EtRange: TcxTextEdit
        Left = 174
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
        Width = 119
      end
      object LbStrategy: TListBox
        Left = 300
        Top = 8
        Width = 92
        Height = 66
        Ctl3D = False
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 24
        Visible = False
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 238
        Caption = 'Auto Delay'
        Transparent = True
      end
      object EtDelay_Mode: TcxComboBox
        Left = 174
        Top = 238
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
        TabOrder = 26
        Text = 'On'
        Width = 119
      end
      object cxLabel15: TcxLabel
        Left = 8
        Top = 272
        Caption = 'Delay Time(ms)'
        Transparent = True
      end
      object EtLightSpinEdit: TSpinEdit
        Left = 174
        Top = 272
        Width = 64
        Height = 26
        Hint = #38388#38548#26102#38388
        Increment = 50
        MaxValue = 40000
        MinValue = 100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        Value = 500
      end
      object cxCheckBoxBlind: TcxCheckBox
        Left = 553
        Top = 274
        Caption = 'blind test'
        State = cbsChecked
        TabOrder = 29
        Width = 120
      end
      object cxButtonBY: TcxButton
        Left = 452
        Top = 272
        Width = 105
        Height = 24
        Anchors = [akTop, akRight]
        Caption = 'Blue-Yellow'
        TabOrder = 30
        OnClick = cxButtonBYClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
      end
      object EtJgSpinEdit: TSpinEdit
        Left = 174
        Top = 272
        Width = 63
        Height = 26
        Hint = #38388#38548#26102#38388
        Increment = 50
        MaxValue = 4000
        MinValue = 500
        ParentShowHint = False
        ShowHint = True
        TabOrder = 31
        Value = 1000
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Control'
      ImageIndex = 1
      object cxLabel11: TcxLabel
        Left = 4
        Top = 8
        Caption = 'Hold Time(ms)'
        Transparent = True
      end
      object EtHold_Time: TcxTextEdit
        Left = 174
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
        Left = 4
        Top = 41
        Caption = 'Delay Time(ms)'
        Transparent = True
      end
      object EtDelay_Time: TcxTextEdit
        Left = 174
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
        Left = 4
        Top = 75
        Caption = 'Blind Stimulation(DB)'
        Transparent = True
      end
      object EtFixation_Value: TcxTextEdit
        Left = 174
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
        Left = 312
        Top = 144
        Caption = 'Rx1'
        Transparent = True
      end
      object cxLabel23: TcxLabel
        Left = 312
        Top = 178
        Caption = 'Rx2'
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 312
        Top = 211
        Caption = 'Rx3'
        Transparent = True
      end
      object EtRx: TcxComboBox
        Left = 564
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
        Left = 4
        Top = 109
        Caption = 'False Pos Cycle'
        Transparent = True
      end
      object cxLabel27: TcxLabel
        Left = 4
        Top = 143
        Caption = 'False Neg Cycle'
        Transparent = True
      end
      object cxLabel28: TcxLabel
        Left = 4
        Top = 177
        Caption = 'Fixation Loss Cycle'
        Transparent = True
      end
      object cxLabel36: TcxLabel
        Left = 312
        Top = 78
        Caption = 'Environment Light Error'
        Transparent = True
      end
      object cxLabel37: TcxLabel
        Left = 312
        Top = 44
        Caption = 'Background Light Intensity(ASB)'
        Transparent = True
      end
      object EtFalse_POS_Cycle: TcxTextEdit
        Left = 174
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
        Left = 174
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
        Left = 174
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
        Left = 564
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
        Left = 564
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
        Left = 174
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
        Left = 4
        Top = 211
        Caption = 'Short Wave Number'
        Transparent = True
      end
      object EtRx3: TcxTextEdit
        Left = 564
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
        Left = 312
        Top = 111
        Caption = 'Rx'
        Transparent = True
      end
      object EtRx2: TcxTextEdit
        Left = 564
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
        Left = 564
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
        Left = 564
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
        Left = 312
        Top = 11
        Caption = 'Single St Init Value(dB)'
        Transparent = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 50
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 30
      Top = 7
      Width = 252
      Height = 27
      Caption = 'Cast Param Setting'
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
      Height = 43
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
    Left = 349
    Top = 11
  end
end
