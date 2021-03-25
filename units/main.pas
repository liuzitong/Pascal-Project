unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, ComCtrls, ToolWin, ImgList, cxPC, cxControls,
  dxStatusBar, ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,cxContainer, cxEdit,
  cxGroupBox, cxLabel, DB, runpic, new, DBTables, programset,
  Buttons, home, Wwtable, DSPack, DSUtil, DirectShow9, fcStatusBar, pubpas,
  JvHidControllerClass,math, dxGDIPlusClasses,uProgLog;

type
  TFMain = class(TForm)
    PcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    FProgram1: TFProgram;
    BitBtn1: TBitBtn;
    Timer: TTimer;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    LaLTD: TcxLabel;
    BtExit: TSpeedButton;
    BtMin: TSpeedButton;
    PopupMenuPrint: TPopupMenu;
    BtSingle: TMenuItem;
    Bt3in1: TMenuItem;
    BtOverview: TMenuItem;
    BtScreen: TMenuItem;
    EtDt: TcxLabel;
    PanelTitle: TPanel;
    TbPt: TwwTable;
    TabControl: TcxTabControl;
    cxImageList1: TcxImageList;
    BtSystem: TcxButton;
    BtMove: TMenuItem;
    BtMOve2: TMenuItem;
    FHome1: TFHome;
    BtAbout: TcxButton;
    FRunpic1: TFRunpic;
    StatusBar: TdxStatusBar;
    HidCtl: TJvHidDeviceController;
    Memo1: TMemo;
    Snapshot: TButton;
    DevListBox: TListBox;
    ButtonReadDev: TButton;
    ButtonReadHead: TButton;
    ButtonInit: TButton;
    TimerInit: TTimer;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    cxLabelTesting: TcxLabel;
    ImageHome: TImage;
    ImageLogo: TImage;
    PanelBottomWaitRoom: TPanel;
    BitBtnArchives: TBitBtn;
    BtDelete: TBitBtn;
    BtStart: TBitBtn;
    BitBtnReturn1: TBitBtn;
    BtNew: TBitBtn;
    BtEdit: TBitBtn;
    PanelBottomQuery: TPanel;
    BitBtnWaitRoom: TBitBtn;
    BtEdit2: TBitBtn;
    BtDelete2: TBitBtn;
    cxButton1: TcxButton;
    BitBtnReturn2: TBitBtn;
    BtRecheck: TBitBtn;
    PanelBottomProgram: TPanel;
    BitBtnReturn3: TBitBtn;
    BtUnlock: TBitBtn;
    PanelBottomMain: TPanel;
    BitBtnClose: TBitBtn;
    BitBtnSetup: TBitBtn;
    BitBtnAbout: TBitBtn;
    PanelBottomRunpic: TPanel;
    BitBtnReturn4: TBitBtn;
    BtStop: TBitBtn;
    BtPause: TBitBtn;
    BtOtherEye: TBitBtn;
    BtProgramSelect: TBitBtn;
    BtParam: TBitBtn;
    BtStartCheck: TBitBtn;
    LabelPatient: TLabel;
    cxTabSheet4: TcxTabSheet;
    LabelProgram: TLabel;
    LabelExamine: TLabel;
    LabelArchives: TLabel;
    cxButtonProgram: TcxButton;
    cxButtonExamine: TcxButton;
    cxButtonArchives: TcxButton;
    BitBtnProgram: TBitBtn;
    BtPrint: TcxButton;
    LabelXtmc: TLabel;
    CheckBoxDebug: TCheckBox;
    LogInfo: TMemo;
    Log: TButton;
    procedure BtQueryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtAboutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtExitClick(Sender: TObject);
    procedure BtMinClick(Sender: TObject);
    procedure BtSingleClick(Sender: TObject);
    procedure Bt3in1Click(Sender: TObject);
    procedure BtOverviewClick(Sender: TObject);
    procedure BtScreenClick(Sender: TObject);
    procedure PcMainChange(Sender: TObject);
    procedure BtPrintMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabControlChange(Sender: TObject);
    procedure BtPrintClick(Sender: TObject);
    procedure BtSystemClick(Sender: TObject);
    procedure TabControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtMoveClick(Sender: TObject);
    procedure BtMOve2Click(Sender: TObject);
    procedure HidCtlArrival(HidDev: TJvHidDevice);//插上USB时，确定是否采用此设备
    procedure HidCtlDeviceDataError(HidDev: TJvHidDevice; Error: Cardinal);
    function HidCtlEnumerate(HidDev: TJvHidDevice;
      const Idx: Integer): Boolean;
    procedure HidCtlRemoval(HidDev: TJvHidDevice);
    procedure FHome1TimerTimer(Sender: TObject);
    procedure SnapshotClick(Sender: TObject);
    procedure HidCtlDeviceChange(Sender: TObject);
    procedure ButtonReadDevClick(Sender: TObject);
    procedure ButtonReadHeadClick(Sender: TObject);
    procedure ButtonInitClick(Sender: TObject);
    procedure TimerInitTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FHome1Panel7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageHomeClick(Sender: TObject);
    procedure cxButtonArchivesClick(Sender: TObject);
    procedure cxButtonExamineClick(Sender: TObject);
    procedure cxButtonProgramClick(Sender: TObject);
    procedure BitBtnArchivesClick(Sender: TObject);
    procedure BitBtnWaitRoomClick(Sender: TObject);
    procedure BtNewClick(Sender: TObject);
    procedure BtEditClick(Sender: TObject);
    procedure BtDeleteClick(Sender: TObject);
    procedure BtStartClick(Sender: TObject);
    procedure BtEdit2Click(Sender: TObject);
    procedure BtDelete2Click(Sender: TObject);
    procedure BtRecheckClick(Sender: TObject);
    procedure BtStartCheckClick(Sender: TObject);
    procedure BtStopClick(Sender: TObject);
    procedure BtOtherEyeClick(Sender: TObject);
    procedure BtProgramSelectClick(Sender: TObject);
    procedure BtParamClick(Sender: TObject);
    procedure BtPauseClick(Sender: TObject);
    procedure BtUnlockClick(Sender: TObject);
    procedure BitBtnReturn4Click(Sender: TObject);
    procedure LogClick(Sender: TObject);
  private
    { Private declarations }
    Button: TMouseButton;

    priReturnId: integer; //下位机返回包ID
    priRead: boolean;
    priConnect: boolean;
    prihardok: boolean;
    prijc1: boolean;


    PassState: byte;

    primoveu,primoved,primovel,primover: boolean;

    primainform:Tform;

    function DeviceName(HidDev: TJvHidDevice): string;
    procedure GetHardStatus;
    function ReadDevData: boolean;
    function SumOfDATATS: boolean;
    function SumOfDATA: boolean;

    procedure AddToHistory(Str: string);

  public
    { Public declarations }
    bShow:boolean;
    CurrentDevice: TJvHidDevice;
    priMotorMove: T5MotorArr;
    prieyemoveo: boolean;


    procedure OnAppMessage(var Msg:TMsg ; var Handled:boolean);

    procedure ShowRead(HidDev: TJvHidDevice; ReportID: Byte;
      const Data: Pointer; Size: Word);
    procedure Write2Device;
    procedure Write2DeviceTs;
    procedure Write2DeviceTsMove;
    procedure Write2DeviceTsMove10H;
    procedure Write2DeviceTsMove10N;

    procedure LightColorGb; //走光斑和颜色
    procedure ResetMotor; //复位机械零
    procedure ResetMotor0; //复位中心点
    procedure JJ2Zero;//焦距电机复位

//    procedure LightDot(db:byte; mydot: TPoint; onoff:byte); //指X,Y坐标值
    procedure LightDot(db:byte; mydot: TPoint;onoff:byte;holdtime:integer); //指X,Y坐标值

    procedure LightDotMove(db:byte; mydot0,mydot: TPoint; gb:byte; spd:word; jjstep:byte); //指X,Y坐标值

    procedure LightOther(fixmode:byte; backmode:byte); //包括固视，背景等
//    procedure BtUpMouseDown;

    procedure SetTestStyle;
  end;

var
  FMain: TFMain;
implementation

uses Myutils, xwxh, language, About, usbr, vfw, edit;

{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
var
  f:integer;
  s:string;
  i,j: integer;
  x,y:integer;
	latitude,longitude:double;
begin
  Self.Timer.Enabled:=False;
  FRunpic1.Timer.Enabled:=False;
  FHome1.Timer.Enabled:=False;
  FProgram1.Timer.Enabled:=False;

////  Screen.HintFont.Size:=12;
////  Screen.HintFont.Style:=[];

  TrForm(Self);
  Application.OnMessage:=OnAppMessage;
  ///
  PcMain.ActivePageIndex:=4;
 // PcMain.ActivePageIndex:=0;
  PcMain.HideTabs:=True;
  Self.Timer.Enabled:=True;
  FRunpic1.Timer.Enabled:=True;
  FHome1.Timer.Enabled:=True;
  FProgram1.Timer.Enabled:=True;

  Statusbar.Panels[0].Text:=' '+Tr('Welcome');
  StatusBar.Panels[1].Text:=' '+Tr('HardwareStatus');
  Statusbar.Panels[2].Text:=Tr('Logo')+' ';
  TlogFile.GetInstance.Memo:=LogInfo;
  TlogFile.GetInstance.Trace(WarningLevel,'**********************session begins***********************','');
{
 //还不知到是啥类型
  s:=ExeFilePath+'harddata.dat';
  f:=FileOpen(s, fmOpenRead);
  if f=-1 then
  begin
    exit;
  end;
  FileRead(f, SaveData, sizeof(SaveData));
  FileClose(f);
 }
{
   for i:=1 to 24 do begin
    for j:=1 to 20 do begin
			latitude:=DOT_XY2[i,j,1];
			longitude:=DOT_XY2[i,j,2];
			x:=Round(latitude/10*cos(abs(longitude*pi/180)));
			y:=Round(latitude/10*sin(abs(longitude*pi/180)));
			DOT_XY[i,j,1]:=x;
			DOT_XY[i,j,2]:=y;
    end;
  end;
 }
 {
/////改为求DOT_XY2,在XWXH中处理了
  for i:=1 to 24 do begin
    for j:=1 to 20 do begin
			x:=DOT_XY[i,j,1];
			y:=DOT_XY[i,j,2];
			latitude:=Round(sqrt(sqr(x)+sqr(y)));
      longitude:=getViewAngle(x,y);
			DOT_XY2[i,j,1]:=round(latitude);
			DOT_XY2[i,j,2]:=round(longitude);
    end;
  end;
  }
  priConnect := false;
////  GetHardStatus;

  ExeFilePath:=extractFilePath(Application.ExeName);
  SetCurrentDirectory(PChar(ExeFilePath));

  s:=ExeFilePath+'DevTestSet.dat';
  f:=FileOpen(s, fmOpenRead);
  if f=-1 then
  begin
    exit;
  end;
  FileRead(f, DevTestData, sizeof(DevTestData));
  FileClose(f);

  //初始化
  OldPoint.X := 0;
  OldPoint.Y := 0;
  OldDB := 0;
  OldGB := 2;
  OldColor := 0;
  pubMotoBuzy := false;
  pubCurZbx := 1; //主坐标系 1,2
//  PupilBlackValue := 56;

  prihardok := false;
  prijc1 := true;
//  FMain.Enabled := false;  //要求能看报告等
end;

procedure TFMain.BtQueryClick(Sender: TObject);
begin
  PcMain.ActivePageIndex:=3;
end;

procedure TFMain.OnAppMessage(var Msg:TMsg ; var Handled:boolean);
begin
  if Msg.message=RegisterWindowMessage(Pchar(UpperCase(ParamStr(0)))) then begin
    Handled:=true;
    bShow:=True;
  end;
end;

procedure TFMain.TimerTimer(Sender: TObject);
begin
  if bShow then begin
    bShow:=false;
    ShowWindow(Application.Handle, SW_MINIMIZE);
    ShowWindow(Application.Handle, SW_RESTORE);
  end;
  EtDt.Caption:=DateTimeToStr(now);
  inc(T100msCount);
  Label2.Caption := inttostr(T100msCount);
//  if T100msCount>=20 then T100msCount:=0;

///TTT 同步状态

  //BtStop.Enabled := true;
  //BtStart.Visible := false;
  FMain.BtStop.Enabled := FRunpic1.BtStop.Enabled;
  FMain.BtPause.Visible := FRunpic1.BtPause.Visible;
  FMain.BtStartCheck.Caption := FRunpic1.BtStart.Caption;
  FMain.BtStartCheck.Visible := FRunpic1.BtStart.Visible;
  FMain.BtOtherEye.Enabled := FRunpic1.BtOther.Enabled;
  FMain.BtProgramSelect.Enabled := FRunpic1.BtSelect.Enabled;
  FMain.BtParam.Enabled := FRunpic1.BtParam.Enabled;
  FMain.BitBtnReturn4.Enabled := BtParam.Enabled;
  FMain.ImageHome.Enabled := BitBtnReturn4.Enabled;

    {
  FMain.BtStop.Enabled := false;
  FMain.BtStartCheck.Enabled := false;
  FMain.BtStartCheck.Caption := Tr('Start');
  FMain.BtStartCheck.Visible := true;
  FMain.BtPause.Visible := false;
  TimerTestTime.Enabled := false;
  FMain.BtOtherEye.Enabled := true;

  FMain.BtProgramSelect.Enabled := true;
  FMain.BtParam.Enabled := true;
  FMain.BitBtnReturn4.Enabled := true;
  FMain.ImageHome.Enabled := true;
  }

////

end;

procedure TFMain.BtAboutClick(Sender: TObject);
begin
  FAbout:=TFAbout.Create(Self);
  FAbout.ShowModal;
  FAbout.Free;
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
//
end;

procedure TFMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PcMain.ActivePageIndex<>1 then exit;
  if (Key=VK_Up) and (not primoveu)  then
  begin
    FRunpic1.BtUpMouseDown(Self, Button, Shift, 0, 0);
    primoveu := true;
  end;

  if (Key=VK_Down) and (not primoved)  then
  begin
    FRunpic1.BtDnMouseDown(Self, Button, Shift, 0, 0);
    primoved := true;
  end;
  if (Key=VK_Left) and (not primovel)  then
  begin
    FRunpic1.BtLeftMouseDown(Self, Button, Shift, 0, 0);
    primovel := true;
  end;
  if (Key=VK_Right) and (not primover)  then
  begin
    FRunpic1.BtRightMouseDown(Self, Button, Shift, 0, 0);
    primover := true;
  end;
end;

procedure TFMain.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_Up then
  begin
    FRunpic1.BtUpMouseUp(Self, Button, Shift, 0, 0);
    primoveu := false;
  end;
  if Key=VK_Down then
  begin
    FRunpic1.BtDnMouseUp(Self, Button, Shift, 0, 0);
    primoved := false;
  end;
  if Key=VK_Left then
  begin
    FRunpic1.BtLeftMouseUp(Self, Button, Shift, 0, 0);
    primovel := false;
  end;
  if Key=VK_Right then
  begin
    FRunpic1.BtRightMouseUp(Self, Button, Shift, 0, 0);
    primover := false;
  end;
end;

procedure TFMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if PcMain.ActivePageIndex<>1 then exit;
  if Key='D' then begin
//    FRunpic1.LbCamere.Visible:=False;
//    FRunpic1.LaCamere.Visible:=False;
    FUsbr.Show;
  end;
  if Key='E' then begin
//    FRunpic1.LbCamere.Visible:=True;
//    FRunpic1.LaCamere.Visible:=True;
    FXwxh.Show;
  end;
end;

procedure TFMain.BtExitClick(Sender: TObject);
begin
  if DemoCheckData.runstate<>0 then
  begin
    if Xwxx('Checking, Quit')<>IDYES then
    begin
      exit;
    end
    else
    begin
      FRunpic1.BtStop.Click;
    end;
  end
  else
  begin
    if Xwxx('Quit')<>IDYES then exit;
  end;
  Close;
end;

procedure TFMain.BtMinClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFMain.BtPrintClick(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
  FHome1.BtPrintClick(Sender);
end;

procedure TFMain.BtSingleClick(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
//  FHome1.BtDiagnosisClick(Sender);
  FHome1.BtSingleClick(Sender);
end;

procedure TFMain.Bt3in1Click(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
  FHome1.Bt3in1Click(Sender);
end;

procedure TFMain.BtOverviewClick(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
  FHome1.BtOverviewClick(Sender);
end;

procedure TFMain.BtScreenClick(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
  FHome1.BtScreenClick(Sender);
end;

procedure TFMain.BtMoveClick(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then
  begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
  FHome1.BtMoveClick(Sender);
end;

procedure TFMain.BtMOve2Click(Sender: TObject);
begin
  if PcMain.ActivePageIndex>1 then exit;
  if PcMain.ActivePageIndex=1 then begin
    if FRunpic1.TbCheck.FieldByName('State').AsInteger<=1 then exit;
    FRunpic1.BtReportClick(Self);
  end;
  if FHome1.TbCheck2.FieldByName('State').AsInteger<=1 then exit;
  FHome1.BtMove2Click(Sender);
end;

procedure TFMain.PcMainChange(Sender: TObject);
var
  checkdata:TCheckData;
  s:string;
begin
  checkdata:=DemoCheckData;
  if PcMain.ActivePageIndex=0 then
  begin
    TbPt.Filter:='Name='''+FHome1.TbCheck2.FieldByName('Pt').AsString+'''';
    s:=FHome1.TbCheck2.FieldByName('checkdata').AsString;
    MoveCheckData(s, checkdata);
  end
  else if PcMain.ActivePageIndex=1 then
  begin
    TbPt.Filter:='Name='''+FRunpic1.TbCheck.FieldByName('Pt').AsString+'''';
  end
  else
  begin
  end;

  BtSingle.Visible:=(TbPt.FieldByName('Report0').AsInteger<>0) and
                    (((checkdata.pm.Stimulus_Color=0) and (checkdata.pm.Stimulus_Size=2)) or
                     ((checkdata.pm.Stimulus_Color=2) and (checkdata.pm.Stimulus_Size=4)));
  Bt3in1.Visible:=TbPt.FieldByName('Report1').AsInteger<>0;
  BtOverview.Visible:=TbPt.FieldByName('Report2').AsInteger<>0;
  BtScreen.Visible:=TbPt.FieldByName('Report3').AsInteger<>0;
  BtMove.Visible:=TbPt.FieldByName('Type').AsInteger>=4;
  BtMove2.Visible:=BtMove.Visible;
end;

procedure TFMain.BtPrintMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PcMainChange(Sender);
end;

procedure TFMain.TabControlChange(Sender: TObject);
begin
  PcMain.ActivePageIndex:=TabControl.TabIndex;
  if TabControl.TabIndex=1 then
  begin
    FMain.ActiveControl:=nil;
  end;
end;

procedure TFMain.BtSystemClick(Sender: TObject);
begin
  Flanguage:=TFlanguage.Create(Self);
  Flanguage.ShowModal;
  Flanguage.Free;
end;

procedure TFMain.TabControlMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if x<TabControl.Width div 3 then TabControl.Hint:=Tr('Home')
  else if x<TabControl.Width*2 div 3 then TabControl.Hint:=Tr('Check')
  else if x<TabControl.Width then TabControl.Hint:=Tr('Program Setting');
end;

procedure TFMain.Write2Device;
var
  I: Integer;
  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
  //log:TLogFile;
begin
{
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
////  pubMotoBuzy := true;
}
  priRead := false;
  priReturnId := 0;
  //Str:='sss';
  //LogInfo.Lines.Append(Format(' %s %s',['Usb write',Str]));
  if Assigned(CurrentDevice) then
  begin
    Buf[0] := StrToIntDef('$00', 0);
    //数据传输用位，清零
    Buf[61] := 0;
    Buf[62] := 0;
    ToWrite := CurrentDevice.Caps.OutputReportByteLength;
    Move(Server2Lower, Buf[1], sizeof(Server2Lower));
    if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
    begin
      Err := GetLastError;
      TLogFile.GetInstance.Trace(ErrorLevel,'','WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]);
      //AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
    end
    else
    begin
      Str := Format('W %.2x  ', [Buf[0]]);
      for I := 1 to Written-1 do
        Str := Str + Format('%.2x ', [Buf[I]]);
      TLogFile.GetInstance.Trace(LogLevel,'',Str);
      //AddToHistory(Str);
    end;
  end;
  pubMoveTestSend := false;
end;

procedure TFMain.Write2DeviceTs;
var
  I: Integer;
  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
begin
{
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
  }
  pubMotoBuzy := true;

  priRead := false;
  priReturnId := 0;

  if Assigned(CurrentDevice) then
  begin
    Buf[0] := StrToIntDef('$00', 0);
    //数据传输用位，清零
    Buf[61] := 0;
    Buf[62] := 0;
    ToWrite := CurrentDevice.Caps.OutputReportByteLength;
    Move(Server2LowerTs, Buf[1], sizeof(Server2LowerTs));
    if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
    begin
      Err := GetLastError;
      AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
    end
    else
    begin
      Str := Format('W %.2x  ', [Buf[0]]);
      for I := 1 to Written-1 do
        Str := Str + Format('%.2x ', [Buf[I]]);
      AddToHistory(Str);
    end;
  end;
  pubMoveTestSend := false;
end;

procedure TFMain.LightOther(fixmode:byte; backmode:byte); //包括固视，背景0等,backmode=2 关闭背景灯
var
  i: integer;
begin
//取掉下面两项2016.2.22，因会引起扫描暂停
////  pubmoveline := false;
////  prieyemoveo := true;
////
  Fillchar(Server2Lower, sizeof(Server2Lower), 0);

  Server2Lower.otherlamp:=$ff;
  //清零
  Fillchar(Server2Lower.fixlamp, sizeof(Server2Lower.fixlamp), 0);

  TlogFile.GetInstance.Trace(LogLevel,'TFMain.LightOther SaveDataHead.DEVTYPE',IntToStr(SaveDataHead.DEVTYPE));
  if SaveDataHead.DEVTYPE = $8800 then
  begin
    // 赋值
    DemoCheckData.pm.EB_Light_sv := SaveDataBd.HJG_DA;
    //小红外，常亮, 改为红外三
    //Server2Lower.fixlamp[9] := SaveDataBd.FOUCUS_DA[8];
    //背景灯
    Server2Lower.backlamp[1]:=SaveDataBd.BACK_DA[backmode,0];
    Server2Lower.backlamp[2]:=SaveDataBd.BACK_DA[backmode,1];
    Server2Lower.backlamp[3]:=SaveDataBd.BACK_DA[backmode,2];
    //红外灯
    Server2Lower.Infraredlamp[1]:=SaveDataBd.HW_DA[0];
    Server2Lower.Infraredlamp[2]:=SaveDataBd.HW_DA[1];
    Server2Lower.Infraredlamp[3]:=SaveDataBd.HW_DA[2];

    if Lower2Server.glasspos=$FF then  //抬起镜架
      Server2Lower.Infraredlamp[4]:=0  //大红外关闭
    else
      Server2Lower.Infraredlamp[4]:=SaveDataBd.HW_DA[3];  //大红外

//    Server2Lower.Infraredlamp[4]:=SaveDataBd.HW_DA[3];

    case fixmode of
      0: //中心点   1
        Server2Lower.fixlamp[1] := SaveDataBd.FOUCUS_DA[0];
      1: //大菱形   2、3、4
      begin
        Server2Lower.fixlamp[2] := SaveDataBd.FOUCUS_DA[1];
        Server2Lower.fixlamp[3] := SaveDataBd.FOUCUS_DA[2];
        Server2Lower.fixlamp[4] := SaveDataBd.FOUCUS_DA[3];
      end;
      2: //低点   2
        Server2Lower.fixlamp[2] := SaveDataBd.FOUCUS_DA[1];
      3: //小菱形   3、5、6
      begin
        Server2Lower.fixlamp[3] := SaveDataBd.FOUCUS_DA[2];
        Server2Lower.fixlamp[5] := SaveDataBd.FOUCUS_DA[4];
        Server2Lower.fixlamp[6] := SaveDataBd.FOUCUS_DA[5];
      end;
      4: //左盲区固视   7  //右盲区固视   8
      begin
        if DemoCheckData.pm.Eye=0 then
          Server2Lower.fixlamp[7] := SaveDataBd.FOUCUS_DA[6]
        else
          Server2Lower.fixlamp[8] := SaveDataBd.FOUCUS_DA[7];
      end;
    end;
  end
  else if SaveDataHead.DEVTYPE = $0088 then
  begin
  {
    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMotoBuzy);
   }
    //小红外，常亮
    //Server2Lower.fixlamp[9] := SaveDataTs.FOUCUS_DA[8];
    if DemoCheckData.pm.Background_Color=0 then
    //背景灯
    begin
      Server2Lower.backlamp[1]:=SaveDataTs.BACK_DA[backmode,0];
      Server2Lower.backlamp[2]:=SaveDataTs.BACK_DA[backmode,1];
      Server2Lower.backlamp[3]:=SaveDataTs.BACK_DA[backmode,2];
      // 赋值
      DemoCheckData.pm.EB_Light_sv := SaveDataTs.HJG_DA;
      PupilBlackValue := SaveDataTs.EYEGRAY;
    end
    else
    begin
      Server2Lower.Infraredlamp[1]:=SaveDataTs.HW_DA[0]; //黄背景光
      // 赋值
      DemoCheckData.pm.EB_Light_sv := SaveDataTs.HJG_DAH;
      PupilBlackValue := SaveDataTs.EYEGRAYH;
    end;
//    EYEGRAYH: word; //黄背景光阈值
//    HJG_DAH: word;  //黄背景光环境光报警值
    TlogFile.GetInstance.Trace(LogLevel,'TFMain.LightOther DemoCheckData.pm.EB_Light_sv',IntToStr(DemoCheckData.pm.EB_Light_sv));
    //红外灯
    Server2Lower.Infraredlamp[2]:=SaveDataTs.HW_DA[1];
    Server2Lower.Infraredlamp[3]:=SaveDataTs.HW_DA[2]; //小红外

    if Lower2Server.glasspos=$FF then  //抬起镜架
      Server2Lower.Infraredlamp[4]:=0  //大红外关闭
    else
      Server2Lower.Infraredlamp[4]:=SaveDataTs.HW_DA[3];  //大红外

    case fixmode of
      0: //中心点   1
        Server2Lower.fixlamp[1] := SaveDataTs.FOUCUS_DA[0];
      1: //大菱形   2、3、4
      begin
        Server2Lower.fixlamp[2] := SaveDataTs.FOUCUS_DA[1];
        Server2Lower.fixlamp[3] := SaveDataTs.FOUCUS_DA[2];
        Server2Lower.fixlamp[4] := SaveDataTs.FOUCUS_DA[3];
      end;
      2: //低点   2
        Server2Lower.fixlamp[2] := SaveDataTs.FOUCUS_DA[1];
      3,4: //小菱形   3、5、6
      begin
        Server2Lower.fixlamp[3] := SaveDataTs.FOUCUS_DA[2];
        Server2Lower.fixlamp[5] := SaveDataTs.FOUCUS_DA[4];
        Server2Lower.fixlamp[6] := SaveDataTs.FOUCUS_DA[5];
      end;

      {
      4: //左盲区固视   7  //右盲区固视   8  //不会出现，投射不需,用小菱形
      begin
        if DemoCheckData.pm.Eye=0 then
          Server2Lower.fixlamp[7] := SaveDataTs.FOUCUS_DA[6]
        else
          Server2Lower.fixlamp[8] := SaveDataTs.FOUCUS_DA[7];
      end;
      }
    end;
  end;

  if backmode=2 then
  begin
    Server2Lower.backlamp[1]:=0;
    Server2Lower.backlamp[2]:=0;
    Server2Lower.backlamp[3]:=0;
    Server2Lower.Infraredlamp[1]:=0; //黄背景光
  end;

  Server2Lower.otherlamp:=$c4;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;

  Write2Device;

end;

procedure TFMain.ResetMotor; //复位机械零位
var
  i: integer;
begin
  if SaveDataHead.DEVTYPE = $0088 then
  begin
    ///全复位，投射
    priXYFWF:=false;

  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
 
//    if not pubMotoBuzy then
    begin
    ///全复位
      Fillchar(Server2LowerTs, sizeof(Server2LowerTs), 0);
      Server2LowerTs.motorcon:=$c7;

    //  priMotorStep[RadioGroupMotor.ItemIndex] := 0;
    //  RadioGroupMotor.Items[RadioGroupMotor.ItemIndex] := copy(RadioGroupMotor.Items[RadioGroupMotor.ItemIndex],1,10)+inttostr(priMotorStep[RadioGroupMotor.ItemIndex]);

    //x=4
      Server2LowerTs.motor4[1]:=$33;
    //y=5
      Server2LowerTs.motor5[1]:=$33;
    //c=2
      Server2LowerTs.motor2[1]:=$33;
    //s=3
      Server2LowerTs.motor3[1]:=$33;
    //f=1
      Server2LowerTs.motor1[1]:=$33;
    //d=6
      Server2LowerTs.motor6[1]:=$33;

      Server2LowerTs.head[1]:=$bb;
      Server2LowerTs.head[2]:=$0c;
      Server2LowerTs.head[3]:=$dd;

      Server2LowerTs.ending[1]:=$0e;
      Server2LowerTs.ending[2]:=$0f;
      Write2DeviceTs;

    ///走中心位置
      for i:=1 to 5 do
      begin
        Old5MotorStep[i] := 0;
      end;

      priXYFW:=false;
      pubCurZbx := 1;
    end;
  end;
end;

procedure TFMain.ResetMotor0; //复位到中心点
var
  i: integer;
begin
  if SaveDataHead.DEVTYPE = $0088 then
  begin
    ///全复位，投射
    priXYFWF:=false;

    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMotoBuzy);

//    if not pubMotoBuzy then
    begin
    ///全复位
      Fillchar(Server2LowerTs, sizeof(Server2LowerTs), 0);
      Server2LowerTs.motorcon:=$c7;

    //  priMotorStep[RadioGroupMotor.ItemIndex] := 0;
    //  RadioGroupMotor.Items[RadioGroupMotor.ItemIndex] := copy(RadioGroupMotor.Items[RadioGroupMotor.ItemIndex],1,10)+inttostr(priMotorStep[RadioGroupMotor.ItemIndex]);

    //x=4
      Server2LowerTs.motor4[1]:=$33;
    //y=5
      Server2LowerTs.motor5[1]:=$33;
    //c=2
      Server2LowerTs.motor2[1]:=$33;
    //s=3
      Server2LowerTs.motor3[1]:=$33;
    //f=1
      Server2LowerTs.motor1[1]:=$33;
    //d=6
      Server2LowerTs.motor6[1]:=$33;

      Server2LowerTs.head[1]:=$bb;
      Server2LowerTs.head[2]:=$0c;
      Server2LowerTs.head[3]:=$dd;

      Server2LowerTs.ending[1]:=$0e;
      Server2LowerTs.ending[2]:=$0f;
      Write2DeviceTs;

    ///走中心位置
      for i:=1 to 5 do
      begin
        Old5MotorStep[i] := 0;
      end;
    //  Old5MotorStep[4] := SaveDataTs.X2C;
    //  Old5MotorStep[5] := SaveDataTs.Y2C;
      pubCurZbx:=1; //主坐标系
      sleep(2000);
{
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
 }
      priXYFW:=true;
      LightDot(0,point(0,0),1,200);
      Old5MotorStep[4] := 0;
      Old5MotorStep[5] := 0;
      memo2.Lines.Add(inttostr(Old5MotorStep[1]));
      priXYFW:=false;
      pubCurZbx := 1;
      sleep(2000);
    end;
  end;
end;

procedure TFMain.LightColorGb; //走光斑和颜色
begin
  pubmoveline := false;

  if (SaveDataHead.DEVTYPE = $0088) then
  begin
    if (OldGB<>DemoCheckData.pm.Stimulus_Size) or (OldColor<>DemoCheckData.pm.Stimulus_Color) then
    begin
      ///////416
      repeat
        begin
          Application.ProcessMessages;
        end;
      until (not pubMotoBuzy);

      OldGB := DemoCheckData.pm.Stimulus_Size;
      OldColor := DemoCheckData.pm.Stimulus_Color;
      Fillchar(Server2LowerTs, sizeof(Server2LowerTs), 0);
      Server2LowerTs.motorcon:=$c7;
      Server2LowerTs.color:=OldColor+1;
      Server2LowerTs.size:=OldGB+1;

      Server2LowerTs.head[1]:=$bb;
      Server2LowerTs.head[2]:=$0c;
      Server2LowerTs.head[3]:=$dd;

      Server2LowerTs.ending[1]:=$0e;
      Server2LowerTs.ending[2]:=$0f;
      Write2DeviceTs;
      ResetMotor0; //复位
    end;
  end;
end;

procedure TFMain.Write2DeviceTsMove10H;
var
  I: Integer;
  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
begin
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
  pubMotoBuzy := true;

//  pubmoveline := true;

  priRead := false;
  priReturnId := 0;

  if Assigned(CurrentDevice) then
  begin
    Buf[0] := StrToIntDef('$00', 0);
    //数据传输用位，清零
    Buf[61] := 0;
    Buf[62] := 0;
    ToWrite := CurrentDevice.Caps.OutputReportByteLength;
    Move(Server2LowerTsMove10H, Buf[1], sizeof(Server2LowerTsMove10H));
    if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
    begin
      Err := GetLastError;
      AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
    end
    else
    begin
      Str := Format('W %.2x  ', [Buf[0]]);
      for I := 1 to Written-1 do
        Str := Str + Format('%.2x ', [Buf[I]]);
      AddToHistory(Str);
    end;
  end;
end;

procedure TFMain.Write2DeviceTsMove10N;
var
  I: Integer;
  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
begin
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
  pubMotoBuzy := true;

//  pubmoveline := true;

  priRead := false;
  priReturnId := 0;

  if Assigned(CurrentDevice) then
  begin
    Buf[0] := StrToIntDef('$00', 0);
    //数据传输用位，清零
    Buf[61] := 0;
    Buf[62] := 0;
    ToWrite := CurrentDevice.Caps.OutputReportByteLength;
    Move(Server2LowerTsMove10N, Buf[1], sizeof(Server2LowerTsMove10N));
    if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
    begin
      Err := GetLastError;
      AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
    end
    else
    begin
      Str := Format('W %.2x  ', [Buf[0]]);
      for I := 1 to Written-1 do
        Str := Str + Format('%.2x ', [Buf[I]]);
      AddToHistory(Str);
    end;
  end;
end;

procedure TFMain.Write2DeviceTsMove;
var
  I: Integer;
  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
begin
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);
  pubMotoBuzy := true;
  pubmoveline := true;

  priRead := false;
  priReturnId := 0;

  if Assigned(CurrentDevice) then
  begin
    Buf[0] := StrToIntDef('$00', 0);
    //数据传输用位，清零
    Buf[61] := 0;
    Buf[62] := 0;
    ToWrite := CurrentDevice.Caps.OutputReportByteLength;
    Move(Server2LowerTsMove, Buf[1], sizeof(Server2LowerTsMove));
    if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
    begin
      Err := GetLastError;
      AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
    end
    else
    begin
      Str := Format('W %.2x  ', [Buf[0]]);
      for I := 1 to Written-1 do
        Str := Str + Format('%.2x ', [Buf[I]]);
      AddToHistory(Str);
    end;
  end;
end;

procedure TFMain.JJ2Zero;
begin
  pubmoveline := false;
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);

  Fillchar(Server2LowerTs, sizeof(Server2LowerTs), 0);
  Server2LowerTs.motorcon:=$c7;

  Server2LowerTs.motor1[1]:=$33;

  Server2LowerTs.head[1]:=$bb;
  Server2LowerTs.head[2]:=$0c;
  Server2LowerTs.head[3]:=$dd;

  Server2LowerTs.ending[1]:=$0e;
  Server2LowerTs.ending[2]:=$0f;
  Write2DeviceTs;
  Old5MotorStep[1] := 0;
end;

procedure TFMain.LightDotMove(db:byte; mydot0,mydot: TPoint; gb:byte; spd:word; jjstep:byte); //指X,Y坐标值
var
  k,i,j,step,stepbc: integer;
  myda: integer;
  mynearp: TPoint;
  my5StepB,my5StepE,my5Step: T5MotorArr;
  mymotor: array[1..5,1..3] of integer;
  mymotorxw,mymotoryw: integer;
  mydotn: TPoint;
  myResJJ,myResJJ1,myResX1,myResY1:T10MotorArr;
  jjstr,xstr,ystr,xzbstr,yzbstr: string;
  maxxy: integer;
  jjstepn: byte;
begin
  //焦距电机先回零
  ////2016.4.14
  if not pritesting then
    exit;
  JJ2Zero;
  sleep(500);
  ////2016.4.14
  if not pritesting then
    exit;
  //对于周边向中间走，会自动处理坐标切换
  LightDot(db,mydot0,0,200);
  sleep(500);
  ////2016.4.14
  if not pritesting then
    exit;

  maxxy := max(abs(mydot.X-mydot0.X),abs(mydot.Y-mydot0.Y));
  jjstepn := maxxy div 10;
  if jjstepn<1 then
    jjstepn := 1;

  if jjstepn>10 then
    jjstepn := 10;

  ///坐标系切换未处理
  my5StepB := Find5MbyXYDB0(db,mydot0,gb,pubCurZbx);
  my5StepE := Find5MbyXYDB0(db,mydot,gb,pubCurZbx);

  myResJJ1 := Find10(db,mydot0,mydot,gb,pubCurZbx,jjstepn);

  for k:=1 to jjstepn do
  begin
    myResJJ[0,k] := myResJJ1[0,k]-myResJJ1[0,k-1]; //jj
    myResJJ[1,k] := myResJJ1[1,k]-myResJJ1[1,k-1]; //x
    myResJJ[2,k] := myResJJ1[2,k]-myResJJ1[2,k-1]; //y
    myResJJ[3,k] := myResJJ1[3,k]; //x坐标
    myResJJ[4,k] := myResJJ1[4,k]; //y坐标
    jjstr := jjstr+','+inttostr(myResJJ[0,k]);
    xstr := xstr+','+inttostr(myResJJ[1,k]);
    ystr := ystr+','+inttostr(myResJJ[2,k]);
    xzbstr := xzbstr+','+inttostr(myResJJ[3,k]);
    yzbstr := yzbstr+','+inttostr(myResJJ[4,k]);
  end;

  memo2.Lines.Add('焦距:'+jjstr);
  memo2.Lines.Add('X步:'+xstr);
  memo2.Lines.Add('Y步:'+ystr);
  memo2.Lines.Add('X:'+xzbstr);
  memo2.Lines.Add('Y:'+yzbstr);

  mymotorxw := my5StepE[4]-my5StepB[4];
  mymotoryw := my5StepE[5]-my5StepB[5];

  //存储以便取回X,Y
  pubmovearr := myResJJ1;
  pubmovexstep := mymotorxw;
  pubmoveystep := mymotoryw;
//  pubmovejjstep := myResJJ1[10]-myResJJ1[0];  //最大步焦距走步

//    Server2LowerTsMove10H:TServer2LowerTsMove10H;
//    Server2LowerTsMove10N:TServer2LowerTsMove10N;

  Fillchar(Server2LowerTsMove10H, sizeof(Server2LowerTsMove10H), 0);

  Server2LowerTsMove10H.motorcon := $c8;

  if mymotorxw<0 then
  begin
    Server2LowerTsMove10H.motorxa := $11;
    pubmovexfx:=-1;
  end
  else
  begin
    Server2LowerTsMove10H.motorxa := $22;
    pubmovexfx:=1;
  end;

  if mymotoryw<0 then
  begin
    Server2LowerTsMove10H.motorya := $22;
    pubmoveyfx:=-1;
  end
  else
  begin
    Server2LowerTsMove10H.motorya := $11;
    pubmoveyfx:=1;
  end;

  Server2LowerTsMove10H.motords := jjstepn;
  Server2LowerTsMove10H.motorspd[1] := (spd*20) div 256;
  Server2LowerTsMove10H.motorspd[2] := (spd*20) mod 256;

  Server2LowerTsMove10H.head[1]:=$bb;
  Server2LowerTsMove10H.head[2]:=$0c;
  Server2LowerTsMove10H.head[3]:=$dd;

  Server2LowerTsMove10H.ending[1]:=$0e;
  Server2LowerTsMove10H.ending[2]:=$0f;
  ////2016.4.14
  if not pritesting then
    exit;
  pubMoveTestSend := true;
  Write2DeviceTsMove10H;

  step := 1;
  if jjstepn>6 then
    step := 2;

  i:=1;
  k := 1;

  for i:=1 to step do
  begin
    //传输内容
    Fillchar(Server2LowerTsMove10N, sizeof(Server2LowerTsMove10N), 0);

    Server2LowerTsMove10N.motorcon := $c8;
    Server2LowerTsMove10N.addcs := i;
    if i=1 then
    begin
      if jjstepn<=6 then
        stepbc := jjstepn
      else
        stepbc := 6;
    end
    else
    begin
      stepbc := jjstepn-6;
    end;

    for j:=1 to stepbc do
    begin
      //9byte(x,y,j  x3)
      //x
      if myResJJ[1,k]<0 then
        Server2LowerTsMove10N.motordata[9*(j-1)+1] := $11
      else
        Server2LowerTsMove10N.motordata[9*(j-1)+1] := $22;

      Server2LowerTsMove10N.motordata[9*(j-1)+2] := abs(myResJJ[1,k]) div 256;
      Server2LowerTsMove10N.motordata[9*(j-1)+3] := abs(myResJJ[1,k]) mod 256;

      //y
      if myResJJ[2,k]<0 then
        Server2LowerTsMove10N.motordata[9*(j-1)+4] := $22
      else
        Server2LowerTsMove10N.motordata[9*(j-1)+4] := $11;

      Server2LowerTsMove10N.motordata[9*(j-1)+5] := abs(myResJJ[2,k]) div 256;
      Server2LowerTsMove10N.motordata[9*(j-1)+6] := abs(myResJJ[2,k]) mod 256;

      if myResJJ[0,k]<0 then
        Server2LowerTsMove10N.motordata[9*(j-1)+7] := $11
      else
        Server2LowerTsMove10N.motordata[9*(j-1)+7] := $22;
      Server2LowerTsMove10N.motordata[9*(j-1)+8] := abs(myResJJ[0,k]) div 256;
      Server2LowerTsMove10N.motordata[9*(j-1)+9] := abs(myResJJ[0,k]) mod 256;
      k := k+1;
    end;

    Server2LowerTsMove10N.head[1]:=$bb;
    Server2LowerTsMove10N.head[2]:=$0c;
    Server2LowerTsMove10N.head[3]:=$dd;

    Server2LowerTsMove10N.ending[1]:=$0e;
    Server2LowerTsMove10N.ending[2]:=$0f;
  ////2016.4.14
    if not pritesting then
      exit;
    Write2DeviceTsMove10N;
    if (i=step) then  //发送最后一包数据才置为扫描线
      pubmoveline := true;
  end;
  pubMoveTestSend := false;
  // 停所有噻托
  Fillchar(Server2Lower, sizeof(Server2Lower), 0);
  Server2Lower.gillcon:=$c2;
  Server2Lower.gillup:=$00;
  Server2Lower.gilldown:=$00;
  Server2Lower.gillleft:=$00;
  Server2Lower.gillright:=$00;
  Server2Lower.lowerstatus:=$c5;
  Server2Lower.lowerbuzy:=$ff;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;
  Write2Device;

end;

{
procedure TFMain.LightDotMove(db:byte; mydot0,mydot: TPoint; gb:byte; spd:word; jjstep:byte); //指X,Y坐标值
var
  k,i,j,step,stepbc: integer;
  myda: integer;
  mynearp: TPoint;
  my5StepB,my5StepE,my5Step: T5MotorArr;
  mymotor: array[1..5,1..3] of integer;
  mymotorxw,mymotoryw: integer;
  mydotn: TPoint;
  myResJJ,myResJJ1:T10JJMotorArr;
begin
  //焦距电机先回零
  JJ2Zero;
  sleep(500);
  //对于周边向中间走，会自动处理坐标切换
  LightDot(db,mydot0,0);
  sleep(500);
  ///坐标系切换未处理
  my5StepB := Find5MbyXYDB0(db,mydot0,gb,pubCurZbx);
  my5StepE := Find5MbyXYDB0(db,mydot,gb,pubCurZbx);
  myResJJ1 := Find10JJ(db,mydot0,mydot,gb,pubCurZbx);

  for k:=1 to 10 do
  begin
    myResJJ[k] := myResJJ1[k]-myResJJ1[k-1];
  end;

  mymotorxw := my5StepE[4]-my5StepB[4];
  mymotoryw := my5StepE[5]-my5StepB[5];
  //存储以便取回X,Y
  pubmovexstep := mymotorxw;
  pubmoveystep := mymotoryw;
  pubmovejjstep := myResJJ1[10]-myResJJ1[0];  //最大步焦距走步

  Fillchar(Server2LowerTsMove, sizeof(Server2LowerTsMove), 0);
  Server2LowerTsMove.motorcon := $c8;
  if mymotorxw<0 then
  begin
    Server2LowerTsMove.motorx[1] := $11;
    pubmovexfx:=-1;
  end
  else
  begin
    Server2LowerTsMove.motorx[1] := $22;
    pubmovexfx:=1;
  end;

  Server2LowerTsMove.motorx[2] := abs(mymotorxw) div 256;
  Server2LowerTsMove.motorx[3] := abs(mymotorxw) mod 256;

  if mymotoryw<0 then
  begin
    Server2LowerTsMove.motory[1] := $22;
    pubmoveyfx:=-1;
  end
  else
  begin
    Server2LowerTsMove.motory[1] := $11;
    pubmoveyfx:=1;
  end;
  Server2LowerTsMove.motory[2] := abs(mymotoryw) div 256;
  Server2LowerTsMove.motory[3] := abs(mymotoryw) mod 256;

  ///焦距
  Server2LowerTsMove.motorjjstep := 10;
  for i:=1 to 10 do
  begin
    if myResJJ[i]<0 then
      Server2LowerTsMove.motorjj[i,1] := $11
    else
      Server2LowerTsMove.motorjj[i,1] := $22;
    Server2LowerTsMove.motorjj[i,2] := abs(myResJJ[i]) div 256;
    Server2LowerTsMove.motorjj[i,3] := abs(myResJJ[i]) mod 256;
  end;

  ///
  Server2LowerTsMove.motorspd[1] := spd div 256;
  Server2LowerTsMove.motorspd[2] := spd mod 256;

  Server2LowerTsMove.head[1]:=$bb;
  Server2LowerTsMove.head[2]:=$0c;
  Server2LowerTsMove.head[3]:=$dd;

  Server2LowerTsMove.ending[1]:=$0e;
  Server2LowerTsMove.ending[2]:=$0f;
  Write2DeviceTsMove;
end;
}

//procedure TFMain.LightDot(db:byte; x,r:byte);   //指布线坐标1-24，1-20
procedure TFMain.LightDot(db:byte; mydot: TPoint;onoff:byte;holdtime:integer); //指X,Y坐标值
var
  i: integer;
  myda,myda90,myda901,my90t: integer;
  mydb90: single;
  mynearp: TPoint;
  my5Step: T5MotorArr;
  mymotor: array[1..5,1..3] of integer;
  mydot815: TPoint;
begin
  pubmoveline := false;

//  T100msCount := 0;
  DemoCheckData.waitcount := DemoCheckData.waitcount+1;
  prieyemoveo := false;

  mydot815.X := mydot.x;
  mydot815.Y := mydot.Y;

  if SaveDataHead.DEVTYPE = $8800 then
  begin
    T100msCount := 0;
    //只是布点给
    Fillchar(Server2Lower, sizeof(Server2Lower), 0);
    Server2Lower.dotcon:=$c1;

    //通过X，Y找到最接近的X,R布点位置
//    mynearp := FindXRbyXY(mydot);
    mynearp := FindXRbyXY(mydot815);

//    LabelHjgJcz.Caption := inttostr(round((Lower2Server.envlight1[1]*256+Lower2Server.envlight1[2])/2))+' | '+ inttostr(Lower2Server.envlight2[1]*256+Lower2Server.envlight2[2]);

    //在此按照偏心度调整DA值
    myda := SaveDataBd.DOT_DA[1,mynearp.X,mynearp.Y,db];

    //mydb90 := SaveDataBd.DB90[round(sqrt((sqr(mynearp.X)+sqr(mynearp.Y))/2))]/50;
    mydb90 := SaveDataBd.DB90[round(sqrt(sqr(mydot.X)+sqr(mydot.Y))/2)]/50;

    if mydb90>0 then
    begin
      my90t := db+Trunc(mydb90);
      if my90t>maxdb then
        my90t:=maxdb;

      myda90 := SaveDataBd.DOT_DA[1,mynearp.X,mynearp.Y,my90t];
      if (my90t+1)<=maxdb then
        myda901 := SaveDataBd.DOT_DA[1,mynearp.X,mynearp.Y,my90t+1]
      else
        myda901 := myda90;

      myda := myda90-round((myda90-myda901)*(mydb90-Trunc(mydb90)));
    end;

    Server2Lower.da[1]:= myda div 256;
    Server2Lower.da[2]:= myda mod 256;

    Server2Lower.xcoord:=mynearp.X;
    Server2Lower.rcoord:=mynearp.Y;
    memo2.Lines.Add('dotx='+inttostr(mydot.X)+'doty='+inttostr(mydot.Y)+' x='+inttostr(mynearp.X)+' r='+inttostr(mynearp.Y)+' db='+inttostr(db)+' da='+inttostr(myda));
    Server2Lower.gcoord:=0;

//    Server2Lower.stimtime[1]:=0;
//    Server2Lower.stimtime[2]:=180; //200;
    Server2Lower.stimtime[1]:=holdtime div 256;
    Server2Lower.stimtime[2]:=holdtime mod 256;

    Server2Lower.lowerbuzy:=$ff;

    Server2Lower.lowerstatus:=$c5;
    Server2Lower.answer:=$ff;
    Server2Lower.glasspos:=$ff;

{  //不发，自动返回应答器和镜架状态
    Server2Lower.lowerstatus:=$c5
    Server2Lower.answer:=$ff;
    Server2Lower.lowerbuzy:=$ff;
    Server2Lower.lowerserial:=$ff;
    Server2Lower.glasspos:=$ff;
    Server2Lower.envlight1:=$ff;
    Server2Lower.envlight2:=$ff;
    Server2Lower.envtemper:=$ff;
    Server2Lower.eyeleft:=$ff;
    Server2Lower.eyeright:=$ff;
}

    Server2Lower.head[1]:=$bb;
    Server2Lower.head[2]:=$0c;
    Server2Lower.head[3]:=$dd;

    Server2Lower.ending[1]:=$0e;
    Server2Lower.ending[2]:=$0f;
    Write2Device;
  end
  else if SaveDataHead.DEVTYPE = $0088 then
  begin
    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMotoBuzy);

    if onoff=1 then
    begin
      pubKmOpen := false;
    end
    else
      pubKmOpen := true;
    Fillchar(Server2LowerTs, sizeof(Server2LowerTs), 0);
    Server2LowerTs.motorcon:=$c7;

    case DemoCheckData.pm.Fixation_Mode of
      2:
        mydot815.Y := mydot.Y-12;
      1,3,4:
        mydot815.Y := mydot.Y-8;
    end;

    my5Step := Find5MbyXYDB(db,mydot815,oldgb+1,pubCurZbx);

    for i:=1 to 5 do
    begin
      if my5Step[i]<0 then
      begin
        mymotor[i,1] := $11;
        if (i=5) or (i=2) or (i=3) then
          mymotor[i,1] := $22;
      end
      else
      begin
        mymotor[i,1] := $22;
        if (i=5) or (i=2) or (i=3) then
          mymotor[i,1] := $11;
      end;
      mymotor[i,2] := abs(my5Step[i]) div 256;
      mymotor[i,3] := abs(my5Step[i]) mod 256;
    end;

  //三电机联动数据
  //x=4
    Server2LowerTs.motor4[1] := mymotor[4,1];
    Server2LowerTs.motor4[2] := mymotor[4,2];
    Server2LowerTs.motor4[3] := mymotor[4,3];
  //y=5
    Server2LowerTs.motor5[1] := mymotor[5,1];
    Server2LowerTs.motor5[2] := mymotor[5,2];
    Server2LowerTs.motor5[3] := mymotor[5,3];
  //f=1
    Server2LowerTs.motor1[1] := mymotor[1,1];
    Server2LowerTs.motor1[2] := mymotor[1,2];
    Server2LowerTs.motor1[3] := mymotor[1,3];

  ////以下两个DB
  //c=2
    Server2LowerTs.motor2[1] := mymotor[2,1];
    Server2LowerTs.motor2[2] := mymotor[2,2];
    Server2LowerTs.motor2[3] := mymotor[2,3];

  //s=3
    Server2LowerTs.motor3[1] := mymotor[3,1];
    Server2LowerTs.motor3[2] := mymotor[3,2];
    Server2LowerTs.motor3[3] := mymotor[3,3];
  {
  //快门开
    Server2LowerTs.motor6[1]:=$22;
    Server2LowerTs.motor6[2] := SpinEditStep.Value div 256;
    Server2LowerTs.motor6[3] := SpinEditStep.Value mod 256;
   }
  //  if CheckBoxKm200.Checked then
    if onoff=1 then
    begin
      Server2LowerTs.stimmode := $88;
      Server2LowerTs.stimtime[1]:=holdtime div 256;
      Server2LowerTs.stimtime[2]:=holdtime mod 256;

//      Server2LowerTs.stimtime[1] := $00;
//      Server2LowerTs.stimtime[2] := 100; //200;
    end;

    Server2LowerTs.head[1]:=$bb;
    Server2LowerTs.head[2]:=$0c;
    Server2LowerTs.head[3]:=$dd;

    Server2LowerTs.ending[1]:=$0e;
    Server2LowerTs.ending[2]:=$0f;
    Write2DeviceTs;
    memo2.Lines.Add('dotx='+inttostr(mydot.X)+'doty='+inttostr(mydot.Y)+' db='+inttostr(db)+' C='+inttostr(my5Step[2])+' S='+inttostr(my5Step[3]));
    memo2.Lines.Add('初位x:'+inttostr(my5Step[4])+'初位y:'+inttostr(my5Step[5]));
    memo2.Lines.Add('初位0x:'+inttostr(Old5MotorStep[4])+'初位0y:'+inttostr(Old5MotorStep[5]));
{
    memo2.Lines.Add('初位x:'+inttostr(my5Step[4])+'初位y:'+inttostr(my5Step[5]));
    memo2.Lines.Add('初位0x:'+inttostr(Old5MotorStep[4])+'初位0y:'+inttostr(Old5MotorStep[5]));
    memo2.Lines.Add('坐标x:'+inttostr(mydot.X)+'坐标y:'+inttostr(mydot.Y));
    memo2.Lines.Add('坐标系:'+inttostr(pubCurZbx));
    }
  end;
end;


procedure TFMain.AddToHistory(Str: string);
var
  f:integer;
  s:string;
begin
  {Memo1.Lines.Add(Str);
  if CheckBoxDebug.Checked then
  begin
    s:=ExeFilePath+'DEBUG.txt';
    if not FileExists(s) then begin
      f:=FileCreate(s);
    end
    else begin
      f:=FileOpen(s, fmOpenWrite);
      FileSeek(f, 0, 2);
    end;
    s:=Str+#13#10;
    FileWrite(f, s[1], Length(s));
    FileClose(f);
  end; }
end;

function TFMain.DeviceName(HidDev: TJvHidDevice): string;
begin
  if HidDev.ProductName <> '' then
    Result := HidDev.ProductName
  else
    Result := Format('Device VID=%.4x PID=%.4x',
      [HidDev.Attributes.VendorID, HidDev.Attributes.ProductID]);
  if HidDev.SerialNumber <> '' then
    Result := Result + Format(' (Serial=%s)', [HidDev.SerialNumber]);
end;

procedure TFMain.ShowRead(HidDev: TJvHidDevice; ReportID: Byte;
  const Data: Pointer; Size: Word);
var
  i: Integer;
  Str: string;
  lbuf: array[0..63] of byte;
begin
  Str := Format('R %.2x  ', [ReportID]);
  for i := 0 to Size - 1 do
  begin
    lbuf[i] := byte(PChar(Data)[i]);
    Str := Str + Format('%.2x ', [Cardinal(PChar(Data)[i])]);
  end;
  AddToHistory(Str);
  TLogFile.GetInstance.Trace(LogLevel,'',Str);
  if (lbuf[60]=0) and (lbuf[61]=0) then
  begin
    prihardok := true;
    Move(lbuf[0],Lower2Server,Size); // USBDATALEN

{
    StatusBar.Panels[1].Text:=Tr('envlight')+':'+inttostr(round((Lower2Server.envlight1[1]*256+Lower2Server.envlight1[2])/2))+' | '+ inttostr(Lower2Server.envlight2[1]*256+Lower2Server.envlight2[2]);
    StatusBar.Panels[1].Text:=StatusBar.Panels[1].Text+'  '+Tr('glasspos')+':'+inttohex(Lower2Server.glasspos,2);
    StatusBar.Panels[1].Text:=StatusBar.Panels[1].Text+'  '+Tr('answer')+':'+inttohex(Lower2Server.answer,2);
    StatusBar.Panels[1].Text:=StatusBar.Panels[1].Text+'  '+inttohex(Lower2Server.eyeleft,2)+' | '+ inttohex(Lower2Server.eyeright,2);
    StatusBar.Panels[1].Text:=StatusBar.Panels[1].Text+'  '+Tr('envtemper')+':'+inttostr(Lower2Server.envtemper[1]*256+Lower2Server.envtemper[2]);
 }
    if oldglass<>Lower2Server.glasspos then
    begin
      if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
        FMain.LightOther(1,0) // 大菱形固视
      else
        FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);
      oldglass := Lower2Server.glasspos;
    end;

    //快门原定义为6，现在用的10
//    if ((Lower2Server.motorlimit[10]=$44) or (Lower2Server.motorlimit[10]=$11)) then
    if ((Lower2Server.motorlimit[10]=$44)) then
    begin
      if not pubKmOpen then
        T100msCount := 1;
      pubKmOpen := true;
//      memo2.Lines.Add('开快门');
    end;
    {
    else if Lower2Server.motorlimit[10]=$FF then
    begin
      pubKmOpen := false;
      memo2.Lines.Add('关快门');
    end;
    }
    if (Lower2Server.answer=$33) then
    begin
//      memo2.Lines.Add('应答器按下');
      pubkey := true;
      pubkey1 := true;
{
      if pubmoveline then
        memo2.Lines.Add('扫描模式')
      else
        memo2.Lines.Add('走点模式');
}
      if (pubmoveline=true) then // and (Lower2Server.motorlimit[4]=$FF) then
      begin
        pubmovebackx := Lower2Server.moveanswerx[1]*256+ Lower2Server.moveanswerx[2];
        pubmovebacky := Lower2Server.moveanswery[1]*256+ Lower2Server.moveanswery[2];

        GetMoveStep(Lower2Server.moveanswerds,point(pubmovebackx,pubmovebacky));

        Old5MotorStep[4] := pubanswerxystep.X;
        Old5MotorStep[5] := pubanswerxystep.Y;
////        memo2.Lines.Add('应答x:'+inttostr(Old5MotorStep[4])+'应答y:'+inttostr(Old5MotorStep[5]));

        pubmoveanswer := true;
        pubmoveend := true;  //应答了，表示扫描结束了
      end;
    end
    else if (Lower2Server.answer=$ff) then
    begin
////      memo2.Lines.Add('应答器按下');
      if not pubkey then
      begin
        Label1.Caption := '应答时：'+inttostr(T100msCount*100);
        if DemoCheckData.pm.Delay_Mode=0 then
        if (T100msCount>2) and (T100msCount<30) then
        begin
          pubPrefer.breaktime := (pubPrefer.breaktime*4+T100msCount*100) div 5;
        end;
        Label1.Caption := Label1.Caption+'间隔时：'+inttostr(pubPrefer.breaktime);
      end;
      pubkey := true;
      pubkey1 := true;
    end
    else
    begin
      pubkey1 := false;
////      memo2.Lines.Add('应答器松开');
    end;

    //改为取状态忙位，判断下位机忙不忙,2016.2.21
    if Lower2Server.lowerbuzy=$ff then
    begin
      pubMotoBuzy := true;
    end
    else
    begin
      pubMotoBuzy := false;
      if pubmoveline=true then
      begin
        pubmoveend := true;  //不忙，表示扫描结束了
      end;
    end;

{
    if Lower2Server.motorlimit[4]=$11 then
    begin
      pubMotoBuzy := false;
    end;

    if Lower2Server.motorlimit[4]=$ff then
    begin
      pubMotoBuzy := true;
    end
    else
    begin
      pubMotoBuzy := false;
      if pubmoveline=true then
      begin
        pubmoveend := true;  //不忙，表示扫描结束了
      end;
    end;

    if Lower2Server.motorlimit[5]=$ff then
    begin
      pubMotoBuzy := true;
    end
    else
    begin
      pubMotoBuzy := false;
      if pubmoveline then
      begin
        pubmoveend := true;  //不忙，表示扫描结束了
      end;
    end;
}

    pubgets := false;
    pubhjgda := Lower2Server.envlight1[1]*256+Lower2Server.envlight1[2];
    TlogFile.GetInstance.Trace(LogLevel,'ShowRead pubhjgda',IntToStr(pubhjgda));
//    if Lower2Server.envlight1[1]*256+Lower2Server.envlight1[2]>DemoCheckData.pm.EB_Light_sv then
    if pubhjgda>DemoCheckData.pm.EB_Light_sv then
      DemoCheckData.ambient_light := 1
    else
      DemoCheckData.ambient_light := 0;
  end
  else
  begin
    priReturnId := lbuf[60]*256+lbuf[61];
    if priRead then
    begin
      Move(lbuf[4], USBDataBufXj[56*(priReturnId-1)], 56);
    end;
  end;
end;


function TFMain.HidCtlEnumerate(HidDev: TJvHidDevice;
  const Idx: Integer): Boolean;
var
  N: Integer;
  Dev: TJvHidDevice;
begin
//  if ((HidDev.Attributes.VendorID=$0483) and (HidDev.Attributes.ProductID=$5750)) then
  begin
//    CurrentDevice := HidDev;
    N := DevListBox.Items.Add(DeviceName(HidDev));
    HidCtl.CheckOutByIndex(Dev, Idx);
    DevListBox.Items.Objects[N] := Dev;
    Result := True;
  end;
end;

procedure TFMain.HidCtlRemoval(HidDev: TJvHidDevice);
begin
  if ((HidDev.Attributes.VendorID=$0483) and (HidDev.Attributes.ProductID=$5750)) then
  begin
    StatusBar.Panels[2].Text:=Tr('Device Disconnect');
    StatusBar.Panels[2].PanelStyle.Font.Color:=clRed;
    AddToHistory('Removal of ' + DeviceName(HidDev));
    CurrentDevice.OnData := nil;
    priConnect := false;
    GetHardStatus;
  end;
end;

procedure TFMain.HidCtlDeviceDataError(HidDev: TJvHidDevice;
  Error: Cardinal);
begin
  AddToHistory(Format('READ ERROR: %s (%x)', [SysErrorMessage(Error), Error]));
end;

procedure TFMain.HidCtlArrival(HidDev: TJvHidDevice);
begin
  if ((HidDev.Attributes.VendorID=$0483) and (HidDev.Attributes.ProductID=$5750)) then
  //确定是需要的设备
  begin
    TlogFile.GetInstance.Trace(logLevel,'Device arrived',DeviceName(HidDev));
    CurrentDevice := HidDev;
    AddToHistory('Arrival of ' + DeviceName(HidDev));
    priConnect := true;
    GetHardStatus;
    TimerInit.Enabled := true;
  end;
end;

function TFMain.SumOfDATATS: boolean;
var
  i,j,k,m: integer;
  f:integer;
  s: string;
  myres: Cardinal;
  myserno: word;
begin
  myres := 0;
  myres := myres+SaveDataTs.SBID+SaveDataTs.DEVID+SaveDataTs.VERSION+SaveDataTs.EYEGRAY+SaveDataTs.EYEGRAYH+SaveDataTs.EvTemp;

  for i:=0 to 1 do
  for j:=0 to 2 do
    myres := myres+SaveDataTs.BACK_DA[i,j];
  for i:=0 to 8 do
    myres := myres+SaveDataTs.FOUCUS_DA[i];
  for i:=0 to 3 do
    myres := myres+SaveDataTs.HW_DA[i];

  myres := myres+SaveDataTs.HJG_DA+SaveDataTs.HJG_DAH+SaveDataTs.TSG_DA+SaveDataTs.KM2C+SaveDataTs.JJ2LD;

  for i:=0 to 5 do
    myres := myres+SaveDataTs.YS_STEP[i];
  for i:=0 to 7 do
    myres := myres+SaveDataTs.GB_STEP[i];
  for i:=0 to 1 do
    myres := myres+SaveDataTs.JJ_FW[i];

  for i:=1 to 7 do
  for j:=1 to 25 do
    myres := myres+SaveDataTs.JJ_STEP[i,j];

  for i:=1 to 8 do
  for j:=1 to 17 do
    myres := myres+SaveDataTs.DJ_CS[i,j];

  for i:=0 to 45 do
    myres := myres+SaveDataTs.DB90[i];

  for i:=0 to 45 do
    myres := myres+SaveDataTs.DBTemp[i];

  myres := myres+SaveDataTs.JZJJ+SaveDataTs.LXJJ+SaveDataTs.X2CF+SaveDataTs.Y2CF+SaveDataTs.X2C+SaveDataTs.Y2C+SaveDataTs.X2JZ+SaveDataTs.Y2JZ+SaveDataTs.X2LX+SaveDataTs.Y2LX;

  for i:=0 to 1 do
  for j:=0 to 51 do
    myres := myres+SaveDataTs.DB_STEP[i,j];

  myserno :=  myres;
  if SaveDataTs.SerialNo=myserno then
    result := true
  else
    result := false;
end;

function TFMain.SumOfDATA: boolean;
var
  i,j,k,m: integer;
  f:integer;
  s: string;
  myres: Cardinal;
  myserno: word;
begin
  myres := 0;
  myres := myres+SaveDataBd.HJG_DA+SaveDataBd.SBID+SaveDataBd.EYEMOVE+SaveDataBd.EYEGRAY+SaveDataBd.EvTemp+SaveDataBd.DoubleRate;
  for i:=0 to 1 do
  for j:=0 to 2 do
    myres := myres+SaveDataBd.BACK_DA[i,j];
  for i:=0 to 8 do
    myres := myres+SaveDataBd.FOUCUS_DA[i];
  for i:=0 to 3 do
    myres := myres+SaveDataBd.HW_DA[i];

  for k:=1 to 2 do
  for i:=1 to 24 do
  for j:=1 to 20 do
  for m:=0 to 40 do
  begin
    myres := myres+SaveDataBd.DOT_DA[k,i,j,m];
  end;

  for i:=0 to 45 do
    myres := myres+SaveDataBd.DB90[i];

  for i:=0 to 45 do
    myres := myres+SaveDataBd.DBTemp[i];

  for i:=1 to 2 do
  for j:=1 to 17 do
    myres := myres+SaveDataBd.DJ_CS[i,j];
      
  myserno :=  myres;
  if SaveDataBd.SerialNo=myserno then
    result := true
  else
    result := false;
end;

function TFMain.ReadDevData: boolean;  //加上校验
var
  i,j,k,m:integer;
  Buf: array [0..64] of Byte;
  tempUSBDataBufXj:array[0..102400] of byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
  f:integer;
  s:string;
  myCount,StartTime,LI:TLARGEINTEGER;
begin
  Fillchar(USBDataBufXj, sizeof(USBDataBufXj), 0);
  j := 0;

  if SaveDataHead.DEVTYPE = $8800 then
    j := sizeof(SaveDataBd) div 56
  else if SaveDataHead.DEVTYPE = $0088 then
    j := sizeof(SaveDataTs) div 56;

  priRead := true;
  priReturnId := 0;
  if Assigned(CurrentDevice) then
  begin
    i := 1;
    while i<=j+1 do
    begin
      Fillchar(Buf, sizeof(Buf), 0);
      Buf[0] := StrToIntDef('$00', 0);
      Buf[1]:=$bb;
      Buf[2]:=$0c;
      Buf[3]:=$dd;
//      Buf[4]:=$c6;

      Buf[36]:=$c5;
      Buf[47]:=$ff;

      ToWrite := CurrentDevice.Caps.OutputReportByteLength;

      Buf[61]:=i div 256;
      Buf[62]:=i mod 256;
      Buf[63]:=$0e;
      Buf[64]:=$0f;

      if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
      begin
        Err := GetLastError;
        AddToHistory(Format('READ ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
//        StatusBarBottom.SimpleText := '读取第：'+inttostr(i)+' 出错！';
        Statusbar.Panels[0].Text:=' '+Tr('Read DevData: ')+inttostr(i)+Tr('Error');
      end
      else
      begin
        Str := Format('W %.2x  ', [Buf[0]]);
        for k := 1 to Written-1 do
          Str := Str + Format('%.2x ', [Buf[k]]);
        AddToHistory(Str);
//        StatusBarBottom.SimpleText := '读取第：'+inttostr(i)+' OK ';
        Statusbar.Panels[0].Text:=' '+Tr('Read DevData: ')+inttostr(i)+Tr('OK');
        m := 0;

       /////等待间隔时间
        QueryPerformanceFrequency(li);
        myCount:=round((li/1000)*1000); //li* pubPrefer.flashtime;
        QueryPerformanceCounter(StartTime);
        repeat
          Application.ProcessMessages;
          if (priReturnId>=i) then
          begin
//            StatusBarBottom.SimpleText := '读取第：'+inttostr(i)+' OK '+inttostr(m);
            Statusbar.Panels[0].Text:=' '+Tr('Read DevData: ')+inttostr(i)+Tr('OK')+inttostr(m);
            i := i+1;
            myCount:=0;
          end;
          QueryPerformanceCounter(li);
        until li-StartTime > myCount;
      end;
    end;
  end;

  //读取本地硬件数据文件
  SetCurrentDirectory(PChar(ExeFilePath));
  s:=ExeFilePath+'DevData.dat';
  f:=FileCreate(s);
  if f=-1 then
  begin
    ShowMessage('文件错误:'+s);
    exit;
  end;

  if SaveDataHead.DEVTYPE = $8800 then
  begin
    Move(USBDataBufXj[0],SaveDataBd, sizeof(SaveDataBd));
    FileWrite(f, SaveDataBd, sizeof(SaveDataBd));
    if SaveDataBd.EYEMOVE=1 then
      pubEyeMoveYN := true
    else
      pubEyeMoveYN := false;

    PupilBlackValue := SaveDataBd.EYEGRAY;

    if SumOfDATA then
      result := true
    else
      result := false;
  end
  else if SaveDataHead.DEVTYPE = $0088 then
  begin
    Move(USBDataBufXj[0],SaveDataTs, sizeof(SaveDataTs));
    FileWrite(f, SaveDataTs, sizeof(SaveDataTs));
    pubEyeMoveYN := true;
//    PupilBlackValue := 56;
    PupilBlackValue := SaveDataTs.EYEGRAY;

    if SumOfDATATs then
      result := true
    else
      result := false;

  end;
  FileClose(f);
{
  LabelDqwj.Caption := '当前参数文件：读取文件';
  LabelSbbhV.Caption := inttostr(SaveData.DEVID);
  LabelBbh.Caption := '版本号：'+inttostr(SaveData.VERSION);
  LabelSspb.Caption := '双色比：'+inttostr(SaveData.DoubleRate)+'%';
  LabelSspbTs.Caption := '双色比：'+inttostr(SaveData.DoubleRate)+'%';
  LabelCsch.Caption := '参数串号：'+inttostr(SaveData.SerialNo);
}
end;

procedure TFMain.FHome1TimerTimer(Sender: TObject);
begin
  FHome1.TimerTimer(Sender);
end;

procedure TFMain.SnapshotClick(Sender: TObject);
begin
  GetHardStatus;
end;

procedure TFMain.GetHardStatus;
begin
  if priConnect then
  begin
    if CurrentDevice.HasReadWriteAccess then
    begin
      CurrentDevice.OnData := ShowRead;//here bind call back func to process reading data

      StatusBar.Panels[2].Text:=Tr('Device Connected  ');
      StatusBar.Panels[2].PanelStyle.Font.Color:=clBlack;

      //取下位机状态
      Fillchar(Server2Lower, sizeof(Server2Lower), 0);

      Server2Lower.lowerstatus:=$c5;
      Server2Lower.lowerbuzy:=$ff;
      Server2Lower.lowerserial:=$ff;
      Server2Lower.answer:=$ff;
      Server2Lower.glasspos:=$ff;
      Server2Lower.envlight1:=$ff;
      Server2Lower.envlight2:=$ff;
      Server2Lower.envtemper:=$ff;
      Server2Lower.eyeleft:=$ff;
      Server2Lower.eyeright:=$ff;

      Server2Lower.head[1]:=$bb;
      Server2Lower.head[2]:=$0c;
      Server2Lower.head[3]:=$dd;

      Server2Lower.ending[1]:=$0e;
      Server2Lower.ending[2]:=$0f;

      Write2Device;
    end
    else
    begin
      CurrentDevice.OnData := nil;
      StatusBar.Panels[2].Text:=Tr('Device Disconnect');
      StatusBar.Panels[2].PanelStyle.Font.Color:=clRed;
    end;
  end
  else
  begin
    StatusBar.Panels[2].Text:=Tr('Device Disconnect');
    StatusBar.Panels[2].PanelStyle.Font.Color:=clRed;
  end;
end;

procedure TFMain.HidCtlDeviceChange(Sender: TObject);
var
  Dev: TJvHidDevice;
  I: Integer;
begin
  for I := 0 to DevListBox.Items.Count - 1 do
  begin
    Dev := TJvHidDevice(DevListBox.Items.Objects[I]);
    Dev.Free;
  end;
  DevListBox.Items.Clear;
  HidCtl.Enumerate;
  if DevListBox.Items.Count > 0 then
  begin
    DevListBox.ItemIndex := 0;
  end;
end;

procedure TFMain.ButtonReadDevClick(Sender: TObject);
begin
  ReadDevData;
end;

procedure TFMain.ButtonReadHeadClick(Sender: TObject);
var
  i,j,k,m:integer;
  Buf: array [0..64] of Byte;
  tempUSBDataBufXj:array[0..102400] of byte;
  Written: Cardinal;
  ToWrite: Cardinal;
  Str: string;
  Err: DWORD;
  f:integer;
  s:string;
  myCount,StartTime,LI:TLARGEINTEGER;
begin
  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);

    Fillchar(USBDataBufXj, sizeof(USBDataBufXj), 0);
    j := 1;
    priRead := true;
    priReturnId := 0;
    if Assigned(CurrentDevice) then
    begin
      i := 1;
      while i<=j do
      begin
        Fillchar(Buf, sizeof(Buf), 0);
        Buf[0] := StrToIntDef('$00', 0);
        Buf[1]:=$bb;
        Buf[2]:=$0c;
        Buf[3]:=$dd;

        Buf[36]:=$c5;
        Buf[47]:=$ff;

        ToWrite := CurrentDevice.Caps.OutputReportByteLength;

        Buf[61]:=i div 256;
        Buf[62]:=i mod 256;
        Buf[63]:=$0e;
        Buf[64]:=$0f;

        if not CurrentDevice.WriteFile(Buf, ToWrite, Written) then
        begin
          Err := GetLastError;
          AddToHistory(Format('READ ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
          Statusbar.Panels[0].Text:=' '+Tr('Hard Read Error');
  //        StatusBarBottom.SimpleText := '读取第：'+inttostr(i)+' 出错！';
        end
        else
        begin
          Str := Format('W %.2x  ', [Buf[0]]);
          for k := 1 to Written-1 do
            Str := Str + Format('%.2x ', [Buf[k]]);
          AddToHistory(Str);
          Statusbar.Panels[0].Text:='读取第：'+inttostr(i)+' OK '; //' '+Tr('Hard Read Error');
  //        StatusBarBottom.SimpleText := '读取第：'+inttostr(i)+' OK ';
          m := 0;

       /////等待间隔时间
          QueryPerformanceFrequency(li);
          myCount:=round((li/1000)*1000); //li* pubPrefer.flashtime;
          QueryPerformanceCounter(StartTime);
          repeat
            Application.ProcessMessages;
            if (priReturnId>=i) then
            begin
              //StatusBarBottom.SimpleText := '读取第：'+inttostr(i)+' OK '+inttostr(m);
              Statusbar.Panels[0].Text:='读取第：'+inttostr(i)+' OK '+inttostr(m); //' '+Tr('Hard Read Error');
              i := i+1;
              myCount:=0;
            end;
            QueryPerformanceCounter(li);
          until li-StartTime > myCount;
        end;
      end;
      Move(USBDataBufXj[0],SaveDataHead, sizeof(SaveDataHead)); //写入头结构体
      if (SaveDataHead.DEVTYPE<>$8800) and (SaveDataHead.DEVTYPE<>$0088) then
      begin
        ShowMessage('硬件未就绪！');
        application.Terminate;
      end;
      sleep(200);
      GetHardStatus;
    end;
end;

procedure TFMain.ButtonInitClick(Sender: TObject);
var
  f:integer;
  s:string;
begin
  ButtonReadHeadClick(nil);
  //读取本地硬件数据文件
  SetCurrentDirectory(PChar(ExeFilePath));
  s:=ExeFilePath+'DevData.dat';
  f:=FileOpen(s, fmOpenRead);
  if f > 0 then
  begin
    FileRead(f, SaveDataHeadLocal, sizeof(SaveDataHeadLocal));
  end;
  FileClose(f);
  if (SaveDataHead.DEVTYPE<>SaveDataHeadLocal.DEVTYPE) or (SaveDataHead.SerialNo<>SaveDataHeadLocal.SerialNo) or (SaveDataHead.DEVID<>SaveDataHeadLocal.DEVID) then  //读取硬件全部数据
  begin
    ShowMessage('本机与硬件存储数据不一致，将从硬件读取数据！');
    repeat
      begin
        Application.ProcessMessages;
      end;
    until ReadDevData;
  end
  else
  begin
    //直接读本地文件
    f:=FileOpen(s, fmOpenRead);
    if f > 0 then
    begin
      if SaveDataHead.DEVTYPE = $8800 then
      begin
        FileRead(f, SaveDataBd, sizeof(SaveDataBd));
        PupilBlackValue := SaveDataBd.EYEGRAY;
        if SaveDataBd.EYEMOVE=1 then
          pubEyeMoveYN := true
        else
          pubEyeMoveYN := false;
        pmaxdb := 40;
      end
      else if SaveDataHead.DEVTYPE = $0088 then
      begin
        FileRead(f, SaveDataTs, sizeof(SaveDataTs));
        PupilBlackValue := SaveDataTs.EYEGRAY;
        pubEyeMoveYN := true;
        pmaxdb := 51;
      end;
    end;
    FileClose(f);
  end;

  sleep(200);
  GetHardStatus;
  sleep(200);
  GetHardStatus;
  //初始化
  OldPoint.X := 0;
  OldPoint.Y := 0;
  OldDB := 0;
  OldGB := 2;
  OldColor := 0;
  pubMotoBuzy := false;
  pubCurZbx := 1; //主坐标系 1,2
////  PupilBlackValue := 56;

  ResetMotor; //复位
end;

procedure TFMain.TimerInitTimer(Sender: TObject);
begin
  TLogFile.GetInstance.Trace(LogLevel,'check device','');
  if prijc1 then
  begin
    //primainform:=mymessagebox('','正在初始化硬件,请稍侯...');
    primainform:=mymessagebox('','Please waiting......');
    prijc1 := false;
  end;
  GetHardStatus;
  if priHardOk then
  begin
    TLogFile.GetInstance.Trace(LogLevel,'priHardOk','');
    TimerInit.Enabled := false;
    ButtonInitClick(nil);
    FMain.Enabled := true;
    primainform.Free;
    pubMotoBuzy := false;
  end
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //primainform:=mymessagebox('','正在复位硬件,请稍侯...');
  primainform:=mymessagebox('','Please waiting......');
  if (SaveDataHead.DEVTYPE = $0088) then
  begin
    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMotoBuzy);
  end;

  DemoCheckData.pm.Stimulus_Size:=2;
  DemoCheckData.pm.Stimulus_Color:=0;
  FMain.LightColorGb; //走光斑和颜色
  if (SaveDataHead.DEVTYPE = $0088) then
  begin
    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMotoBuzy);
    sleep(1000);
    DemoCheckData.pm.Background_Color:=0;
    FMain.LightOther(0,0);
    sleep(1000);
    DemoCheckData.pm.Background_Color:=0;
    FMain.LightOther(0,0);
    FMain.LightOther(0,0);
    sleep(1000);
  end;
  DemoCheckData.pm.Background_Color:=0;
  FMain.LightOther(0,0);
  primainform.Free;
end;

procedure TFMain.FHome1Panel7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  w,cx:integer;
begin
  w:=(Sender as TPanel).Width;
  cx:=w div 2;
  if (PassState=2) and (x>=(w-40)) then
  begin
    CheckBoxDebug.Visible:=True;
    PassState:=0;
  end;
  if (PassState=1) and (x>=(cx-40)) and (x<=(cx+40)) then
  begin
    PassState:=2;
    exit;
  end;
  if (PassState=0) and (x<40) then
  begin
    PassState:=1;
    exit;
  end;
  PassState:=0;
end;

procedure TFMain.ImageHomeClick(Sender: TObject);
begin
    PcMain.ActivePageIndex:=4;
    LabelPatient.Visible:=false;
    LabelXtmc.Visible:=true;
    PanelBottomMain.Visible:=true;
    PanelBottomWaitRoom.Visible:=false;
    PanelBottomQuery.Visible:=false;
    PanelBottomProgram.Visible:=false;
    PanelBottomRunpic.Visible:=false;
end;

procedure TFMain.cxButtonArchivesClick(Sender: TObject);
begin
   {
     if showWaitRoom then
     begin
         BitBtnWaitRoomClick(Sender);
     end
     else
     begin
         BitBtnArchivesClick(Sender);
     end;
     ///FRunpic1.InitializationRunpic;
     }
end;

procedure TFMain.cxButtonExamineClick(Sender: TObject);
begin
//进入检查方式 0 main  1 new 2 doc
  pubentertestmode := 0;
  if FHome1.BtStart.Enabled then
    FHome1.BtStartClick(Sender)
  else
    FHome1.BtRecheckClick(Sender);
    //BitBtnWaitRoomClick(nil);
end;

procedure TFMain.SetTestStyle;
begin
   PcMain.ActivePageIndex:=1;
   LabelPatient.Visible:=true;
   LabelXtmc.Visible:=false;
   PanelBottomRunpic.Visible:=true;
   PanelBottomMain.Visible:=false;
   PanelBottomWaitRoom.Visible:=false;
   PanelBottomQuery.Visible:=false;
   PanelBottomProgram.Visible:=false;
end;

procedure TFMain.cxButtonProgramClick(Sender: TObject);
begin
   PcMain.ActivePageIndex:=2;
   LabelPatient.Visible:=false;
   PanelBottomProgram.Visible:=true;
   PanelBottomMain.Visible:=false;
   PanelBottomWaitRoom.Visible:=false;
   PanelBottomQuery.Visible:=false;
   PanelBottomRunpic.Visible:=false;
end;


procedure TFMain.BitBtnArchivesClick(Sender: TObject);
begin
     PcMain.ActivePageIndex:=0;
     LabelPatient.Visible:=false;
     PanelBottomQuery.Visible:=true;
     PanelBottomMain.Visible:=false;
     PanelBottomWaitRoom.Visible:=false;
     PanelBottomProgram.Visible:=false;
     PanelBottomRunpic.Visible:=false;
     showWaitRoom:=false;
     FHome1.PanelNewList.Visible:=false;
     FHome1.PanelDocList.Visible:=true;
end;

procedure TFMain.BitBtnWaitRoomClick(Sender: TObject);
begin
     PcMain.ActivePageIndex:=0;
     LabelPatient.Visible:=false;
     PanelBottomWaitRoom.Visible:=true;
     PanelBottomMain.Visible:=false;
     PanelBottomQuery.Visible:=false;
     PanelBottomProgram.Visible:=false;
     PanelBottomRunpic.Visible:=false;
     showWaitRoom:=true;
     FHome1.PanelNewList.Visible:=true;
     FHome1.PanelDocList.Visible:=false;
end;

procedure TFMain.BtNewClick(Sender: TObject);
begin
     if FHome1.BtNew.Enabled then
        FHome1.BtNewClick(Sender);
end;

procedure TFMain.BtEditClick(Sender: TObject);
begin
     if FHome1.BtEdit.Enabled then
        FHome1.BtEditClick(Sender);
end;

procedure TFMain.BtDeleteClick(Sender: TObject);
begin
     if FHome1.BtDelete.Enabled then
        FHome1.BtDeleteClick(Sender);
end;

procedure TFMain.BtStartClick(Sender: TObject);
begin
     if FHome1.BtStart.Enabled then
        FHome1.BtStartClick(Sender);

end;

procedure TFMain.BtEdit2Click(Sender: TObject);
begin
     if FHome1.BtEdit2.Enabled then
        FHome1.BtEdit2Click(Sender);
end;

procedure TFMain.BtDelete2Click(Sender: TObject);
begin
     if FHome1.BtDelete2.Enabled then
        FHome1.BtDeleteClick(Sender);
end;

procedure TFMain.BtRecheckClick(Sender: TObject);
begin
  if FHome1.BtRecheck.Enabled then
  begin
    pubentertestmode := 2;
    FHome1.BtRecheckClick(Sender);
  end;
end;

procedure TFMain.BtStartCheckClick(Sender: TObject);
begin
     FRunpic1.BtStartClick(Sender);
end;

procedure TFMain.BtStopClick(Sender: TObject);
begin
    FRunpic1.BtStopClick(Sender);
end;

procedure TFMain.BtOtherEyeClick(Sender: TObject);
begin
    FRunpic1.BtOtherClick(Sender);
end;

procedure TFMain.BtProgramSelectClick(Sender: TObject);
begin
    FRunpic1.BtSelectClick(Sender);
end;

procedure TFMain.BtParamClick(Sender: TObject);
begin
    FRunpic1.BtParamClick(Sender);
end;

procedure TFMain.BtPauseClick(Sender: TObject);
begin
     FRunpic1.BtPauseClick(Sender);
end;

procedure TFMain.BtUnlockClick(Sender: TObject);
begin
  FProgram1.BtUnLockClick(Sender);
end;

procedure TFMain.BitBtnReturn4Click(Sender: TObject);
begin
   if PcMain.ActivePageIndex=4 then
   begin
      BtExitClick(Sender);
   end;
   case pubentertestmode of
     0:
     begin
        PcMain.ActivePageIndex:=4;
        LabelPatient.Visible:=false;
        LabelXtmc.Visible:=true;
        PanelBottomMain.Visible:=true;
        PanelBottomWaitRoom.Visible:=false;
        PanelBottomQuery.Visible:=false;
        PanelBottomProgram.Visible:=false;
        PanelBottomRunpic.Visible:=false;
     end;
     1:
     begin
       FHome1.BtEditClick(nil);
     end;
     2:
     begin
       BitBtnArchivesClick(nil);
     end;
   end;
end;



procedure TFMain.LogClick(Sender: TObject);
begin
  if LogInfo.Visible=true then LogInfo.Visible:=false
  else if LogInfo.Visible=false then LogInfo.Visible:=true;
end;

end.
