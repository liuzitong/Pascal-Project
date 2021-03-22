object Ftridimension: TFtridimension
  Left = 509
  Top = 87
  Width = 1288
  Height = 778
  Caption = 'Tridimension View'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 31
    Width = 1128
    Height = 699
    Camera = GLCamera1
    FieldOfView = 163.716842651367200000
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1272
    Height = 31
    Align = alTop
    TabOrder = 1
    object EtColor0: TPanel
      Left = 5
      Top = 5
      Width = 36
      Height = 21
      Caption = '0'
      Color = clRed
      TabOrder = 0
    end
    object EtColor1: TPanel
      Tag = 1
      Left = 45
      Top = 5
      Width = 36
      Height = 21
      Caption = '1-2'
      Color = 13055
      TabOrder = 1
    end
    object EtColor2: TPanel
      Tag = 2
      Left = 85
      Top = 5
      Width = 36
      Height = 21
      Caption = '3-4'
      Color = 25855
      TabOrder = 2
    end
    object EtColor3: TPanel
      Tag = 3
      Left = 125
      Top = 5
      Width = 36
      Height = 21
      Caption = '5-6'
      Color = 38655
      TabOrder = 3
    end
    object EtColor4: TPanel
      Tag = 4
      Left = 165
      Top = 5
      Width = 36
      Height = 21
      Caption = '7-8'
      Color = 51455
      TabOrder = 4
    end
    object EtColor5: TPanel
      Tag = 5
      Left = 205
      Top = 5
      Width = 36
      Height = 21
      Caption = '9-10'
      Color = clYellow
      TabOrder = 5
    end
    object EtColor6: TPanel
      Tag = 6
      Left = 245
      Top = 5
      Width = 36
      Height = 21
      Caption = '11-12'
      Color = 65480
      TabOrder = 6
    end
    object EtColor7: TPanel
      Tag = 7
      Left = 285
      Top = 5
      Width = 36
      Height = 21
      Caption = '13-14'
      Color = 65430
      TabOrder = 7
    end
    object EtColor8: TPanel
      Tag = 8
      Left = 325
      Top = 5
      Width = 36
      Height = 21
      Caption = '15-16'
      Color = 65430
      TabOrder = 8
    end
    object EtColor9: TPanel
      Tag = 9
      Left = 365
      Top = 5
      Width = 36
      Height = 21
      Caption = '17-18'
      Color = 65330
      TabOrder = 9
    end
    object EtColor10: TPanel
      Tag = 10
      Left = 405
      Top = 5
      Width = 36
      Height = 21
      Caption = '19-20'
      Color = clLime
      TabOrder = 10
    end
    object EtColor11: TPanel
      Tag = 11
      Left = 445
      Top = 5
      Width = 36
      Height = 21
      Caption = '21-22'
      Color = 3342080
      TabOrder = 11
    end
    object EtColor12: TPanel
      Tag = 12
      Left = 485
      Top = 5
      Width = 36
      Height = 21
      Caption = '23-24'
      Color = 6618880
      TabOrder = 12
    end
    object EtColor13: TPanel
      Tag = 13
      Left = 525
      Top = 5
      Width = 36
      Height = 21
      Caption = '25-26'
      Color = 9895680
      TabOrder = 13
    end
    object EtColor14: TPanel
      Tag = 14
      Left = 565
      Top = 5
      Width = 36
      Height = 21
      Caption = '27-28'
      Color = 13172480
      TabOrder = 14
    end
    object EtColor15: TPanel
      Tag = 15
      Left = 605
      Top = 5
      Width = 36
      Height = 21
      Caption = '29-30'
      Color = clAqua
      TabOrder = 15
    end
    object EtColor16: TPanel
      Tag = 16
      Left = 645
      Top = 5
      Width = 36
      Height = 21
      Caption = '31-32'
      Color = 16762880
      TabOrder = 16
    end
    object EtColor17: TPanel
      Tag = 17
      Left = 685
      Top = 5
      Width = 36
      Height = 21
      Caption = '33-34'
      Color = 16750080
      TabOrder = 17
    end
    object EtColor18: TPanel
      Tag = 18
      Left = 725
      Top = 5
      Width = 36
      Height = 21
      Caption = '35-36'
      Color = 16737280
      TabOrder = 18
    end
    object EtColor19: TPanel
      Tag = 19
      Left = 765
      Top = 5
      Width = 36
      Height = 21
      Caption = '37-38'
      Color = 16724480
      TabOrder = 19
    end
    object EtColor20: TPanel
      Tag = 20
      Left = 805
      Top = 5
      Width = 36
      Height = 21
      Caption = '39-40'
      Color = clBlue
      TabOrder = 20
    end
    object EtElapse: TcxLabel
      Left = 855
      Top = 3
      Caption = 'EtElapse'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = #24494#36719#38597#40657
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 730
    Width = 1272
    Height = 10
    Align = alBottom
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 1128
    Top = 31
    Width = 144
    Height = 699
    Align = alRight
    TabOrder = 3
    object BtRestore: TcxButton
      Left = 7
      Top = 68
      Width = 130
      Height = 48
      Caption = 'Restore'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtRestoreClick
    end
    object BtZoomout: TcxButton
      Left = 7
      Top = 129
      Width = 130
      Height = 48
      Caption = 'Zoomout'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtZoomoutClick
    end
    object BtZoomin: TcxButton
      Left = 7
      Top = 190
      Width = 130
      Height = 48
      Caption = 'Zoomin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtZoominClick
    end
    object EtFlat: TcxCheckBox
      Left = 9
      Top = 15
      Caption = 'Flat'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = #24494#36719#38597#40657
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnClick = EtFlatClick
      Width = 128
    end
    object BtDemo: TcxButton
      Left = 7
      Top = 251
      Width = 130
      Height = 48
      Caption = 'Demo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = BtDemoClick
    end
    object BtDemo2: TcxButton
      Left = 7
      Top = 312
      Width = 130
      Height = 48
      Caption = 'Demo2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = BtDemo2Click
    end
  end
  object GLScene1: TGLScene
    Left = 15
    Top = 50
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      SpotCutOff = 180.000000000000000000
    end
    object GLDummyCube1: TGLDummyCube
      ShowAxes = True
      CubeSize = 1.000000000000000000
      object GLXYZGrid1: TGLXYZGrid
        XSamplingScale.Step = 0.100000001490116100
        YSamplingScale.Step = 0.100000001490116100
        ZSamplingScale.Step = 0.100000001490116100
      end
    end
    object GLXYZGrid2: TGLXYZGrid
      LineColor.Color = {0000003F0000003F0000803F0000803F}
      XSamplingScale.Min = -2.000000000000000000
      XSamplingScale.Max = 2.000000000000000000
      XSamplingScale.Step = 0.100000001490116100
      YSamplingScale.Min = -2.000000000000000000
      YSamplingScale.Max = 2.000000000000000000
      YSamplingScale.Step = 0.100000001490116100
      ZSamplingScale.Step = 0.100000001490116100
    end
    object GLDirectOpenGL1: TGLDirectOpenGL
      UseBuildList = False
      OnRender = GLDirectOpenGL1Render
      Blend = False
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000000000000000000080400000803F}
    end
  end
end
