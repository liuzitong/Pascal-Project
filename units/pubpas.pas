unit pubpas;

interface

uses Types;

type
  TReport = packed record
    ReportID: Byte;
    Bytes: array [0..63] of Byte;
  end;

type
  TServer2Lower=record        //投射布点都要用
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1至3是usb通信识别帧头
    dotcon:byte;  //3    0xc1（0x00） 刺激点命令
    da:array[1..2] of Byte;  //4,5   亮度DB值对应的AD值,高字节在前
    xcoord:byte;  //6   X坐标1-24    
    rcoord:byte;  //7  R坐标1-20
    gcoord:byte;  //8  G坐标1-20
    stimtime:array[1..2] of Byte;  //word;  //9,10 10-11位是要求刺激点亮的时间，单位为毫秒  高字节在前，范围0-2000毫秒 如果为0xff  0xff 代表常亮，调试用
    gillcon:byte; //11  0xc2（0x00）  腮托电机命令
    gillup:byte;  //12  上动0xff
    gilldown:byte;  //13  下动0xff
    gillleft:byte;  //14  左动0xff
    gillright:byte;  //15  右动0xff
    cameracon:byte;  //16   0xc3（0x00） 摄像头电源命令
    cameraonoff:byte; // 17  电源开0xff  电源关0x00
    otherlamp:byte;  //18  0xc4（0x00） 辅助灯命令 不执行发0x00
    fixlamp:array[1..9] of Byte;  //19-27   固视灯1-9   数值1-255
    Infraredlamp:array[1..4] of Byte; //28-31   红外灯1-4   数值1-255
    backlamp:array[1..3] of Byte; //32-34   背景灯R   背景灯G  背景灯B   数值1-255
    lowerstatus:byte;  //35   0xc5（0x00）要求下位机返回状态
    lowerbuzy:byte; //36   需返回0xff  不需返回0x00  忙状态
    lowerserial:byte;  //37  需返回0xff  不需返回0x00   硬件软件号
    answer:byte;  //  38  响应器状态  需返回0xff  不需返回0x00
    glasspos:byte;  // 39   镜架状态  需返回0xff  不需返回0x00
    envlight1:byte;  // 40  环境光1   需返回0xff  不需返回0x00
    envlight2:byte;  // 41  环境光2   需返回0xff  不需返回0x00
    envtemper:byte;  //42  环境温度   需返回0xff  不需返回0x00
    eyeleft:byte;     //43  左眼位       需返回0xff  不需返回0x00
    eyeright:byte;  //44  右眼位      需返回0xff  不需返回0x00
    motorlimit:byte; //45  电机限位状态   需返回0xff  不需返回0x00
    savedata:byte;  // 46 存储数据        需返回0xff  不需返回0x00
    backup:array[1..15] of Byte;  // 47至61字节  为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63至64是结束帧码
  end;
{
0XAA  0X0F  0XEE  0XC7    0X??  0X??  0X??   0X??   0X??   0X??
     帧头       电机命令 （    电机1的五位数据         ）（
0X??  0X??   0X??  0X??   0X??  0X??  0X??   0X??  0X??    0X??
电机2的五位数据       ）（    电机3的五位数据       ）   （
0X??  0X??   0X??  0X??   0X??  0X??  0X??   0X??  0X??    0X??
电机4的五位数据       ）（    电机5的五位数据       ）   （
0X??  0X??   0X??  0X??  0X??   0X??   0X00   0X00  0X00    0X00
电机6的五位数据       ） 颜色  光斑 --------------------------

0X00  0X00   0X00  0X00  0X00  0X00  0X00   0X00  0X00    0X00
--------------------------------备用--------------------------
0X00  0X00   0X00  0X00  0X00  0X00  0X00   0X00  0X00    0X00
 -------------------------------------------------------------
0X00   0X00  0X4E  0X4F
}
type            //投射加
  TServer2LowerTs=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1至3是usb通信识别帧头
    motorcon:byte;  //3    0xc7 电机命令
    motor1:array[1..5] of Byte;
//电机顺序为：聚焦电机，颜色电机（DB电机），光斑电机（DB电机），X电机，y电机，快门电机
//第一位：控制位（含义：0X00为不控制；0X11为顺时针转；0X22为逆时针转；0X33为复位及电机自动回复到光电开关位置及0点调试位置）
//第二，三，四位：转的角度位脉冲表示，数值高位在前（例：每步1.8度的步进电机转360度要200个脉冲，驱动器为128细分则转360度要25600个脉冲，
//每个脉冲就是0.0140625度；如果要电机转30度就设置数值为2133个脉冲（十六进制表示0x00 0x08 0x55）;如果要电机转1440度就设置数值为102400个脉冲（十六进制表示0x01 0x90 0x00））
    motor2:array[1..5] of Byte;
    motor3:array[1..5] of Byte;
    motor4:array[1..5] of Byte;
    motor5:array[1..5] of Byte;
    motor6:array[1..5] of Byte; //-33
    color:byte;  //34  协议35位为 颜色 ：数值范围十进制1至5
    size:byte;   //35  协议36位为 光斑 ：数值范围十进制1至6
    stimmode:byte; //36 协议37位为 快门方式：88表示会用后面两位控制时间
    stimtime:array[1..2] of byte; //37,38 协议38-39位为 快门时间
    backup:array[1..23] of Byte;  //39-61  40至62字节  为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63至64是结束帧码
  end;

type            //投射加,扫描线
  TServer2LowerTsMove=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1至3是usb通信识别帧头
    motorcon:byte;  //3    0xc8 扫描命令
    motorx:array[1..3] of Byte;
    motory:array[1..3] of Byte;
    motorspd:array[1..2] of Byte;
    motorjjstep:Byte; //12  焦距分段数
    motorjj:array[1..10,1..3] of Byte;  //13-42
    backup:array[1..19] of Byte;  //43-61  44至62字节  为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63至64是结束帧码
  end;

type            //投射加,扫描线，分段数据头
  TServer2LowerTsMove10H=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1至3是usb通信识别帧头
    motorcon:byte;  //3    0xc8 扫描命令
    motords:byte;  //4  段数
    motorspd:array[1..2] of Byte; //5,6//速度
    motorxa:Byte;  //7 x方向
    motorya:Byte;  //8方向
    backup:array[1..53] of Byte;  //9-61  10至62字节  为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63至64是结束帧码
  end;

type            //投射加,扫描线,分段数据内容
  TServer2LowerTsMove10N=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1至3是usb通信识别帧头
    motorcon:byte;  //3    0xc8 扫描命令
    motordata:array[1..57] of Byte;  //3-59  4至60字节  为数据
    addcs:byte;  //累加次数
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63至64是结束帧码
  end;

type
  TLower2Server=record
    head:array[1..3] of Byte;  //0,1,2  0xaa 0xf0 0xee 1至3是usb通信识别帧头
    lowerbuzy:byte; //3  忙0xff 不忙0x11
    lowerserialhard:array[1..2] of Byte;  //4，5  5至6 是硬件号
    lowerserialsoft:array[1..2] of Byte;  //6，7  7至8是软件号
    answer:byte;  //  8 按下去0xff  没按0x11
    answertime:array[1..2] of Byte; //9-10 看到刺激 点的反应时间 单位毫秒
    glasspos:byte;  // 11  镜架状态 抬上来是0xff  扳下去是0x11
    eyeleft:byte;  //12  左眼位 是0xff 否0x11
    eyeright:byte;  //13  右眼位  是0xff 否0x11
    envlight1:array[1..2] of Byte;  //14，15  15至16是环境光1的值
    envlight2:array[1..2] of Byte;  //16，17   17至18是环境光2的值
    envtemper:array[1..2] of Byte;  //18,19  环境温度
    motorlimit:array[1..10] of byte; //20-29  电机限位限位1-10  是0xff 否0x11
    moveanswerx:array[1..2] of byte;  //30-31 X步数
    moveanswery:array[1..2] of byte;  //32-33 Y步数
    moveanswerds:byte;  //34 段数
    moveanswerjj:array[1..3] of byte;  //35-37 焦距方向及步数
    backup:array[1..24] of Byte;  //38-61 31至62字节为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63  0xe4  0xf4  63至64是结束帧码

  end;

////////修改,主机储存数据与从机数据
type
  TSAVEDATABD=record   //78735Byte 读取DevData
    DEVTYPE:word; //0-1  0 布点0x8800  1投射 0x0088
    SerialNo:word;  //2-3  串号，计算而来
    DEVID: Cardinal;  //4-7  球体编号
    VERSION: word;  //8-9 版本号
    DOT_DA:array[1..2, 1..24, 1..20, 0..40] of word;//0-78719 颜色 行 列 (0db, 40db)
    FOUCUS_DA:array[0..8] of word;
    BACK_DA:array[0..1,0..2] of word;
    HW_DA:array[0..3] of word;
    HJG_DA:word;
    DoubleRate:word;
    EYEMOVE: word;
    EYEGRAY: word;
    EvTemp: word;
    DB90:array[0..45] of word; //90度衰减，以中心0度为基础，DB数*50存储，间隔2度，0-45
    DBTemp:array[0..45] of word; //温度衰减，以中心0度为基础，DB数*50存储，间隔1度，0-45
    SBID: Cardinal;  //4-7  设备编号
    DJ_CS:array[1..2,1..17] of word; // 各个电机参数
    EYEGRAYH: word; //黄背景光阈值
    HJG_DAH: word;  //黄背景光环境光报警值    
  end;

////////新建,主机储存数据与从机数据投射,数据上位机需要,有些数据下位机自己用的没有放在里面
type
  TSAVEDATATS=record        //3306byte  读取 DevData
    DEVTYPE:word; //0-1   布点0x8800  1投射 0x0088
    SerialNo:word;  //2-3  串号，计算而来
    DEVID: Cardinal;  //4-7  球体编号
    VERSION: word;  //8-9 版本号
    FOUCUS_DA:array[0..8] of word;  //10-27 a~1b 9个固视灯强度大小  固视点调试
    BACK_DA:array[0..1,0..2] of word; //28-39 [backmode 白光,黄光?] [0:r,1:g,2:b] 背景灯调试
    HW_DA:array[0..3] of word; //40-47 28~2f  0 黄背景光,1投射光?,  2小红外,2大红外
    HJG_DA:word;  //48,49  30~31 环境光报警值 环境光报警阈值 DA
    TSG_DA:word;  //50,51  32~33 投射光强的最亮值预设  代码没用  投射光DA
    KM2C:word; //52,53 快门开位  
    YS_STEP:array[0..5] of word;  //54-65 0,完全通过 1-5五种颜色中的各个颜色所需对应的电机转动步数  颜色
    GB_STEP:array[0..7] of word;  //66-81 0,完全通过 1-7六种光斑中的各个光斑所需对用的电机转动步数  光斑尺寸
    JJ2LD:word;  //82,83  52~53 焦距电机到联动位置所需要移动的步数   焦距联动
    //以下的 smallint 改为 integer 长度加一倍
    X2C:integer;   //84-87 54~57 X电机在计算的中心点时所走动的步数,以复位点计数  到中心点
    Y2C:integer;   //88,91 58~5b  Y电机在计算的中心点时所走动的步数
    X2JZ:integer;  //92,95 5c~5f 光强校正时 X电机所需走动的步数,以复位点计数  代码好像没用  光强校正
    Y2JZ:integer;  //96,99 60~63 光强校正时 Y电机所需走动的步数
    JZJJ:word;  //调试软件integer位置数据全按软件调试计算 100,103  64~67 光强校正时 焦距电机所需走动的步数   光强校正_焦距
    X2LX:integer;   //104-107 68~6b 进行菱形中心点测试时X电机所需走动的步数   菱形中心
    Y2LX:integer;  //108-111  6c~6f 进行菱形中心点测试时Y电机所需走动的步数
    LXJJ:word;  // 112-113  0x70~0x71菱形中心点测试时 焦距电机所需走动的步数 菱形中心点_焦距
    JJ_FW:array[0..1] of word; //114-117 72~73 小 74~75 大  焦距电机的调焦工作范围,从复位位置开始计数  调焦范围
    JJ_STEP:array[1..7,1..25] of word;  //118-467 0x76~0x1d3  焦距电机（光斑，距离）对应步数，从复位位置开始计数  焦距参数表右边
    DB_STEP:array[0..1,0..51] of word; //468-675 0x1d4~0x2a3  dB对应的颜色电机和光斑电机各自转动的步数  DB参数表
    EYEGRAY: word;     //676-677 0x2a4~ 0x2a5   瞳孔灰度值 识别瞳孔用   瞳孔灰度阈值?
    EvTemp: word;     //678-679   0x2a6~0x2a7  代码没用  调试温度
    X2CF:integer;   //680-683 0x2a8~0x2ab    正中心到副中心X电机步数  正副中心差
    Y2CF:integer;   //684-687 0x2ac~0x2af    正中心到副中心Y电机步数
    SBID: Cardinal;  //688-691 0x2b0~ 0x2b3   设备编号
    DJ_CS:array[1..8,1..17] of word; //692-963 0x2b3~0x3c3   各个电机参数   电机参数表  新版不需要
    EYEGRAYH: word; //964-965 0x3c4~0x3c5  黄背景光阈值
    HJG_DAH: word;  //964-965 0x3c6~0x3c7 黄背景光环境光报警值
    DB90:array[0..45] of word; //966-1057  90度衰减，以中心0度为基础，DB数*50存储，间隔2度，0-45   0-90度衰减
    DBTemp:array[0..45] of word; //1058-1149 温度衰减，以中心0度为基础，DB数*50存储，间隔1度，0-45    温度曲线
  end;

////////新建
type
  TSAVEDATAHead=record        //数据头 就是投射数据的前面一截
    DEVTYPE:word; //0-1  0 布点0x8800  1投射 0x0088
    SerialNo:word;  //2-3  串号，计算而来
    DEVID: Cardinal;  //4-7  设备编号
    VERSION: word;  //8-9 版本号
  end;

////////新建
type
  TDEVTESTDATA=record         //Fmain.FormCreate中读取DevTestSet.dat得到,其实DevData.dat也有存储,但是很奇怪,另外搞了个文件
    TIMESPACE: BYTE;
    CtbcTs: WORD;
    XtbcTs: WORD;
    Cz0Ts: WORD;
    Cz40Ts: WORD;
    //投射加，存储于本地的  需要改成存储到下位机
    XY2STEP: array[-15..15,-15..15] of array[1..3] of Longint; //-2147483648..2147483647 	x,y 对应的X电机步，Y电机步，距离长度      电机位置表
    XY2STEP2: array[-15..15,-15..15] of array[1..3] of Longint; //-2147483648..2147483647 	x,y 对应的X电机步，Y电机步，距离长度    电机位置副表
    JJ_STEPT:array[1..2,1..25] of smallint;  //调焦时x,y位置   焦距参数表左边   感觉没用
    DoubleRate:byte;
    VERSION: word;  //版本号
    SAVEPATH: ShortString;  //存储路径
  end;                                    									 //10080


type
  TPrefer=record
    Maintag:integer;
    Analysis:string[10];
    AnalysisHint:string;
    kbeangle:integer;
    kenangle:integer;
    testnum:integer;
    testStrategy:string[16];
    flashcolor:string[10];
    flashdiam:string[2];
    flashtime:integer;
    breaktime:integer;
    backcolor:string[10];
    backbright:integer;
    testdot:string;
    TestResult:string;
    LorR: string[5];
    BAnswer: integer;    //盲点应答
    BTest: integer;        //盲点测试数
    Dqbd: single;  //短期波动  sc=相对缺损
    Pjqs: single; //平均缺损  SC=绝对缺损
    TestPjz: single;  //平均光敏度
    TestDateTime: TDateTime;
    TestTime: string[6];
    JyjcNum:integer; //假阳性检测次
    JyydNum:integer; //假阳性应答次
    JsjcNum:integer; //假阴性检测次
    JsydNum:integer; //假阴性应答次
    TestDb:integer;  //screen test use db
    ReportMs:byte; //报告单模式
    xxdb1: single;  //象限db
    xxdb2: single;  //象限db
    xxdb3: single;  //象限db
    xxdb4: single;  //象限db
end;

type
  tdata=record
    x:integer;              //亮点的x,y坐标值,被democheckdata.pt赋值
    y:integer;
    db:integer;              //好像是第一次亮灯的数值,初始值好像为0,被democheckdata赋值,且4个点会减少一定数值
    arr:boolean;             //初始值为true应该表示指没测试的点 false应该是已经测试了的点
    oren:byte;                //初始值为0 在DelYDQK中被赋值
    isxy4:boolean;             //初始值为false,开始在getXy4设置4个点为true,之后在hasEnded中设置其它点的此字段为true
    arrtime:integer;           //步距?    初始值为4
    DBlow,DBmid,DBhigh:byte;   //预测DB的范围 DBmid 初始值为0
end;

type
  TPatient = record
     Id:string;
     name:string[10];   //姓名
     sex:string[2];     //性别
     age:string[3];     //年龄
     birthdate:string[10];
     eyesight:string;     //视力
     eyepower:string;  //眼压
     eyediam:string;  //直径
end;

type T5MotorArr=array[0..5] of integer;
type T10JJMotorArr=array[0..10] of integer;
type T10MotorArr=array[0..4,0..10] of integer;  //jj,x,y电机分段步数,x,y分段位置坐标X10

type
  newtdatarray = array of tdata;
  TDataArray = array of array of Single;
  PInteger = ^Integer;
  TIntArray = array of integer;
  TMDArray = array[0..56,0..1] of byte;
  TYCArray = array[0..23,0..1] of single;

var
  Server2Lower:TServer2Lower;
  Server2LowerTs:TServer2LowerTs;
  Server2LowerTsMove:TServer2LowerTsMove;
  Server2LowerTsMove10H:TServer2LowerTsMove10H;
  Server2LowerTsMove10N:TServer2LowerTsMove10N;


  Lower2Server:TLower2Server;
  SaveDataBd:TSAVEDATABD;         //布点 由TFMain.TimerInitTimer->ButtonInitClick-> ReadDevData 初始化。
  SaveDataTs:TSAVEDATATS;       //投射
  SaveDataHead:TSAVEDATAHead;   //硬件   由TFMain.TimerInitTimer->ButtonInitClick->ButtonReadHeadClick 初始化。
  SaveDataHeadLocal:TSAVEDATAHead; //本机
  OldPoint: TPoint;
  OldDB,OldGB,OldColor: byte;
  Old5MotorStep: T5MotorArr;  //存储上一次投射时5电机查表位置
  OldPId: integer;
  changeparm: boolean;

  Old4XY: boolean;                  //btStartClick之后设定为true,在hasEnded中xy4end为true时设定为false,false之后才会对非定位点之后的其它点测试             
  priXYFW,priXYFWF: boolean;
  T100msCount:integer;

  pubmovearr: T10MotorArr;
  pubanswerxy,pubanswerxystep:TPoint;

  pubMotoBuzy: boolean; //电机状态 忙不？
  pubblindon: boolean;  //盲测
  pubtestover: boolean;
  pubKmOpen: boolean; //开快门
  pubCurZbx: byte;  //1,2坐标系统

  pubmoveline: boolean; //扫描
  pubmoveend: boolean;  //线扫描结束
  pubmoveanswer: boolean; //扫描应答
  pubmovebackx,pubmovebacky,pubmovebackjj,pubmovexfx,pubmoveyfx: integer;
  pubmovexstep,pubmoveystep,pubmovejjstep: integer;

  DevTestData:TDEVTESTDATA;
  ExeFilePath:string;

  USBReadbuf:array[0..10240] of byte;

  USBDataBuf:array[0..102400] of byte;

  USBDataBufXj:array[0..102400] of byte;

  ////////
  A: TDataArray;
  pubqdcx: string;
  pubgbqd: boolean;
  pubYhdw,pubKorFstr: string;
  pubKorF: integer;
  pubPatient: TPatient;
  pubPrefer: TPrefer;
  pubMaintag: integer;
  pubblindx,pubblindy,pubblinddb: Byte;

  pubkey: boolean;
  pubkey1: boolean;
  publevel: Byte;       // =0 新测试 ＝1 VIEW  ＝2 选点重测
  pubQdms: Byte;      //=0 自动取点 ＝1 从库取点 ＝2 自由取点
  pubDub: boolean;  //是否已测双眼
  pubSave: boolean;
  pubResW: byte;  //1－测另一眼，2－复查
  pubLoad,pubLoadDb: boolean;
  pubZrfs: byte;  //1-测试载入, 2-FMAN 载入
  pubZdpz,pubResultDb: string;
  pubDbTime: TDateTime;

  pubProjId: integer;
  pubxx1,pubxx2,pubxx3,pubxx4: boolean;  //象限选择
  pubhastest: integer;                    //已经测试了的点
  pubbackon: boolean;

  My_top_db:integer;
  beep:boolean;  //07.9.16修改，主页加载时默认设置为false，即默认不出声

  publight,pubAnswer,pubAnswStop,pubHjg:boolean;  //true 强光 FALSE 暗室
  pubmovspid: byte; //1--9    移动速度
  pubshowgray: boolean;  //灰度显示
  pubEyeMoveYN: boolean;

  oldglass: byte;


  pmoverstrstep,pmovelstrstep: string;

  pmaxdb: integer;
  //////
  pubentertest: boolean;
  pubentertestmode: byte;   //进入检查方式 0 main  1 new 2 doc
  pubcurid: string;

  prikey,pritesting,pubgets:boolean; //pubgets获取硬件状态,showread置false.  pritesting hasEnded在测量的达到数目之后置为false.

  pubhjgda: integer;

  pubMoveTestSend: boolean; //

implementation


end.
