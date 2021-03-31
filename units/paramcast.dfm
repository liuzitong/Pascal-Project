object FParamCast: TFParamCast
  Left = 93
  Top = 122
  BorderStyle = bsNone
  Caption = 'Cast Param Setting'
  ClientHeight = 575
  ClientWidth = 910
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
    Top = 505
    Width = 910
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      910
      70)
    object BtOk: TcxButton
      Left = 604
      Top = 9
      Width = 124
      Height = 53
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
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
      Left = 769
      Top = 9
      Width = 124
      Height = 53
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
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
    Top = 504
    Width = 910
    Height = 1
    Align = alBottom
    Color = 16749107
    TabOrder = 1
  end
  object Page: TPageControl
    Left = 0
    Top = 65
    Width = 910
    Height = 439
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Common'
      DesignSize = (
        902
        403)
      object cxLabel4: TcxLabel
        Left = 21
        Top = 10
        Caption = 'Range'
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 21
        Top = 183
        Caption = 'Stimulation Color'
        Transparent = True
      end
      object EtStimulus_Color: TcxComboBox
        Left = 228
        Top = 183
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
        Height = 36
        Width = 156
      end
      object cxLabel6: TcxLabel
        Left = 21
        Top = 96
        Caption = 'Strategy'
        Transparent = True
      end
      object EtStrategy: TcxComboBox
        Left = 228
        Top = 96
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
        Width = 156
      end
      object cxLabel7: TcxLabel
        Left = 472
        Top = 183
        Caption = 'Fixation Mode'
        Transparent = True
      end
      object EtFixation_Mode: TcxComboBox
        Left = 724
        Top = 183
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
        Height = 36
        Width = 155
      end
      object EtAlarm_Mode: TcxComboBox
        Left = 724
        Top = 270
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
        Height = 36
        Width = 155
      end
      object cxLabel8: TcxLabel
        Left = 472
        Top = 270
        Caption = 'Eye Move Alarm Mode'
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 472
        Top = 139
        Caption = 'Short Wave Detect'
        Transparent = True
      end
      object EtSF: TcxComboBox
        Left = 724
        Top = 139
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
        Height = 36
        Width = 155
      end
      object cxLabel3: TcxLabel
        Left = 21
        Top = 226
        Caption = 'Stimulation Size'
        Transparent = True
      end
      object EtStimulus_Size: TcxComboBox
        Left = 228
        Top = 226
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
        Height = 36
        Width = 156
      end
      object cxLabel17: TcxLabel
        Left = 472
        Top = 96
        Caption = 'Center point detection'
        Transparent = True
      end
      object EtFovea: TcxComboBox
        Left = 724
        Top = 96
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
      object cxLabel14: TcxLabel
        Left = 21
        Top = 270
        Caption = 'Blackground Color'
        Transparent = True
      end
      object EtBackground_Color: TcxComboBox
        Left = 228
        Top = 270
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
        Height = 36
        Width = 156
      end
      object cxLabel30: TcxLabel
        Left = 21
        Top = 53
        Caption = 'Dot Number'
        Transparent = True
      end
      object EtDot_Number: TcxTextEdit
        Left = 228
        Top = 53
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
        Width = 156
      end
      object EtInit_Strategy: TcxComboBox
        Left = 228
        Top = 140
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
        Width = 156
      end
      object cxLabel34: TcxLabel
        Left = 21
        Top = 140
        Caption = 'The initial strategy'
        Transparent = True
      end
      object cxLabel13: TcxLabel
        Left = 472
        Top = 226
        Caption = 'Fixation Loss Monitor'
        Transparent = True
      end
      object EtFixation_Monitor: TcxComboBox
        Left = 724
        Top = 226
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
        Height = 36
        Width = 155
      end
      object EtRange: TcxTextEdit
        Left = 228
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
        Width = 156
      end
      object LbStrategy: TListBox
        Left = 394
        Top = 10
        Width = 121
        Height = 87
        Ctl3D = False
        ItemHeight = 21
        ParentCtl3D = False
        TabOrder = 24
        Visible = False
      end
      object cxLabel2: TcxLabel
        Left = 21
        Top = 313
        Caption = 'Auto Delay'
        Transparent = True
      end
      object EtDelay_Mode: TcxComboBox
        Left = 228
        Top = 313
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
        Width = 156
      end
      object cxLabel15: TcxLabel
        Left = 21
        Top = 357
        Caption = 'Delay Time'
        Transparent = True
      end
      object EtLightSpinEdit: TSpinEdit
        Left = 228
        Top = 357
        Width = 85
        Height = 31
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
        Left = 726
        Top = 359
        Caption = 'blind test'
        State = cbsChecked
        TabOrder = 29
        Width = 157
      end
      object cxButtonBY: TcxButton
        Left = 471
        Top = 357
        Width = 138
        Height = 31
        Anchors = [akTop, akRight]
        Caption = 'Blue-Yellow'
        TabOrder = 30
        OnClick = cxButtonBYClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
      end
      object EtJgSpinEdit: TSpinEdit
        Left = 228
        Top = 357
        Width = 83
        Height = 31
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
        Left = 16
        Top = 10
        Caption = 'Hold Time'
        Transparent = True
      end
      object EtHold_Time: TcxTextEdit
        Left = 218
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
        Left = 16
        Top = 54
        Caption = 'Delay Time'
        Transparent = True
      end
      object EtDelay_Time: TcxTextEdit
        Left = 218
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
        Left = 16
        Top = 99
        Caption = 'Blind Stimulation DB'
        Transparent = True
      end
      object EtFixation_Value: TcxTextEdit
        Left = 218
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
        Left = 451
        Top = 189
        Caption = 'Rx1'
        Transparent = True
      end
      object cxLabel23: TcxLabel
        Left = 451
        Top = 233
        Caption = 'Rx2'
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 451
        Top = 277
        Caption = 'Rx3'
        Transparent = True
      end
      object EtRx: TcxComboBox
        Left = 698
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
        Left = 16
        Top = 143
        Caption = 'False Pos Cycle'
        Transparent = True
      end
      object cxLabel27: TcxLabel
        Left = 16
        Top = 188
        Caption = 'False Neg Cycle'
        Transparent = True
      end
      object cxLabel28: TcxLabel
        Left = 16
        Top = 232
        Caption = 'Fixation Loss Cycle'
        Transparent = True
      end
      object cxLabel36: TcxLabel
        Left = 451
        Top = 102
        Caption = 'Environment Light Error'
        Transparent = True
      end
      object cxLabel37: TcxLabel
        Left = 451
        Top = 58
        Caption = 'Background Light Intensity'
        Transparent = True
      end
      object EtFalse_POS_Cycle: TcxTextEdit
        Left = 218
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
        Left = 218
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
        Left = 218
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
        Left = 698
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
        Left = 698
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
        Left = 218
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
        Left = 16
        Top = 277
        Caption = 'Short Wave Number'
        Transparent = True
      end
      object EtRx3: TcxTextEdit
        Left = 698
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
        Left = 451
        Top = 146
        Caption = 'Rx'
        Transparent = True
      end
      object EtRx2: TcxTextEdit
        Left = 698
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
        Left = 698
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
        Left = 698
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
        Left = 451
        Top = 15
        Caption = 'Single St Init Value'
        Transparent = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 910
    Height = 65
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 40
      Top = 9
      Width = 315
      Height = 46
      Caption = 'Cast Param Setting'
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
      Height = 57
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
