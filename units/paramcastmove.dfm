object FParamCastMove: TFParamCastMove
  Left = 119
  Top = 160
  BorderStyle = bsNone
  Caption = 'Move Param Setting'
  ClientHeight = 513
  ClientWidth = 905
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
    Top = 443
    Width = 905
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      905
      70)
    object BtOk: TcxButton
      Left = 615
      Top = 7
      Width = 124
      Height = 58
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
      Left = 763
      Top = 7
      Width = 124
      Height = 58
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
    Top = 442
    Width = 905
    Height = 1
    Align = alBottom
    Color = 16749107
    TabOrder = 1
  end
  object Page: TPageControl
    Left = 0
    Top = 61
    Width = 905
    Height = 381
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Common'
      object LbStrategy: TListBox
        Left = 363
        Top = 10
        Width = 121
        Height = 97
        Ctl3D = False
        ItemHeight = 21
        ParentCtl3D = False
        TabOrder = 0
        Visible = False
      end
      object cxLabel4: TcxLabel
        Left = 13
        Top = 10
        Caption = 'Range'
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 13
        Top = 139
        Caption = 'Stimulation Color'
        Transparent = True
      end
      object EtStimulus_Color: TcxComboBox
        Left = 209
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
        TabOrder = 6
        Height = 36
        Width = 155
      end
      object cxLabel6: TcxLabel
        Left = 13
        Top = 96
        Caption = 'Strategy'
        Transparent = True
      end
      object EtStrategy: TcxComboBox
        Left = 209
        Top = 96
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'MoveStrategy30'
          'MoveStrategy31'
          'MoveStrategy32'
          'MoveStrategy33'
          'MoveStrategy34')
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
        Width = 155
      end
      object cxLabel3: TcxLabel
        Left = 13
        Top = 182
        Caption = 'Stimulation Size'
        Transparent = True
      end
      object EtStimulus_Size: TcxComboBox
        Left = 209
        Top = 182
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
        TabOrder = 7
        Height = 36
        Width = 155
      end
      object cxLabel14: TcxLabel
        Left = 13
        Top = 226
        Caption = 'Blackground Color'
        Transparent = True
      end
      object EtBackground_Color: TcxComboBox
        Left = 209
        Top = 226
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
        TabOrder = 8
        Height = 36
        Width = 155
      end
      object cxLabel30: TcxLabel
        Left = 13
        Top = 53
        Caption = 'Dot Number'
        Transparent = True
      end
      object EtDot_Number: TcxTextEdit
        Left = 209
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
        TabOrder = 4
        Height = 36
        Width = 155
      end
      object EtRange: TcxTextEdit
        Left = 209
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
        TabOrder = 3
        Height = 36
        Width = 155
      end
      object EtAlarm_Mode: TcxComboBox
        Left = 701
        Top = 226
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
        TabOrder = 13
        Height = 36
        Width = 155
      end
      object cxLabel8: TcxLabel
        Left = 480
        Top = 226
        Caption = 'Eye Move Alarm Mode'
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 480
        Top = 57
        Caption = 'Move Speed'
        Transparent = True
      end
      object EtMoveSpeed: TcxComboBox
        Left = 701
        Top = 57
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'MoveSpeed0'
          'MoveSpeed1'
          'MoveSpeed2'
          'MoveSpeed3'
          'MoveSpeed4'
          'MoveSpeed5'
          'MoveSpeed6'
          'MoveSpeed7'
          'MoveSpeed8')
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
      object cxLabel7: TcxLabel
        Left = 480
        Top = 99
        Caption = 'Move DB Value'
        Transparent = True
      end
      object EtDynamic_Value: TcxTextEdit
        Left = 821
        Top = 98
        Enabled = False
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 10
        Width = 36
      end
      object cxLabel1: TcxLabel
        Left = 480
        Top = 141
        Caption = 'Move Angle'
        Transparent = True
      end
      object EtMoveMode: TcxComboBox
        Left = 701
        Top = 141
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '4'
          '6'
          '8')
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
      object cxLabel9: TcxLabel
        Left = 480
        Top = 183
        Caption = 'Move Distance'
        Transparent = True
      end
      object EtMoveDistance: TcxComboBox
        Left = 701
        Top = 183
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '5'
          '10'
          '15')
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
        Height = 36
        Width = 155
      end
      object cxLabel13: TcxLabel
        Left = 480
        Top = 15
        Caption = 'Fixation Mode'
        Transparent = True
      end
      object EtFixation_Mode: TcxComboBox
        Left = 701
        Top = 15
        AutoSize = False
        Enabled = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Center Point'
          'Diamond'
          'Lower Point')
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
        Height = 36
        Width = 155
      end
      object EtDB0: TcxComboBox
        Left = 701
        Top = 99
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '1'
          '2'
          '3'
          '4')
        Properties.OnChange = EtDB0PropertiesChange
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
        Height = 36
        Width = 56
      end
      object EtDB1: TcxComboBox
        Left = 761
        Top = 98
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'A'
          'A'#39
          'B'
          'B'#39
          'C'
          'C'#39
          'D'
          'D'#39
          'E'
          'E'#39)
        Properties.OnChange = EtDB1PropertiesChange
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
        Height = 36
        Width = 56
      end
      object cxCheckBoxBlind: TcxCheckBox
        Left = 207
        Top = 281
        Caption = 'blind test'
        State = cbsChecked
        TabOrder = 27
        Width = 157
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
        Height = 31
        Width = 177
      end
      object cxLabel12: TcxLabel
        Left = 16
        Top = 54
        Caption = 'Delay Time'
        Transparent = True
      end
      object EtDelay_Time: TcxTextEdit
        Left = 233
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
        Left = 233
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
        Top = 145
        Caption = 'Rx1'
        Transparent = True
      end
      object cxLabel23: TcxLabel
        Left = 451
        Top = 188
        Caption = 'Rx2'
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 451
        Top = 232
        Caption = 'Rx3'
        Transparent = True
      end
      object EtRx: TcxComboBox
        Left = 689
        Top = 101
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
        Top = 58
        Caption = 'Environment Light Error'
        Transparent = True
      end
      object cxLabel37: TcxLabel
        Left = 451
        Top = 15
        Caption = 'Background Light Intensity'
        Transparent = True
      end
      object EtFalse_POS_Cycle: TcxTextEdit
        Left = 233
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
        Left = 233
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
        Left = 233
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
        Left = 689
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
        TabOrder = 14
        Width = 176
      end
      object EtB_Light_sv: TcxTextEdit
        Left = 689
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
        TabOrder = 13
        Width = 176
      end
      object EtSF_Number: TcxTextEdit
        Left = 233
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
        Left = 689
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
        TabOrder = 25
        Width = 176
      end
      object cxLabel10: TcxLabel
        Left = 451
        Top = 101
        Caption = 'Rx'
        Transparent = True
      end
      object EtRx2: TcxTextEdit
        Left = 689
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
        TabOrder = 23
        Width = 176
      end
      object EtRx1: TcxTextEdit
        Left = 689
        Top = 145
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
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 905
    Height = 61
    Align = alTop
    Color = 2368548
    TabOrder = 3
    object Label1: TLabel
      Left = 40
      Top = 9
      Width = 338
      Height = 46
      Caption = 'Move Param Setting'
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
      Height = 52
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
    Left = 514
    Top = 41
  end
end
