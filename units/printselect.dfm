object FPrintSelect: TFPrintSelect
  Left = 91
  Top = 12
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PrintSelect'
  ClientHeight = 658
  ClientWidth = 1043
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 1043
    Height = 617
    ActivePage = TabSheet1
    Align = alClient
    Enabled = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Threshold Strategy'
      object ImageField: TImage
        Left = 5
        Top = 25
        Width = 240
        Height = 240
      end
      object ImageGray: TImage
        Left = 255
        Top = 25
        Width = 240
        Height = 240
      end
      object ImageDepth: TImage
        Left = 755
        Top = 25
        Width = 240
        Height = 240
      end
      object ImageDev: TImage
        Left = 10
        Top = 295
        Width = 202
        Height = 202
      end
      object ImageDevPE: TImage
        Left = 215
        Top = 295
        Width = 202
        Height = 202
      end
      object ImageMdev: TImage
        Left = 440
        Top = 295
        Width = 202
        Height = 202
      end
      object ImageMdevPE: TImage
        Left = 645
        Top = 295
        Width = 202
        Height = 202
      end
      object ImageNormal: TImage
        Left = 505
        Top = 25
        Width = 240
        Height = 240
      end
      object ImageEyeMove: TImage
        Left = 10
        Top = 535
        Width = 561
        Height = 46
      end
      object ImageBabie: TImage
        Left = 855
        Top = 295
        Width = 141
        Height = 201
      end
      object cxLabel2: TcxLabel
        Left = 325
        Top = 5
        Caption = 'Threshold Graytone'
        Properties.Alignment.Horz = taCenter
      end
      object cxLabel3: TcxLabel
        Left = 175
        Top = 275
        Caption = 'Total Deviation'
        Properties.Alignment.Horz = taCenter
      end
      object cxLabel4: TcxLabel
        Left = 600
        Top = 275
        Caption = 'Pattern Deviation'
        Properties.Alignment.Horz = taCenter
      end
      object cxLabel5: TcxLabel
        Left = 830
        Top = 5
        Caption = 'Defect Depth(DB)'
        Properties.Alignment.Horz = taCenter
      end
      object cxLabel6: TcxLabel
        Left = 575
        Top = 5
        Caption = 'Normal Expected'
        Properties.Alignment.Horz = taCenter
      end
      object cxLabel7: TcxLabel
        Left = 10
        Top = 515
        Caption = 'Eye Move Curve'
      end
      object cxLabel1: TcxLabel
        Left = 885
        Top = 275
        Caption = 'Babie Curve'
        Properties.Alignment.Horz = taCenter
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Screen Strategy'
      ImageIndex = 5
      object ImageScreen: TImage
        Left = 5
        Top = 5
        Width = 540
        Height = 540
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 617
    Width = 1043
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtSingle: TcxButton
      Left = 700
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Single'
      Enabled = False
      TabOrder = 0
      OnClick = BtSingleClick
    end
    object Bt3in1: TcxButton
      Left = 785
      Top = 11
      Width = 75
      Height = 25
      Caption = '3in1'
      Enabled = False
      TabOrder = 1
      OnClick = Bt3in1Click
    end
    object BtScreen: TcxButton
      Left = 870
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Screen'
      Enabled = False
      TabOrder = 2
      OnClick = BtScreenClick
    end
    object BtOverview: TcxButton
      Left = 955
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Overview'
      Enabled = False
      TabOrder = 3
      OnClick = BtOverviewClick
    end
  end
  object RvProject: TRvProject
    Engine = RvSystem
    ProjectFile = 'rp.rav'
    Left = 35
    Top = 115
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 95
    Top = 115
  end
  object RvTableConnection: TRvTableConnection
    RuntimeVisibility = rtDeveloper
    Table = TbCheckResult
    Left = 170
    Top = 115
  end
  object TbCheckResult: TwwTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'lw'
    Filtered = True
    TableName = 'checkresult.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 169
    Top = 169
  end
  object TbCheck: TwwTable
    Active = True
    DatabaseName = 'lw'
    Filtered = True
    TableName = 'check.DB'
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 379
    Top = 114
  end
end
