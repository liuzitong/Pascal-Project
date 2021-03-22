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
    head:array[1..3] of Byte;  //0,1,2 0xaa 0x0f 0xee  1��3��usbͨ��ʶ��֡ͷ
    dotcon:byte;  //3    0xc1��0x00�� �̼�������
    da:word;      //4,5   ����DBֵ��Ӧ��ADֵ,���ֽ���ǰ
    xcoord:byte;  //6   X����1-24
    rcoord:byte;  //7  R����1-20
    gcoord:byte;  //8  G����1-20
    stimtime:word;  //9,10 10-11λ��Ҫ��̼�������ʱ�䣬��λΪ����  ���ֽ���ǰ����Χ0-2000���� ���Ϊ0xff  0xff ��������������
    gillcon:byte; //11  0xc2��0x00��  ���е������
    gillup:byte;  //12  �϶�0xff
    gilldown:byte;  //13  �¶�0xff
    gillleft:byte;  //14  ��0xff
    gillright:byte;  //15  �Ҷ�0xff
    cameracon:byte;  //16   0xc3��0x00�� ����ͷ��Դ����
    cameraonoff:byte; // 17  ��Դ��0xff  ��Դ��0x00
    otherlamp:byte;  //18  0xc4��0x00�� ���������� ��ִ�з�0x00
    fixlamp:array[1..9] of Byte;  //19-27   ���ӵ�1-9   ��ֵ1-255
    Infraredlamp:array[1..4] of Byte; //28-31   �����1-4   ��ֵ1-255
    backlamp:array[1..3] of Byte; //32-34   ������R   ������G  ������B   ��ֵ1-255
    lowerstatus:byte;  //35   0xc5��0x00��Ҫ����λ������״̬
    lowerbuzy:byte; //36   �践��0xff  ���践��0x00  æ״̬
    lowerserial:byte;  //37  �践��0xff  ���践��0x00   Ӳ�������
    answer:byte;  //  38  ��Ӧ��״̬  �践��0xff  ���践��0x00
    glasspos:byte;  // 39   ����״̬  �践��0xff  ���践��0x00
    envlight1:byte;  // 40  ������1   �践��0xff  ���践��0x00
    envlight2:byte;  // 41  ������2   �践��0xff  ���践��0x00
    envtemper:byte;  //42  �����¶�
    eyeleft:byte;  //43  ����λ
    eyeright:byte;  //44  ����λ
    motorlimit:byte; //45  �����λ״̬
    savedata:byte;  // 46 �洢����
    backup:array[1..15] of Byte;  // 47��61�ֽ�  Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63   0x4e   0x4f  63��64�ǽ���֡��
  end;

type
  TLower2Server=record
    head:array[1..3] of Byte;  //0,1,2  0xaa 0xf0 0xee 1��3��usbͨ��ʶ��֡ͷ
    lowerbuzy:byte; //3  æ0xff ��æ0x11
    lowerserialhard:word;  //4��5  5��6 ��Ӳ����
    lowerserialsoft:word;  //6��7  7��8�������
    answer:byte;  //  8 ����ȥ0xff  û��0x11
    answertime:word; //9-10 �����̼� ��ķ�Ӧʱ�� ��λ����
    glasspos:byte;  // 11  ����״̬ ̧������0xff  ����ȥ��0x11
    eyeleft:byte;  //12  ����λ ��0xff ��0x11
    eyeright:byte;  //13  ����λ  ��0xff ��0x11
    envlight1:word;  //14��15  15��16�ǻ�����1��ֵ
    envlight2:word;  //16��17   17��18�ǻ�����2��ֵ
    envtemper:word;  //18,19  �����¶�
    motorlimit:array[1..10] of byte; //20-29  �����λ��λ1-10  ��0xff ��0x11
    backup:array[1..15] of Byte;  //30-61 31��62�ֽ�Ϊ��������ȫΪ0x00
    ending:array[1..2] of Byte;  //62,63  0xe4  0xf4  63��64�ǽ���֡��
  end;

{
һ���������Ϳ��Ƶ�64��16��������
�ֽ�λ����    1          2       3           4                 5             6
��    �ݣ�   0xaa      0x0f     0xee       0xc1��0x00��        0x??           0x??
˵    ���� ��1��3��usbͨ��ʶ��֡ͷ��   �̼�������     ( ����DBֵ��Ӧ��ADֵ,���ֽ���ǰ )
                            ��ִ�з�0x00

�ֽ�λ����    7            8          9                10        11
��    �ݣ�   0x??        0x??         0x??            0x??       0x??
˵    ����( X����1-24,R����1-20, G����1-20,)    (10-11λ��Ҫ��̼�������ʱ�䣬��λΪ����)
	���ֽ���ǰ����Χ0-2000����
        �����Ϊ0xff  0xff �������������ã�

�ֽ�λ����   12                13          14
��    �ݣ�  0xc2��0x00��       0x??       0x??
˵    ���� ���е������     �϶�0xff    �¶�0xff

�ֽ�λ����    15          16           17               18            19             20
��    �ݣ�   0x??        0x??          0xc3��0x00��    0x??         0xc4��0x00��     0x??
˵    ���� ��0xff    �Ҷ�0xff     ����ͷ��Դ����    ��Դ��0xff   ����������      ���ӵ�1
           ֹͣ0x00    ֹͣ0x00     ��ִ�з�0x00    ��Դ��0x00   ��ִ�з�0x00    ��ֵ1-255

�ֽ�λ����    21          22           23              24            25             26
��    �ݣ�   0x??        0x??          0x??            0x??          0x??           0x??
˵    ���� ���ӵ�2     ���ӵ�3      ���ӵ�4         ���ӵ�5       ���ӵ�6        ���ӵ�7
          ��ֵ1-255    ��ֵ1-255    ��ֵ1-255       ��ֵ1-255      ��ֵ1-255      ��ֵ1-255

�ֽ�λ����    27          28           29              30            31             32
��    �ݣ�   0x??        0x??          0x??            0x??          0x??           0x??
˵    ���� ���ӵ�8     ���ӵ�9      �����1        �����2       �����3        ������
          ��ֵ1-255    ��ֵ1-255    ��ֵ1-255       ��ֵ1-255      ��ֵ1-255      ��ֵ1-255

�ֽ�λ����    33          34              35            36            37             38
��    �ݣ�   0x??         0x??           0x??        0xc5��0x00��     0x??           0x??
˵    ���� ������R      ������G     ������B     Ҫ����λ��       æ״̬       Ӳ�������
      ��ֵ1-255      ��ֵ1-255   ��ֵ1-255    ����״̬        �践��0xff    �践��0xff

�ֽ�λ����    39          40              41            42            43              44
��    �ݣ�   0x??        0x??             0x??          0x??          0x??           0x??
˵    ������Ӧ��״̬    ����״̬        ������1     ������2       �����¶�         ����λ
     �践��0xff    �践��0xff     �践��0xff      �践��0xff     �践��0xff    �践��0xff
     ���践��0x00  ���践��0x00  ���践��0x00   ���践��0x00   ���践��0x00  ���践��0x00

�ֽ�λ����    45         46             47              48-��-62         63            64
��    �ݣ�   0x??         0x??          0x??           0x00--0x00       0x4e           0x4f
˵    ���� ����λ     �����λ״̬    �洢����        46��62�ֽ�     ��63��64�ǽ���֡�룩
     �践��0xff   �践��0xff      �践��0xff     Ϊ��������ȫΪ0x00
   ���践��0x00  ���践��0x00  ���践��0x00

�����ӻ����ظ�������64��16��������
�ֽ�λ����    1          2       3              4                 5             6
��    �ݣ�   0xaa      0xf0     0xee            0x??             0x??           0x??
˵    ���� ��1��3��usbͨ��ʶ��֡ͷ��        æ״̬         ��  5��6 ��Ӳ����     ��
                                  æ0xff
                                             ��æ0x11

�ֽ�λ����    7         8         9           10      11          12             13
��    �ݣ�   0x??      0x??      0x??        0x??     0x??        0x??           0x??
˵    ���� (7��8������ţ�   ��Ӧ��״̬  ��10-11 �����̼���    ����״̬        ����λ
                              ����ȥ0xff    ����ķ�Ӧʱ�䣩   ̧������0xff 	 ��0xff
                               û��0x11    �� ��λ����  ��    ����ȥ��0x11     ��0x11

�ֽ�λ����    14        15          16           17             18             19
��    �ݣ�   0x??      0x??         0x??         0x??           0x??           0x??
˵    ���� ����λ  ��14��15�ǻ�����1��ֵ�� ��16��17�ǻ�����2��ֵ��     �¶�ֵ
           ��0xff
           ��0x11

�ֽ�λ����    20        21          22           23             24             25
��    �ݣ�   0x??      0x??         0x??         0x??           0x??           0x??
˵    ���� �¶�ֵ     ��λ1      ��λ2         ��λ3         ��λ4          ��λ5
                      ��0xff      ��0xff         ��0xff         ��0xff          ��0xff
                      ��0x11     ��0x11        ��0x11        ��0x11         ��0x11

�ֽ�λ����    26        27          28           29             30             31
��    �ݣ�   0x??      0x??         0x??         0x??           0x??           0x00
˵    ����   ��λ6    ��λ7      ��λ8         ��λ9         ��λ10
            ��0xff     ��0xff      ��0xff         ��0xff         ��0xff
            ��0x11    ��0x11     ��0x11        ��0x11        ��0x11

�ֽ�λ����    32  --------��---------    62            63              64
��    �ݣ�   0x00 --------------------------     0x00           0xe4           0xf4
˵    ����   �� 31��62�ֽ�Ϊ��������ȫΪ0x00  ��   ��  63��64�ǽ���֡��    ��

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
