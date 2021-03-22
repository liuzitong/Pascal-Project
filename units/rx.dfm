object FRx: TFRx
  Left = 419
  Top = 440
  BorderStyle = bsDialog
  Caption = 'Auto Calc'
  ClientHeight = 281
  ClientWidth = 578
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 35
  object cxLabel7: TcxLabel
    Left = 317
    Top = 16
    Caption = 'Rx3'
    ParentColor = False
    Style.Color = clBlack
    Transparent = True
  end
  object BtAuto: TcxButton
    Left = 422
    Top = 174
    Width = 131
    Height = 40
    Caption = 'Auto Calc'
    TabOrder = 1
    OnClick = BtAutoClick
  end
  object cxLabel1: TcxLabel
    Left = 121
    Top = 16
    Caption = 'Rx1'
    ParentColor = False
    Style.Color = clBlack
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 215
    Top = 16
    Caption = 'Rx2'
    ParentColor = False
    Style.Color = clBlack
    Transparent = True
  end
  object cxLabel12: TcxLabel
    Left = 28
    Top = 75
    Caption = 'Right'
    ParentColor = False
    Style.Color = clBlack
    Transparent = True
  end
  object cxLabel13: TcxLabel
    Left = 28
    Top = 175
    Caption = 'Left'
    ParentColor = False
    Style.Color = clBlack
    Transparent = True
  end
  object EtRx1_1: TcxSpinEdit
    Left = 116
    Top = 75
    Properties.AssignedValues.MaxValue = True
    Properties.AssignedValues.MinValue = True
    Properties.ValueType = vtFloat
    TabOrder = 6
    Width = 80
  end
  object EtRx2_1: TcxSpinEdit
    Left = 213
    Top = 75
    Properties.ValueType = vtFloat
    TabOrder = 7
    Width = 80
  end
  object EtRx3_1: TcxSpinEdit
    Left = 312
    Top = 75
    Properties.ValueType = vtFloat
    TabOrder = 8
    Width = 80
  end
  object EtRx1_0: TcxSpinEdit
    Left = 116
    Top = 175
    Properties.ValueType = vtFloat
    TabOrder = 9
    Width = 80
  end
  object EtRx2_0: TcxSpinEdit
    Left = 213
    Top = 175
    Properties.ValueType = vtFloat
    TabOrder = 10
    Width = 80
  end
  object EtRx3_0: TcxSpinEdit
    Left = 312
    Top = 175
    Properties.ValueType = vtFloat
    TabOrder = 11
    Width = 80
  end
  object BtManual: TcxButton
    Left = 422
    Top = 75
    Width = 131
    Height = 40
    Caption = 'Manual Input'
    TabOrder = 12
    OnClick = BtManualClick
  end
end
