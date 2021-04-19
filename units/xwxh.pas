{
  使用说明：
  1、使用TCHECKDATA和TCHECKRESULT 建立2个变量
  2、TCHECKDATA存放设置参数、程序等
  3、调用GetCheckData获取程序特征、正常值
  3、将TCHECKDATA下载到服务器
  4、将TCHECKDATA中的运行状态下载到服务器启动测试
  5、读取服务器中的TCHECKDATA中的所有参数（多机控制时，参数可能是由其他计算机下载的）
  6、测试过程中显示TCHECKDATA中的刷新参数
  7、测试完成后调用GetCheckResult可获取测试结果参数
  8、为了你调试方便,我建立了2个变量DemoCheckData和DemoCheckResult,它们的值都是计算好了的，你直接使用即可
  9、DemoCheckData按程序30-2，左眼，48岁建立，如想修改可参考其定义
}

unit xwxh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ScktComp, ExtCtrls,
  StdCtrls, DB, DBTables, Wwquery, Wwtable, ImgList, cxGraphics, Math, pubpas,myIniFiles;

const
  MAXCHECK=400;
  MAXGRAY=400;
  MAXDB=40;

type
  TFXwxh = class(TForm)
    Timer: TTimer;
    ClientSocketRD: TClientSocket;
    ClientSocketWR: TClientSocket;
    LaCount: TLabel;
    LaRunstate: TLabel;
    Gray1: TImage;
    Gray0: TImage;
    Gray2: TImage;
    Gray3: TImage;
    Gray4: TImage;
    Gray5: TImage;
    Gray6: TImage;
    Gray7: TImage;
    Gray8: TImage;
    Gray9: TImage;
    PE1: TImage;
    PE0: TImage;
    PE2: TImage;
    PE3: TImage;
    PE4: TImage;
    MPE1: TImage;
    MPE0: TImage;
    MPE2: TImage;
    MPE3: TImage;
    MPE4: TImage;
    SE1: TImage;
    SE0: TImage;
    SE2: TImage;
    ImageBabie: TImage;
    Query: TwwQuery;
    SE3: TImage;
    DE0: TImage;
    TbCheck: TwwTable;
    LaUSBWrite: TLabel;
    BtClear: TButton;
    GpaPE1: TImage;
    GpaPE0: TImage;
    GpaPE2: TImage;
    GpaPE3: TImage;
    GpaPE4: TImage;
    Gray2_1: TImage;
    Gray2_0: TImage;
    Gray2_2: TImage;
    Gray2_3: TImage;
    Gray2_4: TImage;
    Gray2_5: TImage;
    Gray2_6: TImage;
    Gray2_7: TImage;
    Gray2_8: TImage;
    Gray2_9: TImage;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientSocketRDError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketWRError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRDRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketWRRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketRDConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketRDDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormDestroy(Sender: TObject);
    procedure BtClearClick(Sender: TObject);
  private
    { Private declarations }
    RDCount:integer;
    RDState:integer;
    RDDelay:integer;
  public
    { Public declarations }
  end;

var
  FXwxh: TFXwxh;

type
  TXwData = record
    oprank1pass:integer;
    oprank2pass:integer;
    oprank:integer;
    Hospital:string[80];
    Name2:boolean;
    EyeMove:boolean;
    YkFilter:boolean;
    Yk3x3:array[1..3, 1..3] of double;
    //新加，当前程序ID
    CurPtId:integer;
  end;

  TPTFeature=record                                      //程序特征
    ptxstep:integer;                                     //x步长
    ptystep:integer;                                     //y步长
    ptleft:integer;                                      //坐标
    pttop:integer;                                       //
    ptright:integer;                                     //
    ptbottom:integer;                                    //
    ptr2:integer;                                        //点范围
    innerr:integer;                                      //内圆半径
    temp:array[1..12] of integer;                        //留用
  end;

  TCHECKPOINT=record                                     //程序点
    x:Shortint;
    y:Shortint;
  end;
  PTCHECKPOINT=^TCHECKPOINT;

  TCHECKSET=record                                       //设置参数
    Device_Type:integer;                                 //设备类型
    Range:integer;                                       //角度范围
    Strategy:integer;                                    //策略
    Init_Strategy:integer;                               //初值策略
    Init_Value:integer;                                  //初值策略初值
    Hold_Time:integer;                                   //保持时间
    Delay_Time:integer;                                  //延时时间
    Blue_Yellow:integer;                                 //蓝黄模式
    Background_Color:integer;                            //背景颜色
    Stimulus_Color:integer;                              //刺激颜色
    Stimulus_Size:integer;                               //光标尺寸
    Fixation_Monitor:integer;                            //固视检测
    Fovea:integer;                                       //中心检测  center point detection?
    Peripheral:integer;                                  //外围检测
    SF:integer;                                          //短期波动检测 short wate dectect
    SF_Number:integer;                                   //短期波动检测次数
    Dynamic_Value:integer;                               //动态刺激初值
    Alarm_Mode:integer;                                  //报警方式
    Blind_Value:integer;                                 //盲点刺激值
    Rx:integer;                                          //镜片
    Rx1:integer;                                         //镜片参数1
    Rx2:integer;                                         //镜片参数2
    Rx3:integer;                                         //镜片参数3
    False_POS_Cycle:integer;                             //假阳性检测周期
    False_NEG_Cycle:integer;                             //假阴性检测周期
    Fixation_Cycle:integer;                              //固视检测周期
    Fixation_Value:integer;                              //固视刺激值
    Eye:integer;                                         //眼别  0 L,1 R
    Age:integer;                                         //年龄
    Dot_Number:integer;                                  //程序点数
    Chin_Dir:integer;                                    //腮托控制字
    B_Light_sv:integer;                                  //背景光强度
    EB_Light_sv:integer;                                 //环境光差报警值
    Fixation_Mode:integer;                               //固视方式
    MoveSpeed:integer;                                   //动态移动速度
    MoveMode:integer;                                    //动态方式
    MoveX0:integer;                                      //动态X0
    MoveY0:integer;                                      //动态Y0
    MoveX1:integer;                                      //动态X1
    MoveY1:integer;                                      //动态Y1
    MoveDistance:integer;                                //动态距离
    MoveTime:integer;                                    //动态时间
    Delay_Mode:integer;                                  //延时方式
    temp:array[1..17] of integer;                        //留用
  end;

  TCHECKDATA=record                                      //检查数据
    //refresh
    runstate:integer;			   //0-959                     //运行状态
    runstate30:integer;                                  //30度内状态
    count:integer;                                       //完成检测点数
    alarm:integer;                                       //报警状态
    v:array[1..MAXCHECK] of Shortint;                    //检测值   -1代表未完成 -99代表绝对缺损 0代表相对缺损
    sfv:array[1..MAXCHECK] of Shortint;                  //短期波动 -1代表未完成 -99代表绝对缺损 0代表相对缺损
    poscount:integer;                                    //假阳性计数
    poslength:integer;                                   //假阳性次数
    negcount:integer;                                    //假阴性计数
    neglength:integer;                                   //假阴性次数
    fixationcount:integer;                               //固视丢失计数
    fixationlength:integer;                              //固视丢失次数
    stimuluscount:integer;                               //总刺激计数
    thresholdcount:integer;                              //完成计数
    devicetype:integer;                                  //设备类型
 	  isblind2:integer;                                    //
	  testms:integer;                                      //测试时间
    ambient_light:integer;                               //环境光报警
    E_Light_pv:integer;                                  //环境光
    T_Light_pv:integer;                                  //投射光
    Ready:integer;                                       //就绪
    Rol:integer;                                         //循环
    waitcount:integer;                                   //等待次数
    temp:array[1..19] of integer;                        //留用

    //set from server
    pm:TCHECKSET;			   //960-1199

    pt:array[1..MAXCHECK] of TCHECKPOINT;  //1200-2399   //程序点
    sv:array[1..MAXCHECK] of Shortint;                   //年龄段正常值

    ptf:TPTFeature;                        //2400-2479   //程序特征
    vcount:array[1..MAXCHECK] of Shortint; //2480        //各点检测次数
    temp2:array[1..30] of integer;         //2880        //留用

    //上位机自用数据
    EyeMoveData:array[1..600] of Shortint  //3000        //眼动曲线
  end;                                     //3600

  TCHECKRESULT=record                                    //检查结果
    MD:double;                                           //MD
    PSD:double;                                          //PSD
    MDP:integer;                                         //MD概率                <10 <5 <2 < 1 <0.5 >=10
    PSDP:integer;                                        //PSD概率               <10 <5 <2 < 1 <0.5 >=10
    SF:double;                                           //短期波动
    VFI:double;                                          //VFI
    GHT:integer;                                         //GHT                   正常界限外 普遍敏感度下降 P值有意义为边界 正常
    GrayXCount:integer;                                  //灰度图X坐标点数
    GrayYCount:integer;                                  //灰度图y坐标点数
    Gray:array[1..MAXGRAY, 1..MAXGRAY] of Shortint;      //灰度图坐标值
    Gray2:array[1..MAXGRAY, 1..MAXGRAY] of Shortint;     //灰度图坐标值2
    Dev:array[1..MAXCHECK] of integer;                   //总体偏差      (99盲点)
    DevPE:array[1..MAXCHECK] of integer;                 //总体偏差概率  (99盲点) <5 <2 <1 <0.5 >=5
    MDev:array[1..MAXCHECK] of integer;                  //模式偏差      (99盲点)
    MDevPE:array[1..MAXCHECK] of integer;                //模式偏差概率  (99盲点) <5 <2 <1 <0.5 >=5
    Babie:array[1..MAXCHECK] of integer;                 //总体偏差x10从小到大排序并平滑
    GpaDev:array[1..MAXCHECK] of integer;                //Gpa 总体偏差      (99盲点)
    GpaDevPE:array[1..MAXCHECK] of integer;              //Gpa 模式偏差概率  (99盲点) <5 <2 <1 <0.5 >=5
  End;

  TCheckReport=record
    Eye:string;

    Fixation_Monitor:string;
    Fixation_Target:string;
    Fixation_Losses:string;
    False_POS_Errors:string;
    False_NEG_Errors:string;
    Test_Duration:string;
    Fovea:string;
    FoveaDB:string;

    Stimulus:string;
    Background:string;
    Strategy:string;

    Pupil_Diameter:string;
    Visual_Acuity:string;
    RX:string;

    Age:string;

    GHT:string;
    MD:string;
    PSD:string;
    VFI:string;

    Seen:string;
    NotSeen:string;
  end;

  TSAVEDATA=record
    DOT_DA:array[1..2, 1..24, 1..20, 1..2] of integer;			 //0-7679                        //颜色 行 列 (0db, 40db)
    ambient_light:integer;                         					 //7680                          //环境光给定
	  Infrared_pwm:integer;					                           //7684
	  SIZE_MOTOR_POS:array[1..8] of integer;     				       //7688
    LightX:integer;                                          //7720
    LightY:integer;                                          //7724
    DiamondX:integer;                                        //7728
    DiamondY:integer;                                        //7732
    Size_Focus:array[1..10] of integer;                      //7736
    temp:array[1..104] of integer;                           //7776                          //
    DA_TAB:array[1..64] of integer;	          			         //8192                          //0db,1db....40db
    BACK_TAB:array[1..16] of integer;					               //8448                          //PWM white, PWM yellow
    RDB_TAB:array[1..16] of integer;					               //8512                          //0 10...90度衰减比
    CastXStep0:integer;	                          					 //8576
    CastYStep0:integer;
    DB_MOTOR_POS:array[1..60, 1..2] of integer;			         //8584
    FOCUS_TAB:array[1..10, 1..2] of integer;				         //9064
    CastFStep0:integer;                         						 //9144
    CastSStep0:integer;                         						 //9148
    CastCStep0:integer;                         						 //9152
    CastDB0Step0:integer;                         					 //9156
    CastDB1Step0:integer;                         					 //9160
    CastLight:integer;                                       //9164
    BeepTime:integer;                                        //9168
    BlackValue:integer;                                      //9172
    temp2:array[1..223] of integer;						               //9176
    Date:integer;                                            //10068
    ID:integer;                                              //10072
    Password:integer;                                        //10076
  end;                                    									 //10080

var
  XwData:TXwData=
  (
    oprank1pass:1111;
    oprank2pass:2222;
    oprank:1;
    Hospital:'abc';
    YK3x3:
    (
      (1,1,1),
      (1,1,1),
      (1,1,1)
    );
        //新加，当前程序ID
    CurPtId:0;
  );

function GetCheckData(var checkdata:TCHECKDATA):boolean;                                      //计算正常值、程序特征
function GetCheckResult(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;          //计算检测结果、灰度图, 返回0表示无灰度图
function GetCheckReport(checkdata:TCheckData; var checkreport:TCheckReport):boolean;
function GetCheckReport2(checkdata:TCheckData; checkresult:TCheckResult; checkdb:TDataSet; var checkreport:TCheckReport):boolean;
function GetGray(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT; g:integer; c2:boolean):boolean;
function GetGpaDev(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;

function GetNORMAL_VALUE(x,y:integer; age:integer; eye:integer; checkdata:TCheckData):integer;//获取年龄段正常值
function GetCheckV(v:integer):integer;                                                        //获取阈值
function GetPE_VALUE(x,y,v:integer; checkdata:TCheckData):integer;                            //获取概率值
function WriteXwCheckData:boolean;                                                            //修改设置参数
function WriteXwProgram:boolean;
function WriteXwSaveData:boolean;                                                             //修改设置参数
function WriteXwRunstate(d:TCHECKDATA):boolean;                                               //修改运行状态
function XwCreatePT(outerr:integer; innerr:integer; step:integer; pt:PTCHECKPOINT):integer;   //根据外圆、内圆、步长获取程序数据
function XwCreatePT2(x0,y0,x1,y1:integer; step:integer; pt:PTCHECKPOINT):integer;             //矩形、步长获取程序数据
procedure GetCxCy(x,y,w,h,range,step:integer; var cx, cy:integer);

procedure GetDemo;
function getViewAngle(x,y:integer):integer;
                                                                 //计算演示数据

procedure CanvasTextOut(canvas:TCanvas; x,y:integer; s:string);                               //以x,y为中心输出s
procedure CanvasTextOut2(canvas:TCanvas; x,y:integer; s1,s2:string);                          //以x,y为中心输出s1和s2两行

procedure DrawAxis(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);
procedure DrawAxis2(canvas:TCanvas; xc,yc,w,h:integer; checkdata:TCHECKDATA);
procedure DrawAxis3(canvas:TCanvas; xc,yc,w,h:integer; checkdata:TCHECKDATA);
procedure DrawAxis4(canvas:TCanvas; xc,yc,w,h:integer; checkdata:TCHECKDATA);
procedure DrawValue(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; showr:boolean);
procedure DrawValue2(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT; select:integer; xy:integer; dev:boolean);
procedure DrawValue4(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT; select:integer; xy:integer; dev:boolean);

procedure DrawGray(Canvas:TCanvas; xc,yc:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT);
procedure DrawGray2(Canvas:TCanvas; xc,yc:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT);
procedure DrawBabie(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT);
procedure DrawPtDot(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);
procedure DrawEyeMove(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);

function GetPTName(s:string; tp:integer):string;
function GetPtData(id:integer; var checkdata:TCheckData; var pt:string):string;
function GetEyeValue(s:string):integer;
procedure PrepareCheckData(age,eye:integer; other:boolean; var checkdata:TCheckData);
function FindXyStep(x,y,step:integer; checkdata:TCheckData):integer;
function FindXy(x,y:integer; checkdata:TCheckData):integer;


procedure DeleteDoctor(s:string);
function NumberOfCheck:string;
function IdOfLastChecked:integer;
function MaxIDofCheck:integer;
function MaxIDofChecked:integer;
function Last10IDofChecked:integer;
function FilterOfPerson(checkdb:TDataSet):string;
function FilterOfGPA(checkdb:TDataSet):string;
procedure CopyCheckRecord(srcid:string; state:integer=0; other:boolean=true);
procedure ClearCheckState1;
procedure ClearCheckState2;
function PtParamOfName(pt, param:string):string;

procedure MoveCheckData(s:string; var checkdata:TCheckData);

function FindXRbyXY(mydot:TPoint):TPoint; //通过XY坐标找最近的布线坐标
function Find5MbyXYDB(db:byte; mydot:TPoint; gb:byte; zbx:byte):T5MotorArr; //通过XY坐标找五电机移动相对前一点的位置
function Find5MbyXYDB0(db:byte; mydot:TPoint; gb:byte; zbx:byte):T5MotorArr; //通过XY坐标找五电机移动相对前一点的位置
function Find10JJ(db:byte; mydot0,mydote:TPoint; gb:byte; zbx:byte):T10JJMotorArr; //通过XY坐标找焦距电机的位置
function Find10(db:byte; mydot0,mydote:TPoint; gb:byte; zbx:byte; ds:byte):T10MotorArr; //通过XY坐标找焦距电机的位置
function GetQZ(x,y: integer):integer;

procedure GetMoveStep(ds: byte; answerstep:TPoint);


function myMessagebox(aviname,mess:string):TForm;

//function Find5MbyXYDB(db:byte; mydot:TPoint):T5MotorArr; //通过XY坐标找五电机移动相对前一点的位置

function isNearbyXY(x0,y0,x1,y1,r2:integer): boolean;
function NearestXY(x,y,r2:integer): integer;

procedure ReadXwData;
procedure SaveXwData;

procedure DBtoDB2(db:integer; var db0, db1:integer);
function DB2toDB(db0, db1:integer):integer;

function YkFilter(checkdata:TCHECKDATA):TCHECKDATA;

var
  GpaCheckData:TCheckData;
  GpaCheckResult:TCheckResult;
  GpaRate:string;
  GpaSlope:string;
  GpaMD:string;
  GpaPT:string;
  GpaProgression:string;
  GpaBaselineDate:string;
  GpaFollowDate:string;
  Gpa30_2:boolean;
  Gpa24_2:boolean;
  GpaDot_Number:integer;
  GpaSingle:integer;
  GpaDevPE:array[1..MAXCHECK] of integer;

var
  DefaultCheckData:TCheckData=
  (
    pm:
    (
      Device_Type:0;
      Range:30;
      Strategy:0;
      Init_Strategy:0;
      Init_Value:10;
      Hold_Time:200;
      Delay_Time:1200;
      Blue_Yellow:0;
      Background_Color:0;
      Stimulus_Color:0;
      Stimulus_Size:0;
      Fixation_Monitor:1;
      Fovea:1;
      Peripheral:0;
      SF:0;
      SF_Number:10;
      Dynamic_Value:0;
      Alarm_Mode:0;
      Blind_Value:10;
      Rx:0;
      Rx1:0;
      Rx2:0;
      Rx3:0;
      False_POS_Cycle:20;
      False_NEG_Cycle:20;
      Fixation_Cycle:10;
      Fixation_Value:20;
      Eye:0;
      Age:0;
      Dot_Number:0;
      Chin_Dir:0;
      B_Light_sv:0;
      EB_Light_sv:0;
      Fixation_Mode:0;
    )
  );

  xwQuit:boolean;                                        //退出通知
  xwInitOk:boolean;                                      //初始化完成
  xwServerError:boolean;                                 //服务器错误(一般为未启动)
  xwDeviceError:boolean;                                 //设备错误
  xwDownload:boolean;                                    //是否已经下载程序

  DemoCheckData:TCHECKDATA=
  (
    devicetype:1;
    Ready:1;
    pm:
    (
      Range:30;
      Strategy:30;
      Eye:1;
      Age:52;
      Dot_Number:4;
    )
  );

  DemoCheckResult:TCHECKRESULT;
  SaveData:TSAVEDATA;
  PupilBlackValue: integer;

  PT30_2:array[1..76, 1..2] of integer=
  (
                                  (-9,27), (-3,27), (3,27), (9,27),
                        (-15,21), (-9,21), (-3,21), (3,21), (9,21), (15,21),
              (-21,15), (-15,15), (-9,15), (-3,15), (3,15), (9,15), (15,15), (21,15),
    (-27, 9), (-21, 9), (-15, 9), (-9, 9), (-3, 9), (3, 9), (9, 9), (15, 9), (21, 9), (27, 9),
    (-27, 3), (-21, 3), (-15, 3), (-9, 3), (-3, 3), (3, 3), (9, 3), (15, 3), (21, 3), (27, 3),
    (-27, -3),(-21, -3),(-15, -3),(-9, -3),(-3, -3),(3, -3),(9, -3),(15, -3),(21, -3),(27, -3),
    (-27, -9),(-21, -9),(-15, -9),(-9, -9),(-3, -9),(3, -9),(9, -9),(15, -9),(21, -9),(27, -9),
              (-21,-15),(-15,-15),(-9,-15),(-3,-15),(3,-15),(9,-15),(15,-15),(21,-15),
                        (-15,-21),(-9,-21),(-3,-21),(3,-21),(9,-21),(15,-21),
                                  (-9,-27),(-3,-27),(3,-27),(9,-27)
  );

{
  DemoData30_2:array[1..76] of integer=
  (
              22,21,19,15,
           22,21, 22,22,22,14,
        22,23,23,23,21,17,16,17,
     20,21,23,23,23,23,21,20,10,6,
     17,19,23,26,25,23,24,17,19,10,
     0,0,4,17,13,6,12,0,0,0,
     4,0,0,6,15,6,2,0,3,6,
        0,0,8,6,5,5,5,5,
           0,0,0,0,6,10,
              0,0,0,5
  );

  DemoData30_2:array[1..76] of integer=
  (
              21,28,21,28,
           27,28, 30,27,30,27,
        26,30,28,32,29,31,24,28,
     25,28,30,32,31,34,31,29,30,27,
     26,27,24,30,34,34,31,30,30,26,
     26,29,0,33,34,33,31,29,5,23,
     30,27,31,31,31,31,7,0,0,19,
        25,29,33,29,27,12,0,0,
           30,27,30,25,25,6,
              28,27,29,29
  );
}

  DemoData30_2:array[1..76] of integer=
  (
              10,30,25,29,
           0,0, 17,29,30,29,
        0,0,24,30,33,33,30,28,
     0,0,0,27,31,33,33,31,31,27,
     0,0,21,30,33,35,33,33,30,29,
     0,0,0,33,34,36,34,33,32,29,
     0,11,29,31,34,34,34,31,29,26,
        25,30,32,31,31,30,29,27,
           32,32,31,29,28,29,
              27,28,27,24
  );

var
  DOT_XY2:array[1..24, 1..20, 1..2] of integer;


  DOT_XY:array[1..24, 1..20, 1..2] of integer=
  (
  //X\Y	AC0       AC1       AC2       AC3       AC4       AC5       AC6       AC7       AC8       AC9       AC10      AC11      AC12      AC13      AC14      AC15      AC16      AC17      AC18      AC19
  {0}	((0,45),   (0,37),   (0,25),   (0,15),   (0,10),   (0,53),   (0,0),    (0,0),    (0,0),    (0,0),    (0,0),    (0,0),    (0,-8),   (0,-10),  (0,0),    (0,-15),  (0,0),    (0,0),    (0,0),    (0,-57) ),
  {1}	((-75,3),  (-56,3),  (-52,3),  (-50,4),  (-42,3),  (-40,3),  (-33,3),  (-30,3),  (-27,3),  (-27,-3), (-21,-3), (-30,-3), (-33,-3), (-40,-3), (-42,-6), (-42,-3), (-50,-4), (-52,-3), (-56,-3), (-75,-3)),
  {2}	((75,3),   (56,3),   (52,3),   (50,4),   (42,3),   (40,3),   (33,3),   (30,3),   (27,3),   (27,-3),  (21,-3),  (30,-3),  (33,-3),  (40,-3),  (42,-6),  (42,-3),  (50,-4),  (52,-3),  (56,-3),  (75,-3) ),
  {3}	((-73,10), (-56,10), (-54,6),  (-42,6),  (-39,7),  (0,0),    (-30,6),  (-21,3),  (-19,1),  (-19,-1), (-19,-3), (0,0),    (-30,-6), (-39,-7), (-42,-8), (-49,-9), (-51,-8), (-54,-6), (-56,-8), (-75,-8)),
  {4}	((73,10),  (56,10),  (54,6),   (42,6),   (39,7),   (0,0),    (30,6),   (21,3),   (19,1),   (19,-1),  (19,-3),  (0,0),    (30,-6),  (39,-7),  (42,-8),  (49,-9),  (51,-8),  (54,-6),  (56,-8),  (75,-8) ),
  {5}	((-76,24), (-51,10), (-49,9),  (-42,10), (-33,10), (-30,10), (-27,9),  (-24,6),  (-17,1),  (-17,-1), (-17,-3), (-24,-6), (-30,-8), (-33,-8), (-42,-13),(-46,-13),(-56,-13),(-60,-16),(-74,-13),(-85,-10)),
  {6}	((76,24),  (51,10),  (49,9),   (42,10),  (33,10),  (30,10),  (27,9),   (24,6),   (17,1),   (17,-1),  (17,-3),  (24,-6),  (30,-8),  (33,-8),  (42,-13), (46,-13), (56,-13), (60,-16), (74,-13), (85,-10) ),
  {7}	((-56,21), (-54,18), (-47,17), (-42,18), (-38,14), (0,0),    (-21,9),  (-15,3),  (-15,1),  (-15,-1), (-15,-3), (0,0),    (-27,-9), (-33,-13),(-36,-17),(-47,-17),(-54,-18),(-56,-21),(-72,-21),(-82,-22)),
  {8}	((56,21),  (54,18),  (47,17),  (42,18),  (38,14),  (0,0),    (21,9),   (15,3),   (15,1),   (15,-1),  (15,-3),  (0,0),    (27,-9),  (33,-13), (36,-17), (47,-17), (54,-18), (56,-21), (72,-21), (82,-22)),
  {9}	((-54,30), (-42,30), (-41,21), (-34,21), (-30,18), (0,0),    (-18,8),  (-13,3),  (-13,1),  (-13,-1), (-13,-3), (0,0),    (-21,-9), (-30,-13),(-30,-18),(-42,-18),(-42,-21),(0,0),    (-56,-27),(-67,-30)),
  {10}((54,30),  (42,30),  (41,21),  (34,21),  (30,18),  (0,0),    (18,8),   (13,3),   (13,1),   (13,-1),  (13,-3),  (0,0),    (21,-9),  (30,-13), (30,-18), (42,-18), (42,-21), (0,0),    (56,-27), (67,-30)),
  {11}((-30,42), (-30,37), (-30,30), (-21,21), (0,0),    (-21,15), (-15,9),  (0,0),    (-11,1),  (-11,-1), (-11,-3), (0,0),    (-18,-8), (-20,-13),(-21,-15),(-30,-21),(-37,-22),(-42,-30),(-48,-30),(-74,-38)),
  {12}((30,42),  (30,37),  (30,30),  (21,21),  (0,0),    (21,15),  (15,9),   (0,0),    (11,1),   (11,-1),  (11,-3),  (0,0),    (18,-8),  (20,-13), (21,-15), (30,-21), (37,-22), (42,-30), (48,-30), (74,-38)),
  {13}((-20,53), (-23,36), (-18,30), (-17,21), (-15,15), (0,0),    (-9,5),   (-9,3),   (-9,1),   (-9,-1),  (-9,-3),  (-9,-5),	 (-13,-8), (-15,-9), (-15,-15),(-21,-21),(-30,-30),(-34,-30),(-42,-42),(-54,-43)),
  {14}((20,53),  (23,36),  (18,30),  (17,21),  (15,15),  (0,0),    (9,5),    (9,3),    (9,1),    (9,-1),   (9,-3),   (9,-5),	 (13,-8),  (15,-9),  (15,-15), (21,-21), (30,-30), (34,-30), (42,-42), (54,-43)),
  {15}((-18,42), (-18,35), (-14,27), (-15,21), (-9,9),   (-7,7),   (-7,5),   (-7,3),   (-7,1),   (-7,-1),  (-7,-3),  (-7,-5),  (-7,-7),  (-9,-9),  (-13,-13),(-15,-21),(-18,-30),(-18,-35),(-30,-42),(-30,-53)),
  {16}((18,42),  (18,35),  (14,27),  (15,21),  (9,9),    (7,7),    (7,5),    (7,3),    (7,1),    (7,-1),   (7,-3),   (7,-5),   (7,-7),   (9,-9),   (13,-13), (15,-21), (18,-30), (18,-35), (30,-42), (30,-53)),
  {17}((0,0),    (-9,27),  (-9,21),  (-9,15),  (-5,9),   (-5,7),   (-5,5),   (-5,3),   (-5,1),   (-5,-1),  (-5,-3),  (-5,-5),  (-5,-7),  (-5,-9),  (-8,-13), (-9,-15), (-13,-21),(-14,-27),(-18,-42),(-18,-54)),
  {18}((0,0),    (9,27),   (9,21),   (9,15),   (5,9),    (5,7),    (5,5),    (5,3),    (5,1),    (5,-1),   (5,-3),   (5,-5),   (5,-7),   (5,-9),   (8,-13),  (9,-15),  (13,-21), (14,-27), (18,-42), (18,-54)),
  {19}((-6,42),  (-6,30),  (-6,21),  (0,0),    (-3,9),   (-3,7),   (-3,5),   (-3,3),   (-3,1),   (-3,-1),  (-3,-3),  (-3,-5),  (-3,-7),  (-3,-9),  (-9,-21), (-9,-27), (-6,-30), (-10,-43),(-11,-52),(-10,-57)),
  {20}((6,42),   (6,30),   (6,21),   (0,0),    (3,9),    (3,7),    (3,5),    (3,3),    (3,1),    (3,-1),   (3,-3),   (3,-5),   (3,-7),   (3,-9),   (9,-21),  (9,-27),  (6,-30),  (10,-43), (11,-52), (10,-57)),
  {21}((0,0),    (-3,27),  (-3,21),  (-3,15),  (-1,9),   (-1,7),   (-1,5),   (-1,3),   (-1,1),   (-1,-1),  (-1,-3),  (-1,-5),  (-1,-7),  (-1,-9),  (-3,-13), (-3,-15), (-3,-21), (-3,-27), (-6,-42), (-6,-54)),
  {21}((0,0),    (3,27),   (3,21),   (3,15),   (1,9),    (1,7),    (1,5),    (1,3),    (1,1),    (1,-1),   (1,-3),   (1,-5),   (1,-7),   (1,-9),   (3,-13),  (3,-15),  (3,-21),  (3,-27),  (6,-42),  (6,-54)),
  {23}((-85,0),  (-72,0),  (-60,0),  (-50,0),  (0,0),    (0,0),    (0,0),    (-30,0),  (0,0),    (0,0),    (0,0),    (30,0),    (0,0),    (0,0),    (0,0),    (0,0),   (50,0),    (60,0),    (72,0),    (85,0))
  );

  DA_TAB:array[1..MAXDB+1] of integer=
  (
    1000,1000,1000,965,919,875,832,790,749,709,
    670, 632, 595, 559,524,490,457,425,394,364,
    335, 307, 280, 254,229,205,181,159,138,118,
    99,  81,  64,  48, 36, 26, 19, 12, 7,  3,
    0
  );

implementation

uses Myutils, puwait;

//uses Myutils;

{$R *.DFM}

const
  MAXC=31;

type
  NORMAL_VALUETAB=array[1..76] of integer;
  XY_NORMAL_VALUETAB=array[1..76, 1..2] of integer;

const
XY_NORMAL_VALUE:XY_NORMAL_VALUETAB=
(
                                (-9, 27),(-3, 27),(3, 27),(9, 27),
                      (-15, 21),(-9, 21),(-3, 21),(3, 21),(9, 21),(15, 21),
            (-21, 15),(-15, 15),(-9, 15),(-3, 15),(3, 15),(9, 15),(15, 15),(21, 15),
  (-27, 9), (-21, 9), (-15, 9), (-9, 9), (-3, 9), (3, 9), (9, 9), (15, 9), (21, 9), (27, 9),
  (-27, 3), (-21, 3), (-15, 3), (-9, 3), (-3, 3), (3, 3), (9, 3), (15, 3), (21, 3), (27, 3),
  (-27, -3),(-21,-3), (-15,-3), (-9,-3), (-3,-3), (3,-3), (9,-3), (15,-3), (21,-3), (27,-3),
  (-27, -9),(-21,-9), (-15,-9), (-9,-9), (-3,-9), (3,-9), (9,-9), (15,-9), (21,-9), (27,-9),
            (-21,-15),(-15,-15),(-9,-15),(-3,-15),(3,-15),(9,-15),(15,-15),(21,-15),
                      (-15,-21),(-9,-21),(-3,-21),(3,-21),(9,-21),(15,-21),
                                (-9,-27),(-3,-27),(3,-27),(9,-27)
); 

XY_NORMAL_VALUE_60d:XY_NORMAL_VALUETAB=
(
                                 (-12, 66),(-6, 66),(6, 66),(12, 66),
             (-36, 42),(-24, 42),(-12, 42),(-6, 42),(6, 42),(12, 42),(24, 42),(36, 42),
   (-48, 30),(-36, 30),(-24, 30),(-12, 30),(-6, 30),(6, 30),(12, 30),(24, 30),(36, 30),(48, 30),
   (-48,18), (-36,18), (-24,18),                                     (24,18), (36,18), (48,18),
   (-48,6),  (-36,6),  (-24,6),                                      (24,6),  (36,6),  (48,6),
   (-48,-6), (-36,-6), (-24,-6),                                     (24,-6), (36,-6), (48,-6),
   (-48,-18),(-36,-18),(-24,-18),                                    (24,-18),(36,-18),(48,-18),
   (-48,-30),(-36,-30),(-24,-30),(-12,-30),(-6,-30),(6,-30),(12,-30),(24,-30),(36,-30),(48,-30),
             (-36,-42),(-24,-42),(-12,-42),(-6,-42),(6,-42),(12,-42),(24,-42),(36,-42),
             (-36,-54),(-24,-54),(-12,-54),(-6,-54),(6,-54),(12,-54),(24,-54),(36,-54),
                                 (-12,-66),(-6,-66),(6,-66),(12,-66)
);

PE_VALUE5:NORMAL_VALUETAB=
(
	             8, 9, 8, 8,
	          6, 6, 6, 6, 6, 6,
	       6, 5, 5, 4, 3, 3, 4, 5,
      6, 5, 4, 3, 3, 3, 3, 3, 4, 6,
	    4, 3,-3, 3, 3, 3, 3, 3, 3, 5,
	    5, 4,-3, 3, 3, 3, 3, 3, 3, 5,
      5, 4, 4, 3, 3, 3, 3, 3, 3, 6,
         4, 3, 3, 3, 3, 3, 3, 4,
            4, 3, 3, 3, 3, 4,
               5, 4, 4, 6
);

PE_VALUE2:NORMAL_VALUETAB=
(
	             9,10,10, 9,
	          7, 7, 7, 7, 7, 7,
	       7, 6, 6, 5, 4, 4, 5, 6,
      7, 6, 5, 5, 5, 4, 4, 4, 5, 7,
	    6, 5,-4, 4, 4, 4, 4, 4, 4, 6,
	    6, 5,-4, 4, 4, 4, 4, 4, 5, 6,
      7, 5, 5, 4, 4, 4, 4, 4, 5, 7,
         6, 4, 4, 4, 4, 5, 5, 7,
            5, 4, 5, 4, 5, 6,
               6, 6, 6, 7
);

PE_VALUE1:NORMAL_VALUETAB=
(
	             11,11,11,11,
	          8, 8, 8, 8, 8, 8,
	       8, 8, 7, 6, 5, 5, 6, 8,
      8, 8, 7, 6, 6, 5, 5, 5, 7, 10,
	    7, 7,-6, 6, 5, 5, 5, 5, 7, 10,
	    8, 6,-5, 5, 5, 5, 5, 5, 6, 10,
      10,7, 6, 5, 5, 5, 5, 5, 7, 11,
         9, 6, 5, 5, 5, 6, 6, 9,
            9, 7, 6, 6, 6, 7,
               8, 8, 8, 9
);

PE_VALUE05:NORMAL_VALUETAB=
(
	             12,13,13,12,
	          10,10,10,10,10,10,
	       10,10, 9, 8, 7, 7, 8, 10,
      10, 9, 8, 7, 7, 6, 6, 6, 8, 10,
	    9,  8,-7, 7, 6, 6, 6, 6, 8, 9,
	    9,  7,-7, 7, 7, 7, 6, 7, 7, 9,
      10, 8, 7, 6, 7, 7, 6, 8, 8, 10,
          9, 8, 8, 8, 8, 8, 8, 10,
             9, 9, 8, 9, 9, 9,
                11,11,11,11
);

PE_VALUE5_Blue_Yellow_B5:NORMAL_VALUETAB=
(
          12,12,12,12,
        12,11,10,10,11,12,
     12,11,10,10,10,10,11,12,
  12,11,11,10, 9, 9,10,11,11,12,
	11,10,-8, 8, 8, 8, 8,10,10,11,
  11,11,-8, 8, 8, 8, 8,10,10,11,
	12,11,11,10,8,8,10,10,11,12,
		 12,11,10,10,10,10,11,12,
			  12,11,10,10,11,12,
				   12,11,11,12
);

PE_VALUE2_Blue_Yellow_B5:NORMAL_VALUETAB=
(
				14,14,14,140
,		14,13,12,12,13,14,
		14,13,12,12,12,12,13,14,
	14,13,13,12,10,10,12,13,13,14,
	13,12,-10,10,10,10,10,12,12,13,
	13,13,-10,10,10,10,10,12,12,13,
	14,13,13,12,10,10,12,13,13,14,
		14,13,12,12,12,12,13,14,
			14,13,12,12,13,14,
				14,13,13,14
);

PE_VALUE1_Blue_Yellow_B5:NORMAL_VALUETAB=
(
				16,16,16,16,
			16,15,14,14,15,16,
		16,15,14,14,14,14,15,16,
	16,15,15,14,12,12,14,14,15,16,
	15,14,-12,12,12,12,12,14,14,15,
	15,15,-12,12,12,12,12,14,14,15,
	16,15,15,14,12,12,14,15,15,16,
		16,15,14,14,14,14,15,16,
			16,15,14,14,15,16,
				16,15,15,16
);

PE_VALUE05_Blue_Yellow_B5:NORMAL_VALUETAB=
(
				18,18,18,18,
			18,16,15,15,16,18,
		18,16,15,15,15,15,16,18,
	18,16,16,15,13,13,15,15,16,18,
	16,15,-13,13,13,13,13,15,15,16,
	16,15,-13,13,13,13,13,15,15,16,
	18,16,16,15,13,13,15,16,16,18,
		18,16,15,15,15,15,16,18,
			18,16,15,15,16,18,
				18,16,16,18
);

NORMAL_VALUE15_35:NORMAL_VALUETAB=
(
	               260, 270, 270, 270,                            //4
	          290, 290, 290, 290, 290, 300,                       //5~10
	     300, 300, 310, 310, 310, 310, 300, 300,                  //11~18
	310, 310, 310, 320, 340, 340, 330, 320, 310, 290,             //19~28
	310, 310,-330, 340, 350, 350, 340, 330, 310, 290,             //29~38
	310, 320,-330, 340, 350, 350, 340, 330, 310, 290,             //39~48
	310, 320, 320, 330, 340, 340, 330, 320, 310, 300,             //49~58
	     310, 320, 320, 320, 330, 320, 320, 300,                  //59~66
	          310, 310, 310, 310, 300, 300,                       //67~72
	               310, 300, 290, 290                             //73~76
);

NORMAL_VALUE36_45:NORMAL_VALUETAB=
(
	               250, 260, 260, 260,
	          270, 280, 280, 280, 280, 280,
	     290, 300, 300, 300, 310, 300, 300, 280,
	290, 300, 310, 310, 320, 320, 320, 310, 300, 280,
	300, 310,-310, 320, 330, 330, 330, 320, 300, 280,
	300, 310,-320, 330, 340, 340, 330, 320, 310, 280,
	300, 310, 320, 320, 330, 340, 320, 320, 300, 280,
	     310, 310, 310, 320, 320, 320, 310, 290,
	          300, 300, 300, 310, 290, 290,
	               290, 290, 280, 280
);

NORMAL_VALUE36_45_B1_White:NORMAL_VALUETAB=
(
				180,180,180,180,
			190,200,210,210,200,190,
		190,210,220,230,230,220,210,190,
	180,200,220,230,250,250,230,220,200,180,
	180,210,-230,250,270,270,250,230,210,180,
	180,210,-230,250,270,270,250,230,210,180,
	180,200,220,230,250,250,230,220,200,180,
		190,210,220,230,230,220,210,190,
			190,200,210,210,200,190,
				180,180,180,180
);

NORMAL_VALUE36_45_B2_White:NORMAL_VALUETAB=
(
				250,250,250,250,
			260,270,270,270,270,260,
  260,270,290,290,290,290,270,260,
	250,270,290,310,320,320,310,290,270,250,
	250,270,-290,320,330,330,320,290,270,250,
	250,270,-290,320,330,330,320,290,270,250,
	250,270,290,310,320,320,310,290,270,250,
		260,270,290,290,290,290,270,260,
			260,270,270,270,270,260,
				250,250,250,250
);

NORMAL_VALUE36_45_B4_White:NORMAL_VALUETAB=
(
				330,330,330,330,
    340,340,350,350,340,340,
		340,350,360,360,360,360,350,340,
	330,340,360,370,380,380,370,360,340,330,
	330,350,-360,380,390,390,380,360,350,330,
	330,350,-360,380,390,390,380,360,350,330,
	330,340,360,370,380,380,370,360,340,330,
		340,350,360,360,360,360,350,340,
			340,340,350,350,340,340,
				330,330,330,330
);

NORMAL_VALUE36_45_B5_White:NORMAL_VALUETAB=
(
				370,370,370,370,
			370,380,380,380,380,370,
		370,380,390,390,390,390,380,370,
	370,380,390,390,400,400,390,390,380,370,
	370,380,-390,400,410,410,400,390,380,370,
	370,380,-390,400,410,410,400,390,380,370,
	370,380,390,390,400,400,390,390,380,370,
		370,380,390,390,390,390,380,370,
		370,380,380,380,380,370,
				370,370,370,370
);

NORMAL_VALUE36_45_B1_Red:NORMAL_VALUETAB=
(
				90,90,90,90,
			100,110,120,120,110,100,
		100,120,130,140,140,130,120,100,
	90,110,130,150,160,160,150,130,110,90,
	90,120,-140,160,180,180,160,140,120,90,
	90,120,-140,160,180,180,160,140,120,90,
	90,110,130,150,160,160,150,130,110,90,
		100,120,130,140,140,130,120,100,
			100,110,120,120,110,100,
				90,90,90,90
);

NORMAL_VALUE36_45_B2_Red:NORMAL_VALUETAB=
(
				150,150,150,150,
			160,170,170,170,170,160,
		160,170,190,190,190,190,170,160	,
	150,170,190,210,220,220,210,190,170,150,
	150,170,-190,220,230,230,220,190,170,150,
	150,170,-190,220,230,230,220,190,170,150,
	150,170,190,210,220,220,210,190,170,150,
		160,170,190,190,190,190,170,160,
			160,170,170,170,170,160,
				150,150,150,150
);

NORMAL_VALUE36_45_B3_Red:NORMAL_VALUETAB=
(
				170,170,180,180,
			200,200,200,200,200,200,
		210,210,210,220,220,220,210,200,
	220,220,220,230,240,240,240,230,210,200,
	230,230,-230,240,260,260,250,240,220,200,
	230,230,-230,240,260,260,250,240,220,200,
	230,230,230,240,250,250,240,240,220,200,
		230,230,240,240,240,230,220,210,
			23,23,23,23,22,21,
				22,22,21,20
);

NORMAL_VALUE36_45_B4_Red:NORMAL_VALUETAB=
(
				240,240,240,240,
		250,250,260,260,250,250,
		250,260,270,270,270,270,260,250,
	240,250,270,280,290,290,280,270,250,240,
	240,260,-270,290,300,300,290,270,260,240,
	240,260,-270,290,300,300,290,270,260,240,
	240,250,270,280,290,290,280,270,250,240,
		250,260,270,270,270,270,260,250,
			250,250,260,260,250,250,
				240,240,240,240
);

NORMAL_VALUE36_45_B5_Red:NORMAL_VALUETAB=
(
				270,270,270,270,
			270,280,280,280,280,270,
		270,280,290,290,290,290,280,270,
	270,280,290,300,300,300,300,290,280,270,
  270,280,-290,300,310,310,300,290,280,270,
	270,280,-290,300,310,310,300,290,280,270,
	270,280,290,300,300,300,300,290,280,270,
		270,280,290,290,290,290,280,270,
			270,280,280,280,280,270,
				270,270,270,270
);

NORMAL_VALUE36_45_B1_Blue:NORMAL_VALUETAB=
(
				00,00,00,00,
			00,00,00,00,00,00,
		00,00,00,00,00,00,00,00,
	00,00,00,00,00,00,00,00,00,00,
	00,00,00,00,00,00,00,00,00,00,
	00,00,00,00,00,00,00,00,00,00,
	00,00,00,00,00,00,00,00,00,00,
	 00,00,00,00,00,00,00,00,
			00,00,00,00,00,00,
				00,00,00,00
);

NORMAL_VALUE36_45_B2_Blue:NORMAL_VALUETAB=
(
				00,00,00,00,
			00,00,00,00,00,00	,
		00,00,00,50,50,00,00,00,
  00,00,00,50,60,60,50,00,00,00,
	00,00,-50,60,80,80,60,50,00,00,
	00,00,-50,60,80,80,60,50,00,00,
	00,00,00,50,60,60,50,00,00,00,
    00,00,00,50,50,00,00,00,
			00,00,00,00,00,00,
				00,00,00,00
);

NORMAL_VALUE36_45_B3_Blue:NORMAL_VALUETAB=
(
				90,100,100,90,
			100,110,110,110,110,100,
		100,110,120,130,130,120,110,100,
	90,110,120,130,140,140,130,120,110,90,
	100,110,-130,140,160,160,140,130,110,100,
	100,110,-130,140,160,160,140,130,110,100,
	90,110,120,130,140,140,130,120,110,90,
		100,110,120,130,130,120,110,100,
			100,110,110,110,110,110,
				90,100,100,90
);

NORMAL_VALUE36_45_B4_Blue:NORMAL_VALUETAB=
(
				190,200,200,190,
			200,210,210,210,210,200,
		200,210,220,230,230,220,210,200,
	190,210,220,230,240,240,230,220,210,190,
	200,210,-230,240,260,260,240,230,210,200,
	200,210,-230,240,260,260,240,230,210,200,
	190,210,220,230,240,240,230,220,210,190,
		200,210,220,230,230,220,210,200,
			200,210,210,210,210,200,
				190,200,200,190
);

NORMAL_VALUE36_45_B5_Blue:NORMAL_VALUETAB=
(
				170,160,150,150,
			170,200,210,200,200,190,
		220,220,230,240,240,240,220,200,
	230,230,250,260,270,270,270,260,220,180,
	240,250,-260,270,280,290,280,270,250,200,
	240,240,-270,280,290,290,290,280,250,210,
	240,260,270,280,290,290,290,280,250,210,
    250,260,270,280,280,270,260,240,
      250,260,260,260,250,240,
				240,240,230,220
);

NORMAL_VALUE46_55:NORMAL_VALUETAB=
(
	               260, 250, 260, 260,
	          270, 270, 280, 280, 280, 280,
	     290, 290, 290, 300, 300, 300, 290, 280,
	290, 300, 300, 310, 320, 320, 320, 310, 300, 280,
	300, 310,-330, 320, 330, 330, 330, 320, 300, 280,
	300, 310,-330, 330, 330, 330, 330, 320, 310, 280,
	300, 310, 320, 320, 330, 330, 330, 320, 300, 260,
	     300, 310, 310, 320, 310, 310, 300, 290,
	          300, 300, 310, 300, 300, 290,
	               300, 290, 280, 280
);

NORMAL_VALUE56_65:NORMAL_VALUETAB=
(
	               230, 240, 240, 240,
	          260, 260, 270, 270, 260, 260,
	     270, 280, 290, 290, 290, 290, 290, 270,
	280, 280, 290, 300, 300, 310, 310, 300, 280, 260,
	290, 290,-310, 310, 320, 320, 320, 310, 290, 270,
	290, 300,-320, 320, 320, 320, 320, 310, 300, 270,
	290, 300, 300, 310, 310, 320, 320, 310, 290, 260,
	     290, 300, 310, 310, 310, 300, 290, 280,
	          290, 300, 300, 290, 290, 280,
	               280, 290, 280, 270
);

NORMAL_VALUE66_75:NORMAL_VALUETAB=
(
	               230, 230, 240, 240,
	          250, 250, 260, 270, 270, 250,
	     270, 270, 280, 280, 290, 290, 280, 270,
	280, 280, 290, 300, 300, 300, 300, 290, 280, 250,
	280, 290,-310, 310, 320, 320, 310, 310, 290, 260,
	290, 290,-310, 310, 320, 320, 320, 310, 290, 270,
	290, 300, 300, 310, 310, 310, 310, 300, 290, 270,
	     290, 290, 300, 310, 310, 300, 290, 270,
	          290, 290, 290, 290, 280, 270,
	               280, 280, 270, 260
);

NORMAL_VALUE15_35_60d:NORMAL_VALUETAB=
(
	               200, 220, 220, 220,
	     200, 200, 220, 220, 220, 220, 200, 200,
	210, 230, 250, 270, 270, 270, 270, 250, 210, 190,
	230, 250, 270,                     250, 230, 210,
	250, 270, 290,                     270, 250, 230,
	250, 270, 290,                     270, 250, 230,
	230, 250, 270,                     250, 230, 210,
	230, 250, 270, 290, 290, 290, 290, 250, 230, 210,
	     230, 250, 270, 290, 290, 270, 230, 210,
	     230, 240, 250, 250, 250, 250, 230, 210,
	               200, 220, 220, 220
);

GHT1_RIGHT:array[1..3,1..2] of integer=((-9,3),(-3,3),(3,3));
GHT2_RIGHT:array[1..4,1..2] of integer=((-9,9),(-3,9),(3,9),(9,9));
GHT3_RIGHT:array[1..5,1..2] of integer=((-27,3),(-21,3),(-15,9),(-21,9),(-15,3));
GHT4_RIGHT:array[1..6,1..2] of integer=((-15,15),(-9,15),(-3,15),(3,15),(-9,21),(-3,21));
GHT5_RIGHT:array[1..4,1..2] of integer=((9,15),(15,15),(3,21),(9,21));

////接线坐标
BLIND_DOT_RIGHT:array[1..15, 1..2] of integer=
(
	(10, 12), (9,  18), (11, 5),
	(10, 0),  (10, 11), (9,  17),
	(9,  0),  (11, 4),  (11, 0),
	(8,  5),  (8,  4),  (8,  0),
	(13, 5),  (13, 4),  (13, 0)
);

BLIND_DOT_LEFT:array[1..15, 1..2] of integer=
(
	(10, 7), (9,  9),  (11, 2),
	(10, 6), (10, 8),  (9,  10),
	(9,  8), (11, 3),  (11, 1),
	(8,  2), (8,  3),  (8,  1),
	(13, 2), (13, 3),  (13, 1)
);


var
  WriteOk:string;
  WriteTick:dword;
  MaxWriteTick:dword;

//---- XwData ----
procedure SaveXwData;
var
  f:integer;
  s:string;
begin
  s:=ExeFilePath+'xwdata.dat';
  f:=FileCreate(s);
  if f=-1 then begin
    Jgxx('文件错误'+s);
    exit;
  end;
  FileWrite(f, XwData, sizeof(XwData));
  FileClose(f);
end;

function myMessagebox(aviname,mess:string):TForm;
begin
  Application.CreateForm(TFrmPuWait, FrmPuWait);
  with FrmPuWait do
  begin
    if length(mess)>0 then panelMessage.caption:=mess;
    {
    aviname:=uppercase(aviname);
    if aviname='FINDCOMPUTER' then animate1.commonavi:=aviFindComputer else
    if aviname='FINDFILE' then animate1.commonavi:=aviFindFile else
    if aviname='FINDFOLDER' then animate1.commonavi:=aviFindFolder else
    if aviname='FINDFILE' then animate1.commonavi:=aviFindFile else
    if fileexists(puSysPub+aviname+'.avi') then
    begin
      animate1.commonavi:=aviNone;
      animate1.filename:=puSysPub+aviname+'.avi';
    end
    else animate1.commonavi:=aviFindComputer;
    }
    show;
    //showModal;
    update;
  end;
  result:=FrmpuWait;
end;

procedure ReadXwData;
var
  f:integer;
  s:string;
begin
  s:=ExeFilePath+'xwdata.dat';
  f:=FileOpen(s, fmOpenRead);
  if f=-1 then
  begin
    SaveXwData;
    exit;
  end;
  FileRead(f, XwData, sizeof(XwData));
  FileClose(f);
  XwData.oprank:=1;
end;

function getViewAngle(x,y:integer):integer;
begin
  if (x>0) and (y>=0) then
    result := Round(arctan(y/x)*180/pi)
  else if (x<0) and (y>=0) then
    result := 180-Round(arctan(abs(y/x))*180/pi)
  else if (x<0) and (y<0) then
    result := 180+Round(arctan(abs(y/x))*180/pi)
  else if (x>0) and (y<0) then
    result := 360-Round(arctan(abs(y/x))*180/pi)
  else if (x=0) and (y>0) then
    result := 90
  else if (x=0) and (y<0) then
    result := 270;
end;

function GetCheckV(v:integer):integer;
begin
  Result:=v;
  if Result=-99 then Result:=0;
end;

function XYonPT(x,y:integer; checkdata:TCHECKDATA):integer;
var
  i:integer;
begin
  Result:=0;
  for i:=1 to checkdata.pm.Dot_Number do begin
    if (checkdata.pt[i].x=x) and (checkdata.pt[i].y=y) then begin
      Result:=i;
      break;
    end;
  end;
end;

function isGHT1(x,y:integer):boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 3 do begin
    if (GHT1_RIGHT[i][1]=x) and (GHT1_RIGHT[i][2]=y) then begin
      Result:=true;
      break;
    end;
  end;
end;

function isGHT2(x,y:integer):boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 4 do begin
    if (GHT2_RIGHT[i][1]=x) and (GHT2_RIGHT[i][2]=y) then begin
      Result:=true;
      break;
    end;
  end;
end;

function isGHT3(x,y:integer):boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 5 do begin
    if (GHT3_RIGHT[i][1]=x) and (GHT3_RIGHT[i][2]=y) then begin
      Result:=true;
      break;
    end;
  end;
end;

function isGHT4(x,y:integer):boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 6 do begin
    if (GHT4_RIGHT[i][1]=x) and (GHT4_RIGHT[i][2]=y) then begin
      Result:=true;
      break;
    end;
  end;
end;

function isGHT5(x,y:integer):boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 4 do begin
    if (GHT5_RIGHT[i][1]=x) and (GHT5_RIGHT[i][2]=y) then begin
      Result:=true;
      break;
    end;
  end;
end;

function GetPTFeature(var checkdata:TCHECKDATA):boolean;
var
  i,x0,y0,x1,y1,dx,dy,mindx,mindy,left,top,right,bottom:integer;
begin
  Result:=false;
  x0:=checkdata.pt[1].x;
  y0:=checkdata.pt[1].y;
  mindx:=999999;
  mindy:=999999;
  left:=999999;
  top:=-999999;
  right:=-999999;
  bottom:=999999;

  for i:=2 to checkdata.pm.Dot_Number do begin
    x1:=checkdata.pt[i].x;
    y1:=checkdata.pt[i].y;
    if (x1<>x0) then begin
      dx:=abs(x1-x0);
      if (dx<mindx) then mindx:=dx;
      Result:=true;
    end;
    if (y1<>y0) then begin
      dy:=abs(y1-y0);
      if (dy<mindy) then mindy:=dy;
      Result:=true;
    end;
    if (x1<left) then left:=x1;
    if (y1>top) then top:=y1;
    if (x1>right) then right:=x1;
    if (y1<bottom) then bottom:=y1;
  end;
  checkdata.PTF.ptxstep:=mindx;
  checkdata.PTF.ptystep:=mindy;
  checkdata.PTF.ptleft:=left;
  checkdata.PTF.pttop:=top;
  checkdata.PTF.ptright:=right;
  checkdata.PTF.ptbottom:=bottom;
  checkdata.PTF.ptr2:=checkdata.ptf.ptxstep*checkdata.ptf.ptxstep+checkdata.ptf.ptystep*checkdata.ptf.ptystep;
  checkdata.PTF.innerr:=0;

  x1:=checkdata.PTF.ptxstep div 2;
  y1:=checkdata.PTF.ptystep div 2;
  for i:=0 to 9 do begin
    if XYonPT(x1, y1, checkdata)>0 then begin
      if i<>0 then checkdata.PTF.innerr:=checkdata.PTF.ptxstep*i;
      break;
    end;
    inc(x1, checkdata.PTF.ptxstep);
    inc(y1, checkdata.PTF.ptystep);
  end;
end;

function GetNORMAL_VALUEIndex(x,y:integer; tab:XY_NORMAL_VALUETAB):integer;
var
  i,d:integer;
  mini,mind:integer;
  x0,y0:integer;
begin
  mini:=0;
  mind:=99999999;
  for i:=1 to 76 do begin
    x0:=tab[i][1];
    y0:=tab[i][2];
    d:=(x-x0)*(x-x0)+(y-y0)*(y-y0);
    if d<mind then begin
      mind:=d;
      mini:=i;
      if d=0 then break;
    end;
  end;
  Result:=mini;
end;

function GetNORMAL_VALUE30d(x,y:integer; age:integer):integer;
var
  tab:NORMAL_VALUETAB;
  i:integer;
begin
  if age<=35 then tab:=NORMAL_VALUE15_35
  else if age<=45 then tab:=NORMAL_VALUE36_45
  else if age<=55 then tab:=NORMAL_VALUE46_55
  else if age<=65 then tab:=NORMAL_VALUE56_65
  else tab:=NORMAL_VALUE66_75;
  i:=GetNORMAL_VALUEIndex(x, y, XY_NORMAL_VALUE);
  Result:=tab[i];
end;

function GetNORMAL_VALUE60d(x,y:integer; age:integer):integer;
var
  tab:NORMAL_VALUETAB;
  i,j:integer;
begin
  tab:=NORMAL_VALUE15_35_60d;
  if age<=35 then j:=0
  else if age<=45 then j:=1
  else if age<=55 then j:=2
  else if age<=65 then j:=3
  else j:=4;
  i:=GetNORMAL_VALUEIndex(x, y, XY_NORMAL_VALUE_60d);
  Result:=tab[i];
  if Result>0 then Result:=Result-10*j else if Result<0 then Result:=Result+10*j;
end;

function GetNORMAL_VALUE_Color_Size(x,y:integer; age:integer; color,size:integer):integer;
var
  tab:NORMAL_VALUETAB;
  i,j:integer;
begin
  if      (size=0) and (color=0) then tab:=NORMAL_VALUE36_45_B1_White
  else if (size=1) and (color=0) then tab:=NORMAL_VALUE36_45_B2_White
  else if (size=3) and (color=0) then tab:=NORMAL_VALUE36_45_B4_White
  else if (size=4) and (color=0) then tab:=NORMAL_VALUE36_45_B5_White

  else if (size=0) and (color=1) then tab:=NORMAL_VALUE36_45_B1_Red
  else if (size=1) and (color=1) then tab:=NORMAL_VALUE36_45_B2_Red
  else if (size=3) and (color=1) then tab:=NORMAL_VALUE36_45_B4_Red
  else if (size=4) and (color=1) then tab:=NORMAL_VALUE36_45_B5_Red

  else if (size=0) and (color=2) then tab:=NORMAL_VALUE36_45_B1_Blue
  else if (size=1) and (color=2) then tab:=NORMAL_VALUE36_45_B2_Blue
  else if (size=3) and (color=2) then tab:=NORMAL_VALUE36_45_B4_Blue
  else if (size=4) and (color=2) then tab:=NORMAL_VALUE36_45_B5_Blue

  else tab:=NORMAL_VALUE36_45;

  if age<=35 then j:=0
  else if age<=45 then j:=1
  else if age<=55 then j:=2
  else if age<=65 then j:=3
  else j:=4;
  i:=GetNORMAL_VALUEIndex(x, y, XY_NORMAL_VALUE);
  Result:=tab[i];
  if color=2 then begin
    if Result>0 then Result:=Result-20*(j-1) else if Result<0 then Result:=Result+20*(j-1);
  end
  else begin
    if Result>0 then Result:=Result-10*(j-1) else if Result<0 then Result:=Result+10*(j-1);
  end;
end;

function GetNORMAL_VALUE(x,y:integer; age:integer; eye:integer; checkdata:TCheckData):integer;
var
  r2:integer;
begin
  if eye<>0 then x:=-x;
  Result:=200;
  if (checkdata.pm.Stimulus_Color=0) and (checkdata.pm.Stimulus_Size=2) then
  begin
    r2:=x*x+y*y;
    if r2<=30*30 then                              //半径小于30
      Result:=GetNORMAL_VALUE30d(x, y, age)
    else if r2<=60*60 then
      Result:=GetNORMAL_VALUE60d(x, y, age);
  end
  else
  begin
    Result:=GetNORMAL_VALUE_Color_Size(x, y, age, checkdata.pm.Stimulus_Color, checkdata.pm.Stimulus_Size);
  end;
  Result:=Result div 10;
end;

function GetPE_VALUE(x,y,v:integer; checkdata:TCheckData):integer;
var
  r2:integer;
  i,v5,v2,v1,v05:integer;
begin
  Result:=4;
  r2:=x*x+y*y;
  if r2>30*30 then exit;
  i:=GetNORMAL_VALUEIndex(x, y, XY_NORMAL_VALUE);
  if (checkdata.pm.Stimulus_Color=2) and (checkdata.pm.Background_Color=1) and (checkdata.pm.Stimulus_Size=4) then begin
    v5:=PE_VALUE5_Blue_Yellow_B5[i];
    v2:=PE_VALUE2_Blue_Yellow_B5[i];
    v1:=PE_VALUE1_Blue_Yellow_B5[i];
    v05:=PE_VALUE05_Blue_Yellow_B5[i];
  end
  else begin
    v5:=PE_VALUE5[i];
    v2:=PE_VALUE2[i];
    v1:=PE_VALUE1[i];
    v05:=PE_VALUE05[i];
  end;
  if v<=v5 then Result:=4
  else if v<=v2 then Result:=0
  else if v<=v1 then Result:=1
  else if v<=v05 then Result:=2
  else Result:=3;
end;

function GetSE_VALUE(v,sv,strategy:integer):integer;
begin
  Result:=0;
  if v=0 then Result:=1
  else if v=-99 then Result:=2
  else if v=-1 then Result:=4;

  if (strategy=12) and (Result=0) and (sv-v>6) then Result:=5;
end;

function GetDev(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,x,y:integer;
  sv,v,pe:integer;
  vfisc: array[1..5] of single; //实测
  vfibz: array[1..5] of single; //标准
  vfiqz: array[1..5] of single; //权重
  r2: single;
  r: integer;
  vfih,vfi,temp: single;
  vfiMagnification:Double;
begin
  vfiMagnification:=TMyIniFiles.GetIniFile.ReadFloat('report','vfi magnification',1.02);
  vfiqz[1] := 3.29;
  vfiqz[2] := 1.28;
  vfiqz[3] := 0.79;
  vfiqz[4] := 0.57;
  vfiqz[5] := 0.43;
  fillchar(vfisc,5*sizeof(single),0);
  fillchar(vfibz,5*sizeof(single),0);
  Result:=true;

  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    if checkdata.pm.Eye<>0 then x:=-x;
    sv:=GetNORMAL_VALUE(x, y, checkdata.pm.Age, 0, checkdata);  //正常值
    v:=99;
    pe:=99;
    if sv>0 then
    begin
      v:=GetCheckV(checkdata.v[i])-sv;
      pe:=GetPE_VALUE(x, y, -v, checkdata);

      r2:=x*x+y*y;
      r := round(sqrt(r2)/6+0.4);
      if r=0 then
        r:=1;
      if r>5 then
        r:=5;
      vfisc[r] := vfisc[r]+checkdata.v[i];
      vfibz[r] := vfibz[r]+sv;
    end;
    checkresult.Dev[i]:=v;
    checkresult.DevPE[i]:=pe;
  end;
  vfih := 0;
  for i:=1 to 5 do
  begin
    temp := (vfisc[i]/(vfibz[i]+0.0001));
    if temp>1 then
      temp := 1;
    vfih := vfih+vfiqz[i]*temp;
  end;
  vfi := vfih/6.36*vfiMagnification;
  if vfi>1 then
    vfi := 1;
  checkresult.VFI := round(vfi*100)/100;
end;

function GetQZ(x,y: integer):integer;
var
  r2: single;
  r: integer;
begin
  r2:=x*x+y*y;
  r := round(sqrt(r2)/6+0.4);
  result := r;
end;

function Get_PE10(v:double):integer;
begin
  if v>=10 then Result:=5
  else if v>5 then Result:=0
  else if v>2 then Result:=1
  else if v>1 then Result:=2
  else if v>0.5 then Result:=3
  else Result:=4;
end;

function GetPSD(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,n:integer;
  psd,md:double;
begin
  Result:=true;
  n:=0;
  md:=0;
  for i:=1 to checkdata.pm.Dot_Number do begin
    if checkresult.Dev[i]<>99 then begin
      md:=md+checkresult.Dev[i];
      inc(n);
    end;
  end;
  md:=md/n;

  n:=0;
  psd:=0;
  for i:=1 to checkdata.pm.Dot_Number do begin
    if checkresult.Dev[i]<>99 then begin
      psd:=psd+(checkresult.Dev[i]-md)*(checkresult.Dev[i]-md);
      inc(n);
    end;
  end;
  psd:=sqrt(psd/n);

  checkresult.PSD:=psd;
  checkresult.MD:=md;
  checkresult.PSDP:=Get_PE10(psd);
  checkresult.MDP:=Get_PE10(md);
end;

function GetSF(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,n:integer;
  sf:double;
begin
  Result:=true;
  n:=0;
  sf:=0;
  for i:=1 to checkdata.pm.Dot_Number do begin
    if checkdata.sfv[i]<>-1 then begin
      sf:=sf+GetCheckV(checkdata.v[i])-GetCheckV(checkdata.sfv[i]);
      inc(n);
    end;
  end;
  if (n>0) then sf:=sf/n;
  checkresult.sf:=sf;
end;

function GetMDev(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,x,y:integer;
  v:integer;
  md,bestdev:integer;
begin
  Result:=true;
  bestdev:=-9999;
  for i:=1 to checkdata.pm.Dot_Number do begin
    if checkresult.Dev[i]<>99 then begin
      if checkresult.Dev[i]>bestdev then bestdev:=checkresult.Dev[i];
    end;
  end;
  bestdev:=0;
  md:=Round(checkresult.MD+checkresult.PSD)-bestdev;
  //if checkresult.MD>=-1 then begin
//    if md>4 then md:=2 else if md>=2 then md:=1;
  //end
  //else begin
  //  if md>0 then md:=-md;
  //end;
  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    if checkdata.pm.Eye<>0 then x:=-x;
    checkresult.MDev[i]:=99;
    checkresult.MDevPE[i]:=99;
    if checkresult.Dev[i]<>99 then begin
      v:=checkresult.Dev[i]-md;
      checkresult.MDev[i]:=v;
      checkresult.MDevPE[i]:=GetPE_VALUE(x, y, -v, checkdata);
    end;
  end;
end;

function GetGpaDev(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,x,y,n,v,k2,k3:integer;
begin
  Result:=true;
  k2:=0;
  k3:=0;
  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    n:=FindXy(x, y, GpaCheckData);
    if n=0 then continue;
    checkresult.GpaDev[i]:=99;
    checkresult.GpaDevPE[i]:=99;
    if checkresult.MDev[i]<>99 then begin
      v:=checkresult.MDev[i]-GpaCheckResult.MDev[n];
      checkresult.GpaDev[i]:=v;
      v:=GetPE_VALUE(x, y, -v, checkdata);
      if GpaCheckResult.MDevPE[n]=0 then v:=4;
      checkresult.GpaDevPE[i]:=4;
      if (v<4) then begin
        checkresult.GpaDevPE[i]:=GpaDevPE[n];
        GpaDevPE[n]:=GpaDevPE[n]+1;
        if GpaDevPE[n]=2 then inc(k2);
        if GpaDevPE[n]=3 then inc(k3);
        if GpaDevPE[n]>3 then GpaDevPE[n]:=3;
      end
      else begin
        GpaDevPE[n]:=0;
      end;
    end;
  end;
  GpaProgression:=Tr('no Progression');
  if k3>=3 then GpaProgression:=Tr('Likely Progression')
  else if k2>=3 then GpaProgression:=Tr('Possible Progression');
end;

function GetGHT(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,x,y,v:integer;
  ght:array[1..5, 1..2] of double;
  b27:boolean;
begin
  Result:=true;
  b27:=false;
  fillchar(ght, sizeof(ght), 0);
  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    v:=-GetCheckV(checkresult.MDev[i]);
    if checkdata.pm.Eye=0 then x:=-x;
    if isGHT1(x,y) then
    ght[1,1]:=ght[1,1]+v;
    if isGHT2(x,y) then begin
      if (v>=7) and (abs(x)=abs(y)) then b27:=True;
      ght[2,1]:=ght[2,1]+v;
    end;
    if isGHT3(x,y) then ght[3,1]:=ght[3,1]+v;
    if isGHT4(x,y) then ght[4,1]:=ght[4,1]+v;
    if isGHT5(x,y) then ght[5,1]:=ght[5,1]+v;
    if isGHT1(x,-y) then ght[1,2]:=ght[1,2]+v;
    if isGHT2(x,-y) then begin
      if (v>=7) and (abs(x)=abs(y)) then b27:=True;
      ght[2,2]:=ght[2,2]+v;
    end;
    if isGHT3(x,-y) then ght[3,2]:=ght[3,2]+v;
    if isGHT4(x,-y) then ght[4,2]:=ght[4,2]+v;
    if isGHT5(x,-y) then ght[5,2]:=ght[5,2]+v;
  end;

  ght[1,1]:=ght[1,1]/3;
  ght[2,1]:=ght[2,1]/4;
  ght[3,1]:=ght[3,1]/5;
  ght[4,1]:=ght[4,1]/6;
  ght[5,1]:=ght[5,1]/4;

  ght[1,2]:=ght[1,2]/3;
  ght[2,2]:=ght[2,2]/4;
  ght[3,2]:=ght[3,2]/5;
  ght[4,2]:=ght[4,2]/6;
  ght[5,2]:=ght[5,2]/4;

  checkresult.GHT:=3;
  if (ght[1,1]>=5) or (ght[1,2]>=5) or
     (ght[2,1]>=5) or (ght[2,2]>=5) or
     (ght[3,1]>=6) or (ght[3,2]>=6) or
     (ght[4,1]>=6) or (ght[4,2]>=6) or
     (ght[5,1]>=7) or (ght[5,2]>=7)
     then begin
    checkresult.GHT:=0;
    exit;
  end;
  if b27 then begin
    checkresult.GHT:=1;
    exit;
  end;
  if (ght[1,1]>3) or (ght[1,2]>3) or
     (ght[3,1]>=4) or (ght[3,2]>=4) or
     (ght[4,1]>=4) or (ght[4,2]>=4)
     then begin
    checkresult.GHT:=2;
    exit;
  end;
end;

function GetBabie(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
var
  i,j,k,c:integer;
  v:integer;
begin
  Result:=true;
  for i:=1 to checkdata.pm.Dot_Number do begin
    checkresult.Babie[i]:=10*checkresult.Dev[i];
    if checkresult.Dev[i]=99 then checkresult.Babie[i]:=0;
  end;
  for i:=1 to checkdata.pm.Dot_Number do begin
    for j:=i+1 to checkdata.pm.Dot_Number do begin
      if checkresult.Babie[j]>checkresult.Babie[i] then begin
        v:=checkresult.Babie[i];
        checkresult.Babie[i]:=checkresult.Babie[j];
        checkresult.Babie[j]:=v;
      end;
    end;
  end;

  i:=1;
  while (i<=checkdata.pm.Dot_Number-1) do begin
    v:=checkresult.Babie[i];
    c:=0;
    for j:=i+1 to checkdata.pm.Dot_Number-1 do begin
      if v=checkresult.Babie[j] then inc(c) else break;
    end;
    if c<>0 then begin;
      v:=checkresult.Babie[j]-checkresult.Babie[i];
      for k:=1 to c do begin
        inc(checkresult.Babie[i+k], v*k div (c+1));
      end;
      inc(i, c);
    end;
    inc(i);
  end;
end;

function FindGrayXY(checkresult:TCHECKRESULT; i,j,maxj:integer; var x, y:integer):boolean;
begin
  Result:=false;
  y:=-1;
  while j<=maxj do begin
    if checkresult.Gray[i, j]<>-1 then begin
      y:=checkresult.Gray[i, j];
      Result:=true;
      break;
    end;
    inc(j);
  end;
  x:=j;
end;

function GetGray(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT; g:integer; c2:boolean):boolean;
var
  i,j,k:integer;
  x0,y0,x1,y1,nx,ny,xstep,ystep,innerr,x,y,nxdot,nydot:integer;
  rx1,rx2,ry1,ry2:double;
  LR,HB:integer;
begin
  fillchar(checkresult.Gray, sizeof(checkresult.Gray), 0);
  fillchar(checkresult.Gray2, sizeof(checkresult.Gray2), 0);
  checkresult.GrayXCount:=0;
  checkresult.GrayYCount:=0;
  Result:=true;
  x0:=checkdata.ptf.ptleft;
  y0:=checkdata.ptf.pttop;
  x1:=checkdata.ptf.ptright;
  y1:=checkdata.ptf.ptbottom;
  LR:=0;
  if x1>-x0 then
  begin
    x0:=-x1;
    LR:=1;
  end
  else if x1<-x0 then
  begin
    x1:=-x0;
    LR:=2;
  end;
  HB:=0;
  if y0>-y1 then
  begin
    y1:=-y0;
    HB:=1;
  end
  else if y0<-y1 then
  begin
    y0:=-y1;
    HB:=2;
  end;
  xstep:=checkdata.ptf.ptxstep;
  ystep:=checkdata.ptf.ptystep;
  innerr:=checkdata.ptf.innerr;
  nx:=(x1-x0) div xstep;
  ny:=(y0-y1) div ystep;
  nxdot:=(nx*g+1) div 2 * 2;
  nydot:=(ny*g+1) div 2 * 2;
  if nxdot>MAXGRAY then exit;
  if nydot>MAXGRAY then exit;
  for i:=1 to nydot do
  begin
    for j:=1 to nxdot do
    begin
      checkresult.Gray[i, j]:=-1;
    end;
  end;
  inc(ny);

  for k:=1 to checkdata.pm.Dot_Number do
  begin
    x:=checkdata.pt[k].x;
    y:=checkdata.pt[k].y;
    i:=1+(y0-y) div ystep * g;
    j:=1+(x-x0) div xstep * g;
    checkresult.Gray[i, j]:=GetCheckV(checkdata.v[k]);
  end;

  for i:=1 to ny do
  begin
    FindGrayXY(checkresult, 1+(i-1)*g, 1, nxdot, x0, y0);
    FindGrayXY(checkresult, 1+(i-1)*g, x0+1, nxdot, x1, y1);
    for j:=1 to nxdot do
    begin
      if j<x0 then checkresult.Gray[1+(i-1)*g, j]:=y0
      else if j=x0 then continue
      else if j<x1 then checkresult.Gray[1+(i-1)*g, j]:=Round(GetY(x0,y0,x1,y1,j))
      else
      begin
        x0:=x1;
        y0:=y1;
        FindGrayXY(checkresult, 1+(i-1)*g, x0+1, nxdot, x1, y1);
        if y1=-1 then y1:=y0;
      end;
    end;
  end;

  for i:=1 to ny-1 do
  begin
    for j:=1 to nxdot do
    begin
      x0:=0;
      y0:=checkresult.Gray[1+(i-1)*g, j];
      x1:=g;
      y1:=checkresult.Gray[1+(i-0)*g, j];
      for k:=1 to g-1 do
      begin
        checkresult.Gray[1+(i-1)*g+k, j]:=Round(GetY(x0,y0,x1,y1,k))
      end;
    end;
  end;

  if LR=1 then
  begin
    for i:=1 to nydot do
    begin
      checkresult.Gray[i, 1]:=-1;
    end;
  end
  else if LR=2 then
  begin
    for i:=1 to nydot do
    begin
      checkresult.Gray[i, nxdot]:=-1;
    end;
  end;

  if HB=1 then
  begin
    for i:=1 to nxdot do
    begin
      checkresult.Gray[nydot, i]:=-1;
    end;
  end
  else if HB=2 then
  begin
    for i:=1 to nydot do
    begin
      for j:=1 to g do
      begin
        checkresult.Gray[j, i]:=-1;
      end;
    end;
  end;

  if checkdata.pm.Range<>5 then
  begin
    for i:=1 to nydot do
    begin
      for j:=1 to nxdot do
      begin
        rx1:=(nxdot-1)/2;
        ry1:=(nydot-1)/2;
        rx2:=(j-1)-rx1;
        ry2:=ry1-(i-1);
        rx1:=(1.04)*rx1;
        ry1:=(1.04)*ry1;
        rx2:=rx2/rx1;
        ry2:=ry2/ry1;
        if (rx2*rx2+ry2*ry2)>1.0 then checkresult.Gray[i,j]:=-1;
      end;
    end;
  end;

  if checkdata.ptf.innerr>0 then begin
    for i:=1 to nydot do begin
      for j:=1 to nxdot do begin
        rx1:=(nxdot-1)/2;
        ry1:=(nydot-1)/2;
        rx2:=(j-1)-rx1;
        ry2:=(i-1)-ry1;
        rx1:=innerr/xstep*g;
        ry1:=rx1*ystep/xstep;
        rx1:=(0.99)*rx1;
        ry1:=(0.99)*ry1;
        rx2:=rx2/rx1;
        ry2:=ry2/ry1;
        if (rx2*rx2+ry2*ry2)<1.0 then checkresult.Gray[i,j]:=-1;
      end;
    end;
  end;

  i:=nydot div 2;
  for j:=1 to nxdot do begin
    checkresult.Gray[i+0, j]:=checkresult.Gray[i-1, j];
    checkresult.Gray[i+1, j]:=checkresult.Gray[i+2, j];
  end;

  for i:=1 to nydot do begin
    for j:=1 to nxdot do begin
      if (c2) then checkresult.Gray2[i,j]:=checkresult.Gray[i,j];
      if checkresult.Gray[i,j]<>-1 then begin
        if checkresult.Gray[i,j]=0 then checkresult.Gray[i,j]:=0
        else if checkresult.Gray[i,j]<=5  then checkresult.Gray[i,j]:=1
        else if checkresult.Gray[i,j]<=10 then checkresult.Gray[i,j]:=2
        else if checkresult.Gray[i,j]<=15 then checkresult.Gray[i,j]:=3
        else if checkresult.Gray[i,j]<=20 then checkresult.Gray[i,j]:=4
        else if checkresult.Gray[i,j]<=25 then checkresult.Gray[i,j]:=5
        else if checkresult.Gray[i,j]<=30 then checkresult.Gray[i,j]:=6
        else if checkresult.Gray[i,j]<=35 then checkresult.Gray[i,j]:=7
        else if checkresult.Gray[i,j]<=40 then checkresult.Gray[i,j]:=8
        else checkresult.Gray[i,j]:=9;
      end;
    end;
  end;
  checkresult.GrayXCount:=nxdot;
  checkresult.GrayYCount:=nydot;
end;

function GetCheckData(var checkdata:TCHECKDATA):boolean;
var
  i,x,y:integer;
begin
  Result:=true;
  GetPTFeature(checkdata);
  for i:=1 to checkdata.pm.Dot_Number do
  begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    checkdata.sv[i]:=GetNORMAL_VALUE(x, y, checkdata.pm.Age, checkdata.pm.Eye, checkdata);
  end;
end;

function GetCheckResult(checkdata:TCHECKDATA; var checkresult:TCHECKRESULT):boolean;
begin
  Result:=true;
  GetCheckData(checkdata);
  if checkdata.pm.Dot_Number=0 then exit;
  if checkdata.pm.Range=0 then exit;

  GetSF(checkdata, checkresult);
  GetGray(checkdata, checkresult, 3, False);
  GetDev(checkdata, checkresult);
  GetPSD(checkdata, checkresult);
  GetMDev(checkdata, checkresult);
  GetGpaDev(checkdata, checkresult);
  GetBabie(checkdata, checkresult);
  GetGHT(checkdata, checkresult);
end;

function GetCheckReport(checkdata:TCheckData; var checkreport:TCheckReport):boolean;
var
  i,seen,notseen,v:integer;
begin

  checkreport.Eye:=Tr('Eye'+IntToStr(checkdata.pm.Eye));

  checkreport.Fixation_Monitor:=Tr('OFF_ON'+IntToStr(checkdata.pm.Fixation_Monitor));
  checkreport.Fixation_Target:=Tr('Fixation_Target'+IntToStr(checkdata.pm.Fixation_Mode));

  checkreport.Fixation_Losses:=Format('%d/%d', [checkdata.fixationcount, checkdata.fixationlength]);
//  checkreport.False_POS_Errors:=Format('%d/%d', [checkdata.poscount, checkdata.poslength]);
//  checkreport.False_NEG_Errors:=Format('%d/%d', [checkdata.negcount, checkdata.neglength]);
  checkreport.False_POS_Errors:=Format('%d%%', [round(checkdata.poscount*100/(checkdata.poslength+0.001))]);
  checkreport.False_NEG_Errors:=Format('%d%%', [round(checkdata.negcount*100/(checkdata.neglength+0.001))]);
  checkreport.Fovea:=Tr('OFF_ON'+IntToStr(checkdata.pm.Fovea)); //％
  checkreport.FoveaDB:=Format('%ddB', [checkdata.v[checkdata.pm.Dot_Number]]);

  if checkdata.pm.Fovea=0 then checkreport.FoveaDB:=Tr('OFF');

  checkreport.Stimulus:=Tr('StimulusSize'+IntToStr(checkdata.pm.Stimulus_Size))+','+Tr('StimulusColor'+IntToStr(checkdata.pm.Stimulus_Color));
  checkreport.Background:='31.5 ASB';
  if checkdata.pm.Background_Color=1 then checkreport.Background:='315 ASB';
  checkreport.Strategy:=Tr('Strategy'+IntToStr(checkdata.pm.Strategy));
  checkreport.Age:=IntToStr(checkdata.pm.Age);
  checkreport.Test_Duration:=Format('%2.2d:%2.2d', [checkdata.testms div 1000 div 60, checkdata.testms div 1000 mod 60]);
  seen:=0;
  notseen:=0;
  for i:=1 to checkdata.pm.Dot_Number do
  begin
    v:=checkdata.v[i];
    if v>=0 then inc(seen) else inc(notseen);
  end;
  checkreport.Seen:=Format('%d/%d', [seen, checkdata.pm.Dot_Number]);
  checkreport.NotSeen:=Format('%d/%d', [notseen, checkdata.pm.Dot_Number]);

  Result:=true;
end;

function GetCheckReport2(checkdata:TCheckData; checkresult:TCheckResult; checkdb:TDataSet; var checkreport:TCheckReport):boolean;
var
  md,psd:string;
begin
  GetCheckReport(checkdata, checkreport);
  checkreport.Pupil_Diameter:=checkdb.FieldByName('Pupil0').AsString;
  checkreport.Visual_Acuity:=checkdb.FieldByName('Vision0').AsString+'\'+checkdb.FieldByName('Vision1').AsString;
  checkreport.GHT:=Tr(Format('GHT%d', [checkresult.GHT]));

  psd:='';
  if checkresult.PSD>4.3 then psd:='(P<0.5%)'
  else if checkresult.PSD>3.7 then psd:='(P<1%)'
  else if checkresult.PSD>3.2 then psd:='(P<2%)'
  else if checkresult.PSD>2.5 then psd:='(P<5%)'
  else if checkresult.PSD>2.0 then psd:='P<10%';
  checkreport.PSD:=Format('%0.2f', [checkresult.PSD])+psd;

  md:='';
  if checkresult.MD<-5.5 then md:='(P<0.5%)'
  else if checkresult.MD<-3.5 then md:='(P<1%)'
  else if checkresult.MD<-2.6 then md:='(P<2%)'
  else if checkresult.MD<-2.0 then md:='(P<5%)'
  else if checkresult.MD<-1.5 then md:='(P<10%)';
  checkreport.MD:=Format('%0.2f', [checkresult.MD])+md;

  Result:=true;
end;

function ReadXwCheckData:boolean;
var
  s:string;
  cmdlen,datpos,datlen:integer;
begin
  Result:=false;
  datpos:=0;
  datlen:=11*240;
  cmdlen:=8;
  SetLength(s, cmdlen);
  s[1]:=char(cmdlen div 256);
  s[2]:=char(cmdlen and $ff);
  s[3]:=#1;
  s[4]:=char(datpos div 65536);
  s[5]:=char(datpos div 256);
  s[6]:=char(datpos and $ff);
  s[7]:=char(datlen div 256);
  s[8]:=char(datlen and $ff);
  if FXwxh.ClientSocketRD.Active then
  begin
    FXwxh.ClientSocketRD.Socket.SendText(s);
    Result:=true;
  end;
end;

function WaitWriteOk:boolean;
var
  tick:DWord;
begin
  Result:=false;
  WriteOk:='';
  tick:=GetTickCount;
  while GetTickCount-tick<3000 do begin
    if WriteOk<>'' then begin
      if Copy(WriteOk, Length(WriteOk)-1, 2)='OK' then begin
        WriteTick:=GetTickCount-tick;
        if WriteTick>=MaxWriteTick then MaxWriteTick:=WriteTick;
        Result:=true;
      end;
      exit;
    end;
    Application.ProcessMessages;
  end;
end;

function WriteXwRunstate(d:TCHECKDATA):boolean;
var
  s:string;
  cmdlen,datpos,datlen:integer;
begin
  datpos:=0;
  datlen:=4;
  cmdlen:=8+datlen;
  SetLength(s, cmdlen);
  s[1]:=char(cmdlen div 256);
  s[2]:=char(cmdlen and $ff);
  s[3]:=#2;
  s[4]:=char(datpos div 65536);
  s[5]:=char(datpos div 256);
  s[6]:=char(datpos and $ff);
  s[7]:=char(datlen div 256);
  s[8]:=char(datlen and $ff);
  Move(d.runstate, s[9], datlen);
  FXwxh.ClientSocketWR.Socket.SendText(s);
  Result:=WaitWriteOk;
end;

function WriteXwCheckData:boolean;
var
  s:string;
  cmdlen,datpos,datlen:integer;
begin
  Result:=false;
  GetCheckData(DemoCheckData);
  datpos:=960;
  datlen:=7*240;
  cmdlen:=8+datlen;
  SetLength(s, cmdlen);
  s[1]:=char(cmdlen div 256);
  s[2]:=char(cmdlen and $ff);
  s[3]:=#2;
  s[4]:=char(datpos div 65536);
  s[5]:=char(datpos div 256);
  s[6]:=char(datpos and $ff);
  s[7]:=char(datlen div 256);
  s[8]:=char(datlen and $ff);
  Move(DemoCheckData.pm, s[9], datlen);
  if FXwxh.ClientSocketWR.Active then
  begin
    FXwxh.ClientSocketWR.Socket.SendText(s);
    Result:=WaitWriteOk;
  end;
end;

function WriteXwProgram:boolean;
var
  s:string;
  cmdlen,datpos,datlen:integer;
begin
  Result:=false;
  datpos:=4;
  datlen:=9*240;
  cmdlen:=8+datlen;
  SetLength(s, cmdlen);
  s[1]:=char(cmdlen div 256);
  s[2]:=char(cmdlen and $ff);
  s[3]:=#2;
  s[4]:=char(datpos div 65536);
  s[5]:=char(datpos div 256);
  s[6]:=char(datpos and $ff);
  s[7]:=char(datlen div 256);
  s[8]:=char(datlen and $ff);
  Move(DemoCheckData.runstate30, s[9], datlen);
  if FXwxh.ClientSocketWR.Active then
  begin
    FXwxh.ClientSocketWR.Socket.SendText(s);
    Result:=WaitWriteOk;
  end;
end;

function WriteXwSaveData:boolean;
var
  s:string;
  cmdlen,datpos,datlen:integer;
begin
  Result:=false;
  GetCheckData(DemoCheckData);
  datpos:=$10000;
  datlen:=sizeof(SaveData);
  cmdlen:=8+datlen;
  SetLength(s, cmdlen);
  s[1]:=char(cmdlen div 256);
  s[2]:=char(cmdlen and $ff);
  s[3]:=#2;
  s[4]:=char(datpos div 65536);
  s[5]:=char(datpos div 256);
  s[6]:=char(datpos and $ff);
  s[7]:=char(datlen div 256);
  s[8]:=char(datlen and $ff);
  Move(SaveData, s[9], datlen);
  if FXwxh.ClientSocketWR.Active then
  begin
    FXwxh.ClientSocketWR.Socket.SendText(s);
    Result:=WaitWriteOk;
  end;
end;

procedure GetDemo;
var
  i,j,x,y:integer;
	latitude,longitude:double;
begin
/////改为求DOT_XY2
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

{
  for i:=1 to 24 do
  begin
    for j:=1 to 20 do
    begin
//			latitude:=DOT_XY2[i,j,1];
//2014.5.26改
			latitude:=DOT_XY2[i,j,1]/10;
			longitude:=DOT_XY2[i,j,2];
			x:=Round(latitude*cos(abs(longitude*pi/180)));
			y:=Round(latitude*sin(abs(longitude*pi/180)));
			DOT_XY[i,j,1]:=x;
			DOT_XY[i,j,2]:=y;
    end;
  end;
 }
  //为演示准备数据
  for i:=1 to MAXCHECK do
  begin
    DemoCheckData.v[i]:=-1;
    DemoCheckData.sfv[i]:=-1;
  end;

  for i:=1 to DemoCheckData.pm.Dot_Number do
  begin
    DemoCheckData.pt[i].x:=PT30_2[i][1];
    DemoCheckData.pt[i].y:=PT30_2[i][2];
    DemoCheckData.v[i]:=DemoData30_2[i];
  end;

  DemoCheckData.sfv[5]:=30;
  DemoCheckData.sfv[15]:=31;
  DemoCheckData.sfv[25]:=32;
  GetCheckResult(DemoCheckData, DemoCheckResult);
end;

function XwCreatePT(outerr:integer; innerr:integer; step:integer; pt:PTCHECKPOINT):integer;
var
  pt2:array[1..20*MAXCHECK] of TCHECKPOINT;
  i,n,k,x,y,r:integer;
begin
  x:=-outerr+(step div 2);
  y:=abs(x);
  n:=1;
  while true do begin
    pt2[n].x:=x;
    pt2[n].y:=y;
    inc(x, step);
    if x>=outerr then begin
      x:=-outerr+(step div 2);
      dec(y, step);
      if (-y)>=outerr then break;
    end;
    inc(n);
  end;
  k:=0;
  for i:=1 to n do begin
    x:=pt2[i].x;
    y:=pt2[i].y;
    r:=x*x+y*y;
    if (r>=(innerr*innerr)) and (r<=outerr*outerr) then begin
      pt^:=pt2[i];
      inc(pt);
      inc(k);
      if k=MAXCHECK then begin
        Result:=k;
        exit;
      end;
    end;
  end;
  Result:=k;
end;

function XwCreatePT2(x0,y0,x1,y1:integer; step:integer; pt:PTCHECKPOINT):integer;
var
  i,j,xn,yn,n:integer;
begin
  step:=step div 2;
  if step=0 then step:=1;
  x0:=(x0 div step)*step;
  y0:=(y0 div step)*step;
  x1:=(x1 div step)*step;
  y1:=(y1 div step)*step;
  n:=0;
  xn:=(x1-x0) div (2*step)+1;
  yn:=(y0-y1) div (2*step)+1;
  for i:=1 to yn do begin
    for j:=1 to xn do begin
      pt^.x:=x0+(j-1)*2*step;
      pt^.y:=y0-(i-1)*2*step;
      inc(pt);
      inc(n);
      if n=MAXCHECK then begin
        Result:=n;
        exit;
      end;
    end;
  end;
  Result:=n;
end;

procedure CanvasTextOut(canvas:TCanvas; x,y:integer; s:string);
var
  size:TSize;
begin
  size:=canvas.TextExtent(s);
  dec(x, size.cx div 2);
  dec(y, size.cy div 2);
  canvas.TextOut(x, y, s);
end;

procedure CanvasTextOut2(canvas:TCanvas; x,y:integer; s1,s2:string);
var
  size:TSize;
begin
  size:=canvas.TextExtent(s1);
  canvas.TextOut(x-size.cx div 2, y-size.cy, s1);
  size:=canvas.TextExtent(s2);
  canvas.TextOut(x-size.cx div 2, y, s2);
end;

procedure CanvasLine(canvas:TCanvas; x1,y1,x2,y2:integer);
begin
  canvas.MoveTo(x1, y1);
  canvas.LineTo(x2, y2);
end;

procedure DrawAxis(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);
var
  xc,yc,x1,y1,r:integer;
  i,j,k:integer;
  x,y:integer;
  jd:double;
  s:string;
  range:integer;
begin
  range:=checkdata.pm.Range;
  if range=0 then Exit;
  canvas.Brush.Color:=$00515151; // clBtnShadow;
  canvas.Rectangle(0, 0, w, h);
  canvas.Brush.Color:=clWhite;

  xc:=x0+w div 2;
  yc:=y0+h div 2;
  if w>h then w:=h;

  if w>100 then dec(w, 40);
  h:=w;
  x0:=xc-(w div 2);
  y0:=yc-(h div 2);
  x1:=x0+w;
  y1:=y0+h;
  r:=h div 2;

  for i:=0 to 4 do begin
    if i>0 then canvas.Pen.Style:=psDot;
    canvas.Ellipse(x0+i*w div 10, y0+i*h div 10, x1-i*w div 10, y1-i*h div 10);
  end;

  if checkdata.pm.Strategy>=30 then begin
    for i:=0 to 3 do begin
      for j:=1 to 2 do begin
        jd:=(i*90+30*j)*pi/180;
        canvas.MoveTo(xc+Round(10*cos(jd)), yc-Round(10*sin(jd)));
        canvas.LineTo(xc+Round(r*cos(jd)), yc-Round(r*sin(jd)));
      end;
    end;
  end;
  canvas.Pen.Style:=psSolid;

  canvas.MoveTo(x0, yc);
  canvas.LineTo(x1, yc);

  canvas.MoveTo(xc, y0);
  canvas.LineTo(xc, y1);

  for i:=0 to 3 do begin
    jd:=(90*i)*pi/180;
    x:=xc+round(r*cos(jd));
    y:=yc-round(r*sin(jd));
    s:=IntToStr(i*90);
    CanvasTextOut(canvas, x, y, s);
  end;

  for i:=0 to 3 do begin
    for j:=1 to 4 do begin
      x:=xc;
      y:=yc;
      k:=j*range div 5;
      if (i=2) or (i=3) then k:=-k;
      if (i=0) or (i=2) then inc(x, k*r div range) else dec(y, k*r div range);
      s:=IntToStr(k);
      CanvasTextOut(canvas, x, y, s);
    end;
  end;

  s:='  ('+IntToStr(range)+')  ';
  CanvasTextOut(canvas, xc+r, yc, s);
  CanvasTextOut(canvas, xc-r, yc, s);
  CanvasTextOut(canvas, xc, yc+r, s);
  CanvasTextOut(canvas, xc, yc-r, s);

  if range>15 then begin
    x:=Round(GetY(-range, -w div 2, range, w div 2, 14));
    y:=Round(GetY(-range, -w div 2, range, w div 2, 1));
    if checkdata.pm.Eye=0 then x:=xc-x else x:=xc+x;
    y:=yc+y;
    CanvasTextOut(canvas, x, y, 'o');
  end;
end;

procedure DrawAxis2(canvas:TCanvas; xc,yc,w,h:integer; checkdata:TCHECKDATA);
begin
  canvas.MoveTo(xc, yc+h div 2);
  canvas.LineTo(xc, yc-h div 2);

  canvas.MoveTo(xc+w div 2, yc);
  canvas.LineTo(xc-w div 2, yc);
end;

procedure DrawAxis3(canvas:TCanvas; xc,yc,w,h:integer; checkdata:TCHECKDATA);
var
  i,n:integer;
begin
  DrawAxis2(canvas, xc,yc,w,h, checkdata);
  n:=checkdata.pm.Range div 10;
  if n<=1 then n:=3;
  for i:=1 to n do begin
    CanvasLine(canvas, xc+i*w div (2*n), yc-2, xc+i*w div (2*n), yc+2);
    CanvasLine(canvas, xc-i*w div (2*n), yc-2, xc-i*w div (2*n), yc+2);
    CanvasLine(canvas, xc-2, yc+i*h div (2*n), xc+2, yc+i*h div (2*n));
    CanvasLine(canvas, xc-2, yc-i*h div (2*n), xc+2, yc-i*h div (2*n));
  end;
end;


procedure DrawAxis4(canvas:TCanvas; xc,yc,w,h:integer; checkdata:TCHECKDATA);
var
  i,n:integer;
begin
  DrawAxis2(canvas, xc,yc,w,h, checkdata);
  n:=checkdata.pm.Range div 10;
  if n<=1 then n:=3;
  for i:=1 to n do begin
    CanvasLine(canvas, xc+i*w div (2*n), yc-2, xc+i*w div (2*n), yc+2);
    CanvasLine(canvas, xc-i*w div (2*n), yc-2, xc-i*w div (2*n), yc+2);
    CanvasLine(canvas, xc-2, yc+i*h div (2*n), xc+2, yc+i*h div (2*n));
    CanvasLine(canvas, xc-2, yc-i*h div (2*n), xc+2, yc-i*h div (2*n));
//    if ((i mod 3=0) and (i<n)) then
    if (i<n) then
    begin
      CanvasTextOut(canvas, xc+i*w div (2*n), yc+2, IntToStr(i*10));
      CanvasTextOut(canvas, xc-i*w div (2*n), yc+2, IntToStr(i*10));
    end;
  end;
end;


function arctan_a(x,y:double):double;
var
  jd:double;
begin
  if x=0 then begin
    jd:=90;
    if y<0 then jd:=270;
  end
  else begin
    jd:=abs(arctan(y/x));
    jd:=jd*180/pi;
    if (x<0) and (y>=0) then jd:=180-jd;
    if (x<0) and (y<0) then jd:=180+jd;
    if (x>0) and (y<0) then jd:=360-jd;
  end;
  Result:=jd;
end;

function MoveNearestPt(n:integer; checkdata:TCHECKDATA):integer;
var
  i,mini:integer;
  x1,y1,x2,y2,d1,d2,d,mind:double;
begin
  mini:=0;
  x2:=checkdata.pt[n].x;
  y2:=checkdata.pt[n].y;
  d2:=arctan_a(x2, y2);
  mind:=999999;
  for i:=1 to checkdata.pm.Dot_Number do begin
    if i<>n then begin
      x1:=checkdata.pt[i].x;
      y1:=checkdata.pt[i].y;
      d1:=arctan_a(x1,y1);
      d:=d1-d2;
      if d<0 then d:=d+360;
      if d<mind then begin
        mind:=d;
        mini:=i;
      end;
    end;
  end;
  Result:=mini;
end;

procedure DrawValue(Canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; showr:boolean);
var
  xc,yc,r,x_1,y_1:integer;
  i,j:integer;
  x,y:integer;
  s1,s2:string;
  v,sfv,vcount:integer;
  range:integer;
begin
  range:=checkdata.pm.Range;
  if range=0 then Exit;
  canvas.Font.Color:=clBlue;
  canvas.Font.Style:=[fsBold];

  xc:=x0+w div 2;
  yc:=y0+h div 2;
  if w>h then w:=h;

  if w>100 then dec(w, 40);
  h:=w;
  r:=h div 2;

  x_1:=0;
  y_1:=0;
  vcount:=0;
  for i:=1 to checkdata.pm.Dot_Number do
  begin
    s1:='';
    s2:='';
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    if (checkdata.pm.Strategy>=30) then
    begin
      if (checkdata.v[i]<>-99) and (checkdata.sfv[i]<>-99) then
      begin
        x:=checkdata.v[i];
        y:=checkdata.sfv[i];
      end;
    end;
    x:=xc+(x*r div range);
    y:=yc-(y*r div range);
    if not showr then
    begin
      canvas.Brush.color:=clGray;
      canvas.Ellipse(x-2, y-2, x+2, y+2);
      continue;
    end;
    if (checkdata.pm.Strategy=10) or (checkdata.pm.Strategy=11) or (checkdata.pm.Strategy=12) then
    begin
      dec(x, FXwxh.SE0.Width div 2);
      dec(y, FXwxh.SE0.Height div 2);
      v:=GetSE_VALUE(checkdata.v[i], abs(checkdata.sv[i]), checkdata.pm.Strategy);
      if v=0 then canvas.Draw(x, y, FXwxh.SE0.Picture.Graphic)
      else if v=1 then canvas.Draw(x, y, FXwxh.SE1.Picture.Graphic)
      else if v=2 then canvas.Draw(x, y, FXwxh.SE2.Picture.Graphic)
      else if v=3 then canvas.Draw(x, y, FXwxh.SE3.Picture.Graphic)
      else if v=5 then CanvasTextOut(canvas, x, y, Format('%d', [checkdata.v[i]]));
    end
    else if (checkdata.pm.Strategy=30) or (checkdata.pm.Strategy=34) then
    begin
      canvas.Ellipse(x-2, y-2, x+2, y+2);
      canvas.MoveTo(x,y);
      j:=MoveNearestPt(i, checkdata);
      x:=checkdata.pt[j].x;
      y:=checkdata.pt[j].y;
      if (checkdata.v[j]<>-99) and (checkdata.sfv[j]<>-99) then
      begin
        x:=checkdata.v[j];
        y:=checkdata.sfv[j];
      end;
      x:=xc+(x*r div range);
      y:=yc-(y*r div range);
      canvas.LineTo(x,y);
    end
    else if (checkdata.pm.Strategy=31) or (checkdata.pm.Strategy=32) then
    begin
      if i=1 then
      begin
        canvas.MoveTo(x,y);
        x_1:=x;
        y_1:=y;
      end
      else canvas.LineTo(x,y);
      if i=checkdata.pm.Dot_Number then canvas.LineTo(x_1,y_1);
      canvas.Ellipse(x-2, y-2, x+2, y+2);
    end
    else
    begin
      v:=GetCheckV(checkdata.v[i]);
      if v<>-1 then
      begin
        s1:=Format('%d', [v]);
      end;

      sfv:=GetCheckV(checkdata.sfv[i]);
      if XwData.oprank=3 then
      begin
        sfv:=checkdata.vcount[i];
        inc(vcount, sfv);
      end;
      if sfv<>-1 then
      begin
        s2:=Format('(%d)', [sfv]);
      end;
      if (s1<>'') and (s2<>'') then CanvasTextOut2(canvas, x, y, s1, s2)
      else if s1<>'' then CanvasTextOut(canvas, x, y, s1)
      else CanvasTextOut(canvas, x, y, s2);
    end;
  end;
  canvas.Font.Color:=clBlack;
  canvas.Font.Style:=[];
  if vcount>0 then canvas.TextOut(0, 0, Format('%d', [vcount]));
end;

procedure DrawValue2(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT; select:integer; xy:integer; dev:boolean);
var
  xc,yc,r:integer;
  i:integer;
  x,y:integer;
  s1,s2:string;
  v,sfv:integer;
  range:integer;
  rect:TRect;
begin
  range:=checkdata.pm.Range;

  xc:=x0+w div 2;
  yc:=y0+h div 2;
  if w>h then w:=h;

  h:=w;
  r:=h div 2;

  canvas.Font:=FXwxh.LaCount.Font;
  rect.Left:=0;
  rect.Top:=0;
  rect.Right:=w;
  rect.Bottom:=h;
  canvas.FillRect(rect);

  if ((select=3) or (select=4)) and (checkresult.MD<=-20) then begin
    x:=xc-canvas.TextExtent(tr('Pattern Deviation not')).cx div 2;
    y:=yc-40;
    canvas.TextOut(x, y+0, tr('Pattern Deviation not'));
    canvas.TextOut(x, y+20, tr('Shown for serverely'));
    canvas.TextOut(x, y+40, tr('Depressed fields. Refer'));
    canvas.TextOut(x, y+60, tr('to Total Deviation'));
    exit;
  end;
  if select=-1 then exit;
  DrawAxis3(canvas, xc, yc, w, h, checkdata);
  if select=-2 then exit;

  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    if (select=7) or (select=8) then begin
      if FindXy(x,y,GpaCheckData)=0 then continue;
    end;
    x:=xc+(x*r div range);
    y:=yc-(y*r*xy div range div 100);
    if y>rect.Bottom-8 then y:=rect.Bottom-8;
    if y<rect.Top+8 then y:=rect.Top+8;
    v:=GetCheckV(checkdata.v[i]);
    if select=1 then v:=checkresult.Dev[i];
    if select=2 then v:=checkresult.DevPE[i];
    if select=3 then v:=checkresult.MDev[i];
    if select=4 then v:=checkresult.MDevPE[i];
    if select=6 then v:=checkresult.Dev[i];
    if select=7 then v:=checkresult.GpaDev[i];
    if select=8 then v:=checkresult.GpaDevPE[i];
    if select=9 then v:=abs(checkdata.sv[i]);
    if select=9 then v:=GetNORMAL_VALUE(checkdata.pt[i].x, checkdata.pt[i].y, checkdata.pm.Age, checkdata.pm.Eye, checkdata);
    if v<>99 then begin
      s1:='';
      s2:='';
      if (select=0) then begin
        v:=GetCheckV(checkdata.v[i]);
        if v<>-1 then begin
          s1:=Format('%d', [v]);
        end;
        sfv:=GetCheckV(checkdata.sfv[i]);
        if sfv<>-1 then begin
          s2:=Format('(%d)', [sfv]);
        end;
        if (s1<>'') and (s2<>'') then CanvasTextOut2(canvas, x, y, s1, s2)
        else if s1<>'' then CanvasTextOut(canvas, x, y, s1)
        else CanvasTextOut(canvas, x, y, s2);
      end
      else if (select=2) or (select=4) then begin
        if dev then begin
          dec(x, FXwxh.PE0.Width div 2);
          dec(y, FXwxh.PE0.Height div 2);
          if v=0 then canvas.Draw(x, y, FXwxh.PE0.Picture.Graphic);
          if v=1 then canvas.Draw(x, y, FXwxh.PE1.Picture.Graphic);
          if v=2 then canvas.Draw(x, y, FXwxh.PE2.Picture.Graphic);
          if v=3 then canvas.Draw(x, y, FXwxh.PE3.Picture.Graphic);
          if v=4 then canvas.Draw(x, y, FXwxh.PE4.Picture.Graphic);
        end;
      end
      else if (select=5) then begin
        dec(x, FXwxh.SE0.Width div 2);
        dec(y, FXwxh.SE0.Height div 2);
        v:=GetSE_VALUE(checkdata.v[i], abs(checkdata.sv[i]), checkdata.pm.Strategy);
        if v=0 then canvas.Draw(x, y, FXwxh.SE0.Picture.Graphic)
        else if v=1 then canvas.Draw(x, y, FXwxh.SE1.Picture.Graphic)
        else if v=2 then canvas.Draw(x, y, FXwxh.SE2.Picture.Graphic)
        else if v=3 then canvas.Draw(x, y, FXwxh.SE3.Picture.Graphic)
        else if v=5 then CanvasTextOut(canvas, x, y, Format('%d', [-checkresult.Dev[i]]));
      end
      else if (select=6) then begin
        if v>-4 then begin
          dec(x, FXwxh.DE0.Width div 2);
          dec(y, FXwxh.DE0.Height div 2);
          canvas.Draw(x, y, FXwxh.DE0.Picture.Graphic);
        end
        else begin
          s1:=Format('%d', [-v]);
          CanvasTextOut(canvas, x, y, s1);
        end;
      end
      else if (select=8) then begin
        dec(x, FXwxh.GpaPE0.Width div 2);
        dec(y, FXwxh.GpaPE0.Height div 2);
        if v=0 then canvas.Draw(x, y, FXwxh.GpaPE0.Picture.Graphic)
        else if v=1 then canvas.Draw(x, y, FXwxh.GpaPE1.Picture.Graphic)
        else if v=2 then canvas.Draw(x, y, FXwxh.GpaPE2.Picture.Graphic)
        else if v=3 then canvas.Draw(x, y, FXwxh.GpaPE3.Picture.Graphic)
        else if v=4 then canvas.Draw(x, y, FXwxh.GpaPE4.Picture.Graphic);
      end
      else begin
        if dev then begin
          s1:=Format('%d', [v]);
          CanvasTextOut(canvas, x, y, s1);
        end;
      end;
    end;
  end;
  if ((checkdata.pm.Strategy<10) and (select=0)) or
     (checkdata.pm.Strategy=10) or
     (checkdata.pm.Strategy=11) or
     (checkdata.pm.Strategy=12) then begin
    if range>15 then begin
      x:=Round(GetY(-range, -w div 2, range, w div 2, 14));
      y:=Round(GetY(-range, -w div 2, range, w div 2, 1));
      if checkdata.pm.Eye=0 then x:=xc-x else x:=xc+x;
      y:=yc+y;
      x:=x-FXwxh.SE3.Width div 2;
      y:=y-FXwxh.SE3.Height div 2;
      canvas.Draw(x, y, FXwxh.SE3.Picture.Graphic);
    end;
  end;
end;

procedure DrawValue4(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT; select:integer; xy:integer; dev:boolean);
var
  xc,yc,r:integer;
  i:integer;
  x,y:integer;
  s1,s2:string;
  v,sfv:integer;
  range:integer;
  rect:TRect;
begin
  range:=checkdata.pm.Range;

  xc:=x0+w div 2;
  yc:=y0+h div 2;
  if w>h then w:=h;

  h:=w;
  r:=h div 2;

  canvas.Font:=FXwxh.LaCount.Font;
  rect.Left:=0;
  rect.Top:=0;
  rect.Right:=w;
  rect.Bottom:=h;
  canvas.FillRect(rect);

  if ((select=3) or (select=4)) and (checkresult.MD<=-20) then begin
    x:=xc-canvas.TextExtent(tr('Pattern Deviation not')).cx div 2;
    y:=yc-40;
    canvas.TextOut(x, y+0, tr('Pattern Deviation not'));
    canvas.TextOut(x, y+20, tr('Shown for serverely'));
    canvas.TextOut(x, y+40, tr('Depressed fields. Refer'));
    canvas.TextOut(x, y+60, tr('to Total Deviation'));
    exit;
  end;
  if select=-1 then exit;
  DrawAxis4(canvas, xc, yc, w, h, checkdata);
  if select=-2 then exit;

  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    if (select=7) or (select=8) then begin
      if FindXy(x,y,GpaCheckData)=0 then continue;
    end;
    x:=xc+(x*r div range);
    y:=yc-(y*r*xy div range div 100);
    if y>rect.Bottom-8 then y:=rect.Bottom-8;
    if y<rect.Top+8 then y:=rect.Top+8;
    v:=GetCheckV(checkdata.v[i]);
    if select=1 then v:=checkresult.Dev[i];
    if select=2 then v:=checkresult.DevPE[i];
    if select=3 then v:=checkresult.MDev[i];
    if select=4 then v:=checkresult.MDevPE[i];
    if select=6 then v:=checkresult.Dev[i];
    if select=7 then v:=checkresult.GpaDev[i];
    if select=8 then v:=checkresult.GpaDevPE[i];
    if select=9 then v:=abs(checkdata.sv[i]);
    if select=9 then v:=GetNORMAL_VALUE(checkdata.pt[i].x, checkdata.pt[i].y, checkdata.pm.Age, checkdata.pm.Eye, checkdata);
    if v<>99 then begin
      s1:='';
      s2:='';
      if (select=0) then begin
        v:=GetCheckV(checkdata.v[i]);
        if v<>-1 then begin
          s1:=Format('%d', [v]);
        end;
        sfv:=GetCheckV(checkdata.sfv[i]);
        if sfv<>-1 then begin
          s2:=Format('(%d)', [sfv]);
        end;
        if (s1<>'') and (s2<>'') then CanvasTextOut2(canvas, x, y, s1, s2)
        else if s1<>'' then CanvasTextOut(canvas, x, y, s1)
        else CanvasTextOut(canvas, x, y, s2);
      end
      else if (select=2) or (select=4) then begin
        if dev then begin
          dec(x, FXwxh.PE0.Width div 2);
          dec(y, FXwxh.PE0.Height div 2);
          if v=0 then canvas.Draw(x, y, FXwxh.PE0.Picture.Graphic);
          if v=1 then canvas.Draw(x, y, FXwxh.PE1.Picture.Graphic);
          if v=2 then canvas.Draw(x, y, FXwxh.PE2.Picture.Graphic);
          if v=3 then canvas.Draw(x, y, FXwxh.PE3.Picture.Graphic);
          if v=4 then canvas.Draw(x, y, FXwxh.PE4.Picture.Graphic);
        end;
      end
      else if (select=5) then begin
        dec(x, FXwxh.SE0.Width div 2);
        dec(y, FXwxh.SE0.Height div 2);
        v:=GetSE_VALUE(checkdata.v[i], abs(checkdata.sv[i]), checkdata.pm.Strategy);
        if v=0 then canvas.Draw(x, y, FXwxh.SE0.Picture.Graphic)
        else if v=1 then canvas.Draw(x, y, FXwxh.SE1.Picture.Graphic)
        else if v=2 then canvas.Draw(x, y, FXwxh.SE2.Picture.Graphic)
        else if v=3 then canvas.Draw(x, y, FXwxh.SE3.Picture.Graphic)
        else if v=5 then CanvasTextOut(canvas, x, y, Format('%d', [-checkresult.Dev[i]]));
      end
      else if (select=6) then begin
        if v>-4 then begin
          dec(x, FXwxh.DE0.Width div 2);
          dec(y, FXwxh.DE0.Height div 2);
          canvas.Draw(x, y, FXwxh.DE0.Picture.Graphic);
        end
        else begin
          s1:=Format('%d', [-v]);
          CanvasTextOut(canvas, x, y, s1);
        end;
      end
      else if (select=8) then begin
        dec(x, FXwxh.GpaPE0.Width div 2);
        dec(y, FXwxh.GpaPE0.Height div 2);
        if v=0 then canvas.Draw(x, y, FXwxh.GpaPE0.Picture.Graphic)
        else if v=1 then canvas.Draw(x, y, FXwxh.GpaPE1.Picture.Graphic)
        else if v=2 then canvas.Draw(x, y, FXwxh.GpaPE2.Picture.Graphic)
        else if v=3 then canvas.Draw(x, y, FXwxh.GpaPE3.Picture.Graphic)
        else if v=4 then canvas.Draw(x, y, FXwxh.GpaPE4.Picture.Graphic);
      end
      else begin
        if dev then begin
          s1:=Format('%d', [v]);
          CanvasTextOut(canvas, x, y, s1);
        end;
      end;
    end;
  end;
  if ((checkdata.pm.Strategy<10) and (select=0)) or
     (checkdata.pm.Strategy=10) or
     (checkdata.pm.Strategy=11) or
     (checkdata.pm.Strategy=12) then begin
    if range>15 then begin
      x:=Round(GetY(-range, -w div 2, range, w div 2, 14));
      y:=Round(GetY(-range, -w div 2, range, w div 2, 1));
      if checkdata.pm.Eye=0 then x:=xc-x else x:=xc+x;
      y:=yc+y;
      x:=x-FXwxh.SE3.Width div 2;
      y:=y-FXwxh.SE3.Height div 2;
      canvas.Draw(x, y, FXwxh.SE3.Picture.Graphic);
    end;
  end;
end;

procedure DrawGray(canvas:TCanvas; xc,yc:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT);
var
  i,j:integer;
  x,y,w,h,x0,y0:integer;
begin
  w:=checkresult.GrayXCount*FXwxh.Gray0.Width+12;
  h:=checkresult.GrayYCount*FXwxh.Gray0.Height+12;
  x0:=xc-w div 2;
  y0:=yc-h div 2;

  DrawAxis3(canvas, xc, yc, w, h, checkdata);
  for i:=1 to checkresult.GrayYCount do begin
    for j:=1 to checkresult.GrayXCount do begin
      x:=x0+(j-1)*FXwxh.Gray0.Width+((j-1)*2 div checkresult.GrayXCount)*12;
      y:=y0+(i-1)*FXwxh.Gray0.Height+((i-1)*2 div checkresult.GrayYCount)*12;
      if checkresult.Gray[i,j]<>-1 then begin
        if checkresult.Gray[i,j]=0      then canvas.Draw(x, y, FXwxh.Gray0.Picture.Graphic)
        else if checkresult.Gray[i,j]=1 then canvas.Draw(x, y, FXwxh.Gray1.Picture.Graphic)
        else if checkresult.Gray[i,j]=2 then canvas.Draw(x, y, FXwxh.Gray2.Picture.Graphic)
        else if checkresult.Gray[i,j]=3 then canvas.Draw(x, y, FXwxh.Gray3.Picture.Graphic)
        else if checkresult.Gray[i,j]=4 then canvas.Draw(x, y, FXwxh.Gray4.Picture.Graphic)
        else if checkresult.Gray[i,j]=5 then canvas.Draw(x, y, FXwxh.Gray5.Picture.Graphic)
        else if checkresult.Gray[i,j]=6 then canvas.Draw(x, y, FXwxh.Gray6.Picture.Graphic)
        else if checkresult.Gray[i,j]=7 then canvas.Draw(x, y, FXwxh.Gray7.Picture.Graphic)
        else if checkresult.Gray[i,j]=8 then canvas.Draw(x, y, FXwxh.Gray8.Picture.Graphic)
        else                                 canvas.Draw(x, y, FXwxh.Gray9.Picture.Graphic);
      end;
    end;
  end;
end;

procedure DrawGray2(canvas:TCanvas; xc,yc:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT);
var
  i,j:integer;
  x,y,w,h,x0,y0:integer;
begin
  w:=checkresult.GrayXCount*FXwxh.Gray2_0.Width+12;
  h:=checkresult.GrayYCount*FXwxh.Gray2_0.Height+12;
  x0:=xc-w div 2;
  y0:=yc-h div 2;

  DrawAxis3(canvas, xc, yc, w, h, checkdata);
  for i:=1 to checkresult.GrayYCount do begin
    for j:=1 to checkresult.GrayXCount do begin
      x:=x0+(j-1)*FXwxh.Gray2_0.Width+((j-1)*2 div checkresult.GrayXCount)*12;
      y:=y0+(i-1)*FXwxh.Gray2_0.Height+((i-1)*2 div checkresult.GrayYCount)*12;
      if checkresult.Gray[i,j]<>-1 then begin
        if checkresult.Gray[i,j]=0      then canvas.Draw(x, y, FXwxh.Gray2_0.Picture.Graphic)
        else if checkresult.Gray[i,j]=1 then canvas.Draw(x, y, FXwxh.Gray2_1.Picture.Graphic)
        else if checkresult.Gray[i,j]=2 then canvas.Draw(x, y, FXwxh.Gray2_2.Picture.Graphic)
        else if checkresult.Gray[i,j]=3 then canvas.Draw(x, y, FXwxh.Gray2_3.Picture.Graphic)
        else if checkresult.Gray[i,j]=4 then canvas.Draw(x, y, FXwxh.Gray2_4.Picture.Graphic)
        else if checkresult.Gray[i,j]=5 then canvas.Draw(x, y, FXwxh.Gray2_5.Picture.Graphic)
        else if checkresult.Gray[i,j]=6 then canvas.Draw(x, y, FXwxh.Gray2_6.Picture.Graphic)
        else if checkresult.Gray[i,j]=7 then canvas.Draw(x, y, FXwxh.Gray2_7.Picture.Graphic)
        else if checkresult.Gray[i,j]=8 then canvas.Draw(x, y, FXwxh.Gray2_8.Picture.Graphic)
        else                                 canvas.Draw(x, y, FXwxh.Gray2_9.Picture.Graphic);
      end;
    end;
  end;
end;

procedure DrawBabie(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA; checkresult:TCHECKRESULT);
var
  i:integer;
  x,y:integer;
  rect:TRect;
begin
  rect.Left:=0;
  rect.Top:=0;
  rect.Right:=w;
  rect.Bottom:=h;
  canvas.FillRect(rect);
  canvas.Draw(x0, y0+Round(GetY(10, 0, -40, h, 5.1)), FXwxh.ImageBabie.Picture.Graphic);
  canvas.Pen.Width:=2;
  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=x0+Round(GetY(1, 0, checkdata.pm.Dot_Number, w, i));
    y:=y0+Round(GetY(10, 0, -40, h, checkresult.Babie[i]/10.0));
    if i=1 then canvas.MoveTo(x, y) else canvas.LineTo(x, y);
  end;
end;

procedure GetCxCy(x,y,w,h,range,step:integer; var cx, cy:integer);
var
  xc,yc,r:integer;
begin
  xc:=w div 2;
  yc:=h div 2;
  if w>h then w:=h;

  if w>400 then dec(w, 40);
  h:=w;
  r:=h div 2;

  cx:=Round(GetY(xc-r, -range, xc+r, +range, x));
  cy:=Round(GetY(yc-r, +range, yc+r, -range, y));
  if step>=2 then begin
    if cx>=0 then cx:=(cx div step)*step+(step div 2) else cx:=(cx div step)*step-(step div 2);
    if cy>=0 then cy:=(cy div step)*step+(step div 2) else cy:=(cy div step)*step-(step div 2);
  end;
end;

procedure DrawPtDot(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);
var
  xc,yc,r:integer;
  x,y:integer;
  color:TColor;
  i,j,range:integer;
begin
  range:=checkdata.pm.Range;
  xc:=w div 2;
  yc:=h div 2;
  if w>h then w:=h;

  if w>400 then dec(w, 40);
  h:=w;
  r:=h div 2;

  if DemoCheckData.devicetype=0 then
  begin
    for i:=1 to 24 do begin
      for j:=1 to 20 do begin
//        x:=round(DOT_XY[i,j,1]/10);
//        y:=round(DOT_XY[i,j,2]/10);
        x:=round(DOT_XY[i,j,1]);
        y:=round(DOT_XY[i,j,2]);
        if (x=0) and (y=0) then continue;
        x:=x0+xc+(x*r div range);
        y:=y0+yc-(y*r div range);
        color:=canvas.Brush.Color;
        canvas.Brush.Color := clLtGray;
        canvas.Ellipse(x-5, y-5, x+5, y+5);
        canvas.Brush.Color:=color;
      end;
    end;
  end;

  for i:=1 to checkdata.pm.Dot_Number do
  begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    x:=x0+xc+(x*r div range);
    y:=y0+yc-(y*r div range);
    color:=canvas.Brush.Color;
    canvas.Brush.Color := clRed;
    canvas.Ellipse(x-5, y-5, x+5, y+5);
    canvas.Brush.Color:=color;
  end;
end;

procedure DrawEyeMove(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);
var
  i,x,y:integer;
begin
  //canvas.Brush.Color:=clBtnFace;
  canvas.Brush.Color:=$00515151;
  canvas.Rectangle(x0, y0, x0+w, y0+h);
  canvas.MoveTo(x0, h div 2+y0);
  canvas.LineTo(x0+w, h div 2+y0);
  for i:=1 to 600 do begin
    //x:=Round(GetY(1, x0, 600, x0+w, i));
    x:=i;
    //y:=Round(GetY(10, y0, -10, y0+h, checkdata.EyeMoveData[i] div 3));
    y:=Round(GetY(10, y0, -10, y0+h, checkdata.EyeMoveData[i]));
    canvas.MoveTo(x, h div 2+y0);
    canvas.LineTo(x, y);
  end;
end;
{

procedure DrawEyeMove(canvas:TCanvas; x0,y0,w,h:integer; checkdata:TCHECKDATA);
var
  i,x,y:integer;
begin
  canvas.Brush.Color:=clBtnFace;
  canvas.Rectangle(x0, y0, x0+w, y0+h);
  canvas.MoveTo(x0, h div 2+y0);
  canvas.LineTo(x0+w, h div 2+y0);
  for i:=1 to 600 do
  begin
    x:=Round(GetY(1, x0, 600, x0+w, i));
    y:=Round(GetY(10, y0, -10, y0+h, checkdata.EyeMoveData[i] div 3));
    canvas.MoveTo(x, h div 2+y0);
    canvas.LineTo(x, y);
  end;
end;
}

function GetPTName(s:string; tp:integer):string;
begin
  Result:=s;
  if (tp=0) or (tp=1) or (tp=2) or (tp=4) then Result:=Tr(s);
end;

function GetPtData(id:integer; var checkdata:TCheckData; var pt:string):string;
var
  i: integer;
  s: string;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT * From "Pt" where Id='+IntToStr(id)+' ORDER by ID';
  if id=0 then FXwxh.Query.SQL.Text:='SELECT * From "Pt" ORDER by ID';
  FXwxh.Query.Active:=true;
  pt:=FXwxh.Query.FieldByName('Name').AsString;
  Result:=GetPTName(pt, FXwxh.Query.FieldByName('Type').AsInteger);

  SetLength(s, sizeof(checkdata));
  s:=FXwxh.Query.FieldByName('CheckData').AsString;
  MoveCheckData(s, checkdata);
  ////初值类型等
  if SaveDataHead.DEVTYPE = $8800 then
    checkdata.devicetype :=0
  else if SaveDataHead.DEVTYPE = $0088 then
    checkdata.devicetype :=1;

  checkdata.Ready := 1;
  checkdata.runstate := 0;
  ////

  FXwxh.Query.Active:=False;
end;

function FindXyStep(x,y,step:integer; checkdata:TCheckData):integer;
var
  x0,x1,y0,y1:integer;
  i:integer;
begin
  Result:=0;
  x0:=x-step div 4;
  x1:=x+step div 4;
  y0:=y-step div 4;
  y1:=y+step div 4;
  for i:=1 to checkdata.pm.Dot_Number do begin
    x:=checkdata.pt[i].x;
    y:=checkdata.pt[i].y;
    if (x>=x0) and (x<=x1) and (y>=y0) and (y<=y1) then begin
      Result:=i;
      break;
    end;
  end;
end;

function FindXy(x,y:integer; checkdata:TCheckData):integer;
begin
  Result:=FindXyStep(x, y, 0, checkdata);
end;

function FindXRbyXY(mydot:TPoint):TPoint; //通过XY坐标找最近的布线坐标
var
  i,j: integer;
  myx,myr,mydis,mymindis: integer;
begin
  myx := 1;
  myr := 1;
  mymindis := abs(DOT_XY[1,1,1]-mydot.X)+abs(DOT_XY[1,1,2]-mydot.y);
  for i:=1 to 24 do
  begin
    for j:=1 to 20 do
    begin
      mydis := abs(DOT_XY[i,j,1]-mydot.x)+abs(DOT_XY[i,j,2]-mydot.y);
			if mymindis>mydis then
      begin
        mymindis := mydis;
        myx := i;
        myr := j;
      end;
    end;
  end;
  Result:=Point(myx,myr);
end;

procedure GetMoveStep(ds: byte; answerstep:TPoint);
begin
  pubanswerxy.X := round((pubmovearr[3,ds-1]+ (pubmovearr[3,ds]-pubmovearr[3,ds-1])*answerstep.X/(abs(pubmovearr[1,ds]-pubmovearr[1,ds-1])+0.0001))/10);
  pubanswerxy.Y := round((pubmovearr[4,ds-1]+ (pubmovearr[4,ds]-pubmovearr[4,ds-1])*answerstep.Y/(abs(pubmovearr[2,ds]-pubmovearr[2,ds-1])+0.0001))/10);
  pubanswerxystep.X := round(pubmovearr[1,ds-1]+ (pubmovearr[1,ds]-pubmovearr[1,ds-1])*answerstep.X/(abs(pubmovearr[1,ds]-pubmovearr[1,ds-1])+0.0001));
  pubanswerxystep.Y := round(pubmovearr[2,ds-1]+ (pubmovearr[2,ds]-pubmovearr[2,ds-1])*answerstep.Y/(abs(pubmovearr[2,ds]-pubmovearr[2,ds-1])+0.0001));
end;


function Find10(db:byte; mydot0,mydote:TPoint; gb:byte; zbx:byte; ds:byte):T10MotorArr; //通过XY坐标找焦距电机的位置
var
  k,i,j: integer;
  myx,myr,mydis,mymindis,temp4,temp5,temp0: integer;
  myoldjj: integer;
  myRes,cur5Step: T5MotorArr;
  zx,zy: integer;  //x,y 6倍数部分
  fx,fy: extended;
  mydotx,mydoty:single;
  myResJJ:T10MotorArr;
begin
  for k:=0 to ds do
  begin
    mydotX := mydot0.X+(mydote.X-mydot0.X)*k/ds;
    mydotY := mydot0.Y+(mydote.Y-mydot0.Y)*k/ds;

    //插值,保证在同一坐标系中
    zx := Trunc(mydotX/6); //整数
    fx := mydotX/6-zx;     //小数部分
    zy := Trunc(mydotY/6);
    fy := mydotY/6-zy;

    if zbx=1 then
    begin
      cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][1]);
      cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][2]);
      cur5Step[0] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][3]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][3]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][3]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][3]);
//      cur5Step[0] := DevTestData.XY2STEP[Trunc(mydotX/6),Trunc(mydotY/6)][3]; //投射距离
    end
    else // if zbx=2 then
    begin
      cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][1]);
      cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][2]);
      cur5Step[0] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][3]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][3]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][3]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][3]);
  //    cur5Step[0] := DevTestData.XY2STEP2[Trunc(mydotX/6),Trunc(mydotY/6)][3]; //投射距离
    end;

    //
    zx := Trunc((cur5Step[0]-70)/10); //整数
    fx := (cur5Step[0]-70)/10-zx;     //小数部分
    cur5Step[1] := round((1-fx)*SaveDataTs.JJ_STEP[gb,zx]+fx*SaveDataTs.JJ_STEP[gb,zx+1]);

    myResJJ[0,k] := cur5Step[1]; //焦距
    myResJJ[1,k] := cur5Step[4]; //x步
    myResJJ[2,k] := cur5Step[5]; //y步
    myResJJ[3,k] := ROUND(mydotX*10); //x位置X10
    myResJJ[4,k] := ROUND(mydotY*10); //Y位置X10
  end;

  Result:=myResJJ;
end;

function Find5MbyXYDB0(db:byte; mydot:TPoint; gb:byte; zbx:byte):T5MotorArr; //通过XY坐标找五电机移动相对前一点的位置
var
  i,j: integer;
  myx,myr,mydis,mymindis,temp4,temp5,temp0: integer;
  myRes,cur5Step: T5MotorArr;
  zx,zy: integer;  //x,y 6倍数部分
  fx,fy: extended;
begin
  cur5Step[2] := SaveDataTs.DB_STEP[0,db];
  cur5Step[3] := SaveDataTs.DB_STEP[1,db];
  //插值,保证在同一坐标系中
  zx := Trunc(mydot.X/6); //整数
  fx := mydot.X/6-zx;     //小数部分
  zy := Trunc(mydot.Y/6);
  fy := mydot.Y/6-zy;

  if zbx=1 then
  begin
    //(1-u)(1-v)f(i,j)+(1-u)vf(i,j+1)+u(1-v)f(i+1,j)+uvf(i+1,j+1)
    cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][1]);
    cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][2]);
    cur5Step[0] := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
  end
  else // if zbx=2 then
  begin
    //(1-u)(1-v)f(i,j)+(1-u)vf(i,j+1)+u(1-v)f(i+1,j)+uvf(i+1,j+1)
    cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][1]);
    cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][2]);
    cur5Step[0] := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
  end;

  ////处理坐标超界问题，在自动切换坐标后，不会出现
//  if cur5Step[0]=0 then
  if (temp0*cur5Step[0]=0) then
  begin
    for i:=1 to 5 do
    begin
      myRes[i] := 0;
    end;
  end
  else
  begin
    //插值距离
    //
    zx := Trunc((cur5Step[0]-70)/10); //整数
    fx := (cur5Step[0]-70)/10-zx;     //小数部分
    cur5Step[1] := round((1-fx)*SaveDataTs.JJ_STEP[gb,zx]+fx*SaveDataTs.JJ_STEP[gb,zx+1]);

    //cur5Step[1] := SaveDataTs.JJ_STEP[gb,(cur5Step[0]-70) div 10];

    if cur5Step[1]< SaveDataTs.JJ_FW[0] then
      cur5Step[1]:= SaveDataTs.JJ_FW[0];
    if cur5Step[1]> SaveDataTs.JJ_FW[1] then
      cur5Step[1]:= SaveDataTs.JJ_FW[1];
  end;

  Result:=cur5Step;
end;

function Find10JJ(db:byte; mydot0,mydote:TPoint; gb:byte; zbx:byte):T10JJMotorArr; //通过XY坐标找焦距电机的位置
var
  k,i,j: integer;
  myx,myr,mydis,mymindis,temp4,temp5,temp0: integer;
  myoldjj: integer;
  myRes,cur5Step: T5MotorArr;
  zx,zy: integer;  //x,y 6倍数部分
  fx,fy: extended;
  mydot:TPoint;
  myResJJ:T10JJMotorArr;
begin
  for k:=0 to 10 do
  begin
    mydot.X := round(mydot0.X+(mydote.X-mydot0.X)*k/10);
    mydot.Y := round(mydot0.Y+(mydote.Y-mydot0.Y)*k/10);

    //插值,保证在同一坐标系中
    zx := Trunc(mydot.X/6); //整数
    fx := mydot.X/6-zx;     //小数部分
    zy := Trunc(mydot.Y/6);
    fy := mydot.Y/6-zy;

    if zbx=1 then
    begin
      cur5Step[0] := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
    end
    else // if zbx=2 then
    begin
      cur5Step[0] := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
    end;

    //
    zx := Trunc((cur5Step[0]-70)/10); //整数
    fx := (cur5Step[0]-70)/10-zx;     //小数部分
    cur5Step[1] := round((1-fx)*SaveDataTs.JJ_STEP[gb,zx]+fx*SaveDataTs.JJ_STEP[gb,zx+1]);
    myResJJ[k] := cur5Step[1];
  end;

  Result:=myResJJ;
end;

function Find5MbyXYDB(db:byte; mydot:TPoint; gb:byte; zbx:byte):T5MotorArr; //通过XY坐标找五电机移动相对前一点的位置
var
  i,j: integer;
  myx,myr,mydis,mymindis,temp4,temp5,temp0,temp00: integer;
  myRes,cur5Step: T5MotorArr;
  zx,zy: integer;  //x,y 6倍数部分
  fx,fy: extended;
  myzbx: byte;

  myda,myda90,myda901,my90t: integer;
  myda2,myda902,myda9012: integer;
  mydb90: single;
begin
  cur5Step[2] := SaveDataTs.DB_STEP[0,db];
  cur5Step[3] := SaveDataTs.DB_STEP[1,db];

  //在此按照偏心度调整DA值
  mydb90 := SaveDataTs.DB90[round(sqrt(sqr(mydot.X)+sqr(mydot.Y))/2)]/50;
  if mydb90>0 then
  begin
    my90t := db+Trunc(mydb90);
    if my90t>maxdb then
      my90t:=maxdb;

    myda90 := SaveDataTs.DB_STEP[0,my90t];
    myda902 := SaveDataTs.DB_STEP[1,my90t];
    if (my90t+1)<=maxdb then  //maxdb
    begin
      myda901 := SaveDataTs.DB_STEP[0,my90t+1];
      myda9012 := SaveDataTs.DB_STEP[1,my90t+1];
    end
    else
    begin
      myda901 := myda90;
      myda9012 := myda902;
    end;

    myda := myda90-round((myda90-myda901)*(mydb90-Trunc(mydb90)));
    myda2 := myda902-round((myda902-myda9012)*(mydb90-Trunc(mydb90)));
    cur5Step[2] := myda;
    cur5Step[3] := myda2;
  end;

  myzbx := zbx;

  //插值,保证在同一坐标系中
  zx := Trunc(mydot.X/6); //整数
  fx := mydot.X/6-zx;     //小数部分
  zy := Trunc(mydot.Y/6);
  fy := mydot.Y/6-zy;

  if myzbx=1 then
  begin
    //(1-u)(1-v)f(i,j)+(1-u)vf(i,j+1)+u(1-v)f(i+1,j)+uvf(i+1,j+1)
    cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][1]);
    cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][2]);
    cur5Step[0] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][3]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][3]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][3]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][3]);
    temp00 := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离


    if Trunc(mydot.X/6)=mydot.X/6 then
    begin
      if Trunc(mydot.Y/6)=mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)>mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)-1][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)<mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)+1][3]; //投射距离
      end;
    end
    else if Trunc(mydot.X/6)>mydot.X/6 then
    begin
      if Trunc(mydot.Y/6)=mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6)-1,Trunc(mydot.Y/6)][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)>mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6)-1,Trunc(mydot.Y/6)-1][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)<mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6)-1,Trunc(mydot.Y/6)+1][3]; //投射距离
      end;
    end
    else if Trunc(mydot.X/6)<mydot.X/6 then
    begin
      if Trunc(mydot.Y/6)=mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6)+1,Trunc(mydot.Y/6)][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)>mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6)+1,Trunc(mydot.Y/6)-1][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)<mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP[Trunc(mydot.X/6)+1,Trunc(mydot.Y/6)+1][3]; //投射距离
      end
    end;

    //判断是否要换坐标系
    //用投射距离为0判断
    //if (DevTestData.XY2STEP[zx,zy][3]*DevTestData.XY2STEP[zx+1,zy][3]*DevTestData.XY2STEP[zx,zy+1][3]*DevTestData.XY2STEP[zx+1,zy+1][3]=0) then
//    if (temp0*cur5Step[0]=0) then
    if (temp0*temp00=0) then
    begin
     //换坐标算法 到0后，走相对位，走坐标位
      temp4 := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][1]);
      temp5 := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][2]);
      cur5Step[0] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][3]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][3]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][3]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][3]);
      temp00 := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离


      cur5Step[4] := temp4-DevTestData.XY2STEP2[0,0][1] + DevTestData.XY2STEP[0,0][1]+SaveDataTs.X2CF;
      cur5Step[5] := temp5-DevTestData.XY2STEP2[0,0][2] + DevTestData.XY2STEP[0,0][2]+SaveDataTs.Y2CF;
      pubCurZbx:=2; //副坐标系
////      Label1or2.Caption:='副表';
      temp0 := 1;
    end;

    ///复位到零位
    if (priXYFW=true) then
    begin
      cur5Step[4] := SaveDataTs.X2C;
      cur5Step[5] := SaveDataTs.Y2C;
      cur5Step[0] := DevTestData.XY2STEP[0,0][3]; //投射距离
    end;
    ///从副走正中心
    if (priXYFWF=true) then
    begin
      cur5Step[4] := -SaveDataTs.X2CF;
      cur5Step[5] := -SaveDataTs.Y2CF;
      cur5Step[0] := DevTestData.XY2STEP[0,0][3]; //投射距离
    end;
  end
  else // if zbx=2 then
  begin
    //(1-u)(1-v)f(i,j)+(1-u)vf(i,j+1)+u(1-v)f(i+1,j)+uvf(i+1,j+1)
    cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][1]);
    cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][2]);
//    cur5Step[0] := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
    cur5Step[0] := round((1-fx)*(1-fy)*DevTestData.XY2STEP2[zx,zy][3]+(1-fx)*fy*DevTestData.XY2STEP2[zx,zy+1][3]+fx*(1-fy)*DevTestData.XY2STEP2[zx+1,zy][3]+fx*fy*DevTestData.XY2STEP2[zx+1,zy+1][3]);
    temp00 := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离

    if Trunc(mydot.X/6)=mydot.X/6 then
    begin
      if Trunc(mydot.Y/6)=mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)>mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)-1][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)<mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6),Trunc(mydot.Y/6)+1][3]; //投射距离
      end;
    end
    else if Trunc(mydot.X/6)>mydot.X/6 then
    begin
      if Trunc(mydot.Y/6)=mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6)-1,Trunc(mydot.Y/6)][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)>mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6)-1,Trunc(mydot.Y/6)-1][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)<mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6)-1,Trunc(mydot.Y/6)+1][3]; //投射距离
      end;
    end
    else if Trunc(mydot.X/6)<mydot.X/6 then
    begin
      if Trunc(mydot.Y/6)=mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6)+1,Trunc(mydot.Y/6)][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)>mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6)+1,Trunc(mydot.Y/6)-1][3]; //投射距离
      end
      else if Trunc(mydot.Y/6)<mydot.Y/6 then
      begin
        temp0 := DevTestData.XY2STEP2[Trunc(mydot.X/6)+1,Trunc(mydot.Y/6)+1][3]; //投射距离
      end
    end;

////    if CheckBoxZFZB.Checked then
    //判断是否要换坐标系
    //用投射距离为0判断
    //if (DevTestData.XY2STEP2[zx,zy][3]*DevTestData.XY2STEP2[zx+1,zy][3]*DevTestData.XY2STEP2[zx,zy+1][3]*DevTestData.XY2STEP2[zx+1,zy+1][3]=0) then
    ////if (temp0*cur5Step[0]=0) then
    if (temp0*temp00=0) then
    begin
     //换坐标算法 到0后，走相对位，走坐标位
      temp4 := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][1]);
      temp5 := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][2]);

      cur5Step[0] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][3]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][3]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][3]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][3]);
      temp00 := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离

      cur5Step[4] := temp4-DevTestData.XY2STEP[0,0][1]+ DevTestData.XY2STEP2[0,0][1]-SaveDataTs.X2CF;
      cur5Step[5] := temp5-DevTestData.XY2STEP[0,0][2]+ DevTestData.XY2STEP2[0,0][2]-SaveDataTs.Y2CF;
      //cur5Step[0] := DevTestData.XY2STEP[Trunc(mydot.X/6),Trunc(mydot.Y/6)][3]; //投射距离

      pubCurZbx:=1; //主坐标系
////      Label1or2.Caption:='主表';
      temp0 := 1;
    end;

    ///走正副位置差
    if (priXYFW=true) then
    begin
      cur5Step[4] := SaveDataTs.X2CF;
      cur5Step[5] := SaveDataTs.Y2CF;
      cur5Step[0] := DevTestData.XY2STEP2[0,0][3]; //投射距离
    end;
  end;

  ////处理坐标超界问题，在自动切换坐标后，不会出现
//  if cur5Step[0]=0 then
//  if (temp0*cur5Step[0]=0) then
  if (temp0*temp00=0) then
  begin
    for i:=1 to 5 do
    begin
      myRes[i] := 0;
    end;
  end
  else
  begin
    //插值距离
    if cur5Step[0]>320 then
      cur5Step[0]:=320;
    //
    zx := Trunc((cur5Step[0]-70)/10); //整数
    fx := (cur5Step[0]-70)/10-zx;     //小数部分
    cur5Step[1] := round((1-fx)*SaveDataTs.JJ_STEP[gb,zx]+fx*SaveDataTs.JJ_STEP[gb,zx+1]);

    //cur5Step[1] := SaveDataTs.JJ_STEP[gb,(cur5Step[0]-70) div 10];

    if cur5Step[1]< SaveDataTs.JJ_FW[0] then
      cur5Step[1]:= SaveDataTs.JJ_FW[0];
    if cur5Step[1]> SaveDataTs.JJ_FW[1] then
      cur5Step[1]:= SaveDataTs.JJ_FW[1];
    //加入各个SPIN的值
////    SpinEditColor.Value := cur5Step[2];
////    SpinEditSize.Value := cur5Step[3];

////    SpinEditX.Value := cur5Step[4];
////    SpinEditY.Value := cur5Step[5];
////   SpinEditFocus.Value := cur5Step[1];
    /////

    for i:=1 to 5 do
    begin
      myRes[i] := cur5Step[i]-Old5MotorStep[i];
    end;
  {
      SpinEditCX.Value := SaveDataTs.X2C;
      SpinEditCY.Value := SaveDataTs.Y2C;
      SpinEditJZX.Value := SaveDataTs.X2JZ;
      SpinEditJZY.Value := SaveDataTs.Y2JZ;
      SpinEditLXX.Value := SaveDataTs.X2LX;
      SpinEditLXY.Value := SaveDataTs.Y2LX;
   }

    Old5MotorStep := cur5Step;
    //换坐标判断
    if myzbx<>pubCurZbx then
    begin
      Old5MotorStep[4] := temp4;
      Old5MotorStep[5] := temp5;
    end;
    OldPoint := mydot;
    OldDB := db;
  end;

  Result:=myRes;
end;

{
function Find5MbyXYDB(db:byte; mydot:TPoint):T5MotorArr; //通过XY坐标找五电机移动相对前一点的位置
var
  i,j: integer;
  myx,myr,mydis,mymindis: integer;
  myRes,cur5Step: T5MotorArr;
  zx,zy: integer;  //x,y 6倍数部分
  fx,fy: extended;
begin
  if OldGB<1 then
    OldGB := 1;
  cur5Step[2] := SaveDataTs.DB_STEP[0,db];
  cur5Step[3] := SaveDataTs.DB_STEP[1,db];
  //插值,保证在同一坐标系中
  zx := Trunc(mydot.X/6); //整数
  fx := mydot.X/6-zx;     //小数部分
  zy := Trunc(mydot.Y/6);
  fy := mydot.Y/6-zy;
  //(1-u)(1-v)f(i,j)+(1-u)vf(i,j+1)+u(1-v)f(i+1,j)+uvf(i+1,j+1)
  cur5Step[4] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][1]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][1]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][1]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][1]);
  cur5Step[5] := round((1-fx)*(1-fy)*DevTestData.XY2STEP[zx,zy][2]+(1-fx)*fy*DevTestData.XY2STEP[zx,zy+1][2]+fx*(1-fy)*DevTestData.XY2STEP[zx+1,zy][2]+fx*fy*DevTestData.XY2STEP[zx+1,zy+1][2]);
  cur5Step[0] := DevTestData.XY2STEP[round(mydot.X/6),round(mydot.Y/6)][3]; //投射距离
  ///复位
  if (priXYFW=true) then
  begin
    cur5Step[4] := SaveDataTs.X2C;
    cur5Step[5] := SaveDataTs.Y2C;
    cur5Step[0] := DevTestData.XY2STEP[0,0][3]; //投射距离
  end;
                                          //插值距离
  cur5Step[1] := SaveDataTs.JJ_STEP[OldGB,(cur5Step[0]-40) div 10];
  if cur5Step[1]< SaveDataTs.JJ_FW[0] then
    cur5Step[1]:= SaveDataTs.JJ_FW[0];
  if cur5Step[1]> SaveDataTs.JJ_FW[1] then
    cur5Step[1]:= SaveDataTs.JJ_FW[1];

  for i:=1 to 5 do
  begin
    myRes[i] := cur5Step[i]-Old5MotorStep[i];
  end;

  Old5MotorStep := cur5Step;
  OldPoint := mydot;
  OldDB := db;

  Result:=myRes;
end;
}
function isNearbyXY(x0,y0,x1,y1,r2:integer): boolean;
var
  dx,dy: integer;
begin
	dx :=x1-x0;
	dy :=y1-y0;
  if ((dx*dx+dy*dy)<=r2) then
    result := true
  else
    result := false;
end;

function NearestXY(x,y,r2:integer): integer;
var
	i,mini: integer;
	dx,dy,r,minr,myres: integer;
begin
	mini:=-1;
	minr:=999999;
	for i:=0 to DemoCheckData.pm.Dot_Number do
  begin
		dx:=x-DemoCheckData.pt[i].x;
		dy:=y-DemoCheckData.pt[i].y;
		r:=dx*dx+dy*dy;
		if (r<minr) then
    begin
			minr:=r;
			mini:=i;
			if (r=0) then
      begin
        myres:=i;
        break;
      end;
		end;
	end;
	if (minr<r2) then
    myres := mini
  else
    myres := -1;
  result := myres;
end;

procedure PrepareCheckData(age,eye:integer; other:boolean; var checkdata:TCheckData);
var
  i:integer;
begin
  checkdata.pm.Age:=age;
  checkdata.pm.Eye:=eye;
  {
//  if (checkdata.pm.Eye=0) or other then
  begin
    for i:=1 to checkdata.pm.Dot_Number do
    begin
      if (checkdata.pm.Eye=0) then
        checkdata.pt[i].x:=-checkdata.pt[i].x;
      checkdata.sv[i]:=GetNORMAL_VALUE(checkdata.pt[i].x, checkdata.pt[i].y, checkdata.pm.Age, checkdata.pm.Eye, checkdata);
    end;
  end;
   }

  if (checkdata.pm.Eye=0) or other then
  begin
    for i:=1 to checkdata.pm.Dot_Number do
    begin
      checkdata.pt[i].x:=-checkdata.pt[i].x;
      checkdata.sv[i]:=GetNORMAL_VALUE(checkdata.pt[i].x, checkdata.pt[i].y, checkdata.pm.Age, checkdata.pm.Eye, checkdata);
    end;
  end;

  Fillchar(checkdata.EyeMoveData, sizeof(checkdata.EyeMoveData), 0);
end;

function GetEyeValue(s:string):integer;
begin
  Result:=0;
  if UpperCase(s)='RIGHT' then
    Result:=1
  else if s=Tr('Eye1') then
    Result:=1;
  if UpperCase(s)='DOUBLE' then
    Result:=2
  else if s=Tr('Eye3') then
    Result:=2;
end;

procedure DeleteDoctor(s:string);
begin
  FXwxh.Query.SQL.Text:='UPDATE "CHECK" set DoctorDeleted=1 where Doctor="'+s+'"';
  FXwxh.Query.ExecSQL;
end;

function NumOfChecking:integer;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT COUNT(*) as Count From "Check" where State=1';
  FXwxh.Query.Active:=true;
  Result:=FXwxh.Query.FieldByName('CNT').AsInteger;
  FXwxh.Query.Active:=False;
end;

function IdOfChecking:integer;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT Id From "Check" where State=1';
  FXwxh.Query.Active:=true;
  Result:=FXwxh.Query.FieldByName('Id').AsInteger;
  FXwxh.Query.Active:=False;
end;

function NumberOfCheck:string;
var
  s:string;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT Number From "Check" where Number>="'+DateToGzr(Date)
                        +'"and Number<"'+IncStringCount(DateToGzr(Date))+'" Order by Number DESC';
  FXwxh.Query.Active:=true;
  s:=FXwxh.Query.FieldByName('Number').AsString;
  FXwxh.Query.Active:=False;
  if s='' then s:=DateToGzr(Date)+'000';
  Result:=IncStringCount(s);


end;

function IdOfLastChecked:integer;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT ID From "Check" where (State=2) or (State=3)Order by ID DESC';
  FXwxh.Query.Active:=true;
  Result:=FXwxh.Query.FieldByName('Id').AsInteger;
  FXwxh.Query.Active:=False;
end;

function MaxIDofCheck:integer;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT ID From "Check" Order by ID DESC';
  FXwxh.Query.Active:=true;
  Result:=FXwxh.Query.FieldByName('Id').AsInteger;
  FXwxh.Query.Active:=False;
end;

function MaxIDofChecked:integer;
begin
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT ID From "Check" where state=2 or state=3 Order by ID DESC';
  FXwxh.Query.Active:=true;
  Result:=FXwxh.Query.FieldByName('Id').AsInteger;
  FXwxh.Query.Active:=False;
end;

function Last10IDofChecked:integer;
var
  i:integer;
begin
  Result:=0;
  FXwxh.Query.Active:=False;
  FXwxh.Query.SQL.Text:='SELECT ID From "Check" where state=2 or state=3 Order by ID DESC';
  FXwxh.Query.Active:=true;
  for i:=1 to 10 do begin
    if FXwxh.Query.Eof then break;
    Result:=FXwxh.Query.FieldByName('Id').AsInteger;
    FXwxh.Query.Next;
  end;
  FXwxh.Query.Active:=False;
end;

function FilterOfPerson(checkdb:TDataSet):string;
var
  s,name,sex,birthday,eye,pt,strategy:string;
begin
  name:=checkdb.FieldByName('Name').AsString;
  sex:=checkdb.FieldByName('Sex').AsString;
  birthday:=checkdb.FieldByName('Birthday').AsString;
  eye:=checkdb.FieldByName('eye').AsString;
  pt:=checkdb.FieldByName('pt').AsString;
  strategy:=checkdb.FieldByName('strategy').AsString;
  s:='(Name='''+name+
     ''') and (Sex='''+sex+
     ''') and (Birthday='''+birthday+
     ''') and (Eye='''+eye+
     ''') and (Pt='''+pt+
     ''') and (strategy='''+strategy+
     ''') and ((State=2) or (State=3))';
  Result:=s;
end;

function FilterOfGPA(checkdb:TDataSet):string;
var
  s,name,sex,birthday,eye,strategy:string;
begin
  name:=checkdb.FieldByName('Name').AsString;
  sex:=checkdb.FieldByName('Sex').AsString;
  birthday:=checkdb.FieldByName('Birthday').AsString;
  eye:=checkdb.FieldByName('eye').AsString;
  strategy:=checkdb.FieldByName('strategy').AsString;
  s:='(Name='''+name+
     ''') and (Sex='''+sex+
     ''') and (Birthday='''+birthday+
     ''') and (Eye='''+eye+
     ''') and ((Pt=''30-2'') or (Pt=''24-2'')) and (Stimulus_Color=0) and (Stimulus_Size=2) and ((State=2) or (State=3))';
  Result:=s;
end;

procedure CopyCheckRecord(srcid:string; state:integer; other:boolean);
var
  s:array[1..200] of string;
  i:integer;
  age,birth,eye:string;
begin
//2019.11.4加，先清状态
  ClearCheckState1;

  FXwxh.TbCheck.Active:=True;
  FXwxh.TbCheck.Filter:='ID='+srcid;
  for i:=1 to FXwxh.TbCheck.FieldCount-1 do s[i]:=FXwxh.TbCheck.Fields[i].AsString;
  eye:=FXwxh.TbCheck.FieldByName('Eye').AsString;
  if other then begin
    if eye=Tr('Left') then eye:=Tr('Right') else eye:=Tr('Left');
  end;

  FXwxh.TbCheck.Append;
  for i:=1 to FXwxh.TbCheck.FieldCount-1 do FXwxh.TbCheck.Fields[i].AsString:=s[i];
  StrToAge(FXwxh.TbCheck.FieldByName('Birthday').AsString, age, birth);
  FXwxh.TbCheck.FieldByName('Id').AsInteger:=MaxIDofCheck+1;
  FXwxh.TbCheck.FieldByName('Birthday').AsString:=birth;
  FXwxh.TbCheck.FieldByName('Age').AsString:=age;
  FXwxh.TbCheck.FieldByName('Date').AsString:=DateToStr(now);
  FXwxh.TbCheck.FieldByName('Time').AsString:=TimeToStr(now);
  //FXwxh.TbCheck.FieldByName('State').AsInteger:=state;
  //2019.11.4加，直接职位当前测试状态
  FXwxh.TbCheck.FieldByName('State').AsInteger:=1;

  FXwxh.TbCheck.FieldByName('Number').AsString:=NumberOfCheck;
  FXwxh.TbCheck.FieldByName('Eye').AsString:=eye;
  FXwxh.TbCheck.Post;
  FXwxh.TbCheck.FlushBuffers;
  FXwxh.TbCheck.Active:=False;
end;

procedure ClearCheckState1;
begin
  FXwxh.Query.SQL.Text:='UPDATE "CHECK" set state=0 where state=1';
  FXwxh.Query.ExecSQL;
  FXwxh.Query.SQL.Text:='UPDATE "CHECK" set state=3 where state=2';
  FXwxh.Query.ExecSQL;
end;

procedure ClearCheckState2;
begin
  FXwxh.Query.SQL.Text:='UPDATE "CHECK" set state=3 where state=2';
  FXwxh.Query.ExecSQL;
end;

function PtParamOfName(pt, param:string):string;
begin
  FXwxh.Query.SQL.Text:='SELECT * from pt where name='''+pt+'''';
  FXwxh.Query.Active:=True;
  Result:=FXwxh.Query.FieldByName(param).AsString;
  FXwxh.Query.Active:=False;
end;

procedure MoveCheckData(s:string; var checkdata:TCheckData);
var
  len:integer;
begin
  len:=Length(s);
  if len>sizeof(checkdata) then len:=sizeof(checkdata);
  if len>0 then Move(s[1], checkdata, len);
end;

const
  DB0TAB:array[1..4] of integer=(25,20,15,10);
  DB1TAB:array[1..10] of integer=(4,4,3,3,2,2,1,1,0,0);

procedure DBtoDB2(db:integer; var db0, db1:integer);
var
  i,j:integer;
begin
  db0:=0;
  db1:=0;
  if db>(DB0TAB[1]+DB1TAB[1]) then exit;
  for i:=1 to 4 do begin
    for j:=1 to 10 do begin
      db0:=i-1;
      db1:=j-1;
      if db=(DB0TAB[i]+DB1TAB[j]) then exit;
    end;
  end;
  db0:=4;
  db1:=10;
end;

function DB2toDB(db0, db1:integer):integer;
begin
  inc(db0);
  inc(db1);
  if db0<1 then db0:=1;
  if db1<1 then db1:=1;
  if db0>4 then db0:=4;
  if db1>10 then db1:=10;
  Result:=DB0TAB[db0]+DB1TAB[db1];
end;

function Yk3x3(index:integer; checkdata:TCHECKDATA):double;
var
  nv,v,v2,sum,v0,v1:Double;
  i,j,k,x,y:integer;
begin
  nv:=0;
  sum:=0;
  x:=checkdata.pt[index].x;
  y:=checkdata.pt[index].y;
  v:=checkdata.v[index];
  v0:=v;
  v1:=v;
  for i:=1 to 3 do begin
    for j:=1 to 3 do begin
      v2:=v;
      if ((y-(i-2)*6)*y)>0 then begin
        k:=FindXy(x+(j-2)*6, y-(i-2)*6, checkdata);
        if k>=1 then begin
          if checkdata.sv[k]>0 then begin
            v2:=checkdata.v[k];
            if v2<0 then v2:=0;
          end;
        end;
      end;
      nv:=nv+XwData.Yk3x3[i,j]*v2;
      sum:=sum+XwData.Yk3x3[i,j];
      if (i=2) and (j=1) then v0:=v2;
      if (i=2) and (j=3) then v1:=v2;
    end;
  end;
  nv:=nv/sum;
  if v>0 then begin
    if (v>nv) then begin
      v2:=GetY(0, 0.6, 20, 0, abs(v1-v0));
      v:=v-(v-nv)*v2;
    end
    else if (v<nv) then begin
      v:=v+(nv-v)/9;
    end;
    if v<0 then v:=0;
  end;
  Result:=v;
end;

function YkFilter(checkdata:TCHECKDATA):TCHECKDATA;
var
  i:integer;
  c:TCHECKDATA;
begin
  c:=checkdata;
  for i:=1 to checkdata.pm.Dot_Number do begin
    c.v[i]:=Round(Yk3x3(i, checkdata));
  end;
  Result:=c;
end;

//----TFXwxh----
procedure TFXwxh.FormCreate(Sender: TObject);
begin
  GetDemo;
  ReadXwData;
{
  GetCheckData(DemoCheckdata);
  Randomize;

  ReadXwData;
 }
end;

procedure TFXwxh.ClientSocketWRError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
  Socket.Close;
end;

procedure TFXwxh.TimerTimer(Sender: TObject);
begin
  if RDState=1 then
  begin
    RDState:=2;
    RDDelay:=0;
    ReadXwCheckData;
  end
  else
  begin
    inc(RDDelay);
    if RDDelay>=60 then
    begin
      RDDelay:=0;
      ClientSocketRD.Active:=true;
      ClientSocketWR.Active:=true;
    end;
  end;
  LaCount.Caption:=Format('RDCount:%d, RDState:%d, RDDelay:%d', [RDCount, RDState, RDDelay]);
  LaRunstate.Caption:='RunState='+IntToStr(DemoCheckData.runstate);
  LaUSBWrite.Caption:=Format('WaitWrite:%d, %d', [WriteTick, MaxWriteTick]);
end;

procedure TFXwxh.ClientSocketWRRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  WriteOk:=Socket.ReceiveText;
end;

procedure TFXwxh.ClientSocketRDConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  RDState:=1;
end;

procedure TFXwxh.ClientSocketRDError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
  Socket.Close;
  RDState:=3;
end;

procedure TFXwxh.ClientSocketRDRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s:string;
  len:integer;
  tick:DWord;
begin
  inc(RDCount);
  s:='';
  tick:=GetTickCount;
  while not xwQuit do
  begin
    s:=s+Socket.ReceiveText;
    if Length(s)<2 then
    begin
      exit;
    end;
    if (GetTickCount-Tick)>=3000 then
    begin
      Application.ProcessMessages;
      Sleep(100);
    end;
    if (GetTickCount-Tick)>=30000 then
    begin
      xwServerError:=true;
      exit;
    end;
    len:=256*Byte(s[1])+Byte(s[2]);
    if Length(s)>=len then break;
  end;
  Move(s[9], DemoCheckData, 44*60);
  xwInitOk:=true;
  xwServerError:=false;
  xwDeviceError:=false;
  RDState:=1;
end;

procedure TFXwxh.ClientSocketRDDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  RDState:=3;
end;

procedure TFXwxh.FormDestroy(Sender: TObject);
begin
  xwQuit:=true;
end;

procedure TFXwxh.BtClearClick(Sender: TObject);
begin
  WriteTick:=0;
  MaxWriteTick:=0;
end;


end.
