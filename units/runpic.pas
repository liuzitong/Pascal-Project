unit runpic;

interface

uses
  ShareMem,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus, cxLookAndFeelPainters, ExtCtrls, StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxLabel, DateUtils, dxBar,
  dxBarExtItems, cxClasses, cxProgressBar, DB, DBTables, Wwtable, Wwdatsrc,
  cxDBLabel, Buttons, DSPack, cxMCListBox, DSUtil, DirectShow9, Math, ComObj, ShellApi,
  cxCheckBox, pubpas, JvHidControllerClass,xwxh, MPlayer, Spin,myIniFiles;

type

  TFRunpic = class(TFrame)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel6: TcxLabel;
    Panel3: TPanel;
    cxLabel14: TcxLabel;
    cxComboBox1: TcxComboBox;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel10: TPanel;
    Timer: TTimer;
    Panel5: TPanel;
    ImageRun: TImage;
    TbCheck: TwwTable;
    cxDBLabel1: TcxDBLabel;
    DsCheck: TwwDataSource;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel4: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    pVideo: TPanel;
    PaChin: TPanel;
    Panel2: TPanel;
    EtProgram: TcxDBLabel;
    EtCursor: TcxLabel;
    EtStategy: TcxDBLabel;
    cxLabel2: TcxLabel;
    cxDBLabel6: TcxDBLabel;
    BtStart: TcxButton;
    BtStop: TcxButton;
    BtSave: TcxButton;
    BtParam: TcxButton;
    BtSelect: TcxButton;
    BtOther: TcxButton;
    BtDiagnosis: TcxButton;
    BtReport: TcxButton;
    BtSame: TcxButton;
    FilterGraph: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    Filter: TFilter;
    TimerFast: TTimer;
    LaCamere: TLabel;
    VideoWindow: TVideoWindow;
    EtAutoPupil: TcxCheckBox;
    OpenDialog: TOpenDialog;
    PCenW: TPanel;
    PCenH: TPanel;
    PLTW: TPanel;
    PLTH: TPanel;
    PLBW: TPanel;
    PLBH: TPanel;
    PRTW: TPanel;
    PRTH: TPanel;
    PRBW: TPanel;
    PRBH: TPanel;
    TimerTestTime: TTimer;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit3: TSpinEdit;
    Memo1: TMemo;
    Panel6: TPanel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    Label41: TLabel;
    Label15: TLabel;
    Button1: TButton;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBoxYdzt: TCheckBox;
    ImageEyeMove: TImage;
    PaPupil: TPanel;
    Panel9: TPanel;
    cxLabel9: TcxLabel;
    EtPosCount: TcxLabel;
    cxLabel5: TcxLabel;
    EtNegCount: TcxLabel;
    cxLabel15: TcxLabel;
    EtFixation: TcxLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    EtCount: TcxLabel;
    cxLabel19: TcxLabel;
    EtTime: TcxLabel;
    cxLabel7: TcxLabel;
    EtPupilDiameter: TcxLabel;
    EtEyeMoveAlarm: TShape;
    BtCamere: TcxButton;
    cxLabel13: TcxLabel;
    cxDBLabel8: TcxDBLabel;
    cxButtonAutoPupil: TcxButton;
    cxButtonMaualPupil: TcxButton;
    btPause: TcxButton;
    btDemoData: TcxButton;

    procedure TimerTimer(Sender: TObject);
    procedure BtParamClick(Sender: TObject);
    procedure BtStartClick(Sender: TObject);
    procedure BtPauseClick(Sender: TObject);
    procedure BtStopClick(Sender: TObject);
    procedure BtReportClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure BtSelectClick(Sender: TObject);
    procedure BtOtherClick(Sender: TObject);
    procedure TbCheckAfterPost(DataSet: TDataSet);
    procedure BtUpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtUpMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtDnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtDnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtLeftMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtLeftMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtRightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtRightMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtDiagnosisClick(Sender: TObject);
    procedure BtSameClick(Sender: TObject);
    procedure TimerFastTimer(Sender: TObject);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure BtCamereClick(Sender: TObject);
    procedure BtDemoDataClick(Sender: TObject);
    procedure EtAutoPupilClick(Sender: TObject);
    procedure TimerTestTimeTimer(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure SpinEdit5Change(Sender: TObject);
    procedure cxButtonAutoPupilCKClick(Sender: TObject);
    procedure cxButtonAutoPupilClick(Sender: TObject);
    procedure cxButtonMaualPupilClick(Sender: TObject);
  private
    { Private declarations }

    patientNumber: string;
    patientName: string;
    patientSex: string;
    patientAge: string;


    bInitCamere:boolean;
    CamereI, CamereJ:integer;
    bRefresh:boolean;
    bShowCheckResult:boolean;
    runstate:integer;
    MainActivePageIndex:integer;
    StopCount:integer;
    alarm:integer;
    EyeMove:integer;
    EyeMoveAlarm:boolean;
    EyeMoveAlarmAck:boolean;
    EyeMoveAlarmPause:boolean;
    PupilDiameter:string;
    WaitCount:integer;

    ChinDown,ChinUp:boolean;

    priCloseBj: boolean;
    priCloseCount: integer;
    priCenterDot: boolean;         //中心点检测  paramsetting中设置会影响此字段
    priFxy4: boolean;          ////btStart置为false,之后没有置为FALSE的时候,
    priCenEnd: boolean;       //btStartclick中置为true,如果中心点检查是false
    priZcyd: boolean;          //正常应答
    priYdcs: integer;        //应答次数 等于三的时候给prijclx赋值1


    pripm:TCHECKSET;			   //960-1199   打开了param界面且选择了OK之后会把democheckdata.pm赋值给它

    prijcsj: Cardinal;
    priStop,priHjStop: boolean;
    priIni: boolean;
    priJczt: byte; //1－已新开始， 2－已暂停，3－已继续，4－复查          没找到初始化位置.不知道哪里会初始化为0
////    priBMdxy: TMDArray;
////    priBdotArray: TDataArray;

    priy, priquan, pripnum: integer;      //prinum 点的个数:= DemoCheckData.pm.Dot_Number
    pricurp: integer; //当前点          strategy mod 30<10 是在btStartClick初始化为4个基准点,其他情况初始化为0
    prijclx: byte; //检查点类型         0:正常跳转  1:盲点测试   2:假阳  没有亮灯,但是点了  3:假阴 暗的灯点了,但是亮的却没有点
    prihadnum: integer; //已测次
    prifcnum: integer;  //复查点数
    priPush,priYdjs: byte;
    pristepdb: byte;

    priox,prioy: integer;  //box 选取
    priboxs: boolean;
    prihadblind,prihavingblind: boolean;
    priblindpoint:TPoint;        
    pricurbp: integer;         //啥用? 盲点?             
    prisftestdot: integer;     //短期测试点 

    priqdms: integer;//直接从项目中取出的QDMS

    pricurdb,pritrioren,pricury,pricurstep : integer;

    labelarray: array[0..300] of integer;

    afarray,fcqpoint: TIntArray;  //乱续labelarray  afarray没什么用,顺序初始赋值0~i之后就没变过.

    ftpoint: newtdatarray;  //array of control point   在BtStartClick初始化

    procedure DelYdqk;
    procedure TWTimerProc;
    procedure TWTimerProcMove;
    procedure DelYdqkMove;

    procedure RecordEyeMove;

    function GetNearDB(i:integer; mytdata: newtdatarray): integer;

    function HasEnded(mytdata: newtdatarray): boolean;
    function HasEndedmove(mytdata: newtdatarray): boolean;
    procedure CheckMove;

    function skippoint(mytdata:newtdatarray; mypoint: integer): integer;
    function skippointmove(mytdata:newtdatarray; mypoint: integer): integer;

    procedure Getxy4;
    procedure ClearTest;
    function GetoldId(x,y,myw:integer): integer;


  public
    { Public declarations }
    isEyeMove:boolean;
    procedure InitCamere;
    procedure DoneCamere;

  end;

implementation

uses  param, Myutils, main, programselect, usbr,
  diagnosis, paramcastmove, paramcast, movexy, xwzp;

{$R *.dfm}
const
{
    BLIND_DOT_RIGHTP: array[1..15,1..2] of integer=
    (
      (15,-1),
      (13,-1),(17,-1),(15,-3),(15,1),
      (13,-3),(17,-3),(13,1),(17,1),
      (11,-1),(17,-1),(11,-3),(17,-3),(11,1),(17,1)
    );

    BLIND_DOT_LEFTP: array[1..15,1..2] of integer=
    (
      (-15,-1),
      (-13,-1),(-17,-1),(-15,-3),(-15,1),
      (-13,-3),(-17,-3),(-13,1),(-17,1),
      (-11,-1),(-17,-1),(-11,-3),(-17,-3),(-11,1),(-17,1)
    );
 }
    BLIND_DOT_RIGHTP: array[1..15,1..2] of integer=
    (
      (15,-1),
      (17,-1),(15,-3),(15,1),(13,-1),
      (13,-3),(17,-3),(13,1),(17,1),
      (11,-1),(17,-1),(11,-3),(17,-3),(11,1),(17,1)
    );

    BLIND_DOT_LEFTP: array[1..15,1..2] of integer=
    (
      (-15,-1),
      (-17,-1),(-15,-3),(-15,1), (-13,-1),
      (-13,-3),(-17,-3),(-13,1),(-17,1),
      (-11,-1),(-17,-1),(-11,-3),(-17,-3),(-11,1),(-17,1)
    );

function TFRunpic.Hasendedmove(mytdata: newtdatarray): boolean;
var
  i,j,dis,num: integer;
  myresult: boolean;
  xy4end,hasdot: boolean;
begin
  myresult := True;

  num := 0;
  for i:=low(mytdata) to high(mytdata) do
  begin
    if mytdata[i].arr=False then
    begin
      num := num+1;
    end;
  end;

  pubhastest := num;
  DemoCheckData.count := num;

  for i:=low(mytdata) to high(mytdata) do
  begin
    if mytdata[i].arr=True then
    begin
      myresult := false;
      break;
    end;
  end;
  result := myresult;
end;

function TFRunpic.Hasended(mytdata: newtdatarray): boolean;  //被DelYdkq调用
var
  i,j,dis,num: integer;
  myresult: boolean;
  xy4end,hasdot: boolean;
begin
  myresult := True;
  xy4end := True;
  num := 0;
  for i:=low(mytdata) to high(mytdata) do   //应该作用是遍历mytdata
  begin
    if mytdata[i].arr=False then     //点已经被测试
    begin
      num := num+1;                  //统计测试的点数      
      priCenEnd := true;             //只有有任意一点被测试即为true
    end;
    if ((mytdata[i].arr=True) and (mytdata[i].isxy4=True)) then     //4个特殊点,只要有任一没有检查完就为TRUE
    begin
      xy4end := false;    //表示没有测试完4个点
    end;
  end;

  //if (DemoCheckData.pm.Strategy mod 30=0) and (priCenEnd) and (priCenterDot)  then
  if (DemoCheckData.pm.Strategy<30) and (priCenEnd) and (priCenterDot)  then
  begin
    sleep(1000);
    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);//正常固视

    priCenterDot := false;
  end;

  if (DemoCheckData.pm.Strategy mod 30>=1) and (DemoCheckData.pm.Strategy mod 30<=2) then   //1:全智能交互  2:快速智能交互式 31:盲区 32:暗区
  begin
    //新初始点为isxy4,四点检查完毕
    if xy4end then
    begin
      {
        //若中心点参与了检查，在此值最初四点
        // if not priFxy4 then     //btStart置为false,之后没有置为FALSE的时候,                感觉这部分没什么卵用
        // begin
        //   Getxy4;                   //获得新的四点
        //   priFxy4 := true;
        //   priCenterDot := false;
        //   //if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
        //   //FMain.LightOther(1,0); // 大菱形固视
        //   sleep(1000);
        //   FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);//正常固视
        //   priZcyd := true;
        // end
        // else
      }
      begin
        Old4XY := false;  //最初4点完成后将其他点isxy4设定为true
        for i:=low(mytdata) to high(mytdata) do
        begin
          if (mytdata[i].isxy4=True) and (mytdata[i].arr=false) then
          begin
            hasdot := false;
            ///查找相邻点
            for dis:=2 to 200 do
            begin
              for j:=low(mytdata) to high(mytdata) do
              begin
                if i<>j then
                begin
                  if (isNearbyXY(mytdata[i].x,mytdata[i].y,mytdata[j].x,mytdata[j].y,dis)=true) and (mytdata[j].arr=true) then
                  begin
                    mytdata[j].isxy4 := true;
                    {
                      //改为视野角小于加2DB,否则，原DB
                      mytdata[j].db := mytdata[i].db;
                      if abs(mytdata[j].x)+abs(mytdata[j].y)<abs(mytdata[i].x)+abs(mytdata[i].y) then
                      mytdata[j].db := mytdata[i].db+2;
                    }
                    //改为视野角小于加2DB,否则，原DB
                    mytdata[j].db := mytdata[i].db-1;
                    if abs(mytdata[j].x)+abs(mytdata[j].y)>abs(mytdata[i].x)+abs(mytdata[i].y) then
                    begin
                      //若在5圈，-4
                      if GetQZ(mytdata[j].x,mytdata[j].y)>=5 then
                        mytdata[j].db := mytdata[i].db-4
                      else
                        mytdata[j].db := mytdata[i].db-2;
                    end;
                    {
                      if DemoCheckData.pm.Eye=0 then // 左眼
                      begin
                        if (mytdata[j].x=-15) and (mytdata[j].y=-3) then
                          if mytdata[j].db>16 then
                            mytdata[j].db:=16;
                      end
                      else
                      begin
                        if (mytdata[j].x=15) and (mytdata[j].y=-3) then
                          if mytdata[j].db>16 then
                            mytdata[j].db:=16;
                      end;
                    }
                    if mytdata[j].db>pmaxdb then
                      mytdata[j].db:=pmaxdb;
                    hasdot := true;
                  end;
                end;
              end;
              if hasdot then
                break;
            end;
            mytdata[i].isxy4:=false;
          end;
        end;
      end;
    end;
  end;


  //检测是否已经测试完的逻辑
  for i:=low(mytdata) to high(mytdata) do
    if mytdata[i].arr=True then      //任意一点没检查
    begin
      myresult := false;             //表示没检查完
      break;
    end;
  pubhastest := num;
  DemoCheckData.count := num;
  result := myresult;
end;

function TFRunpic.GetNearDB(i:integer; mytdata: newtdatarray): integer;
var
  j,dis: integer;
  myresult: integer;
  hasdot: boolean;
begin
  myresult := 0;
  hasdot := false;
  ///查找相邻点
  for dis:=2 to 100 do
  begin
    for j:=low(mytdata) to high(mytdata) do
    begin
      if i<>j then
      begin
        if not ((abs(mytdata[j].x)=15) and (mytdata[j].y=-3)) then
        if (isNearbyXY(mytdata[i].x,mytdata[i].y,mytdata[j].x,mytdata[j].y,dis)=true) and (mytdata[j].arr=true) then
        begin
          myresult := mytdata[j].db;
          hasdot := true;
          break;
        end;
      end;
    end;
    if hasdot then
      break;
  end;

  result := myresult;
end;

function Tsxx2(s:string):integer;
begin
  FUsbr.ReadCmdData.Chin_Dir:=FUsbr.ReadCmdData.Chin_Dir and not $0f;
  Result:=Tsxx(s);
end;

function Xwxx2(s:string):integer;
begin
  FUsbr.ReadCmdData.Chin_Dir:=FUsbr.ReadCmdData.Chin_Dir and not $0f;
  Result:=Xwxx(s);
end;

procedure TFRunpic.TimerTimer(Sender: TObject);
var
  checkdata:TCheckData;
  checkreport:TCheckReport;
  year,month,day:Word;
begin
  Timer.Enabled:=False;
  Label4.Caption := inttostr(SaveDataBd.HJG_DA)+'  '+inttostr(DemoCheckData.pm.EB_Light_sv)+'  '+inttostr(pubhjgda) ;
  SpinEdit1.Value := PupilBlackValue;
  {
  if SaveDataHead.DEVTYPE = $8800 then
  begin
    SpinEditHwdDA3.Value := SaveDataBd.HW_DA[2];
    SpinEditHwdDA4.Value := SaveDataBd.HW_DA[3];
  end
  else
  begin
    SpinEditHwdDA3.Value := SaveDataTs.HW_DA[2];
    SpinEditHwdDA4.Value := SaveDataTs.HW_DA[3];
  end;
   }
//  if pubMotoBuzy then
//    FMain.SnapshotClick(nil); //取状态

  RecordEyeMove;
  if priCloseBj then
  begin
    inc(priCloseCount);
    if priCloseCount=5 then
    begin
      priCloseBj := false;
      priCloseCount := 0;
      FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);
    end;
  end;

  if MainActivePageIndex<>FMain.PcMain.ActivePageIndex then
  begin
    MainActivePageIndex:=FMain.PcMain.ActivePageIndex;
    if MainActivePageIndex=1 then
    begin
    /////
      if not bInitCamere then
      begin
        bInitCamere:=True;
        BtCamereClick(nil);
      //        InitCamere;
      end;
      //      FUsbr.ReadCmdData.Chin_Dir:=FUsbr.ReadCmdData.Chin_Dir or $10;
      FMain.ActiveControl:=nil;
    end
    else
    begin
    //      FUsbr.ReadCmdData.Chin_Dir:=FUsbr.ReadCmdData.Chin_Dir and not $10;
    end;
  end;
  {
    ///////
    DemoCheckData.runstate:=0;
    DemoCheckData.Ready:=1;
    //////
  }
  if DemoCheckData.runstate=0 then
  begin
    inc(StopCount);
  end
  else
  begin
    StopCount:=0;
//    xwDownload:=True;
  end;
  BtParam.Enabled:=not TbCheck.Eof and (DemoCheckData.runstate=0) and (DemoCheckData.Ready=1);
//  BtStart.Enabled:=not TbCheck.Eof and ((DemoCheckData.runstate=0) or (DemoCheckData.runstate=2)) and (DemoCheckData.Ready=1) and xwDownload;

//////  BtStop.Enabled:=DemoCheckData.runstate<>0;

////  BtPause.Enabled:=DemoCheckData.runstate=1;
////  BtPause.Visible:=BtPause.Enabled;
  BtSelect.Enabled:=BtParam.Enabled;
  BtOther.Enabled:=BtParam.Enabled;
  BtSave.Enabled:=BtParam.Enabled;
  BtReport.Enabled:=BtParam.Enabled and (TbCheck.FieldByName('State').AsInteger=2);
  BtDiagnosis.Enabled:=BtReport.Enabled;

  GetCheckReport(DemoCheckData, checkreport);

  if (DemoCheckData.runstate=0) and (TbCheck.FieldByName('State').AsInteger=1) then
  begin
    EtCursor.Caption:=checkreport.Stimulus;
    EtCount.Caption:=Format('%d/%d', [0, DemoCheckdata.pm.Dot_Number]);
    EtPosCount.Caption:='0/0';
    EtNegCount.Caption:='0/0';
    EtFixation.Caption:='0/0';
    EtTime.Caption:='00:00';
  end
  else
  begin
    EtCursor.Caption:=checkreport.Stimulus;
    //checkreport.Stimulus:=Tr('StimulusSize'+IntToStr(checkdata.pm.Stimulus_Size))+','+Tr('StimulusColor'+IntToStr(checkdata.pm.Stimulus_Color));
    EtCount.Caption:=Format('%d/%d', [DemoCheckdata.count, DemoCheckdata.pm.Dot_Number]);
    //EtCount.Caption:=inttostr(pubhastest)+'/'+inttostr(pripnum);
    //checkreport.False_POS_Errors:=Format('%d/%d', [checkdata.poscount, checkdata.poslength]);
////    EtNegCount.Caption:=checkreport.False_NEG_Errors;
////    EtPosCount.Caption:=checkreport.False_POS_Errors;
    EtNegCount.Caption:=Format('%d/%d', [DemoCheckData.negcount, DemoCheckData.neglength]);
    EtPosCount.Caption:=Format('%d/%d', [DemoCheckData.poscount, DemoCheckData.poslength]);

//  checkreport.False_POS_Errors:=Format('%d/%d', [checkdata.poscount, checkdata.poslength]);
//  checkreport.False_NEG_Errors:=Format('%d/%d', [checkdata.negcount, checkdata.neglength]);

    EtFixation.Caption:=checkreport.Fixation_Losses;
    //checkreport.Fixation_Losses:=Format('%d/%d', [checkdata.fixationcount, checkdata.fixationlength]);
    //EtFixation.Caption:=inttostr(pubPrefer.BAnswer)+'/'+inttostr(pubPrefer.BTest);
    EtTime.Caption:=checkreport.Test_Duration;
    //checkreport.Test_Duration:=Format('%2.2d:%2.2d', [checkdata.testms div 1000 div 60, checkdata.testms div 1000 mod 60]);
  end;

//  bRefresh:=True;

  if MainActivePageIndex=1 then
  begin
    bRefresh:=True;
  end;
  if bRefresh then
  begin
    bRefresh:=False;
    TbCheck.Refresh;
    DrawAxis(ImageRun.canvas, 0, 0, ImageRun.Width, ImageRun.Height, DemoCheckData);
    checkdata:=DemoCheckData;
    if XwData.YkFilter and BtReport.Enabled then checkdata:=YkFilter(checkdata);
    DrawValue(ImageRun.canvas, 0, 0, ImageRun.Width, ImageRun.Height, checkdata, bShowCheckResult);

    cxLabel13.Refresh;
    EtCount.Refresh;
    cxLabel19.Refresh;
    EtTime.Refresh;
    cxLabel7.Refresh;
    EtPupilDiameter.Refresh;
    EtCursor.Refresh;

  end;

  if runstate<>DemoCheckData.runstate then
  begin
    if (runstate=1) and (DemoCheckData.runstate=0) and (DemoCheckData.pm.Dot_Number-DemoCheckData.count<=2) then
    begin
//      FlashWindow(Application.Handle, True);
//      BtSaveClick(Sender);
    end;
    runstate:=DemoCheckData.runstate;
  end;
  bShowCheckResult:=BtReport.Enabled;

  if runstate<>0 then bShowCheckResult:=True;
  {
  if (runstate=2) and ((DemoCheckData.alarm and $01)<>0) and ((alarm and $01)=0) then Tsxx2('Please Check Eye Position');
  if (runstate=2) and ((DemoCheckData.alarm and $02)<>0) and ((alarm and $02)=0) then Tsxx2('Please put down RX');

  if ((DemoCheckData.alarm and $8000)<>0) and ((alarm and $8000)=0) then Tsxx2('Temperature is too High, Please Check Fan');

  if alarm<>DemoCheckData.alarm then
  begin
    alarm:=DemoCheckData.alarm;
  end;
////  BtDemoData.Visible:=XwData.OpRank=3;
}
  Timer.Enabled:=True;

end;

procedure TFRunpic.BtParamClick(Sender: TObject);                         //参数选择
var
  prtmpform:Tform;
begin
////  if DemoCheckData.Ready=0 then exit;
  BtSameClick(Sender);

  if DemoCheckData.devicetype=0 then     //布点
  begin
    FParam:=TFParam.Create(Self);
    FParam.CheckData:=DemoCheckData;
    FParam.EtRange.Enabled:=False;
    FParam.EtLightSpinEdit.Value :=SpinEdit2.Value;

    FParam.EtStimulus_Color.Enabled:=False;
    FParam.EtDot_Number.Enabled:=False;
    FParam.Page.Pages[1].TabVisible:=False;       //没用
    FParam.TbPt.Filter:='Name='''+TbCheck.FieldByName('Pt').AsString+'''';//设置pt.db的筛选为Name='30-2'之类的
    if FParam.ShowModal=mrOK then
    begin
      DemoCheckData.pm:=FParam.CheckData.pm;
      TbCheck.Edit;
      TbCheck.FieldByName('State').AsInteger:=1;
      TbCheck.FieldByName('Strategy').AsString:=Tr('Strategy'+IntToStr(DemoCheckData.pm.Strategy));
      TbCheck.Post;
      if not WriteXwCheckData then ;     //没用了
      if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
        FMain.LightOther(1,0) // 大菱形固视
      else
        FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);

      SpinEdit2.Value := FParam.EtLightSpinEdit.Value;
      sleep(1000);

      pubtestover := false;

      changeparm := true;
      pubblindon := FParam.cxCheckBoxBlind.Checked; //盲测
    end;
    FParam.Free;
  end
  else
                             //投射
  begin
    if DemoCheckData.pm.Strategy>=30 then  //扫描方式
    begin
      FParamCastMove:=TFParamCastMove.Create(Self);
      FParamCastMove.CheckData:=DemoCheckData;
      FParamCastMove.EtRange.Enabled:=False;
      FParamCastMove.EtDot_Number.Enabled:=False;
      FParamCastMove.EtStrategy.Enabled:=False;
      FParamCastMove.Page.Pages[1].TabVisible:=False;
      FParamCastMove.TbPt.Filter:='Name='''+TbCheck.FieldByName('Pt').AsString+'''';
      if FParamCastMove.ShowModal=mrOK then
      begin
        DemoCheckData.pm:=FParamCastMove.CheckData.pm;
        TbCheck.Edit;
        TbCheck.FieldByName('State').AsInteger:=1;
        TbCheck.FieldByName('Strategy').AsString:=Tr('Strategy'+IntToStr(DemoCheckData.pm.Strategy));
        TbCheck.Post;
        if not WriteXwCheckData then ;

        FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);
        sleep(1000);

        if (SaveDataHead.DEVTYPE = $0088) then
        begin

          Panel4.Enabled := false;
          //prtmpform:=mymessagebox('','正在初始化硬件,请稍侯...');
          prtmpform:=mymessagebox('','Please waiting......');
          FMain.LightColorGb; //走光斑和颜色

          prtmpform.free;
          Panel4.Enabled := true;
        end;
        changeparm := true;
        pubblindon := FParamCastMove.cxCheckBoxBlind.Checked;
      end;
      FParamCastMove.Free;
    end
    else
    begin                      //投射点方式
      FParamCast:=TFParamCast.Create(Self);
      FParamCast.CheckData:=DemoCheckData;
      FParamCast.EtRange.Enabled:=False;
      FParamCast.EtLightSpinEdit.Value :=SpinEdit2.Value;

      FParamCast.EtDot_Number.Enabled:=False;
      FParamCast.Page.Pages[1].TabVisible:=False;
      FParamCast.TbPt.Filter:='Name='''+TbCheck.FieldByName('Pt').AsString+'''';
      if FParamCast.ShowModal=mrOK then
      begin
        DemoCheckData.pm:=FParamCast.CheckData.pm;
        TbCheck.Edit;
        TbCheck.FieldByName('State').AsInteger:=1;
        TbCheck.FieldByName('Strategy').AsString:=Tr('Strategy'+IntToStr(DemoCheckData.pm.Strategy));
        TbCheck.Post;
        if not WriteXwCheckData then ;

        if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
          FMain.LightOther(1,0) // 大菱形固视
        else
          FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);

        SpinEdit2.Value := FParamCast.EtLightSpinEdit.Value;
        sleep(1000);

        if (SaveDataHead.DEVTYPE = $0088) then
        begin

          Panel4.Enabled := false;
          //prtmpform:=mymessagebox('','正在初始化硬件,请稍侯...');
          prtmpform:=mymessagebox('','Please waiting......');
          FMain.LightColorGb; //走光斑和颜色

          prtmpform.free;
          Panel4.Enabled := true;
        end;
        changeparm := true;
        pubblindon := FParamCast.cxCheckBoxBlind.Checked;
      end;
      FParamCast.Free;
    end;
  end;

  if changeparm then   //FParam.ShowModal=mrOK后,赋值为true
    pripm := DemoCheckData.pm;

  FMain.ActiveControl:=nil;
  EyeMove:=1;
  Fillchar(DemoCheckData.EyeMoveData, sizeof(DemoCheckData.EyeMoveData), 0);
  priJczt:=0;
end;

procedure TFRunpic.BtSelectClick(Sender: TObject);           //程序选择
var
  i,id:integer;
  s,pt:string;
  checkdata:TCheckData;
  age,eye:integer;
  prtmpform:Tform;
begin
////  if DemoCheckData.Ready=0 then exit;
  BtSameClick(Sender);
  FProgramSelect:=TFProgramSelect.Create(Self);
  if FProgramSelect.ShowModal=mrOK then
  begin
    id:=FProgramSelect.TbPt.FieldByName('Id').AsInteger;
    isEyeMove:=FProgramSelect.TbPt.FieldByName('EyeMove').AsString<>'0';
    s:=GetPtData(id, checkdata, pt);
    checkdata.count:=0;
    OldPId := id;
    XwData.CurPtId := id;

    age:=TbCheck.FieldByName('Age').AsInteger;
    eye:=GetEyeValue(TbCheck.FieldByName('Eye').AsString);
    PrepareCheckData(age, eye, false, checkdata);
    DemoCheckData:=checkdata;
    TbCheck.Edit;                                     //将信息写入病人表
    TbCheck.FieldByName('State').AsInteger:=1;
    TbCheck.FieldByName('Program').AsString:=s;
    TbCheck.FieldByName('Pt').AsString:=pt;
    TbCheck.FieldByName('Strategy').AsString:=Tr('Strategy'+IntToStr(DemoCheckData.pm.Strategy));
    TbCheck.Post;
    if not WriteXwCheckData then;

    if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
      FMain.LightOther(1,0) // 大菱形固视
    else
      FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);
    sleep(1000);

    if (SaveDataHead.DEVTYPE = $0088) then
    begin

      //prtmpform:=mymessagebox('','正在初始化硬件,请稍侯...');
      prtmpform:=mymessagebox('','Please waiting......');
      Panel4.Enabled := false;

      FMain.LightColorGb; //走光斑和颜色

      prtmpform.free;
      Panel4.Enabled := true;
    end;
    xwDownload:=True;
    changeparm := false;
    pubtestover := false;
  end;
  FProgramSelect.Free;
  FMain.ActiveControl:=nil;
  EyeMove:=1;
  Fillchar(DemoCheckData.EyeMoveData, sizeof(DemoCheckData.EyeMoveData), 0);
  priJczt:=0;
end;

procedure TFRunpic.ClearTest;                  //停止按钮调用
var
  i,id:integer;
  s,pt:string;
  checkdata:TCheckData;
  age,eye:integer;
begin
  //  BtSameClick(Sender);
  //  FProgramSelect:=TFProgramSelect.Create(Self);
  //  if FProgramSelect.ShowModal=mrOK then
  begin
    id:=OldPId;
    s:=GetPtData(id, checkdata, pt);
    age:=TbCheck.FieldByName('Age').AsInteger;
    eye:=GetEyeValue(TbCheck.FieldByName('Eye').AsString);
    PrepareCheckData(age, eye, false, checkdata); //取正常值改变CHECKDATA中的PT 和 SV
    DemoCheckData:=checkdata;
    if changeparm then
      DemoCheckData.pm := pripm;
    DemoCheckData.pm.Eye := checkdata.pm.Eye;
      ////    sleep(1000);
    if not WriteXwCheckData then ;
      if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
        FMain.LightOther(1,0) // 大菱形固视
      else
        FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);
    sleep(100);
    xwDownload:=True;
  end;

  //  FProgramSelect.Free;
    FMain.ActiveControl:=nil;
    EyeMove:=1;
    Fillchar(DemoCheckData.EyeMoveData, sizeof(DemoCheckData.EyeMoveData), 0);
    priJczt:=0;
    DemoCheckData.testms := 0;
    DemoCheckData.count := 0;

    DemoCheckData.fixationcount := 0;
    DemoCheckData.fixationlength := 0;
    DemoCheckData.poscount := 0;
    DemoCheckData.poslength := 0;
    DemoCheckData.negcount := 0;
    DemoCheckData.neglength := 0;
  {
    checkreport.Fixation_Losses:=Format('%d/%d', [checkdata.fixationcount, checkdata.fixationlength]);
    checkreport.False_POS_Errors:=Format('%d/%d', [checkdata.poscount, checkdata.poslength]);
    checkreport.False_NEG_Errors:=Format('%d/%d', [checkdata.negcount, checkdata.neglength]);
  }
end;

procedure TFRunpic.BtStartClick(Sender: TObject);    //主要是初始化一部分DemoCheckData数据,另外初始化ftpoint
var
  checkdata:TCheckData;
  aaa,bbb,ccc,i: integer;
begin
  //  priJczt: byte; //0－原始状态，1－已新开始， 2－已暂停，3－复查 应该不会用
  case priJczt of     //检查状态.
    0:  //点START
      begin
        if pubtestover then           //在DelYdqk中测试完之后就赋值true
        begin
          if Xwxx2('Retest,are you sure?')<>IDYES then exit;
          TbCheck.Edit;
          TbCheck.FieldByName('State').AsInteger:=1;
          TbCheck.Post;
        end;

        cxDBLabel8.Style.Font.Color:=clRed;
        FMain.cxLabelTesting.Visible := true;

        repeat
          begin
            Application.ProcessMessages;
          end;
        until (not pubMotoBuzy);

        if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
          FMain.LightOther(1,0) // 小菱形固视 ,ligthother 应该是开启背景灯.
        else
          FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);

        
        if SaveDataHead.DEVTYPE = $8800 then   //布点    没啥用
         begin
           pubgets := false;
           FMain.SnapshotClick(nil); //获取硬件状态

           repeat
             begin
               Application.ProcessMessages;
             end;
           until (not pubgets);
         end;


        ////原有
        if DemoCheckData.Ready=0 then exit;      //没什么用,应该
        DemoCheckData.count:=0;
        DemoCheckData.fixationcount := 0;       //初始化一部分检测信息
        DemoCheckData.fixationlength := 0;
        DemoCheckData.poscount := 0;
        DemoCheckData.poslength := 0;
        DemoCheckData.negcount := 0;
        DemoCheckData.neglength := 0;


        if pubhjgda>DemoCheckData.pm.EB_Light_sv then         //pubhjgda由TFmain::ShowRead赋值,DemoCheckData.pm.EB_Light_sv在Fmain::lightother中赋值
          ///        if DemoCheckData.ambient_light>=1 then
        begin
          if Xwxx2('Ambient Light too Strong')<>IDYES then exit;
        end;


        BtStop.Enabled := true;

        ChinDown:=True;
        ChinUp:=True;

        Pupilwx0:=(Pupilx+Pupilx+Pupildx)/2-Pupilwx;   //Pupil*由this::SampleGrabberBuffer的GetPupil赋值  SampleGrabberBuffer 是控件SampleGrabber的OnBuffer绑定的回调函数,如果没有消息初始值为0
        Pupilwy0:=(Pupily+Pupily+Pupildy)/2-Pupilwy;

        if DemoCheckData.runstate=0 then    //未运行
        begin
          WaitCount:=0;
          DemoCheckData.waitcount := 0;

          EyeMove:=1;
          PupilDiameter:=EtPupilDiameter.Caption;      //界面编辑器显示112
          Fillchar(DemoCheckData.EyeMoveData, sizeof(DemoCheckData.EyeMoveData), 0);  //zeromemory
        end;

        DemoCheckData.runstate:=1;
        //30,周边到中心扫描，31,盲区扫描
        //0.Full Threshold 1.AutoThreshold 2.Fast Threshold 3.Top Threshold
        if DemoCheckData.pm.Strategy>=32 then   //暗区,静点,直线  投射才有需要
        begin
          FMoveXY:=TFMoveXY.Create(Self);
          FMoveXY.CheckData:=DemoCheckData;
          FMoveXY.EtX1.Enabled:=DemoCheckData.pm.Strategy=34;
          FMoveXY.EtY1.Enabled:=FMoveXY.EtX1.Enabled;
          if FMoveXY.ShowModal=mrOK then
          begin
            DemoCheckData.pm:=FMoveXY.CheckData.pm;
            if not WriteXwCheckData then ;

            FMoveXY.Free;
          end
          else
          begin
            FMoveXY.Free;
            exit;
          end;
        end;

        if DemoCheckData.pm.Strategy>=31 then   //盲区,暗区,静点,直线,  投射才有需要
        begin
          CheckMove;
        end;

        DemoCheckData.runstate:=1;            //正在运行
        DemoCheckData.runstate30:=0;          //应该是投射才需要
        ////        if not WriteXwRunstate(checkdata) then ;
        FMain.ActiveControl:=nil;
        ////
        prisftestdot := 0;
        priCenterDot:=false;
        priFxy4 := false;
        priZcyd := true;   //正常应答
        priYdcs := 0;      //应答次数
        //中心点检查Param Setting中打开 Fovea的值就为1
        if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
        begin
          priCenterDot:=true;
          DemoCheckData.pm.Dot_Number := DemoCheckData.pm.Dot_Number+1;
          DemoCheckData.pt[DemoCheckData.pm.Dot_Number].x :=0;
          DemoCheckData.pt[DemoCheckData.pm.Dot_Number].y :=0;//用0，8代替中心点检查
          DemoCheckData.sv[DemoCheckData.pm.Dot_Number] :=35;
        end;

        pripnum := DemoCheckData.pm.Dot_Number;
        //////init afarray

     
        setlength(afarray,pripnum);
        for i:=0 to pripnum-1 do
        begin
          afarray[i] := i;
        end;
        {
          if not ((DemoCheckData.pm.Strategy mod 30>=1) and (DemoCheckData.pm.Strategy mod 30<=2)) then
          for aaa:=0 to pripnum-1 do
          begin
            bbb:=random(pripnum-1);
            ccc:=afarray[aaa];
            afarray[aaa]:=afarray[bbb];
            afarray[bbb]:=ccc
          end;
        }
        /// 加入对ftpoint的赋值
        setlength(ftpoint,pripnum);
        for i:=1 to DemoCheckData.pm.Dot_Number do
        begin
          ftpoint[i-1].x := DemoCheckData.pt[i].x;
          ftpoint[i-1].y := DemoCheckData.pt[i].y;
          ftpoint[i-1].arrtime := 4;

          if (DemoCheckData.pm.Init_Strategy=2) then     //单点刺激所有的都有一个初始值,默认为1
          begin
            //ftpoint[i-1].db := DemoCheckData.sv[DemoCheckData.pm.Init_Value]; //单DB刺激
            ftpoint[i-1].db := DemoCheckData.pm.Init_Value; //单DB扫描
          end
          else
          begin
            if DemoCheckData.pm.Strategy mod 30 <10  then     //逻辑上看是除开10-13这三个方法 
            begin
              ftpoint[i-1].db := DemoCheckData.sv[i];         //标准DB赋值给它
            end
            else
            begin                                             //阈上值
              ftpoint[i-1].db := DemoCheckData.sv[i]-6;
              if ftpoint[i-1].db<0 then
                ftpoint[i-1].db := 0;
            end;
          end;

          ftpoint[i-1].arr := true;
          ftpoint[i-1].isxy4 := false;
          ftpoint[i-1].oren := 0;
          DemoCheckData.v[i] := -1;
          DemoCheckData.sfv[i] := -1;
          DemoCheckData.vcount[i] := 0;
          //扫描程序
          if (DemoCheckData.pm.Strategy>=30) then
          begin
            DemoCheckData.v[i] := -99;
            DemoCheckData.sfv[i] := -99;
          end;
        end;

        pricurp := 0;

        priCenEnd := true;
        //中心点检查
        if priCenterDot then    //priCenterDot 在1026行被赋值false 判定必失败
        begin
          //若其它固视则不用下偏8度2019.9.9改
          if DemoCheckData.pm.Fixation_Mode=0 then  //中心固视
            ftpoint[pripnum-1].y :=-8; //点0，0 用0，8代替中心点检查

          if DemoCheckData.pm.Fixation_Mode=2 then  //底点固视，测中心点时用菱形固视，应上偏移4度
            ftpoint[pripnum-1].y :=4; //点0，0 用0，8代替中心点检查

          ftpoint[pripnum-1].isxy4 := true;  //置当前检查标志
          ftpoint[pripnum-1].arrtime := 4;
          priCenEnd := false;
          priZcyd := false;
          priYdcs := 0;
          pricurp := pripnum-1;
        end
        else
        begin
          if DemoCheckData.pm.Strategy mod 30<10  then  //'筛选检查' 10，11，12
          begin
            Getxy4;                         //获取标定点,并且使pricurp为第一个标定点                         
            priFxy4 := true;
          end;
        end;

        publevel :=1;

        BtStart.Caption := Tr('Pause');
        priJczt := 1;
        {
          frmMdcx := TfrmMdcx.Create(nil);
          frmMdcx.ShowModal;
          frmMdcx.Free;
        }
        prijcsj := 0;
        prihadnum := 0;
        DemoCheckdata.testms := 0;
        prifcnum := 0;
        pubhastest := 0;

        prihadblind := false;
        prihavingblind := false;
        pricurbp := 1;

        if DemoCheckData.pm.Delay_Mode=0 then  //自动模式
        begin
          pubPrefer.breaktime := 1200;
        end
        else
        begin
          pubPrefer.breaktime := DemoCheckData.pm.Delay_Time;
        end;
        pubPrefer.flashtime := DemoCheckData.pm.Hold_Time;

        Old4XY := true;

        if DemoCheckData.pm.Strategy>=30 then
        begin
          //          pricurp := 0;
          BtStart.Enabled := false;
          TWTimerProcMove;    //投射
        end
        else
        begin
          BtStart.Enabled := true;
          TWTimerProc;
        end;
      end;
    1:  //点PAUSE   开始之后prJczt就被赋值为1
      begin
        if DemoCheckData.Ready=0 then exit;
        ChinDown:=True;
        ChinUp:=True;
        DemoCheckData.runstate:=2;
        DemoCheckData.runstate30:=0;
        ////        if not WriteXwRunstate(checkdata) then;
        FMain.ActiveControl:=nil;

        pritesting:=false;
        TimerTestTime.Enabled := false;
        BtStart.Caption := Tr('Resume');
        priJczt := 2;
      end;
    2:  //点resume
      begin
        ////////////
        ChinDown:=True;
        ChinUp:=True;
        BtStart.Caption := Tr('Pause');
        FMain.ActiveControl:=nil;
        DemoCheckData.runstate:=1;
        priJczt := 1;
        if DemoCheckData.pm.Strategy>=30 then
          TWTimerProcMove
        else
          TWTimerProc;
      end;
    3:
      begin
        BtStart.Caption := Tr('Pause');
        priJczt := 1;
        prijclx := 1;
        if DemoCheckData.pm.Strategy>=30 then
          TWTimerProcMove
        else
          TWTimerProc;
      end;
  end;
end;

procedure TFRunpic.Getxy4;   //在BtStartClick是被调用一次,DelYdqk->hasEnded在xy4end为真的时候调用一次  从运行结果看Getxy4一共调用了两次      标记ftpoint (9,3)等对称的4个点,设置其是XY4,并设置其DB 复制pricurp
var
	i,x,y,numberxy4: integer;
  xy4: array[0..3] of integer;
begin
  for i:=0 to 3 do
  begin
    xy4[i] := 1;
  end;

	numberxy4 := 0;


  for i:=0 to DemoCheckData.pm.Dot_Number-1 do           
  begin
		x := ftpoint[i].x;
		y := ftpoint[i].y;
		if (isNearbyXY(x, y, -9, 9, 0)) then
      begin
        xy4[0] := i;           //XY4点的位置
        //      ftpoint[i].isxy4 := true;
        numberxy4 := numberxy4+1;
      end
      else if (isNearbyXY(x, y, 9, 9, 0)) then
      begin
        xy4[1] := i;
        //      ftpoint[i].isxy4 := true;
        numberxy4 := numberxy4+1;
      end
      else if (isNearbyXY(x, y, -9, -9, 0)) then
      begin
        xy4[2] := i;
        //      ftpoint[i].isxy4 := true;
        numberxy4 := numberxy4+1;
      end
      else if (isNearbyXY(x, y, 9, -9, 0)) then
      begin
        //      ftpoint[i].isxy4 := true;
        xy4[3] := i;
        numberxy4 := numberxy4+1;
      end;
    end;
	if (numberxy4=4) then
  begin
    for i:=0 to 3 do
      begin
        ftpoint[xy4[i]].isxy4 := true;
        ftpoint[xy4[i]].db := DemoCheckData.sv[xy4[i]+1]-4;
      end;
      pricurp := xy4[0];
  	exit;
  end;

	numberxy4 := 0;
  for i:=0 to DemoCheckData.pm.Dot_Number-1 do
  begin
		x := ftpoint[i].x;
		y := ftpoint[i].y;
		if (isNearbyXY(x, y, -3, 3, 0)) then
    begin
      xy4[0] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end
		else if (isNearbyXY(x, y, 3, 3, 0)) then
    begin
      xy4[1] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end
		else if (isNearbyXY(x, y, -3, -3, 0)) then
    begin
      xy4[2] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end
		else if (isNearbyXY(x, y, 3, -3, 0)) then
    begin
      xy4[3] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end;
  end;
	if (numberxy4=4) then
  begin
    for i:=0 to 3 do
    begin
      ftpoint[xy4[i]].isxy4 := true;
      ftpoint[xy4[i]].db := DemoCheckData.sv[xy4[i]+1]-4;
    end;
    pricurp := xy4[0];
  	exit;
  end;

	numberxy4 := 0;
  for i:=0 to DemoCheckData.pm.Dot_Number-1 do
  begin
		x := ftpoint[i].x;
		y := ftpoint[i].y;
		if (isNearbyXY(x, y, -30, 30, 0)) then
    begin
      xy4[0] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end
		else if (isNearbyXY(x, y, 30, 30, 0)) then
    begin
      xy4[1] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end
		else if (isNearbyXY(x, y, -30, -30, 0)) then
    begin
      xy4[2] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end
		else if (isNearbyXY(x, y, 30, -30, 0)) then
    begin
      xy4[3] := i;
      //      ftpoint[i].isxy4 := true;
      numberxy4 := numberxy4+1;
    end;
  end;
	if (numberxy4=4) then
  begin
    for i:=0 to 3 do
    begin
      ftpoint[xy4[i]].isxy4 := true;
      ftpoint[xy4[i]].db := DemoCheckData.sv[xy4[i]+1]-4;
    end;
    pricurp := xy4[0];
  	exit;
  end;

	numberxy4 := 0;
  i := NearestXY(-9, 9, 8*8);
  if (i<>-1) then
  begin
    xy4[0] := i-1;
    numberxy4 := numberxy4+1;
  end;
  i := NearestXY(9, 9, 8*8);
  if (i<>-1) then
  begin
    xy4[1] := i-1;
    numberxy4 := numberxy4+1;
  end;
  i := NearestXY(-9, -9, 8*8);
  if (i<>-1) then
  begin
    xy4[2] := i-1;
    numberxy4 := numberxy4+1;
  end;

  i := NearestXY(9, -9, 8*8);
  if (i<>-1) then
  begin
    xy4[3] := i-1;
    numberxy4 := numberxy4+1;
  end;

	if (numberxy4=4) then
  begin
    for i:=0 to 3 do
    begin
      ftpoint[xy4[i]].isxy4 := true;
      ftpoint[xy4[i]].db := DemoCheckData.sv[xy4[i]+1]-4;
    end;
  	exit;
  end;

	numberxy4 := 0;
  i := NearestXY(-30, 30, 29*29);
  if (i<>-1) then
  begin
    xy4[0] := i-1;
    numberxy4 := numberxy4+1;
  end;
  i := NearestXY(30, 30, 29*29);
  if (i<>-1) then
  begin
    xy4[1] := i-1;
    numberxy4 := numberxy4+1;
  end;
  i := NearestXY(-30, -30, 29*29);
  if (i<>-1) then
  begin
    xy4[2] := i-1;
    numberxy4 := numberxy4+1;
  end;

  i := NearestXY(30, -30, 29*29);
  if (i<>-1) then
  begin
    xy4[3] := i-1;
    numberxy4 := numberxy4+1;
  end;

	if (numberxy4=4) then
  begin
    for i:=0 to 3 do
    begin
      ftpoint[xy4[i]].isxy4 := true;
      ftpoint[xy4[i]].db := DemoCheckData.sv[xy4[i]+1]-4;
    end;
    pricurp := xy4[0];
  	exit;
  end;

	numberxy4 := 0;
  i := NearestXY(-30, 30, 29*29);
  if (i<>-1) then
  begin
    xy4[0] := i-1;
    numberxy4 := numberxy4+1;
  end;
  i := NearestXY(30, 30, 29*29);
  if (i<>-1) then
  begin
    xy4[1] := i-1;
    numberxy4 := numberxy4+1;
  end;

	if (numberxy4=2) then
  begin
    for i:=0 to 1 do
    begin
      ftpoint[xy4[i]].isxy4 := true;
      ftpoint[xy4[i]].db := DemoCheckData.sv[xy4[i]+1]-4;
    end;
    pricurp := xy4[0];
  	exit;
  end;
end;

procedure TFRunpic.BtPauseClick(Sender: TObject);
var
  checkdata:TCheckData;
begin
  begin
    if DemoCheckData.Ready=0 then exit;
    ChinDown:=True;
    ChinUp:=True;
    DemoCheckData.runstate:=2;
    DemoCheckData.runstate30:=0;
    ////        if not WriteXwRunstate(checkdata) then;
    FMain.ActiveControl:=nil;

    pritesting:=false;
    TimerTestTime.Enabled := false;
    BtStart.Caption := Tr('Resume');
    priJczt := 2;
  end;
  {
    if DemoCheckData.Ready=0 then exit;
    ChinDown:=True;
    ChinUp:=True;
    checkdata.runstate:=2;
    checkdata.runstate30:=0;
      ////  if not WriteXwRunstate(checkdata) then;
    FMain.ActiveControl:=nil;
  }
end;

procedure TFRunpic.BtStopClick(Sender: TObject);
var
  checkdata:TCheckData;
  prtmpform:Tform;
begin
  if DemoCheckData.Ready=0 then exit;
  TimerTestTime.Enabled := false;
  DemoCheckData.runstate:=0;
  DemoCheckData.runstate30:=0;
  if not WriteXwRunstate(checkdata) then;

  pritesting:=false;

  BtStop.Enabled := false;
  BtStart.Enabled := false;

  ClearTest;

  FMain.ResetMotor0; //复位

  ////
  priJczt := 0;
  BtStart.Caption := Tr('Start');
  FMain.cxLabelTesting.Visible := false;
  cxDBLabel8.Style.Font.Color:=clMoneyGreen;
  ////


  runstate:=0;
  BtStart.Enabled := true;
  FMain.ActiveControl:=nil;
  EyeMove:=1;
  Fillchar(DemoCheckData.EyeMoveData, sizeof(DemoCheckData.EyeMoveData), 0);
  FMain.ActiveControl:=nil;
  pritesting:=false;
end;

procedure TFRunpic.BtSaveClick(Sender: TObject);
var
  s:string;
begin
//  if Sender<>nil then if Xwxx2('Save')<>IDYES then exit;
  BtStop.Enabled := false;
  if Sender<>nil then
  {
  if Xwxx2('Save')<>IDYES then
  begin
    priJczt := 0;
    BtStart.Caption := Tr('Start');
    FMain.ActiveControl:=nil;
  end
  else
  }
  begin
    priJczt := 0;
    BtStart.Caption := Tr('Start');

    pubtestover := true;

    TbCheck.Edit;
    TbCheck.FieldByName('State').AsInteger:=2;
    SetLength(s, sizeof(DemoCheckData));
    Move(DemoCheckData, s[1], Length(s));
    TbCheck.FieldByName('Checkdata').AsString:=s;
    TbCheck.FieldByName('Date').AsString:=DateToStr(now);
    TbCheck.FieldByName('Time').AsString:=TimeToStr(now);
    TbCheck.FieldByName('Stimulus_Color').AsInteger:=DemoCheckData.pm.Stimulus_Color;
    TbCheck.FieldByName('Stimulus_Size').AsInteger:=DemoCheckData.pm.Stimulus_Size;
    TbCheck.FieldByName('Stimulus').AsString:=Tr('StimulusSize'+IntToStr(DemoCheckdata.pm.Stimulus_Size))+','+Tr('StimulusColor'+IntToStr(DemoCheckdata.pm.Stimulus_Color));
    if (XwData.EyeMove) and (PupilDiameter<>'0.0') then
    begin
      TbCheck.FieldByName('Pupil0').AsString:=PupilDiameter;
      TbCheck.FieldByName('Pupil1').AsString:=PupilDiameter;
    end;
    TbCheck.Post;
    FMain.ActiveControl:=nil;
  end;
  BtStart.Enabled := true;
end;

procedure TFRunpic.BtOtherClick(Sender: TObject);
var
  age,eye:integer;
  id:string;
  prtmpform:Tform;
begin
  if DemoCheckData.Ready=0 then exit;
  if Xwxx2(BtOther.Caption)<>IDYES then exit;
  if TbCheck.FieldByName('State').AsInteger=2 then
  begin
    id:=TbCheck.FieldByName('ID').AsString;
    ClearCheckState1;
    CopyCheckRecord(id, 1);
    TbCheck.Refresh;
  end
  else
  begin
    TbCheck.Edit;
    eye:=GetEyeValue(TbCheck.FieldByName('Eye').AsString);
    if eye=0 then eye:=1 else eye:=0;
    TbCheck.FieldByName('Eye').AsString:=Tr('Eye'+IntToStr(eye));
    TbCheck.Post;
  end;
  age:=TbCheck.FieldByName('Age').AsInteger;
  eye:=GetEyeValue(TbCheck.FieldByName('Eye').AsString);
  PrepareCheckData(age, eye, true, DemoCheckdata);
  WriteXwCheckData;

  ClearTest;

  if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
    FMain.LightOther(1,0) // 大菱形固视
  else
    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);

  FMain.ActiveControl:=nil;
  EyeMove:=1;
  Fillchar(DemoCheckData.EyeMoveData, sizeof(DemoCheckData.EyeMoveData), 0);
  priJczt:=0;
{
  if (SaveDataHead.DEVTYPE = $0088) then
  begin

    Panel4.Enabled := false;
    //prtmpform:=mymessagebox('','正在初始化硬件,请稍侯...');
    prtmpform:=mymessagebox('','Please waiting......');
    FMain.LightColorGb; //走光斑和颜色

    prtmpform.free;
    Panel4.Enabled := true;
  end;
 }
end;

procedure TFRunpic.TbCheckAfterPost(DataSet: TDataSet);
begin
  TbCheck.FlushBuffers;
end;

procedure TFRunpic.BtUpMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if pubMoveTestSend then
      exit;
    Fillchar(Server2Lower, sizeof(Server2Lower), 0);
    Server2Lower.gillcon:=$c2;
    Server2Lower.gillup:=$ff;
//    Server2Lower.lowerstatus:=$c5;
//    Server2Lower.lowerbuzy:=$ff;

    Server2Lower.lowerstatus:=$00;
    Server2Lower.lowerbuzy:=$00;

    Server2Lower.head[1]:=$bb;
    Server2Lower.head[2]:=$0c;
    Server2Lower.head[3]:=$dd;

    Server2Lower.ending[1]:=$0e;
    Server2Lower.ending[2]:=$0f;
    FMain.Write2Device;

    ChinDown:=True;
end;

procedure TFRunpic.BtUpMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if pubMoveTestSend then
      exit;
    Fillchar(Server2Lower, sizeof(Server2Lower), 0);
    Server2Lower.gillcon:=$c2;
    Server2Lower.gillup:=$00;
    Server2Lower.gilldown:=$00;
    Server2Lower.gillleft:=$00;
    Server2Lower.gillright:=$00;
//    Server2Lower.lowerstatus:=$c5;
//    Server2Lower.lowerbuzy:=$ff;
    Server2Lower.lowerstatus:=$00;
    Server2Lower.lowerbuzy:=$00;

    Server2Lower.head[1]:=$bb;
    Server2Lower.head[2]:=$0c;
    Server2Lower.head[3]:=$dd;

    Server2Lower.ending[1]:=$0e;
    Server2Lower.ending[2]:=$0f;
    FMain.Write2Device;

    ChinUp:=True;
end;

procedure TFRunpic.BtDnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if pubMoveTestSend then
      exit;

  Fillchar(Server2Lower, sizeof(Server2Lower), 0);
  Server2Lower.gillcon:=$c2;
  Server2Lower.gilldown:=$ff;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;
  FMain.Write2Device;

  ChinDown:=True;
end;

procedure TFRunpic.BtDnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: byte;
begin
    if pubMoveTestSend then
      exit;

    Fillchar(Server2Lower, sizeof(Server2Lower), 0);
    Server2Lower.gillcon:=$c2;
    Server2Lower.gilldown:=$00;

    Server2Lower.head[1]:=$bb;
    Server2Lower.head[2]:=$0c;
    Server2Lower.head[3]:=$dd;

    Server2Lower.ending[1]:=$0e;
    Server2Lower.ending[2]:=$0f;
    FMain.Write2Device;

    ChinUp:=True;
end;

procedure TFRunpic.BtLeftMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if pubMoveTestSend then
      exit;

  Fillchar(Server2Lower, sizeof(Server2Lower), 0);
  Server2Lower.gillcon:=$c2;
  Server2Lower.gillleft:=$ff;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;
  FMain.Write2Device;

  ChinDown:=True;
end;

procedure TFRunpic.BtLeftMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: byte;
begin
    if pubMoveTestSend then
      exit;

    Fillchar(Server2Lower, sizeof(Server2Lower), 0);
    Server2Lower.gillcon:=$c2;
    Server2Lower.gillleft:=$00;

    Server2Lower.head[1]:=$bb;
    Server2Lower.head[2]:=$0c;
    Server2Lower.head[3]:=$dd;

    Server2Lower.ending[1]:=$0e;
    Server2Lower.ending[2]:=$0f;
    FMain.Write2Device;

    ChinUp:=True;
end;

procedure TFRunpic.BtRightMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    if pubMoveTestSend then
      exit;

  Fillchar(Server2Lower, sizeof(Server2Lower), 0);
  Server2Lower.gillcon:=$c2;
  Server2Lower.gillright:=$ff;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;
  FMain.Write2Device;

  ChinDown:=True;
end;

procedure TFRunpic.BtRightMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: byte;
begin
    if pubMoveTestSend then
      exit;
      {
    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMoveTestSend);
       }
    Fillchar(Server2Lower, sizeof(Server2Lower), 0);
    Server2Lower.gillcon:=$c2;
    Server2Lower.gillright:=$00;

    Server2Lower.head[1]:=$bb;
    Server2Lower.head[2]:=$0c;
    Server2Lower.head[3]:=$dd;

    Server2Lower.ending[1]:=$0e;
    Server2Lower.ending[2]:=$0f;
    FMain.Write2Device;

    ChinUp:=True;

end;

procedure TFRunpic.BtDiagnosisClick(Sender: TObject);
begin
  BtReportClick(Sender);
//  FMain.PcMain.ActivePageIndex:=0;
  FDiagnosis:=TFDiagnosis.Create(Self);
  FDiagnosis.Left:=Screen.Width-FDiagnosis.Width;
  FDiagnosis.Top:=Screen.Height-FDiagnosis.Height;
  FDiagnosis.EtDiagnosis.Text:=TbCheck.FieldByName('Describe').AsString;
  if FDiagnosis.ShowModal=mrOk then
  begin
    TbCheck.Edit;
    TbCheck.FieldByName('Describe').AsString:=FDiagnosis.EtDiagnosis.Text;
    TbCheck.Post;
  end;
  FDiagnosis.Free;
//  FMain.PcMain.ActivePageIndex:=1;
  FMain.ActiveControl:=nil;
end;

procedure TFRunpic.BtReportClick(Sender: TObject);
begin
  FMain.FHome1.TbCheck2.Filter:='ID='+TbCheck.FieldByName('ID').AsString;
  FMain.FHome1.PrepareReport(FMain.FHome1.TbCheck2.Filter);
end;

procedure TFRunpic.BtSameClick(Sender: TObject);
var
  id:string;
begin
  if TbCheck.FieldByName('State').AsInteger=2 then
  begin
    if Xwxx2('Use Other Param or Program to Check')<>IDYES then exit;
    id:=TbCheck.FieldByName('ID').AsString;
    ClearCheckState1;
    CopyCheckRecord(id, 1, false);
    TbCheck.Refresh;
  end;
end;

procedure TFRunpic.InitCamere;
var
  i,j,si,sj:integer;
  SysDev: TSysDevEnum;
  PinList: TPinList;
  VideoMediaTypes:TEnumMediaType;
  s:string;
begin
  si:=0;
  sj:=0;
//  LbCamere.Items.Clear;
  SysDev:= TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  VideoMediaTypes := TEnumMediaType.Create;
  if SysDev.CountFilters > 0 then
  begin
    for i := 0 to SysDev.CountFilters - 1 do
    begin
      s:=SysDev.Filters[i].FriendlyName;
      if (Pos('2820', s)>0) or (Pos('2860', s)>0) then
      begin
        si:=i;
        sj:=0;
      end;
//      LbCamere.Items.Add(s);
      SysDev.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
      FilterGraph.ClearGraph;
      FilterGraph.Active := false;
      Filter.BaseFilter.Moniker := SysDev.GetMoniker(i);
      FilterGraph.Active := true;
      PinList := TPinList.Create(Filter as IBaseFilter);
      VideoMediaTypes.Assign(PinList.First);
      for j := 0 to VideoMediaTypes.Count - 1 do
      begin
        s:=VideoMediaTypes.MediaDescription[j];
        if (Pos('YUY2 320X240, 16 bits', s)>0) and (i=si) and (sj=0) then sj:=j;
//        LbCamere.Items.Add(' '+s);
      end;
      PinList.Free;
    end;

    FilterGraph.ClearGraph;
    FilterGraph.Active := false;
    Filter.BaseFilter.Moniker := SysDev.GetMoniker(si);
    FilterGraph.Active := true;

    PinList := TPinList.Create(Filter as IBaseFilter);
    VideoMediaTypes.Assign(PinList.First);
    (PinList.First as IAMStreamConfig).SetFormat(VideoMediaTypes.Items[sj].AMMediaType^);
    PinList.Free;

    (FilterGraph as ICaptureGraphBuilder2).RenderStream(@PIN_CATEGORY_PREVIEW, nil, Filter as IBaseFilter, SampleGrabber as IBaseFilter, VideoWindow as IbaseFilter);
    FilterGraph.Play;
  end;
  SysDev.Free;
  VideoMediaTypes.Free;
  CamereI:=si;
  CamereJ:=sj;

end;

procedure TFRunpic.DoneCamere;
begin
  FilterGraph.ClearGraph;
  FilterGraph.Active := false;
end;

procedure TFRunpic.BtCamereClick(Sender: TObject);
begin
  FilterGraph.ClearGraph;
  FilterGraph.Active := false;

  Fillchar(Server2Lower, sizeof(Server2Lower), 0);
  Server2Lower.cameracon:=$c3;
  Server2Lower.cameraonoff:=$ff;
  Server2Lower.lowerstatus:=$c5;
  Server2Lower.lowerbuzy:=$ff;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;

  FMain.Write2Device;

  sleep(2000);

  InitCamere;
  FMain.ActiveControl:=nil;
end;

procedure TFRunpic.RecordEyeMove;
var
  jd,diameter:double;
begin
//  EtAutoPupil.Visible:=XwData.EyeMove and ((DemoCheckData.alarm and $04)<>0);
////  EtAutoPupil.Visible:=XwData.EyeMove;
  cxLabel7.Visible:=XwData.EyeMove;
  EtEyeMoveAlarm.Visible:=XwData.EyeMove and (DemoCheckData.pm.Fixation_Monitor=1);
  EtPupilDiameter.Visible:=XwData.EyeMove;
  ImageEyeMove.Visible:=XwData.EyeMove;

  if XwData.EyeMove then
  begin
//    PaChin.Height:=125;
//    PaPupil.Height:=155;
  end
  else
  begin
//    PaChin.Height:=85;
//    PaPupil.Height:=130;
    exit;
  end;
{
  if ChinUp or ChinDown then
  begin
    Pupilwx0:=(Pupilx+Pupilx+Pupildx)/2-Pupilwx;
    Pupilwy0:=(Pupily+Pupily+Pupildy)/2-Pupilwy;
  end;

  if ChinUp then
  begin
    if ChinDown then
      ChinDown:=False
    else
      ChinUp:=False;
  end;
 }
  jd:=Abs(PupilD);
  diameter:=Pupildx*0.171875;
  EyeMoveAlarm:=((jd>=5) or (Pupilok<>1)) and (DemoCheckData.pm.Alarm_Mode>=1);
//  if (DemoCheckData.alarm and $10)<>0 then jd:=-jd; 测其他点？
  if FMain.prieyemoveo then jd:=-jd;
  if Pupilok<>1 then jd:=-3;

  if not EyeMoveAlarm then EyeMoveAlarmAck:=False;
//  EtEyeMoveAlarm.Visible:=EyeMoveAlarm ;
  EtEyeMoveAlarm.Visible:=XwData.EyeMove and (DemoCheckData.pm.Fixation_Monitor=1);

  if DemoCheckData.runstate<>2 then
  begin
    EyeMoveAlarmPause:=false;
  end
  else if EyeMoveAlarmPause and not EyeMoveAlarm then
  begin
    BtStartClick(Self);
    EyeMoveAlarmPause:=False;
    Sleep(1000);
  end;

  if DemoCheckData.runstate=0 then EtPupilDiameter.Caption:=Format('%0.1f', [diameter]);
//  EtPupilDiameter.Caption:=Format('%0.1f', [diameter]);
  DrawEyeMove(ImageEyeMove.Canvas, 0, 0, ImageEyeMove.Width, ImageEyeMove.Height, DemoCheckData);

  if DemoCheckData.runstate=1 then
  begin
    if WaitCount<>DemoCheckData.waitcount then
    begin
      WaitCount:=DemoCheckData.waitcount;
      if EyeMove<1 then EyeMove:=1;
      if EyeMove>600 then EyeMove:=600;
      if isEyeMove then DemoCheckData.EyeMoveData[EyeMove]:=Round(jd);
      inc(EyeMove);
    end;

    if EyeMoveAlarm and (DemoCheckData.pm.Alarm_Mode=2) and not EyeMoveAlarmPause and isEyeMove then
    begin
      BtPauseClick(Self);
      ChinDown:=False;
      ChinUp:=False;
      EyeMoveAlarmPause:=True;
      Sleep(1000);
    end;
  end;
end;

procedure TFRunpic.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
begin
  LaCamere.Caption:=Format('BufferLen=%d(%d,%d)', [BufferLen, CamereI, CamereJ]);

  SetLength(Bmpbuf, BmpSize);
  SetLength(Bmpdata, BmpSize);
  MyMove(pBuffer, PByte(@Bmpbuf[1]), Bmpsize);
  MyMove(pBuffer, PByte(@Bmpdata[1]), Bmpsize);
  GetPupil;

////  Label3.Caption := inttostr(GetoldId(PCenH.Left,PCenW.Top,5));

{
  if CheckBox1.Checked then
  begin
    Memo1.Lines.Add('vok:'+inttostr(Pupilok)+' ld:'+inttostr(round(PupilD))+' x0:'+floattostr(Pupilwx0)+' y0:'+inttostr(round(Pupilwy0)));
//    Memo1.Lines.Add('vok:'+inttostr(Pupilok)+' x0:'+inttostr(round(Pupilwx0))+' y0:'+inttostr(round(Pupilwy0)));
    if memo1.Lines.Count>100 then
      memo1.Lines.Clear;
  end;
}  
  {
        Pupilx:=trunc(vx);
      Pupily:=trunc(vy);
      Pupildx:=trunc(vdx);
      Pupildy:=trunc(vdy);
      Pupilwx:=trunc(vwx);
      Pupilwy:=trunc(vwy);
      PupilD:=GetEyeMove(Pupilx, Pupily, Pupildx, Pupildy, Pupilwx, Pupilwy);
      vok:=1.0;
   }
end;

function TFRunpic.GetoldId(x,y,myw:integer): integer;
var
  i,j,r,g,b,rgb,maxrgb: integer;
  myresult: Cardinal;
  mydot,myid,myresult1: integer;
  myi:integer;
begin
  myresult := 0;
  maxrgb := 0;
  mydot := 0;
  for i:=-1*myw to myw do
  for j:=-1*myw to myw do
  begin
    myi := 1+(y+j)*320*3+(x+i)*3;

    r := Byte(BmpData[myi+0]);
    g := Byte(BmpData[myi+1]);
    b := Byte(BmpData[myi+2]);
    rgb := Round(r * 0.3 + g * 0.59 + b * 0.11);
//      c:=((R*299)+(G*587)+(B*114)) div 1000;
    if rgb<=100 then
    begin
      myresult:=myresult+rgb;
      mydot := mydot+1;
    end;
  end;

  if mydot>0 then
  begin
    myid := round(myresult/mydot);
    myresult1 := myid;
  end
  else
  begin
    myresult1 := 0;
  end;
  result := myresult1;
end;

procedure TFRunpic.TimerFastTimer(Sender: TObject);
begin
  PCenW.BringToFront;
  PCenH.BringToFront;
//  PCenWR.BringToFront;
//  PCenHB.BringToFront;
  PLTW.BringToFront;
  PLTH.BringToFront;
  PLBW.BringToFront;
  PLBH.BringToFront;
  PRTW.BringToFront;
  PRTH.BringToFront;
  PRBW.BringToFront;
  PRBH.BringToFront;

  ///
  if (patientNumber <> TbCheck.FieldByName('Number').AsString)
    or (patientName <> TbCheck.FieldByName('Name').AsString)
    or (patientSex <> TbCheck.FieldByName('Sex').AsString)
    or (patientAge <> TbCheck.FieldByName('Age').AsString) then
  begin
    patientNumber := TbCheck.FieldByName('Number').AsString;
    patientName := TbCheck.FieldByName('Name').AsString;
    patientSex := TbCheck.FieldByName('Sex').AsString;
    patientAge := TbCheck.FieldByName('Age').AsString;
    //FMain.LabelPatient.Caption:=Format('Number:%s   Name:%s   Sex:%s   Age:%s', [patientNumber, patientName, patientSex, patientAge]);
    FMain.LabelPatient.Caption:=Format(' %s: %s   %s: %s   %s: %s', [Tr('Name'),patientName,Tr('Sex'), patientSex, Tr('Age'), patientAge]);
  end;


  //if EtAutoPupil.Checked and EtAutoPupil.Visible then AutoPupil;
  if EtAutoPupil.Checked then AutoPupil;

//  if XwData.oprank=3 then if Pupilok=1 then MessageBeep(1);
//  if Pupilok=1 then MessageBeep(1);
end;

procedure TFRunpic.BtDemoDataClick(Sender: TObject);
var
  s,s2:string;
  i,n:integer;
  sL:TStrings;
begin
  if not OpenDialog.Execute then exit;
  s:=ReadFileToString(OpenDialog.FileName);
  sL:=TStringList.Create;
  sL.Text:=s;
  n:=1;
  for i:=0 to sL.Count-1 do begin
    s:=Trim(sL.Strings[i]);
    if Pos('E', UpperCase(s))>0 then break;
    while s<>'' do
    begin
      s2:=Trim(CopySubStrDelta(s));
      if s2='' then break;
      DemoCheckData.v[n]:=StrToInt(s2);
      inc(n);
    end;
  end;
  sL.Free;
  for i:=1 to DemoCheckData.pm.Dot_Number do
  begin
    DemoCheckData.sfv[i]:=-1;
  end;
  DemoCheckData.count:=DemoCheckData.pm.Dot_Number;
  BtSaveClick(nil);
end;

procedure TFRunpic.EtAutoPupilClick(Sender: TObject);
begin
  FMain.ActiveControl:=nil;
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

    FMain.Write2Device;
end;

procedure TFRunpic.DelYdqkMove;            //TWTimerProcMove
var
  i,aj: integer;
begin
  if pubmoveanswer then
  begin
    ftpoint[afarray[pricurp]].arr := False;
    if (DemoCheckData.pm.Strategy=30) then
    begin
        DemoCheckData.v[pricurp+1] := pubanswerxy.X;
        DemoCheckData.sfv[pricurp+1] := pubanswerxy.Y;
//      DemoCheckData.v[pricurp+1] := round(ftpoint[afarray[pricurp]].x+(DemoCheckData.pm.MoveX0-ftpoint[afarray[pricurp]].x)*pubmovebackx/(abs(pubmovexstep)+0.001));  //x
//      DemoCheckData.sfv[pricurp+1] := round(ftpoint[afarray[pricurp]].y+(DemoCheckData.pm.MoveY0-ftpoint[afarray[pricurp]].y)*pubmovebacky/(abs(pubmoveystep)+0.001));  //y
    end
    else
    begin
        DemoCheckData.v[pricurp+1] := pubanswerxy.X;
        DemoCheckData.sfv[pricurp+1] := pubanswerxy.Y;
//      DemoCheckData.v[pricurp+1] := round(DemoCheckData.pm.MoveX0+(ftpoint[afarray[pricurp]].x-DemoCheckData.pm.MoveX0)*pubmovebackx/(abs(pubmovexstep)+0.001));  //x
//      DemoCheckData.sfv[pricurp+1] := round(DemoCheckData.pm.MoveY0+(ftpoint[afarray[pricurp]].y-DemoCheckData.pm.MoveY0)*pubmovebacky/(abs(pubmoveystep)+0.001));  //y
    end;

//    DemoCheckData.sfv[pricurp+1] := ftpoint[afarray[pricurp]].db;
{
        Old5MotorStep[4] := pubmovexfx*pubmovebackx;
        Old5MotorStep[5] := pubmoveyfx*pubmovebacky;
        FMain.memo2.Lines.Add('应答x:'+inttostr(Old5MotorStep[4])+'应答y:'+inttostr(Old5MotorStep[5]));
 }
{
        //处理实际走步 到位置记忆中
        Old5MotorStep[1] := Old5MotorStep[1]+pubmovebackjj;
        Old5MotorStep[4] := Old5MotorStep[4]+pubmovexfx*pubmovebackx;
        Old5MotorStep[5] := Old5MotorStep[5]+pubmoveyfx*pubmovebacky;

        FMain.memo2.Lines.Add('应答x:'+inttostr(Old5MotorStep[4])+'应答y:'+inttostr(Old5MotorStep[5]));
 }
  end
  else
  begin
    ftpoint[afarray[pricurp]].arr := False;

    if (DemoCheckData.pm.Strategy=30) then
    begin
      DemoCheckData.v[pricurp+1] := DemoCheckData.pm.MoveX0;  //x
      DemoCheckData.sfv[pricurp+1] := DemoCheckData.pm.MoveY0;  //y
    end
    else if ((DemoCheckData.pm.Strategy>=31) and (DemoCheckData.pm.Strategy<=34)) then
    begin
      DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].x;  //x
      DemoCheckData.sfv[pricurp+1] := ftpoint[afarray[pricurp]].y;  //y
    end;

    pubmovebackx := pubmovexstep;
    pubmovebacky := pubmoveystep;
    pubmovebackjj := pubmovejjstep;  //走完的焦距变步

    //处理实际走步 到位置记忆中
    Old5MotorStep[1] := Old5MotorStep[1]+pubmovebackjj;
    Old5MotorStep[4] := Old5MotorStep[4]+pubmovebackx;
    Old5MotorStep[5] := Old5MotorStep[5]+pubmovebacky;
  end;

//  pubmoveend := false;
//  pubmoveanswer := false;

  if HasEndedmove(ftpoint) then
  begin
    DemoCheckdata.count := pubhastest;
    pritesting:=false;
    TimerTestTime.Enabled := false;
    DemoCheckData.runstate:=0;

    Panel4.Enabled := false;
    sleep(1000);
    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,2); //关闭背景灯 5s   2为关闭背景光
    sleep(1000);
    FMain.ResetMotor0; //复位
    sleep(3000);
    priCloseBj := true;
    priCloseCount := 0;

    FlashWindow(Application.Handle, True);
    FMain.cxLabelTesting.Visible := false;
    cxDBLabel8.Style.Font.Color:=clMoneyGreen;
    BtSaveClick(BtSave);
///    BtStopClick(nil);
    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);
    Panel4.Enabled := true;
    exit;
  end
  else
  begin
    pricurp := skippointmove(ftpoint,pricurp);
  end;
end;

procedure TFRunpic.DelYdqk;
var
  i,aj: integer;
begin
  if pubkey then
    fmain.memo2.Lines.Add('X='+inttostr(ftpoint[afarray[pricurp]].x)+' Y='+inttostr(ftpoint[afarray[pricurp]].Y)+'  应答了')
  else
    fmain.memo2.Lines.Add('X='+inttostr(ftpoint[afarray[pricurp]].x)+' Y='+inttostr(ftpoint[afarray[pricurp]].Y)+'  未应答');

  case prijclx of
    0: ///正常跳转
    begin
      if pubkey then    //已经应答
      begin
        if priZcyd and (not priCenterDot) then
        begin
          priYdcs := priYdcs+1;   //应答次数
        end;

        pubkey := false;
        //pubKmOpen := false;
        ////////////筛选检测
        if (DemoCheckData.pm.Strategy mod 30 >=10) then  //'筛选检查'
        begin
          if DemoCheckData.pm.Strategy mod 30 =10  then  //一级筛选
          begin
            case pritrioren of
              0: //初态
              begin
                ftpoint[afarray[pricurp]].db := 1;
                DemoCheckData.v[pricurp+1] := 1;
                ftpoint[afarray[pricurp]].oren := 0;
                ftpoint[afarray[pricurp]].arr := false;
              end;
            end;
          end
          else
          if DemoCheckData.pm.Strategy mod 30 =11  then  //二级筛选
          begin
            case pritrioren of
              0: //初态  ,应答直接结束，正常
              begin
                ftpoint[afarray[pricurp]].db := 1;
                DemoCheckData.v[pricurp+1] := 1;
                ftpoint[afarray[pricurp]].oren := 1;
                ftpoint[afarray[pricurp]].arr := False;
              end;
              1: //两次看见，不会出现
              begin
                ftpoint[afarray[pricurp]].db := 1;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 1;
              end;
              3: //看不见－－看见 ，相对缺省
              begin
                ftpoint[afarray[pricurp]].db := 0;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 0;
              end;
            end;
          end
          else
          if DemoCheckData.pm.Strategy mod 30 =12  then  //量化
          begin
            case pritrioren of
              0: //初态  ,应答直接结束
              begin
                ftpoint[afarray[pricurp]].db := 98;
                DemoCheckData.v[pricurp+1] := 98;
                ftpoint[afarray[pricurp]].oren := 1;
                ftpoint[afarray[pricurp]].arr := False;
              end;
              3:
              begin
                ftpoint[afarray[pricurp]].oren := 7;
                ftpoint[afarray[pricurp]].arr := true;
              end;
              7:  ////////////处理阈值检查之快速法
              begin
                ftpoint[afarray[pricurp]].db := pricurdb;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := pricurdb;
              end;
            end;
          end
          else
          begin
            case pritrioren of
              0: //初态  ,应答直接结束，正常
              begin
                ftpoint[afarray[pricurp]].db := 1;
                DemoCheckData.v[pricurp+1] := 1;
                ftpoint[afarray[pricurp]].oren := 1;
                ftpoint[afarray[pricurp]].arr := False;
              end;
              1: //两次看见，不会出现
              begin
                ftpoint[afarray[pricurp]].db := 1;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 1;
              end;
              3: //看不见－－看见 ，相对缺省
              begin
                ftpoint[afarray[pricurp]].db := 0;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 0;
              end;
            end;
          end;
        end
        else
        begin
          case pritrioren of
            0:
            begin
              ftpoint[afarray[pricurp]].oren := 2;
              ///都用全域值测试
              if not Old4XY then       
              begin
                {
                  if DemoCheckData.pm.Strategy mod 30=2  then  //快速智能
                  begin
                    if ftpoint[afarray[pricurp]].db>DemoCheckData.sv[pricurp+1]-1 then
                    begin
                      ftpoint[afarray[pricurp]].arr := False;
                      DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db;// pricurdb;
                      if GetNearDB(pricurp,ftpoint)>ftpoint[afarray[pricurp]].db then
                        DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+1;// pricurdb;
                    end;
                  end;
                }
                //若在5圈，应答并在正常内，结束
                if DemoCheckData.pm.Strategy mod 30=2  then  //快速智能
                if GetQZ(ftpoint[afarray[pricurp]].x,ftpoint[afarray[pricurp]].y)>=5 then //第五圈直接赋值
                begin
                  if ftpoint[afarray[pricurp]].db>DemoCheckData.sv[pricurp+1]-4 then
                  begin
                    ftpoint[afarray[pricurp]].arr := False;
                    DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+1;     // 对点DB赋值
                    if GetNearDB(pricurp,ftpoint)>ftpoint[afarray[pricurp]].db then
                    DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+2;     // 对点DB赋值
                  end;
                end;
              end;
            end;
            2:
            begin
              ftpoint[afarray[pricurp]].oren := 2;
              if not Old4XY then  
              begin
                {
                  if DemoCheckData.pm.Strategy mod 
                  30=2  then  //快速智能
                  begin
                    if ftpoint[afarray[pricurp]].db>DemoCheckData.sv[pricurp+1]-1 then
                    begin
                      ftpoint[afarray[pricurp]].arr := False;
                      DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
                      if GetNearDB(pricurp,ftpoint)>ftpoint[afarray[pricurp]].db then
                        DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+1;// pricurdb;
                    end;
                  end;
                }
                //若在5圈，应答并在正常内，结束
                if (ftpoint[afarray[pricurp]].arrtime=2) or ((DemoCheckData.pm.Strategy mod 30=2) and (GetQZ(ftpoint[afarray[pricurp]].x,ftpoint[afarray[pricurp]].y)>=5)) then
                begin
                  if ftpoint[afarray[pricurp]].db>DemoCheckData.sv[pricurp+1]-4 then
                  begin
                    ftpoint[afarray[pricurp]].arr := False;
                    DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+1;// pricurdb;
                    if GetNearDB(pricurp,ftpoint)>ftpoint[afarray[pricurp]].db then
                    DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+2;// pricurdb;
                  end;
                end;
              end;

              //一直应答到最大结束
              if ftpoint[afarray[pricurp]].db>=pmaxdb then
              begin
                ftpoint[afarray[pricurp]].db := pmaxdb;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := pmaxdb; //pricurdb;
              end;

            end;
            7:  ////////////处理阈值检查之快速法
            begin
              ////              ftpoint[afarray[pricurp]].db := pricurdb;
              ftpoint[afarray[pricurp]].arr := False;
              DemoCheckData.v[pricurp+1] := pricurdb;
            end;
            1,4,3:
            begin
              ftpoint[afarray[pricurp]].oren := 4;  //到应答

              if ftpoint[afarray[pricurp]].arrtime=1 then
              begin
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
              end;

              if Old4XY then
              begin
                if ftpoint[afarray[pricurp]].arrtime=1 then
                begin
                  ftpoint[afarray[pricurp]].arr := False;
                  DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
                end;
              end
              else
              begin
                if ftpoint[afarray[pricurp]].arrtime=2 then
                begin
                  ftpoint[afarray[pricurp]].arr := False;
                  DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
                  if GetNearDB(pricurp,ftpoint)>ftpoint[afarray[pricurp]].db then
                    DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db+1;// pricurdb;
                end;
              end;

              //一直应答到最大结束
              if ftpoint[afarray[pricurp]].db>=pmaxdb then
              begin
                ftpoint[afarray[pricurp]].db := pmaxdb;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := pmaxdb; //pricurdb;
              end;

            end;
          end;
        end;
      end
      else  //未应答
      begin
        //        if pubPrefer.testStrategy = '筛选检查' then
        if DemoCheckData.pm.Strategy mod 30 >=10 then  //'筛选检查'   对DemoCheckData中的db数组赋值
        begin
          if DemoCheckData.pm.Strategy mod 30 =10  then  //一级筛选
          begin
            case pritrioren of
              0: //初态
              begin
                ftpoint[afarray[pricurp]].db := -99;
                DemoCheckData.v[pricurp+1] := -99;
                ftpoint[afarray[pricurp]].oren := 0;
                ftpoint[afarray[pricurp]].arr := false;
              end;
            end;
          end
          else if DemoCheckData.pm.Strategy mod 30 =11  then  //二级筛选
          begin
            case pritrioren of
              0: //初态
              begin
                ftpoint[afarray[pricurp]].db := 0;
                ftpoint[afarray[pricurp]].oren := 3;
                ftpoint[afarray[pricurp]].arr := True;
              end;
              1: //看见，看不见，不会出现
              begin
                ftpoint[afarray[pricurp]].db := 1;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 1;
              end;
              3: //看不见 ，绝对缺省
              begin
                ftpoint[afarray[pricurp]].db := -99;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := -99;
              end;
            end;
          end
          else
          if DemoCheckData.pm.Strategy mod 30 =12  then  //量化
          begin
            case pritrioren of
              0: //初态
              begin
                ftpoint[afarray[pricurp]].arr := True;
                ftpoint[afarray[pricurp]].db := pricurdb;
                ftpoint[afarray[pricurp]].oren := 3;
                if pricurdb<=0 then
                begin
                  ftpoint[afarray[pricurp]].db := -99;
                  ftpoint[afarray[pricurp]].arr := False;
                  DemoCheckData.v[pricurp+1] := -99;
                end;
              end;
              3:  //一致没应答
              begin
                ftpoint[afarray[pricurp]].arr := True;
                ftpoint[afarray[pricurp]].db := pricurdb;
                ftpoint[afarray[pricurp]].oren := 3;

                if pricurdb<=0 then
                begin
                  ftpoint[afarray[pricurp]].db := -99;
                  ftpoint[afarray[pricurp]].arr := False;
                  DemoCheckData.v[pricurp+1] := -99;
                end;
              end;
              7:  //应答-不应答
              begin
                if pricurdb>1 then
                  pricurdb := pricurdb-1;
                ftpoint[afarray[pricurp]].db := pricurdb;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := pricurdb;
              end;
            end;
          end
          else
          begin
            case pritrioren of
              0: //初态
              begin
                ftpoint[afarray[pricurp]].db := 0;
                ftpoint[afarray[pricurp]].oren := 3;
                ftpoint[afarray[pricurp]].arr := True;
              end;
              1: //看见，看不见，不会出现
              begin
                ftpoint[afarray[pricurp]].db := 1;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 1;
              end;
              3: //看不见 ，绝对缺省
              begin
                ftpoint[afarray[pricurp]].db := -99;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := -99;
              end;
            end;
          end;
        end
        else
        begin
          case pritrioren of
            0,1:
            begin
              ftpoint[afarray[pricurp]].arr := True;
              ftpoint[afarray[pricurp]].oren := 1; //1
              if pricurdb<=0 then
              begin
                ftpoint[afarray[pricurp]].db := 0;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
              end;
            end;

            2,4,3:
            begin
              ///转向即完成
              ///新改要反转次数050309
              ftpoint[afarray[pricurp]].oren := 3;  //应答-未应答

              if ftpoint[afarray[pricurp]].arrtime=1 then
              begin
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
              end;

              if Old4XY then
              begin
                if ftpoint[afarray[pricurp]].arrtime=1 then
                begin
                  ftpoint[afarray[pricurp]].arr := False;
                  DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
                end;
              end
              else
              begin
                if ftpoint[afarray[pricurp]].arrtime=2 then
                begin
                  ftpoint[afarray[pricurp]].arr := False;
                  DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db; //pricurdb;
                  if GetNearDB(pricurp,ftpoint)<ftpoint[afarray[pricurp]].db then
                    DemoCheckData.v[pricurp+1] := ftpoint[afarray[pricurp]].db-1;// pricurdb;
                end;
              end;
              if ftpoint[afarray[pricurp]].db<=0 then
              begin
                ftpoint[afarray[pricurp]].db := 0;
                ftpoint[afarray[pricurp]].arr := False;
                DemoCheckData.v[pricurp+1] := 0;
              end;
            end;

            7:  ////////////处理阈值检查之快速法
            begin
              if pricurdb>1 then
                pricurdb := pricurdb-1;  //-2是回到-4的状态，改为-1在-4状态上+1
              ftpoint[afarray[pricurp]].db := pricurdb;
              ftpoint[afarray[pricurp]].arr := False;
              DemoCheckData.v[pricurp+1] := pricurdb;
            end;

          end;
        end;
      end;
    end;

    1: ///盲点
    begin
      //        prihadblind := false;
      //        prihavingblind := false;
      //        pricurbp := 1;
      if pubkey then
      begin
        if not prihavingblind then
        begin
          pubPrefer.BAnswer := pubPrefer.BAnswer+1;
          DemoCheckData.fixationcount := DemoCheckData.fixationcount+1;
        end;
        //EtFixation.Caption:=inttostr(pubPrefer.BAnswer)+'/'+inttostr(pubPrefer.BTest);
      end
      else
      begin
        prihadblind := true;
        prihavingblind := false;
      end;
    end;

    2: ///假阳   没有亮灯,但是点了
    begin
      if pubkey then
      begin
        pubPrefer.JyydNum := pubPrefer.JyydNum+1;
        //        if (pubPrefer.JyydNum/(pubPrefer.JyjcNum+0.01)>0.2) then
        //          pubPrefer.JyydNum := round(pubPrefer.JyjcNum*0.2);
        DemoCheckData.poscount := DemoCheckData.poscount+1;
        //EtPosCount.Caption:= inttostr(pubPrefer.JyydNum)+'/'+inttostr(pubPrefer.JyjcNum);
      end;
    end;

    3: ///假阴   暗的灯点了,但是亮的却没有点
    begin
      if not pubkey then
      begin
        pubPrefer.JsydNum := pubPrefer.JsydNum+1;
        //        if (pubPrefer.JsydNum/(pubPrefer.JsjcNum+0.01)>0.2) then
        //          pubPrefer.JsydNum := round(pubPrefer.JsjcNum*0.2);
        DemoCheckData.negcount := DemoCheckData.negcount+1;
        //EtNegCount.Caption:=inttostr(pubPrefer.JsydNum)+'/'+inttostr(pubPrefer.JsjcNum);
      end;
    end;

  end;
  pubkey := false;

  if hasended(ftpoint) then             //表示检查完毕
  begin
    DemoCheckdata.count := pubhastest;
    pritesting:=false;
    TimerTestTime.Enabled := false;
    DemoCheckData.runstate:=0;
    {
      Panel4.Enabled := false;
      FMain.LightOther(DemoCheckData.pm.Fixation_Mode,2); //关闭背景灯 5s   2为关闭背景光
      sleep(3000);
      FMain.ResetMotor0; //复位
      priCloseBj := true;
      priCloseCount := 0;
      FlashWindow(Application.Handle, True);
      BtSaveClick(BtSave);
      Panel4.Enabled := true;
    }
    Panel4.Enabled := false;
    sleep(1000);
    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,2); //关闭背景灯 5s   2为关闭背景光
    FMain.ResetMotor0; //复位
    sleep(3000);
    FlashWindow(Application.Handle, True);
    FMain.cxLabelTesting.Visible := false;
    cxDBLabel8.Style.Font.Color:=clMoneyGreen;
    BtSaveClick(BtSave);                                   //此处就是将数据结果写入数据库
    ////    BtStopClick(nil);
    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);    //开灯?
    Panel4.Enabled := true;

    //    FMain.ResetMotor; //复位
    priCloseBj := true;
    priCloseCount := 0;
    exit;
  end
  else
  begin
    pricurp := skippoint(ftpoint,pricurp);
  end;
end;

function TFRunpic.skippointmove(mytdata:newtdatarray; mypoint: integer): integer;
var
  i,k,curpoint,myresult,myresult1: integer;
  myhaskj: boolean;
begin
  myresult := mypoint;

//  k := random(10);
  k := 0;
  for i:=0 to high(afarray) do
  begin
    curpoint := i+mypoint+1+k;
    if curpoint>high(afarray) then
      curpoint := curpoint mod (high(afarray)+1);

    if mytdata[afarray[curpoint]].arr=True then
    begin
        myresult := curpoint;
        break;
    end;
  end;
  result := myresult;
end;

function TFRunpic.skippoint(mytdata:newtdatarray; mypoint: integer): integer;
var
  i,k,curpoint,myresult,myresult1: integer;
  myhaskj: boolean;
begin
  prijclx := 0;  ///正常
  myresult := mypoint;     //mypoint:外部传来的pricurp 当前点

  k := random(10);
  for i:=0 to high(afarray) do
  begin
    curpoint := i+mypoint+1+k;                       
    if curpoint>high(afarray) then
      curpoint := curpoint mod (high(afarray)+1);

    if mytdata[afarray[curpoint]].arr=True then      //随机算法,此点在附近且未被应答过
    begin
      //全域值中心点检查
      if ((DemoCheckData.pm.Strategy mod 30>=1) and (DemoCheckData.pm.Strategy mod 30<=2)) or (priCenterDot and (priCenEnd=false)) then
      begin
        //必须跳动的是isxy4点
        if mytdata[afarray[curpoint]].isxy4 then  //isxy4在hasEnded中被赋值
        begin
          myresult := curpoint;
          break;
        end;
      end
      else
      begin
        myresult := curpoint;
        break;
      end;
    end
    else  //已经测试完成的点 处理短期波动
    begin
      //处理短期波动
      if (DemoCheckData.pm.SF=1) then
        if (DemoCheckData.pm.Strategy mod 30>=0) and (DemoCheckData.pm.Strategy mod 30<=2) then
        begin
          if (prisftestdot<DemoCheckData.pm.SF_Number) then
          if (DemoCheckdata.count mod DemoCheckData.pm.SF_Number=0) then
          if not ((DemoCheckData.pt[curpoint+1].x=0) and (DemoCheckData.pt[curpoint+1].y=0)) then
          if (DemoCheckData.sfv[curpoint+1]=-1) then
          begin
            prisftestdot := prisftestdot+1;
            DemoCheckData.sfv[curpoint+1] := DemoCheckData.v[curpoint+1];
            ftpoint[afarray[curpoint]].oren := 0;
            ftpoint[afarray[curpoint]].arr := true;
            break;
        end;
      end;
    end;
  end;

  //  if prihavingblind  then   盲点测试相关 暂时不管
  if prihavingblind and (DemoCheckData.pm.Fixation_Mode<>4) then
  begin
    pricurbp := pricurbp+1;
    if pricurbp>15 then
    begin
      //application.messagebox('盲点查询错误，请检查眼位后，重新开始','系统管理',mb_ok);
      application.messagebox(PansiChar(tr('Blind check error,please check the eye position and start again!')),PansiChar(tr('System')),mb_ok);
      BtStopClick(nil);
    end;
    prijclx := 1;
  end
  else
  begin
    //  if prihadnum mod 29 =0 then  盲点测试才会转入此分支
    if ((priYdcs=3) and pubblindon and (not priCenterDot) and (DemoCheckData.pm.Fixation_Mode<>4) and (DemoCheckData.pm.Eye<2)) then
    begin
      prijclx := 1;      ////当正常应答两次后查询盲点
      priYdcs := priYdcs+1;
    end
    else
    begin
      if (prihadnum mod DemoCheckData.pm.Fixation_Cycle=0) and pubblindon and (not priCenterDot) and (DemoCheckData.pm.Fixation_Mode<>4) and (DemoCheckData.pm.Eye<2) then
        prijclx := 1      ////盲点
        //  else if prihadnum mod 35 = 0 then
      else if prihadnum mod DemoCheckData.pm.False_POS_Cycle = 13 then
        prijclx := 2      ////假阳
        //  else if prihadnum mod 35 = 17 then
      else if prihadnum mod DemoCheckData.pm.False_NEG_Cycle = 7 then
      begin
        myhaskj := false;
        for i:=0 to high(afarray) do
        begin
          if ((mytdata[afarray[i]].oren=2) or ((mytdata[afarray[i]].arr=false) and (mytdata[afarray[i]].db>0))) then  //应答了的点
          begin
            myresult1 := afarray[i]; //curpoint;
            myhaskj := True;
            break;
          end;
        end;
        if myhaskj then
        begin
          prijclx := 3;      ////假阴
          myresult := myresult1;
        end
        else
          prijclx := 0;
      end
      else
        prijclx := 0;  ///正常
    end;
  end;

  result := myresult;
end;

procedure TFRunpic.TWTimerProc;
var
  myCount,StartTime,LI:TLARGEINTEGER;
  mycurdb,waitTime,blindotDBAdd: integer;
  prtmpform:Tform;
begin
  pritesting:=True;
  pubmoveline := false;    //好像是投射才需要?
  TimerTestTime.Enabled := true;
  pristepdb := 4;
  blindotDBAdd:=TMyIniFiles.GetIniFile.ReadInteger('blindot','dbValue addtion',0);
  while pritesting do                           //检查停止通过pritesting控制,hasEnded 在检查数目达到之后置为false
  begin
    if (not pristop) and (not priHjStop) then    //好像这两个变量总为false ,没什么用
    begin
      Application.ProcessMessages;
      pubkey := false;
      prihadnum := prihadnum+1;
      case prijclx of                             //prijclx 检查点类型，由delydqk调用的skippoint 赋值.
        0: //正常跳转                               //计算出大概的DB值,然后调用lightDot亮灯,赋值是在DelYdqk中进行
        begin
          //if pubPrefer.testStrategy='筛选检查' then
          if DemoCheckData.pm.Strategy mod 30>=10  then  //'筛选检查' 10 二区法，11 三区法，12量化缺损
          begin
            pritrioren := ftpoint[afarray[pricurp]].oren;   //pricurp在getXY4中被赋值过
            pricury := ftpoint[afarray[pricurp]].y;
            if pritrioren=3 then
            begin
              pricurdb := 0;
              if DemoCheckData.pm.Strategy mod 30=12  then   //量化缺损
              begin
                 pricurdb := ftpoint[afarray[pricurp]].db-pristepdb; //此函数赋值为4;
              end;
            end
            else
              pricurdb := ftpoint[afarray[pricurp]].db;
            FMain.LightDot(pricurdb,point(ftpoint[afarray[pricurp]].x,pricury),1,DemoCheckData.pm.Hold_Time);
          end
          else //0:全阈值,1:智能交互式,2:快速交互式,3:插值(停用)
          begin
            pritrioren := ftpoint[afarray[pricurp]].oren;
            pricury := ftpoint[afarray[pricurp]].y;
            case pritrioren of
              0: //初态
              begin
                pricurdb := ftpoint[afarray[pricurp]].db; //4;
                ftpoint[afarray[pricurp]].arrtime := 4;
              end;
              2: //看见  第一次按下应答器就会oren赋值为2进入此分支
              begin
                //if (ftpoint[afarray[pricurp]].db>DemoCheckData.sv[pricurp+1]-1) then
                if (ftpoint[afarray[pricurp]].db>DemoCheckData.sv[pricurp+1]-4) then
                  pricurstep := 2   //说明这是走的-4->+2?
                else
                  pricurstep := 4;  //走的+4
                pricurdb := ftpoint[afarray[pricurp]].db+pricurstep; //4;
                ftpoint[afarray[pricurp]].arrtime := pricurstep;
              end;
              1: //一直看不见
              begin
                pricurstep := 4;
                pricurdb := ftpoint[afarray[pricurp]].db-4;
                ftpoint[afarray[pricurp]].arrtime := pricurstep;
              end;
              7: //快检法
                pricurdb := ftpoint[afarray[pricurp]].db+pristepdb div 2 ; //4;

              3: //看见--看不见
              begin
                if ftpoint[afarray[pricurp]].arrtime<=2 then
                  pricurstep := 1
                else
                  pricurstep := 2;
                pricurdb := ftpoint[afarray[pricurp]].db-pricurstep; //4;
                ftpoint[afarray[pricurp]].arrtime := pricurstep;
              end;
              4: //看不见--看见
              begin
                if ftpoint[afarray[pricurp]].arrtime<=2 then
                  pricurstep := 1
                else
                  pricurstep := 2;
                pricurdb := ftpoint[afarray[pricurp]].db+pricurstep; //4;
                ftpoint[afarray[pricurp]].arrtime := pricurstep;
              end;
            end;
            if pricurdb>=pmaxdb then
            begin
              pricurdb := pmaxdb;
              pricurstep := 1;
              ftpoint[afarray[pricurp]].arrtime:=1;
            end;
            if pricurdb<0 then
              pricurdb := 0;
            //放此处给值
            ftpoint[afarray[pricurp]].db := pricurdb;
            FMain.LightDot(pricurdb,point(ftpoint[afarray[pricurp]].x,pricury),1,DemoCheckData.pm.Hold_Time);
          end;
        end;

        1: ///盲点                 然后调用lightDot亮灯,可能亮灯在奇怪的地方
        begin
          ////加入盲点查询程序
          ////prihadblind := false;
          ////prihavingblind := false;
          FMain.Memo2.Lines.Add('blind spot test');
          if prihadblind then        //找到盲点
          begin
            pubPrefer.BTest := pubPrefer.BTest+1;
            DemoCheckData.fixationlength := DemoCheckData.fixationlength+1;
            //EtFixation.Caption:=inttostr(pubPrefer.BAnswer)+'/'+inttostr(pubPrefer.BTest);
            //FMain.LightDot(pubblinddb,point(pubblindx,pubblindy),1);
            //DB在设置中，位置四点后，找3X5的盲点位置    接线坐标BLIND_DOT_RIGHT BLIND_DOT_LEFT
            //priblindpoint
            FMain.LightDot(DemoCheckData.pm.Blind_Value+blindotDBAdd,priblindpoint,1,DemoCheckData.pm.Hold_Time);
          end
          else
          begin
            prihavingblind := true; //正在查询盲点
            if DemoCheckData.pm.Eye=1 then    //右眼
              priblindpoint := point(BLIND_DOT_RIGHTP[pricurbp,1],BLIND_DOT_RIGHTP[pricurbp,2])
            else
              priblindpoint := point(BLIND_DOT_LEFTP[pricurbp,1],BLIND_DOT_LEFTP[pricurbp,2]);
            FMain.LightDot(DemoCheckData.pm.Blind_Value,priblindpoint,1,DemoCheckData.pm.Hold_Time);
          end;
        end;

        2: ///假阳
        begin
          //          shape5.Brush.Color:=clblue;
          //          shape5.Update;
          pubPrefer.JyjcNum := pubPrefer.JyjcNum+1;
          DemoCheckData.poslength := DemoCheckData.poslength+1;
          FMain.Memo2.Lines.Add('false positive test');
          FMain.LightDot(40,point(0,0),0,DemoCheckData.pm.Hold_Time);
          //EtPosCount.Caption:= inttostr(pubPrefer.JyydNum)+'/'+inttostr(pubPrefer.JyjcNum);

          //          LedLightShutoff;
        end;

        3: ///假阴
        begin
          //          shape5.Brush.Color:=clblue;
          //          shape5.Update;
          FMain.Memo2.Lines.Add('false negative test');
          pubPrefer.JsjcNum := pubPrefer.JsjcNum+1;
          DemoCheckData.neglength := DemoCheckData.neglength+1;
          //EtNegCount.Caption:=inttostr(pubPrefer.JsydNum)+'/'+inttostr(pubPrefer.JsjcNum);
          pricury := ftpoint[afarray[pricurp]].y;
          //          if pubPrefer.testStrategy='筛选检查' then
          if DemoCheckData.pm.Strategy mod 30>=10  then  //'筛选检查'
            mycurdb := 0 //pubprefer.TestDb-4 改为最亮
          else
            mycurdb := ftpoint[afarray[pricurp]].db-9;       //0; //
          if pricurdb<0 then
            mycurdb := 0;

            //          FMain.LightDot(mycurdb,point(ftpoint[afarray[pricurp]].x,pricury),1,DemoCheckData.pm.Hold_Time);
          FMain.LightDot(mycurdb,point(ftpoint[afarray[pricurp]].x,pricury),1,DemoCheckData.pm.Hold_Time);
        end;
      end;
      {
        if (now()>encodedate(2018,5,5)) then
          if (random(10)<4) then
          exit;
          ///17.4.17
          }
          {
          //投射先等电机到位时间,这段时间应答无效
          if SaveDataHead.DEVTYPE = $0088 then
          begin
            repeat
              Application.ProcessMessages;
              if not pritesting then
                break;
            until pubKmOpen;

            ///        T100msCount := 1;

          //处理固定时长的等待时间，对投射
          if DemoCheckData.pm.Delay_Mode=1 then
          begin
            QueryPerformanceFrequency(li);
            myCount:=round((li/1000)*(pubPrefer.breaktime-500));
            QueryPerformanceCounter(StartTime);
            repeat
              Application.ProcessMessages;
              if not pritesting then
                break;
              QueryPerformanceCounter(li);
            until li-StartTime > myCount;
          end
          else
          if prijclx=2 then //假阳
          begin
            QueryPerformanceFrequency(li);
            myCount:=round((li/1000)*(500));
            QueryPerformanceCounter(StartTime);
            repeat
              Application.ProcessMessages;
              if not pritesting then
                break;
              QueryPerformanceCounter(li);
            until li-StartTime > myCount;
          end;

          /////处理应答暂停
          if CheckBoxYdzt.Checked then
          begin
            if pubkey1=true then
            begin
              prtmpform:=mymessagebox('','应答暂停中...');
              repeat
                begin
                  Application.ProcessMessages;
                  if not CheckBoxYdzt.Checked then
                    break;
                end;
              until (not pubkey1);
              prtmpform.free;
            end;

          end;
          pubkey := false;
          ////T100msCount := 0;
        end;
      }

      //投射先等电机到位时间,这段时间应答无效   
      if SaveDataHead.DEVTYPE = $0088 then   //投射类型
      begin
        repeat
          Application.ProcessMessages;
          if not pritesting then
            break;
        until pubKmOpen;
        pubkey := false;
      end;

      //计算等待时间
      QueryPerformanceFrequency(li);
      //myCount:=round((li/1000)*(SpinEdit3.Value));
      //myCount:=round((li/1000)*(pubPrefer.breaktime+200));
      waitTime:= pubPrefer.breaktime+SpinEdit2.Value+pubPrefer.flashtime;
      // waitTime:=10000;
      if DemoCheckData.pm.Delay_Mode=0 then   //自动延时
        begin
          myCount:=round((li/1000)*waitTime);
        end
      else
        myCount:=round((li/1000)*(pubPrefer.breaktime+pubPrefer.flashtime));
      QueryPerformanceCounter(StartTime);



      //亮灯等待,按下应答器之后就进入后续
      repeat
        Application.ProcessMessages;
        if not pritesting then
          break;
        if pubkey then           //按下应答器会在main.showRead中被赋值为true
        begin
         //投射应答即完成 myCount:=0后会跳出循环
          if ((SaveDataHead.DEVTYPE = $0088) and (DemoCheckData.pm.Delay_Mode=0)) then
          begin
            myCount := 0;
          end;
        end;
        QueryPerformanceCounter(li);
      until li-StartTime > myCount;
      //Fmain.memo2.Lines.Add('等待时间结束'+inttostr(li));
      //17.4.17
      //if SaveDataHead.DEVTYPE = $8800 then
      
      {
        QueryPerformanceFrequency(li);
        myCount:=round((li/1000)*(SpinEdit2.Value)); // pubPrefer.breaktime*0.8));
        QueryPerformanceCounter(StartTime);
        repeat
          Application.ProcessMessages;
          if not pritesting then
            break;
          QueryPerformanceCounter(li);
        until li-StartTime > myCount;
      }
      /////处理应答暂停
      if CheckBoxYdzt.Checked then   //按下的情况下程序进入循环,防止进入应答处理
      begin
        if pubkey1=true then
        begin
          //prtmpform:=mymessagebox('','应答暂停中...');
          FMain.cxLabelTesting.Caption := tr('Answer Pause');
          repeat
            begin
              Application.ProcessMessages;
              if not CheckBoxYdzt.Checked then
                break;
            end;
          until (not pubkey1);    //松开
          FMain.cxLabelTesting.Caption := tr('Testing');
          //prtmpform.free;
        end;
      end;
      
      /////处理应答情况并到下一点
      DelYdqk;
    end
    else
      Application.ProcessMessages;
  end;
end;

procedure TFRunpic.CheckMove;
var
  x,y,i,n: integer;
  d: single;
begin
  if (DemoCheckData.pm.Strategy=31) then //blind
  begin
    n:=0;
    x:=-14;
    y:=-1;
    if (DemoCheckData.pm.Eye=1) then
    begin
      x:=14; //BLIND_DOT_RIGHT_[n][0];
      y:=-1; //BLIND_DOT_RIGHT_[n][1];
    end;
  	DemoCheckData.pm.MoveX0 := x;
	  DemoCheckData.pm.MoveY0 := y;
  end;

  if (DemoCheckData.pm.Strategy=32) then   //暗点检查
  begin
  	x:=DemoCheckData.pm.MoveX0;
	  y:=DemoCheckData.pm.MoveY0;
  end;

  if (DemoCheckData.pm.Strategy=33) then     //暗点检查
  begin
  	x:=DemoCheckData.pm.MoveX0;
	  y:=DemoCheckData.pm.MoveY0;
  end;

  if (DemoCheckData.pm.Strategy=34) then     //单线扫描
  begin
  	x:=DemoCheckData.pm.MoveX0;
	  y:=DemoCheckData.pm.MoveY0;
  	DemoCheckData.pm.Dot_Number:=2;
    DemoCheckData.pt[1].x := DemoCheckData.pm.MoveX0;
    DemoCheckData.pt[1].y := DemoCheckData.pm.MoveY0;
    DemoCheckData.pt[2].x := DemoCheckData.pm.MoveX1;
    DemoCheckData.pt[2].y := DemoCheckData.pm.MoveY1;
  end
  else
  begin
    DemoCheckData.pm.Dot_Number:=4;
    d:=90;
    if (DemoCheckData.pm.MoveMode=1) then
    begin
      d:=60;
      DemoCheckData.pm.Dot_Number:=6;
    end;
    if (DemoCheckData.pm.MoveMode=2) then
    begin
      d:=45;
      DemoCheckData.pm.Dot_Number:=8;
    end;

    for i:=1 to DemoCheckData.pm.Dot_Number do
    begin
      DemoCheckData.pt[i].x:=round(x+(5*DemoCheckData.pm.MoveDistance+5)*cos(pi*(i-1)*d/180.0));
      DemoCheckData.pt[i].y:=round(y+(5*DemoCheckData.pm.MoveDistance+5)*sin(pi*(i-1)*d/180.0));
    end;
  end;

end;

procedure TFRunpic.TWTimerProcMove;
var
  myCount,StartTime,LI:TLARGEINTEGER;
  mycurdb: integer;
begin
  pritesting:=True;
  TimerTestTime.Enabled := true;
  pristepdb := 4;
  pubmoveline := true;
  while pritesting do
  begin
    if (not pristop) and (not priHjStop) then
    begin
      Application.ProcessMessages;
      pubkey := false;
      prihadnum := prihadnum+1;

      if DemoCheckData.pm.Strategy>=30  then  //move
      begin
        pricury := ftpoint[afarray[pricurp]].y;
        pubmoveanswer := false;
        pubmoveend := false;
        if (DemoCheckData.pm.Strategy=30) then
        begin
           FMain.LightDotMove(DemoCheckData.pm.Dynamic_Value,point(ftpoint[afarray[pricurp]].x,pricury),point(0,0),oldgb+1,10-DemoCheckData.pm.MoveSpeed,10);
        end
        else if ((DemoCheckData.pm.Strategy>=31) and (DemoCheckData.pm.Strategy<=34)) then
        begin
           FMain.LightDotMove(DemoCheckData.pm.Dynamic_Value,point(DemoCheckData.pm.MoveX0,DemoCheckData.pm.MoveY0),point(ftpoint[afarray[pricurp]].x,pricury),oldgb+1,10-DemoCheckData.pm.MoveSpeed,10);
        end;
      end;

      repeat
        begin
          Application.ProcessMessages;
          if not pritesting then
            break;
          /////处理应答情况并到下一点
          ////if pubmoveend then
            if pubmoveend and (not pubkey1) then // and (not pubMotoBuzy) then
              DelYdqkMove;
        end;
      //until (pubmoveend);
      until (pubmoveend and (not pubkey1)) // and (not pubMotoBuzy))

    end
    else
      Application.ProcessMessages;
  end;
end;


procedure TFRunpic.TimerTestTimeTimer(Sender: TObject);
begin
  DemoCheckData.testms := DemoCheckData.testms+1000;
end;

procedure TFRunpic.SpinEdit1Change(Sender: TObject);
begin
  PupilBlackValue :=  SpinEdit1.Value;
end;

procedure TFRunpic.Button1Click(Sender: TObject);
begin
  SpinEdit1.Value := PupilBlackValue;
  if SaveDataHead.DEVTYPE = $8800 then
  begin
    SpinEdit4.Value := SaveDataBd.HW_DA[2];
    SpinEdit5.Value := SaveDataBd.HW_DA[3];
  end
  else
  begin
    SpinEdit4.Value := SaveDataTs.HW_DA[2];
    SpinEdit5.Value := SaveDataTs.HW_DA[3];
  end;
end;

procedure TFRunpic.SpinEdit4Change(Sender: TObject);
begin
  if SaveDataHead.DEVTYPE = $8800 then
  begin
    SaveDataBd.HW_DA[2]:=SpinEdit4.Value;
  end
  else
  begin
    SaveDataTs.HW_DA[2]:=SpinEdit4.Value;
  end;
  FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);//正常固视
end;

procedure TFRunpic.SpinEdit5Change(Sender: TObject);
begin
  if SaveDataHead.DEVTYPE = $8800 then
  begin
    SaveDataBd.HW_DA[3]:=SpinEdit5.Value;
  end
  else
  begin
    SaveDataTs.HW_DA[3]:=SpinEdit5.Value;
  end;
  FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);//正常固视
end;

procedure TFRunpic.cxButtonAutoPupilCKClick(Sender: TObject);
begin
     EtAutoPupil.Checked := false;
     //cxButtonAutoPupil.Visible := true;
     //cxButtonAutoPupilCK.Visible := false;
     FMain.ActiveControl:=nil;
end;


procedure TFRunpic.cxButtonAutoPupilClick(Sender: TObject);
begin
  //EtAutoPupil.Checked := not EtAutoPupil.Checked;
  EtAutoPupil.Checked := true;
  cxButtonAutoPupil.Visible := false;
  cxButtonMaualPupil.Visible := true;
  EtAutoPupilClick(nil);
end;

procedure TFRunpic.cxButtonMaualPupilClick(Sender: TObject);
begin
  EtAutoPupil.Checked := false;
  cxButtonAutoPupil.Visible := true;
  cxButtonMaualPupil.Visible := false;
  EtAutoPupilClick(nil);
end;



end.

