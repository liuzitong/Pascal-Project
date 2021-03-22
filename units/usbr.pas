unit usbr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Hid, HidUsage, SetupAPI,
  StdCtrls, ExtCtrls, ScktComp;

const
  USBDATALEN=64;

type
  TReadCmdData=record
	  Chin_Dir:integer;
    v12:Byte;
    v34:Byte;
    state:Byte;
    state2:Byte;
    color:Byte;
    size:Byte;
    i:Byte;
    j:Byte;
    Background_Color:Byte;
    Fixation_Mode:Byte;
    da:Word;
    back1:Word;
    back2:Word;
    ambient_light:Word;
    Infrared_pwm:Word;
	  motorpos:array[1..8] of Smallint;
    temp:array[1..16] of Byte;
    USBErrorCount:Word;
    v56:Byte;
    v78:Byte;
  end;

type
  TServer2Lower=record
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1至3是usb通信识别帧头
    dotcon:byte;  //3    0xc1（0x00） 刺激点命令
    da:word;      //4,5   亮度DB值对应的AD值,高字节在前
    xcoord:byte;  //6   X坐标1-24
    rcoord:byte;  //7  R坐标1-20
    gcoord:byte;  //8  G坐标1-20
    stimtime:word;  //9,10 10-11位是要求刺激点亮的时间，单位为毫秒  高字节在前，范围0-2000毫秒 如果为0xff  0xff 代表常亮，调试用
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
    envtemper:byte;  //42  环境温度
    eyeleft:byte;  //43  左眼位
    eyeright:byte;  //44  右眼位
    motorlimit:byte; //45  电机限位状态
    savedata:byte;  // 46 存储数据
    backup:array[1..15] of Byte;  // 47至61字节  为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63至64是结束帧码
  end;

type
  TLower2Server=record
    head:array[1..3] of Byte;  //0,1,2  0xaa 0xf0 0xee 1至3是usb通信识别帧头
    lowerbuzy:byte; //3  忙0xff 不忙0x11
    lowerserialhard:word;  //4，5  5至6 是硬件号
    lowerserialsoft:word;  //6，7  7至8是软件号
    answer:byte;  //  8 按下去0xff  没按0x11
    answertime:word; //9-10 看到刺激 点的反应时间 单位毫秒
    glasspos:byte;  // 11  镜架状态 抬上来是0xff  扳下去是0x11
    eyeleft:byte;  //12  左眼位 是0xff 否0x11
    eyeright:byte;  //13  右眼位  是0xff 否0x11
    envlight1:word;  //14，15  15至16是环境光1的值
    envlight2:word;  //16，17   17至18是环境光2的值
    envtemper:word;  //18,19  环境温度
    motorlimit:array[1..10] of byte; //20-29  电机限位限位1-10  是0xff 否0x11
    backup:array[1..15] of Byte;  //30-61 31至62字节为备用数据全为0x00
    ending:array[1..2] of Byte;  //62,63  0xe4  0xf4  63至64是结束帧码
  end;

{
一、主机发送控制的64个16进制数据
字节位数：    1          2       3           4                 5             6
数    据：   0xaa      0x0f     0xee       0xc1（0x00）        0x??           0x??
说    明： （1至3是usb通信识别帧头）   刺激点命令     ( 亮度DB值对应的AD值,高字节在前 )
                            不执行发0x00

字节位数：    7            8          9                10        11
数    据：   0x??        0x??         0x??            0x??       0x??
说    明：( X坐标1-24,R坐标1-20, G坐标1-20,)    (10-11位是要求刺激点亮的时间，单位为毫秒)
	高字节在前，范围0-2000毫秒
        （如果为0xff  0xff 代表常亮，调试用）

字节位数：   12                13          14
数    据：  0xc2（0x00）       0x??       0x??
说    明： 腮托电机命令     上动0xff    下动0xff

字节位数：    15          16           17               18            19             20
数    据：   0x??        0x??          0xc3（0x00）    0x??         0xc4（0x00）     0x??
说    明： 左动0xff    右动0xff     摄像头电源命令    电源开0xff   辅助灯命令      固视灯1
           停止0x00    停止0x00     不执行发0x00    电源关0x00   不执行发0x00    数值1-255

字节位数：    21          22           23              24            25             26
数    据：   0x??        0x??          0x??            0x??          0x??           0x??
说    明： 固视灯2     固视灯3      固视灯4         固视灯5       固视灯6        固视灯7
          数值1-255    数值1-255    数值1-255       数值1-255      数值1-255      数值1-255

字节位数：    27          28           29              30            31             32
数    据：   0x??        0x??          0x??            0x??          0x??           0x??
说    明： 固视灯8     固视灯9      红外灯1        红外灯2       红外灯3        大红外灯
          数值1-255    数值1-255    数值1-255       数值1-255      数值1-255      数值1-255

字节位数：    33          34              35            36            37             38
数    据：   0x??         0x??           0x??        0xc5（0x00）     0x??           0x??
说    明： 背景灯R      背景灯G     背景灯B     要求下位机       忙状态       硬件软件号
      数值1-255      数值1-255   数值1-255    返回状态        需返回0xff    需返回0xff

字节位数：    39          40              41            42            43              44
数    据：   0x??        0x??             0x??          0x??          0x??           0x??
说    明：响应器状态    镜架状态        环境光1     环境光2       环境温度         左眼位
     需返回0xff    需返回0xff     需返回0xff      需返回0xff     需返回0xff    需返回0xff
     不需返回0x00  不需返回0x00  不需返回0x00   不需返回0x00   不需返回0x00  不需返回0x00

字节位数：    45         46             47              48-至-62         63            64
数    据：   0x??         0x??          0x??           0x00--0x00       0x4e           0x4f
说    明： 右眼位     电机限位状态    存储数据        46至62字节     （63至64是结束帧码）
     需返回0xff   需返回0xff      需返回0xff     为备用数据全为0x00
   不需返回0x00  不需返回0x00  不需返回0x00

二、从机返回给主机的64个16进制数据
字节位数：    1          2       3              4                 5             6
数    据：   0xaa      0xf0     0xee            0x??             0x??           0x??
说    明： （1至3是usb通信识别帧头）        忙状态         （  5至6 是硬件号     ）
                                  忙0xff
                                             不忙0x11

字节位数：    7         8         9           10      11          12             13
数    据：   0x??      0x??      0x??        0x??     0x??        0x??           0x??
说    明： (7至8是软件号）   响应器状态  （10-11 看到刺激）    镜架状态        左眼位
                              按下去0xff    （点的反应时间）   抬上来是0xff 	 是0xff
                               没按0x11    （ 单位毫秒  ）    扳下去是0x11     否0x11

字节位数：    14        15          16           17             18             19
数    据：   0x??      0x??         0x??         0x??           0x??           0x??
说    明： 右眼位  （14至15是环境光1的值） （16至17是环境光2的值）     温度值
           是0xff
           否0x11

字节位数：    20        21          22           23             24             25
数    据：   0x??      0x??         0x??         0x??           0x??           0x??
说    明： 温度值     限位1      限位2         限位3         限位4          限位5
                      是0xff      是0xff         是0xff         是0xff          是0xff
                      否0x11     否0x11        否0x11        否0x11         否0x11

字节位数：    26        27          28           29             30             31
数    据：   0x??      0x??         0x??         0x??           0x??           0x00
说    明：   限位6    限位7      限位8         限位9         限位10
            是0xff     是0xff      是0xff         是0xff         是0xff
            否0x11    否0x11     否0x11        否0x11        否0x11

字节位数：    32  --------至---------    62            63              64
数    据：   0x00 --------------------------     0x00           0xe4           0xf4
说    明：   （ 31至62字节为备用数据全为0x00  ）   （  63至64是结束帧码    ）

}
  TUsbrThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

  TFUsbr = class(TForm)
    ServerSocket: TServerSocket;
    Timer: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EtUSBReadCount: TEdit;
    EtRunstate: TEdit;
    EtTCPReadCount: TEdit;
    EtTCPRDCount: TEdit;
    EtUSBWriteCount: TEdit;
    EtStimulusCount: TEdit;
    EtTCPWDCount: TEdit;
    Label4: TLabel;
    EtUSBLoopTick: TEdit;
    Label9: TLabel;
    EtUSBErrorCount: TEdit;
    Label10: TLabel;
    EtThresholdCount: TEdit;
    Label11: TLabel;
    EtUSBFileHandle: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    EtTCPErrorCount: TEdit;
    BtClear: TButton;
    BtStart: TButton;
    BtStop: TButton;
    Pause: TButton;
    EtUSBFileName: TMemo;
    Label15: TLabel;
    EtEye: TEdit;
    Label14: TLabel;
    EtAge: TEdit;
    EtClient: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure BtClearClick(Sender: TObject);
    procedure BtStartClick(Sender: TObject);
    procedure BtStopClick(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);

  private
    { Private declarations }
    hCommCS:TRTLCriticalSection;

    Guid:TGUID;
    info:THandle;
    ifdata:TSPDeviceInterfaceData;
    detail:TSPDeviceInterfaceDetailData;
    Overlapped:TOverlapped;

    USBReadCount:integer;
    USBReadbuf:array[0..10240] of byte;
    USBReadLen:DWord;

    USBWriteCount:integer;
    USBWritebuf:array[0..10240] of byte;
    USBWriteLen:DWord;

    USBWaitLen:DWord;

    USBLoopTick:integer;
    USBErrorCount:integer;

    Thread:TUsbrThread;

    TCPReadCount:integer;
    TCPRDCount:integer;
    TCPWDCount:integer;
    TCPErrorCount:integer;

    LoopCount,LoopCount2:integer;

    function MainLoop:boolean;
    function Init:boolean;
    function OpenUsbFile:boolean;
    function OpenUsbFile_retry:boolean;
    function SendCommand:boolean;
    function SendCommand_retry:boolean;
    function WaitOverlapped:boolean;

    function RDCmd(n:integer):boolean;
    function WDCmd(n:integer; s:string):boolean;

    function ServerSocketCmd(cmd:string):string;

  public
    { Public declarations }
    InitOk:boolean;
    ReInit:boolean;
    hid:THandle;
    ReadCmdData:TReadCmdData;
    USBDataBuf:array[0..102400] of byte;
  end;

var
  FUsbr: TFUsbr;

implementation

uses Myutils, xwxh;

{$R *.DFM}

{ TUsbrThread }
procedure TUsbrThread.Execute;
begin
  { Place thread code here }
  while not bQuit do
  begin
    FUsbr.MainLoop;
  end;
end;

procedure TFUsbr.FormCreate(Sender: TObject);
begin
  InitializeCriticalSection(hCommCS);
  Thread:=TUsbrThread.Create(false);
  ReadCmdData.v12:=$12;
  ReadCmdData.v34:=$34;
  ReadCmdData.v56:=$56;
  ReadCmdData.v78:=$78;
end;

procedure TFUsbr.FormDestroy(Sender: TObject);
begin
  bQuit:=True;
  DeleteCriticalSection(hCommCS);
  Thread.Terminate;
  Thread.WaitFor;
end;

function TFUsbr.MainLoop:boolean;
var
  i,c,len:integer;
  b:boolean;
  tick:DWord;
begin
  hid:=INVALID_HANDLE_VALUE;
  while not bQuit do
  begin
    if Init then break;
    sleep(100);
  end;

  c:=0;
  inc(LoopCount);
  while not bQuit do
  begin
    xwDownload:=False;
    if not OpenUsbFile then
    begin
      inc(c);
      sleep(1000);
      if c>10 then break;
      continue;
    end;

    i:=0;
    tick:=GetTickCount;
    len:=168;
    InitOk:=False;
    while not bQuit do
    begin
      if len<>168 then b:=RDCmd(i*(USBDATALEN-4)) else b:=RDCmd($10000+i*(USBDATALEN-4));
      inc(i);
      if i>=len then
      begin
        if len=50 then InitOk:=True;
        i:=0;
        len:=50;
        USBLoopTick:=GetTickCount-tick;
        tick:=GetTickCount;
        if USBLoopTick<1000 then Sleep(20);
      end;
      if not b then
      begin
        break;
      end;
      if ReInit then
      begin
        ReInit:=false;
        break;
      end;
    end;

    if hid<>INVALID_HANDLE_VALUE then CloseHandle(hid);
    hid:=INVALID_HANDLE_VALUE;
    sleep(100);
  end;

  if hid<>INVALID_HANDLE_VALUE then CloseHandle(hid);
  Result:=true;
end;

function TFUsbr.Init:boolean;
var
  n:DWord;
  index:DWord;
  s:string;
begin
{
  Result:=false;
  HidD_GetHidGuid(Guid);
  info:=SetupDiGetClassDevs(Guid, nil, 0, cDIGCFPresent + cDIGCFDeviceInterface);
  index:=0;
  while true do
  begin
    ifData.cbSize:=sizeof(ifData);
    if SetupDiEnumDeviceInterfaces(info, nil, Guid, index, ifData)=0 then
    begin
      break;
    end;
    inc(index);

    n:=0;
    fillchar(detail, sizeof(detail), 0);
    detail.cbSize:=sizeof(detail);
    if SetupDiGetDeviceInterfaceDetail(info, @ifData, nil, 0, @n, nil)=0 then
    begin
      if (GetLastError<>ERROR_INSUFFICIENT_BUFFER) then RecordLastError('SetupDiGetDeviceInterfaceDetail');
    end;

    detail.cbSize:=5;
    if SetupDiGetDeviceInterfaceDetail(info, @ifData, @detail, n, nil, nil)=0 then
    begin
      RecordLastError('SetupDiGetDeviceInterfaceDetail');
      break;
    end;
    s:=UpperCase(detail.DevicePath);
    if Pos('VID_0483&PID_5750', s)>0 then
    begin
      Result:=true;
      break;
    end;
  end;
  SetupDiDestroyDeviceInfoList(info);
  }
end;

function TFUsbr.OpenUsbFile:boolean;
begin
  hid:=CreateFile(detail.DevicePath, GENERIC_READ + GENERIC_WRITE,
  FILE_SHARE_READ + FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
  Result:=hid<>INVALID_HANDLE_VALUE;
end;

function TFUsbr.OpenUsbFile_retry:boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 10 do
  begin
    if OpenUsbFile then
    begin
      Result:=true;
      exit;
    end;
    Sleep(100);
    if bQuit then break;
  end;
end;

function TFUsbr.SendCommand:boolean;
begin
  Result:=false;
  inc(USBWriteCount);
  if not WriteFile(hid, USBWritebuf, USBDATALEN, USBWriteLen, @Overlapped) then
  begin
    if GetLastError<>ERROR_IO_PENDING then
    begin
      RecordLastError('WriteFile');
      inc(USBErrorCount);
      exit;
    end
    else
    begin
      WaitOverlapped;
      USBWriteLen:=USBWaitLen;
    end;
  end;
  if USBWriteLen<>USBDATALEN then
  begin
    inc(USBErrorCount);
    exit;
  end;

  if not ReadFile(hid, USBReadbuf, 1000+USBDATALEN, USBReadLen, @Overlapped) then
  begin
    if GetLastError<>ERROR_IO_PENDING then
    begin
      inc(USBErrorCount);
      RecordLastError('ReadFile');
      exit;
    end
    else
    begin
      WaitOverlapped;
      USBReadLen:=USBWaitLen;
    end;
  end;
  if USBReadLen<>USBDATALEN then
  begin
    USBReadLen:=0;
    inc(USBErrorCount);
    exit;
  end;
  if USBReadbuf[0]<>7 then
  begin
    inc(USBErrorCount);
    USBReadLen:=0;
    exit;
  end;
  inc(USBReadCount);
  Result:=true;
end;

function TFUsbr.SendCommand_retry:boolean;
var
  i:integer;
begin
  Result:=false;
  for i:=1 to 10 do
  begin
    if SendCommand then
    begin
      Result:=true;
      exit;
    end;
    if hid<>INVALID_HANDLE_VALUE then CloseHandle(hid);
    hid:=INVALID_HANDLE_VALUE;
    if not OpenUsbFile_retry then break;
    Sleep(100);
  end;
end;

function TFUsbr.WaitOverlapped:boolean;
var
  tick:DWord;
begin
  Result:=false;
  USBWaitLen:=0;
  Tick:=GetTickCount;
  while not bQuit do
  begin
    Application.ProcessMessages;
    if not GetOverlappedResult(hid, Overlapped, USBWaitLen, false) then
    begin
      if GetLastError<>ERROR_IO_INCOMPLETE then
      begin
        RecordLastError('GetOverlappedResult');
        Result:=False;
        break;
      end;
    end;
    if USBWaitLen>0 then
    begin
      Result:=true;
      break;
    end;
    if (GetTickCount-tick)>=1000 then break;
  end;
end;

function TFUsbr.RDCmd(n:integer):boolean;
var
  i,n2:integer;
begin
  EnterCriticalSection(hCommCS);
  Result:=false;
  Fillchar(USBWritebuf, sizeof(USBWritebuf), 0);
  USBWritebuf[0]:=1;
  USBWritebuf[1]:=n div (256*256) and $ff;
  USBWritebuf[2]:=n div (256) and $ff;
  USBWritebuf[3]:=n div (1) and $ff;
  Move(ReadCmdData, USBWritebuf[4], USBDATALEN-4);
  if SendCommand then
  begin
    n2:=256*256*USBReadbuf[1]+256*USBReadbuf[2]+USBReadbuf[3];
    if n<>n2 then
    begin
      inc(USBErrorCount);
      n:=n2;
      FlushFileBuffers(hid);
    end;
    for i:=4 to USBDATALEN-1 do
    begin
      USBDatabuf[n+i-4]:=USBReadbuf[i];
    end;
    Result:=true;
  end;
  LeaveCriticalSection(hCommCS);
end;

function TFUsbr.WDCmd(n:integer; s:string):boolean;
var
  i:integer;
begin
  EnterCriticalSection(hCommCS);
  Result:=false;
  USBWritebuf[0]:=2;
  if Length(s)<>(USBDATALEN-4) then
  begin
    USBWritebuf[0]:=3;
    USBWritebuf[4]:=Length(s);
    for i:=1 to Length(s) do USBWritebuf[5+i-1]:=Byte(s[i]);
  end
  else
  begin
    for i:=1 to Length(s) do USBWritebuf[4+i-1]:=Byte(s[i]);
  end;
  USBWritebuf[1]:=n div (256*256) and $ff;
  USBWritebuf[2]:=n div (256) and $ff;
  USBWritebuf[3]:=n div (1) and $ff;
  if SendCommand_retry then Result:=true;
  LeaveCriticalSection(hCommCS);
end;

procedure TFUsbr.ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s:string;
  len:integer;
  tick:DWord;
begin
  inc(TCPReadCount);
  s:='';
  tick:=GetTickCount;
  while true do
  begin
    s:=s+Socket.ReceiveText;
    if Length(s)<2 then
    begin
      exit;
    end;
    if (GetTickCount-Tick)>=1000 then
    begin
      exit;
    end;
    len:=256*Byte(s[1])+Byte(s[2]);
    if Length(s)=len then break;
    if Length(s)>len then
    begin
      break;
    end;
  end;
  s:=ServerSocketCmd(s);
  Socket.SendText(s);
end;

function TFUsbr.ServerSocketCmd(cmd:string):string;
var
  s,sz:string;
  i,n,nd,len,lenz:integer;
  ok:boolean;
begin
  Result:='';
  n:=Byte(cmd[4])*256*256+Byte(cmd[5])*256+Byte(cmd[6]);
  len:=Byte(cmd[7])*256+Byte(cmd[8]);
  if cmd[3]=#1 then begin
    inc(TCPRDCount);
    SetLength(s, len);
    for i:=1 to len do s[i]:=char(USBDataBuf[n+i-1]);
  end
  else if cmd[3]=#2 then begin
    inc(TCPWDCount);
    ok:=false;
    if hid<>INVALID_HANDLE_VALUE then begin
      EnterCriticalSection(hCommCS);
      nd:=9;
      while (len>0) and (not bQuit) do begin
        lenz:=len;
        if lenz>(USBDATALEN-4) then lenz:=USBDATALEN-4;
        sz:=Copy(cmd, nd, lenz);
        ok:=WDCmd(n, sz);
        if not ok then begin
          inc(TCPErrorCount);
          break;
        end;
        dec(len, USBDATALEN-4);
        inc(n, USBDATALEN-4);
        inc(nd, USBDATALEN-4);
      end;
      LeaveCriticalSection(hCommCS);
    end;
    s:='ER';
    if ok then begin
      s:='OK';
    end;
  end;
  s:=Copy(cmd, 1, 8)+s;
  s[1]:=char(Length(s) div 256);
  s[2]:=char(Length(s) and $ff);
  Result:=s;
end;

procedure TFUsbr.ServerSocketClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode:=0;
  Socket.Close;
  inc(TCPErrorCount);
end;

procedure TFUsbr.TimerTimer(Sender: TObject);
begin
  Timer.Enabled:=False;
  if LoopCount<>LoopCount2 then begin
    LoopCount2:=LoopCount;
    EtUSBFileName.Lines.Add(detail.DevicePath);
  end;
  EtUSBFileHandle.Text:=IntToStr(hid);
  EtUSBReadCount.Text:=IntToStr(USBReadCount);
  EtUSBWriteCount.Text:=IntToStr(USBWriteCount);
  EtUSBLoopTick.Text:=IntToStr(USBLoopTick);
  EtUSBErrorCount.Text:=IntToStr(USBErrorCount);
  EtRunstate.Text:=IntToStr(USBDataBuf[0]);
  EtStimulusCount.Text:=IntToStr(USBDataBuf[840]+256*USBDataBuf[841]);
  EtThresholdCount.Text:=IntToStr(USBDataBuf[844]+256*USBDataBuf[845]);
  EtEye.Text:=IntToStr(USBDataBuf[960+4*27]);
  EtAge.Text:=IntToStr(USBDataBuf[960+4*28]);
  EtTCPReadCount.Text:=IntToStr(TCPReadCount);
  EtTCPRDCount.Text:=IntToStr(TCPRDCount);
  EtTCPWDCount.Text:=IntToStr(TCPWDCount);
  EtTCPErrorCount.Text:=IntToStr(TCPErrorCount);
  Timer.Enabled:=True;
end;

procedure TFUsbr.BtClearClick(Sender: TObject);
begin
  USBReadCount:=0;
  USBWriteCount:=0;
  USBErrorCount:=0;
  TCPReadCount:=0;
  TCPRDCount:=0;
  TCPWDCount:=0;
  TCPErrorCount:=0;
  EtUSBFileName.Text:=EtUSBFileName.Lines[0];
end;

procedure TFUsbr.BtStartClick(Sender: TObject);
var
  s:string;
begin
  s:=#1#0#0#0;
  WDCmd(0, s);
end;

procedure TFUsbr.BtStopClick(Sender: TObject);
var
  s:string;
begin
  s:=#0#0#0#0;
  WDCmd(0, s);
end;

procedure TFUsbr.PauseClick(Sender: TObject);
var
  s:string;
begin
  s:=#2#0#0#0;
  WDCmd(0, s);
end;

procedure TFUsbr.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i:integer;
begin
  EtClient.Lines.Clear;
  for i:=0 to ServerSocket.Socket.ActiveConnections-1 do begin
    EtClient.Lines.Add(ServerSocket.Socket.Connections[i].RemoteAddress);
  end;
end;

end.
