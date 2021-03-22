object FUsbr: TFUsbr
  Left = 340
  Top = 332
  Width = 713
  Height = 292
  BorderIcons = [biSystemMenu]
  Caption = 'USB Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 175
    Top = 115
    Width = 76
    Height = 13
    Caption = 'USBReadCount'
  end
  object Label2: TLabel
    Left = 5
    Top = 115
    Width = 75
    Height = 13
    Caption = 'USBWriteCount'
  end
  object Label3: TLabel
    Left = 5
    Top = 140
    Width = 43
    Height = 13
    Caption = 'Runstate'
  end
  object Label5: TLabel
    Left = 175
    Top = 140
    Width = 67
    Height = 13
    Caption = 'StimulusCount'
  end
  object Label6: TLabel
    Left = 5
    Top = 165
    Width = 75
    Height = 13
    Caption = 'TCPReadCount'
  end
  object Label7: TLabel
    Left = 175
    Top = 165
    Width = 65
    Height = 13
    Caption = 'TCPRDCount'
  end
  object Label8: TLabel
    Left = 345
    Top = 165
    Width = 68
    Height = 13
    Caption = 'TCPWDCount'
  end
  object Label4: TLabel
    Left = 350
    Top = 115
    Width = 67
    Height = 13
    Caption = 'USBLoopTick'
  end
  object Label9: TLabel
    Left = 525
    Top = 115
    Width = 72
    Height = 13
    Caption = 'USBErrorCount'
  end
  object Label10: TLabel
    Left = 350
    Top = 140
    Width = 75
    Height = 13
    Caption = 'ThresholdCount'
  end
  object Label11: TLabel
    Left = 5
    Top = 90
    Width = 72
    Height = 13
    Caption = 'USBFileHandle'
  end
  object Label12: TLabel
    Left = 5
    Top = 10
    Width = 66
    Height = 13
    Caption = 'USBFileName'
  end
  object Label13: TLabel
    Left = 525
    Top = 170
    Width = 71
    Height = 13
    Caption = 'TCPErrorCount'
  end
  object Label15: TLabel
    Left = 525
    Top = 140
    Width = 18
    Height = 13
    Caption = 'Eye'
  end
  object Label14: TLabel
    Left = 5
    Top = 190
    Width = 19
    Height = 13
    Caption = 'Age'
  end
  object EtUSBReadCount: TEdit
    Left = 255
    Top = 110
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object EtRunstate: TEdit
    Left = 85
    Top = 135
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EtTCPReadCount: TEdit
    Left = 85
    Top = 160
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object EtTCPRDCount: TEdit
    Left = 255
    Top = 160
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object EtUSBWriteCount: TEdit
    Left = 85
    Top = 110
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object EtStimulusCount: TEdit
    Left = 255
    Top = 135
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object EtTCPWDCount: TEdit
    Left = 430
    Top = 160
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object EtUSBLoopTick: TEdit
    Left = 430
    Top = 110
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object EtUSBErrorCount: TEdit
    Left = 605
    Top = 110
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object EtThresholdCount: TEdit
    Left = 430
    Top = 135
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object EtUSBFileHandle: TEdit
    Left = 85
    Top = 85
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object EtTCPErrorCount: TEdit
    Left = 605
    Top = 165
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object BtClear: TButton
    Left = 5
    Top = 225
    Width = 75
    Height = 26
    Caption = 'Clear'
    TabOrder = 12
    OnClick = BtClearClick
  end
  object BtStart: TButton
    Left = 95
    Top = 225
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 13
    OnClick = BtStartClick
  end
  object BtStop: TButton
    Left = 180
    Top = 225
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 14
    OnClick = BtStopClick
  end
  object Pause: TButton
    Left = 265
    Top = 225
    Width = 75
    Height = 25
    Caption = 'Pause'
    TabOrder = 15
    OnClick = PauseClick
  end
  object EtUSBFileName: TMemo
    Left = 85
    Top = 10
    Width = 601
    Height = 71
    ScrollBars = ssVertical
    TabOrder = 16
  end
  object EtEye: TEdit
    Left = 605
    Top = 135
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 17
  end
  object EtAge: TEdit
    Left = 85
    Top = 185
    Width = 76
    Height = 21
    Enabled = False
    TabOrder = 18
  end
  object EtClient: TMemo
    Left = 350
    Top = 190
    Width = 331
    Height = 61
    TabOrder = 19
  end
  object ServerSocket: TServerSocket
    Active = True
    Port = 8123
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientRead = ServerSocketClientRead
    OnClientError = ServerSocketClientError
    Left = 200
    Top = 90
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 270
    Top = 90
  end
end
