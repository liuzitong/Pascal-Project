unit Myutils;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Math, TeEngine, Chart, Series,
  Dialogs, ExtCtrls, Db, DBTables, Wwtable, Buttons, StdCtrls, fcLabel, Menus, Wwdbcomb, ComCtrls, ScktComp,
  cxCheckListBox, cxLabel, cxRadioGroup, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses, wwDBNavigator,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, Wwdbigrd, Wwdbgrid,
  cxGridDBTableView, cxGrid, dxBar, cxListView, cxButtons, cxMemo,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxPC, dxNavBar, dxNavBarCollns, dxNavBarBase,
  cxCheckComboBox, cxCheckBox, cxGroupBox, cxCheckGroup;

const
  Space10   = #32#32#32#32#32#32#32#32#32#32;
  Zero10    = #0#0#0#0#0#0#0#0#0#0;
  RegString = '12345678';

const
  MAXMNO=32;

const
  BMPFILEHEAD320x240x24=
        #$42#$4D#$36#$84#$03#$00#$00#$00#$00#$00#$36#$00#$00#$00#$28#$00+
        #$00#$00#$40#$01#$00#$00#$F0#$00#$00#$00#$01#$00#$18#$00#$00#$00+
        #$00#$00#$00#$84#$03#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00+
        #$00#$00#$00#$00#$00#$00;
        
type
  TMachine=record
    Active:boolean;
    Pause:boolean;
    Gw:string[80];
    Sb:string[80];
    Ip:string[20];
    Error:boolean;
    boxtype,testtype,runstate:string[80];
    cpv0,cpv1,cpv2,cpv3,pv0,pv1,wt,cspv0,cspv1:string[80];
    AlarmIn,AlarmStop,bHumShow,bPvAlarm_:string[20];
    commstate:string[80];
  end;

  TS7200Data = record
    AlarmIn,AlarmStop,AlarmAck:boolean;
    bHumShow:boolean;
    bLinking:boolean;
    bPvAlarm_:boolean;
    pv:array[0..40] of double;
    auxpv:array[0..40] of double;
    QB0,QB1,QB2,QB3,QB4,QB5:integer;
    IB0,IB1,IB2,IB3,IB4,IB5:integer;
    runtime:double;
    regcount:double;
    runtime_:double;
    totalruntime:double;
    cspv0,cspv1,cspv2,cspv3:double;
    hout0,cout0,hout1,cout1:double;
    cpv0,cpv1,cpv2,cpv3:double;
    wt,wspv:double;
    runstate:integer;
    runstate2:integer;
    testtype:integer;
    pidno:integer;
    xrolc,xroll,irolc,iroll:integer;
    segno,segnum:integer;
    yearopen,monthopen,dayopen,houropen,minuteopen:integer;
    yearclose,monthclose,dayclose,hourclose,minuteclose:integer;
    eepromwc:integer;
    bHumBox,bQDBox,bGFBox,bWC,bWC2,bWC3,bTempBox,bHumBox2,bLightBox:boolean;
    bRun,bProgTest,bHumTest:boolean;
    bReg,bRegStop:boolean;
    bTimerOpen,bTimerClose:boolean;
    bAuxPv9:boolean;
    bIllume:boolean;
    bHs,bHsHf:boolean;
    bYjRunPos:boolean;
    bLink:boolean;
    boxtype:integer;
    blacklength:integer;
    RecordTimeLength:integer;
    printtimelength:integer;
    ptno:integer;
    pname:string;
    segtw,segspv0,segspv1,segspv2:double;
    seg1tw,seg1spv0,seg1spv1,seg1spv2:double;
    seg1ev:integer;
    linkptno,linkrol:integer;

    VB:array[0..10240] of integer;
  end;

var
  ExeFileName:string;
  ExeFileExt:string;
  ExeFilePath:string;
  ExeFilePath2:string;
  Trk:TStrings;
  Machines:array[0..MAXMNO] of TMachine;
  S7200Data:TS7200Data;
  CurrentMno:integer;
  LastErrorString:string;
  bQuit:boolean;

function Xwxx(s:string):integer;
function Tsxx(s:string):integer;
function Jgxx(s:string):integer;
function CharToInt(c:char):integer;
function ValidGzr(s:string):boolean;
function DateToGzr(da:TDate):string;
function CopySubStr(var S:string; Substr:string):string;
function CopySubStrDelta(var s:string):string;
function CopyDirFiles(sdir, odir, filter:string):boolean;
function StrToFloatDef(s:string; f:double):double;
function StrToFloatError(s:string; var v:double):boolean;
function GetZoneType(qsrq, jsrq:TDate; var s:string):integer;
function IncStringCount(s:string):string;
function IncStringBH100(s:string):string;
function GetHum(T0,T1,A,P:double):double;
function Humew(AT:double):double;
function S8ToDate(s:string):TDate;
function S8ToDateStr(s:string):string;
function DateToS8(d:TDate):string;
function StrToCurrF(s:string):double;
function AddSumOfString(s:string):integer;
function XorSumOfString(s:string):integer;
function AddSumOfString2(s:string):integer;
procedure GetYueQzrq(n,y:WORD; var Qsrq,Jsrq:TDate);
procedure Sort(var y:Array of double; L:integer);
function StrToHex(s:string; l:integer):integer;
function IntToHexL(i,L:integer):string;
function IntToChinese(i:integer):string;
function GetINIString(app,key:string):string;
procedure SetINIString(app,key,value:string);
function GetOtherINIString(f,app,key:string):string;
procedure SetOtherINIString(f,app,key,value:string);
function GetExeFileYear:integer;
function GetDateTimeFileName:string;
function H4ToFloat(s:string):double;
function HB4ToFloat(b0,b1,b2,b3:byte):double;
function FloatToH4(x:double):string;
procedure FloatToHB4(x:double; var b0,b1,b2,b3:byte);
function RoundL(x:real):integer;
procedure AddXYtoSeries(series:TChartSeries; x, y:double);
procedure ShowAlarmBar(b:boolean; bar:TPanel; c0:TColor=clBlack; c1:TColor=clRed);
function InttoBIN(v:integer; len:integer):string;
function BintoInt(v:string):integer;
function GetCursorValue(sr:TChartSeries; x:double; var rate:double):double;
function GetCursorValue2(sr:TChartSeries; x:double):double;
function ReadFileToString(fn:string):string;
procedure WriteStringToFile(fn:string; s:string);
procedure RecordError(err:string);
function RecordLastError(s:string):integer;
procedure RecordInfo(fn:string; info:string);
function StrtoStrHex(s:string):string;
function PassTran(s:string):string;
function StrToLines(s:string):string;
procedure ChLook(ds:TDataSet; fn,s:string);
function ExePathFileName(s:string; suffix:string='.hdt'):string;
function FileNameWithOutExt(s:string):string;
function Tr(s:string; prefix:string=''):string;
function Trs(s:string; prefix:string=''):string;
function S7200Tr(s:string; prefix:string=''):string;
procedure TrForm(fm:TComponent);
procedure TrwwDBGrid(wwdbgrid:TwwDBGrid);
function GetY_(x0,y0,x1,y1,x:double):double;
function GetY(x0,y0,x1,y1,x:double):double;
function TwtoHMS(tw:double):string;
function HMStoTw(tm:string):double;
function isPrevInst(exe:string):boolean;
function MachinesFileName:string;
procedure SaveMachines;
procedure ReadMachines;
procedure XwSocketHandle(mno:integer; Ip:string; Sockets:TClientSocket; var RPState, RPTick, RPTickLength:integer; var Error:boolean);
function YUY2toBmp(syuy2:string; w:integer; h:integer):string;
function StrToAge(s:string; var age, birthday:string):boolean;
procedure MyMove(src:PByte; obj:PByte; count:integer);
procedure JwdtoXy(jd,wd:double; var x,y:double);
procedure XytoJwd(x,y:double; var jd,wd:double);
function dataToStr(const data:Pointer;Size:Integer):string;
procedure reverseArr(arr:PShortInt;startIndex,endIndex:Integer);

implementation

procedure MyMove(src:PByte; obj:PByte; count:integer);
var
  b:byte;
  i:integer;
begin
  for i:=0 to count-1 do begin
    b:=src^;
    obj^:=b;
    inc(obj);
    inc(src);
  end;
end;

function MachinesFileName:string;
begin
  Result:=ExeFilePath+'machines.dat';
end;

procedure SaveMachines;
var
  f:integer;
begin
  f:=FileCreate(MachinesFileName);
  FileWrite(f, Machines, sizeof(Machines));
  FileClose(f);
end;

procedure ReadMachines;
var
  f:integer;
begin
  f:=FileOpen(MachinesFileName, fmOpenRead);
  FileRead(f, Machines, sizeof(Machines));
  FileClose(f);
end;

function isPrevInst(exe:string):boolean;
var
  mutex:THandle;
begin
  Result:=false;
  mutex:=CreateMutex(nil, true, Pchar(UpperCase(exe)));
  if mutex<>0 then begin
    if GetLastError=ERROR_ALREADY_EXISTS then begin
      Result:=true;
    end;
  end;
  CloseHandle(mutex);
end;

function GetY_(x0,y0,x1,y1,x:double):double;
var
  y:double;
begin
  y:=y0+(y1-y0)/(x1-x0)*(x-x0);
  Result:=y;
end;

function GetY(x0,y0,x1,y1,x:double):double;
var
  y:double;
begin
  y:=GetY_(x0,y0,x1,y1,x);
  if (y1>=y0) then
  begin
    if y>y1 then y:=y1;
    if y<y0 then y:=y0;
  end
  else begin
    if y>y0 then y:=y0;
    if y<y1 then y:=y1;
  end;
  Result:=y;
end;

function Tsxx(s:string):integer;
begin
  s:=S7200Tr(s);
  Result:=Application.MessageBox(PChar(@s[1]), PChar(Tr('message')), MB_OKCANCEL+MB_ICONINFORMATION);
end;

function Jgxx(s:string):integer;
begin
  s:=S7200Tr(s);
  Result:=Application.MessageBox(PChar(@s[1]), PChar(Tr('warnning')), MB_OKCANCEL+MB_ICONWARNING);
end;

function Xwxx(s:string):integer;
begin
  s:=S7200Tr(s);
  Result:=Application.MessageBox(PChar(@s[1]), PChar(Tr('query')), MB_YESNO+MB_ICONQUESTION);
end;

function CharToInt(c:char):integer;
begin
  case c of
    '0'..'9':Result:=Byte(c)-Byte('0');
    'a'..'f':Result:=10+Byte(c)-Byte('a');
    'A'..'F':Result:=10+Byte(c)-Byte('A');
    else Result:=0;
  end;
end;

function ValidGzr(s:string):boolean;
var
  n,y,r:WORD;
begin
  Result:=False;
  n:=StrToIntDef(Copy(s, 1, 4), 0);
  y:=StrToIntDef(Copy(s, 5, 2), 0);
  r:=StrToIntDef(Copy(s, 7, 2), 0);
  if (n=2) or (y=2) or (r=2) then exit;
  Try
    Result:=True;
    EnCodeDate(n, y, r);
  except
    Result:=False;
  End;
end;

function DateToGzr(da:TDate):string;
var
  n,y,r:WORD;
begin
  DeCodeDate(da, n, y, r);
  Result:=Format('%04.4d%02.2d%02.2d', [n, y, r]);
end;

function CopySubStr(var S:string; Substr:string):string;
begin
  if Pos(Substr, S)=0 then begin
    Result:=S;
    S:='';
  end
  else begin
    Result:=Copy(S, 1, Pos(Substr, S)-1);
    S:=Copy(S, Pos(Substr, S)+Length(Substr), Length(S));
  end;
end;

function CopySubStrDelta(var s:string):string;
var
  p1,p2:integer;
begin
  p1:=Pos('，', s);
  p2:=Pos(',', s);

  if (p1=0) and (p2=0) then begin
    Result:=s;
    s:='';
  end
  else if (p1=0)then Result:=CopySubStr(s, ',')
  else if (p2=0)then Result:=CopySubStr(s, '，')
  else if (p1>p2) then Result:=CopySubStr(s, ',')
  else Result:=CopySubStr(s, '，')
end;

function CopyDirFiles(sdir, odir, filter:string):boolean;
var
  fd:TWin32FindData;
  hf:THandle;
  s,ss,so:string;
begin
  Result:=False;
  s:=sdir+filter;
  hf:=FindFirstFile(Pchar(s), fd);
  if hf=INVALID_HANDLE_VALUE then exit;

  Result:=True;
  Repeat
    s:=fd.cFileName;
    if fd.dwFileAttributes=FILE_ATTRIBUTE_ARCHIVE then begin
      ss:=sdir+s;
      so:=odir+s;
      if not CopyFile(Pchar(ss), Pchar(so), False) then begin
        Result:=False;
        exit;
      end;
    end;
  until not FindNextFile(hf, fd);
end;

function StrToFloatError(s:string; var v:double):boolean;
var
  d:double;
begin
  Result:=True;
  try
    d:=StrToFloat(s);
    v:=d;
  except
    Result:=False;
  end;
end;

function StrToFloatDef(s:string; f:double):double;
begin
  Result:=f;
  if s='' then exit;
  if s='-' then exit;
  try
    Result:=StrToFloat(s);
  except
    Result:=f;
  end;
end;

function GetZoneType(qsrq, jsrq:TDate; var s:string):integer;
var
  n1,n2,n3,y1,y2,y3,r1,r2,r3:WORD;
begin
  Result:=0;
  s:='';
  if qsrq=0 then exit;
  if jsrq=0 then exit;
  DecodeDate(qsrq, n1, y1, r1);
  DecodeDate(jsrq, n2, y2, r2);
  DecodeDate(jsrq+1, n3, y3, r3);
  if (n1=n2) and (y1=y2) and (r1=r2) then begin
    s:=DateToStr(qsrq)+'日';
    Result:=100;
  end
  else if n1<>n2 then begin
    s:=DateToStr(qsrq)+DateToStr(jsrq)+'区间';
  end
  else if r1<>1 then begin
    s:=DateToStr(qsrq)+DateToStr(jsrq)+'区间';
  end
  else if r3<>1 then begin
    s:=DateToStr(qsrq)+DateToStr(jsrq)+'区间';
  end
  else if y1=y2 then begin
    s:=IntToStr(n1)+'年'+IntToStr(y1)+'月';
    Result:=y1;
  end
  else if (y1=1) and (y2=3) then begin
    s:=IntToStr(n1)+'年1季度';
    Result:=41;
  end
  else if (y1=4) and (y2=6) then begin
    s:=IntToStr(n1)+'年2季度';
    Result:=42;
  end
  else if (y1=7) and (y2=9) then begin
    s:=IntToStr(n1)+'年3季度';
    Result:=43;
  end
  else if (y1=10) and (y2=12) then begin
    s:=IntToStr(n1)+'年4季度';
    Result:=44;
  end
  else if (y1=1) and (y2=6) then begin
    s:=IntToStr(n1)+'年上半年度';
    Result:=21;
  end
  else if (y1=7) and (y2=12) then begin
    s:=IntToStr(n1)+'年下半年度';
    Result:=22;
  end
  else if (y1=1) and (y2=12) then begin
    s:=IntToStr(n1)+'年度';
    Result:=99;
  end;
end;

function IncStringCount(s:string):string;
begin
  try
    Result:=IntToStr(StrToInt64(s)+1);
  except
    Result:=s;
  end;
end;

function IncStringBH100(s:string):string;
var
  i:integer;
begin
  i:=StrToIntDef(Copy(s, Length(s)-1, 2), 0);
  i:=i+1;
  Result:=Copy(s, 1, Length(s)-2)+Format('%2.2d', [i]);
end;

function Humew(AT:double):double;
var
  TT1,TT:double;
begin
  TT1:=273.15;
  TT:=TT1+AT;
  Result:=Power(10,10.79574*(1-TT1/TT)-
                5.028*log10(TT/TT1)+
                1.50475e-4*(1-Power(10, -8.2969*(TT/TT1-1)))+
                0.42873e-3*(Power(10, 4.76955*(1-TT/TT1))-1)-
                0.21386);
end;

function GetHum(T0,T1,A,P:double):double;
begin
  Result:=(Humew(T1)-A*P*(T0-T1))/Humew(T0)*100;
  if Result>100 then Result:=100;
  if Result<0 then Result:=0;
end;

function S8ToDateStr(s:string):string;
var
  d:TDate;
  n,y,r:Word;
begin
  d:=S8ToDate(s);
  DeCodeDate(d, n, y, r);
  Result:=Format('%4.4d-%2.2d-%2.2d', [n, y, r]);
end;

function S8ToDate(s:string):TDate;
var
  n,y,r:integer;
begin
  n:=StrToIntDef(Copy(s, 1, 4), 0);
  y:=StrToIntDef(Copy(s, 5, 2), 0);
  r:=StrToIntDef(Copy(s, 7, 2), 0);
  Result:=EnCodeDate(n, y, r);
end;

function DateToS8(d:TDate):string;
var
  n,y,r:Word;
begin
  DeCodeDate(d, n, y, r);
  Result:=Format('%4.4d%2.2d%2.2d', [n, y, r]);
end;

function StrToCurrF(s:string):double;
var
  i:integer;
  sz:string;
begin
  sz:='';
  for i:=1 to Length(s) do begin
    case s[i] of
      '0'..'9','.','-':sz:=sz+s[i];
    end;
  end;
  Result:=StrToFloatDef(sz, 0);
end;

procedure GetYueQzrq(n,y:WORD; var Qsrq,Jsrq:TDate);
begin
  Qsrq:=EnCodeDate(n, y, 1);
  case y of
    1,3,5,7,8,10,12:Jsrq:=EnCodeDate(n, y, 31);
    4,6,9,11:Jsrq:=EnCodeDate(n, y, 30);
    else begin
      if n mod 4=0 then Jsrq:=EnCodeDate(n, y, 29) else Jsrq:=EnCodeDate(n, y, 28);
    end;
  end;
end;

function AddSumOfString(s:string):integer;
var
  i,a:integer;
begin
  a:=0;
  for i:=1 to Length(s) do begin
    a:=a+Byte(s[i]);
  end;
  Result:=a and $ff;
end;

function XorSumOfString(s:string):integer;
var
  i,a:integer;
begin
  a:=0;
  for i:=1 to Length(s) do begin
    a:=a xor Byte(s[i]);
  end;
  Result:=a;
end;

function AddSumOfString2(s:string):integer;
var
  i,a:integer;
begin
  a:=0;
  for i:=1 to Length(s) div 2 do begin
    a:=a + StrToIntDef('$'+s[2*i-1]+s[2*i], 0);
  end;
  Result:=a and $ff;
end;

procedure Sort(var y:Array of double; L:integer);
var
  i,j,maxs:integer;
  tmpy,maxy:double;
begin
  for i:=0 to L-1 do begin
    maxy:=-maxint;
    maxs:=-1;
    for j:=i to L-1 do begin
      if y[j]>maxy then begin
        maxy:=y[j];
        maxs:=j;
      end;
    end;
    tmpy:=y[i];
    y[i]:=maxy;
    y[maxs]:=tmpy;
  end;
end;

function StrToHex(s:string; l:integer):integer;
var
  i:integer;
begin
  i:=StrToInt('$'+s);
  if (2*i)>l then Result:=i-l else Result:=i;
end;

function IntToHexL(i,L:integer):string;
var
  s:string;
begin
  s:=IntToHex(i, L);
  if Length(s)<=L then begin
    Result:=s;
  end
  else begin
    Result:=Copy(s, Length(s)-L+1, L);
  end;
end;

function IntToChinese(i:integer):string;
begin
  Result:='';
  case i of
    0:Result:='零';
    1:Result:='一';
    2:Result:='二';
    3:Result:='三';
    4:Result:='四';
    5:Result:='五';
    6:Result:='六';
    7:Result:='七';
    8:Result:='八';
    9:Result:='九';
    10:Result:='十';
  end;
end;

function GetINIString(app,key:string):string;
var
  f,s:string;
  dw:DWORD;
begin
  f:=Copy(ParamStr(0), 1, Pos('.', ParamStr(0))-1)+'.INI';
  SetLength(s, 250);
  dw:=GetPrivateProfileString(Pchar(app), Pchar(key), '', Pchar(s), Length(s), Pchar(f));
  SetLength(s, dw);
  Result:=s;
end;

function GetOtherINIString(f,app,key:string):string;
var
  s:string;
  dw:DWORD;
begin
  SetLength(s, 250);
  dw:=GetPrivateProfileString(Pchar(app), Pchar(key), '', Pchar(s), Length(s), Pchar(f));
  SetLength(s, dw);
  Result:=s;
end;

procedure SetINIString(app,key,value:string);
var
  f:string;
begin
  f:=Copy(ParamStr(0), 1, Pos('.', ParamStr(0))-1)+'.INI';
  WritePrivateProfileString(Pchar(app), Pchar(key), Pchar(value), Pchar(f));
end;

procedure SetOtherINIString(f,app,key,value:string);
begin
  WritePrivateProfileString(Pchar(app), Pchar(key), Pchar(value), Pchar(f));
end;

function GetDateTimeFileName:string;
var
  year,month,day,hour,minute,second,ms:Word;
begin
  DecodeDate(now, year, month, day);
  DecodeTime(now, hour, minute, second, ms);
  Result:=format('%4.4d-%2.2d-%2.2d-%2.2d-%2.2d-%2.2d', [year, month, day, hour, minute, second]);
end;

function GetExeFileYear:integer;
var
  hf:THandle;
  ofs:TOFStruct;
  bfi:TByHandleFileInformation;
  dt:TSystemTime;
  s:string;
begin
  s:=ParamStr(0);
  hf:=OpenFile(Pchar(s), ofs, OF_READ);
  GetFileInformationByHandle(hf, bfi);
  FileTimeToSystemTime(bfi.ftLastWriteTime, dt);
  Result:=dt.wYear;
end;

function HB4ToFloat(b0,b1,b2,b3:byte):double;
var
  j:integer;
  t:integer;
  i:double;
begin
  j:=b0;
  t:=(b1*256*256)+(b2*256)+b3;
  if j=0 then begin
    Result:=0;
    exit;
  end
  else begin
    if (j and $80)=0 then i:=2 else i:=-2;
    j:=j and $7f;
    j:=j*2;
    if (t and $800000)<>0 then j:=j+1;
    t:=t or $800000;
    while j>$80 do begin
      i:=i*2;
      j:=j-1;
    end;
    while j<$80 do begin
      i:=i/2;
      j:=j+1;
    end;
    Result:=i*t/$800000;
  end;
end;

function H4ToFloat(s:string):double;
var
  j:integer;
  t:integer;
  i:double;
begin
  j:=StrToIntDef('$'+Copy(s, 1, 2), 0);
  t:=StrToIntDef('$'+Copy(s, 3, 6), 0);
  if j=0 then begin
    Result:=0;
    exit;
  end
  else begin
    if (j and $80)=0 then i:=2 else i:=-2;
    j:=j and $7f;
    j:=j*2;
    if (t and $800000)<>0 then j:=j+1;
    t:=t or $800000;
    while j>$80 do begin
      i:=i*2;
      j:=j-1;
    end;
    while j<$80 do begin
      i:=i/2;
      j:=j+1;
    end;
    Result:=i*t/$800000;
  end;
end;

function FloatToH4(x:double):string;
var
  i,j,t:integer;
begin
  if x=0 then begin
    Result:='00000000';
    exit;
  end
  else begin
    if x>0 then i:=1 else i:=-1;
    x:=abs(x);
    j:=$80;
    while x>=4 do begin
      x:=x/2;
      j:=j+1;
      if j>=$100 then begin
        Result:='00000000';
        exit;
      end;
    end;
    while x<2 do begin
      x:=x*2;
      j:=j-1;
      if j<=0 then begin
        Result:='00000000';
        exit;
      end;
    end;
    t:=Round(x/2*$800000) and $7fffff;
    if (j and $01)<>0 then t:=t or $800000;
    j:=j div 2;
    if i<0 then j:=j or $80;
    Result:=IntToHex(j, 2)+IntToHex(t, 6);
  end;
end;

procedure FloatToHB4(x:double; var b0,b1,b2,b3:byte);
var
  i,j,t:integer;
begin
  b0:=0;b1:=0;b2:=0;b3:=0;
  if x=0 then begin
    exit;
  end
  else begin
    if x>0 then i:=1 else i:=-1;
    x:=abs(x);
    j:=$80;
    while x>=4 do begin
      x:=x/2;
      j:=j+1;
      if j>=$100 then begin
        exit;
      end;
    end;
    while x<2 do begin
      x:=x*2;
      j:=j-1;
      if j<=0 then begin
        exit;
      end;
    end;
    t:=Round(x/2*$800000) and $7fffff;
    if (j and $01)<>0 then t:=t or $800000;
    j:=j div 2;
    if i<0 then j:=j or $80;
    b0:=j;
    b1:=t div 65536;
    b2:=(t div 256) mod 256;
    b3:=t mod 256;
  end;
end;

function RoundL(x:real):integer;
begin
  Result:=Integer(Round(x));
end;

procedure AddXYtoSeries(series:TChartSeries; x, y:double);
var
  y0,y1:double;
  cnt:integer;
begin
  cnt:=series.Count;
  if cnt<2 then begin
    series.AddXY(x, y);
  end
  else begin
    y0:=series.YValues[cnt-2];
    y1:=series.YValues[cnt-1];
    if (y0=y1) and (y=y0) then begin
      series.XValues[cnt-1]:=x;
      series.Repaint;
    end
    else begin
      series.AddXY(x, y);
    end;
  end;
end;

procedure ShowAlarmBar(b:boolean; bar:TPanel; c0:TColor=clBlack; c1:TColor=clRed);
begin
  if b then begin
    bar.Color:=c1;
  end
  else begin
    bar.Color:=c0;
  end;
end;

function InttoBIN(v:integer; len:integer):string;
var
  i:integer;
  b:integer;
  s:string;
begin
  b:=1;
  s:='';
  for i:=1 to len do begin
    if (v and b)<>0 then s:='1'+s else s:='0'+s;
    b:=b shl 1;
  end;
  Result:=s;
end;

function BintoInt(v:string):integer;
var
  i:integer;
  l:integer;
begin
  l:=0;
  for i:=1 to Length(v) do begin
    l:=2*l;
    if v[i]='1' then l:=l+1;
  end;
  Result:=l;
end;

function GetCursorValue(sr:TChartSeries; x:double; var rate:double):double;
var
  x0,y0,x1,y1,y:double;
  i:integer;
begin
  y:=0;
  rate:=0;
  for i:=1 to sr.Count-1 do begin
    x1:=sr.XValues[i];
    y1:=sr.YValues[i];
    if x1>=x then begin
      x0:=sr.XValues[i-1];
      y0:=sr.YValues[i-1];
      y:=y0+(y1-y0)*(x-x0)/(x1-x0);
      rate:=(y1-y0)/(x1-x0)/1440;
      break;
    end;
  end;
  Result:=y;
end;

function GetCursorValue2(sr:TChartSeries; x:double):double;
var
  x1,y:double;
  i:integer;
begin
  y:=0;
  for i:=1 to sr.Count-1 do begin
    x1:=sr.XValues[i];
    if x1>=x then begin
      y:=sr.YValues[i-1];
      break;
    end;
  end;
  Result:=y;
end;

function ReadFileToString(fn:string):string;
var
  s:string;
  f:integer;
  len:integer;
begin
  Result:='';
  s:='';
  if not FileExists(fn) then exit;
  f:=FileOpen(fn, fmOpenRead);
  len:=FileSeek(f, 0, 2);
  SetLength(s, len);
  FileSeek(f, 0, 0);
  FileRead(f, s[1], len);
  FileClose(f);
  Result:=s;
end;

procedure WriteStringToFile(fn:string; s:string);
var
  f:integer;
begin
  f:=FileCreate(fn);
  if f=-1 then Jgxx('文件'+fn+'错误');
  FileWrite(f, s[1], Length(s));
  FileClose(f);
end;

procedure RecordInfo(fn:string; info:string);
var
  f:integer;
begin
  if not FileExists(fn) then begin
    f:=FileCreate(fn);
  end
  else begin
    f:=FileOpen(fn, fmOpenWrite);
    FileSeek(f, 0, 2);
  end;
  FileWrite(f, info[1], Length(info));
  FileClose(f);
end;

function RecordLastError(s:string):integer;
var
  buf:array[0..10204] of char;
  err:integer;
begin
  err:=GetLastError;
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, err, 0, @buf, 10204, nil);
  LastErrorString:=buf;
  LastErrorString:=s+' '+IntToStr(GetLastError)+':'+LastErrorString;
  RecordError(LastErrorString);
  Result:=err;
end;

procedure RecordError(err:string);
var
  f:integer;
  s:string;
begin
  s:=ExeFilePath+'DEBUG.txt';
  if not FileExists(s) then begin
    f:=FileCreate(s);
  end
  else begin
    f:=FileOpen(s, fmOpenWrite);
    FileSeek(f, 0, 2);
  end;
  s:=DateTimeToStr(now)+#9+ParamStr(0)+#9+err;
  if Pos(#13, s)=0 then s:=s+#13#10;
  FileWrite(f, s[1], Length(s));
  FileClose(f);
end;

function StrtoStrHex(s:string):string;
var
  hex:string;
  i:integer;
begin
  hex:='';
  for i:=1 to Length(s) do begin
    hex:=hex+Format('%2.2X ', [Byte(s[i])]);
  end;
  Result:=hex;
end;

function PassTran(s:string):string;
var
  c:char;
begin
  s:=s+'AAAA';
  s:=Copy(s, 1, 4);
  c:=s[1];s[1]:=s[4];s[4]:=c;
  c:=s[2];s[2]:=s[3];s[3]:=c;
  s[1]:=char(Byte(s[1])+1);
  s[2]:=char(Byte(s[2])+2);
  s[3]:=char(Byte(s[3])+3);
  s[4]:=char(Byte(s[4])+4);
  Result:=s;
end;

function StrToLines(s:string):string;
var
  i:integer;
  s1:string;
begin
  s1:='';
  for i:=1 to Length(s) do begin
    if s[i]<>'~' then s1:=s1+s[i] else s1:=s1+#13#10;
  end;
  Result:=s1;
end;

procedure ChLook(ds:TDataSet; fn,s:string);
begin
  s:=GetOtherINIString(ExeFilePath+'XW.INI', 'DIR', s);
  if Length(s)<2 then exit;
  if Byte(s[1])<$80 then exit;
  ds.Filtered:=True;
  ds.Filter:=fn+'>='''+s+'''';
end;

function ExePathFileName(s:string; suffix:string):string;
begin
  if (Pos('\', s)=0) and (Pos('/', s)=0) then s:=ExeFilePath+s;
  if (Pos('.', s)=0) then s:=s+suffix;
  Result:=s;
end;

function FileNameWithOutExt(s:string):string;
var
  i:integer;
begin
  Result:=s;
  if Pos('.', s)=0 then exit;
  for i:=Length(s) downto 1 do begin
    if s[i]='.' then begin
      Result:=Copy(s, 1, i-1);
      exit;
    end;
  end;
end;

function Trs(s:string; prefix:string=''):string;
var
  sL:TStrings;
  i:integer;
  s2:string;
begin
  s2:='';
  sL:=TStringList.Create;
  sL.Text:=s;
  for i:=0 to sL.Count-1 do begin
    s2:=s2+Tr(sL.Strings[i], prefix)+#13#10;
  end;
  sL.Free;
  if s2='' then s2:=s;
  Result:=s2;
end;

function Tr(s:string; prefix:string=''):string;
var
  s2:string;
begin
  s2:=Trk.Values[prefix+s];
  if s2='' then s2:=Trk.Values[s];
  if s2='' then s2:=s;
  s2:=stringReplace(s2, '~', #13#10, [rfReplaceAll]);
  if (s2=s) and (Copy(s2, Length(s2), 1)=':') then begin
    s2:=Tr(Copy(s2, 1, Length(s2)-1))+':';
  end;
  Result:=s2;
end;

function S7200Tr(s:string; prefix:string=''):string;
var
  s2,sr:string;
begin
  Result:='';
  sr:=stringReplace(s, '~', #13#10, [rfReplaceAll]);
  if s='' then exit;
  if S7200Data.bWC2 then
  begin
    s2:=tr(s+'_wc2');
    if (s2=(s+'_wc2')) or (s2=(sr+'_wc2')) then
    begin
      s2:=tr(s+'_wc3');
      if (s2=(s+'_wc3')) or (s2=(sr+'_wc3')) then
      begin
        Result:=tr(s);
      end
      else
      begin
        Result:=s2;
      end;
    end
    else
    begin
      Result:=s2;
    end;
  end
  else if S7200Data.bWC3 then
  begin
    s2:=tr(s+'_wc3');
    if (s2=(s+'_wc3')) or (s2=(sr+'_wc3')) then
    begin
      Result:=tr(s);
    end
    else
    begin
      Result:=s2;
    end;
  end
  else if S7200Data.bQDBox then
  begin
    s2:=tr(s+'_qd');
    if (s2=(s+'_qd')) or (s2=(sr+'_qd')) then
    begin
      Result:=tr(s);
    end
    else
    begin
      Result:=s2;
    end;
  end
  else if S7200Data.bGFBox then
  begin
    s2:=tr(s+'_gf');
    if (s2=(s+'_gf')) or (s2=(sr+'_gf')) then
    begin
      Result:=tr(s);
    end
    else
    begin
      Result:=s2;
    end;
  end
  else if S7200Data.bLightBox then
  begin
    s2:=tr(s+'_LT');
    if (s2=(s+'_LT')) or (s2=(sr+'_LT')) then
    begin
      Result:=tr(s);
    end
    else
    begin
      Result:=s2;
    end;
  end
  else
  begin
    Result:=tr(s);
  end;
end;

procedure TrwwDBGrid(wwdbgrid:TwwDBGrid);
var
  i:integer;
begin
  for i:=0 to wwdbgrid.FieldCount-1 do
  begin
    wwdbgrid.Fields[i].DisplayLabel:=S7200Tr(wwdbgrid.Fields[i].DisplayLabel, 'dg');
  end
end;

procedure TrForm(fm:TComponent);
var
  i,j:integer;
  s,s1:string;
  cm:TComponent;
  fcla:TFcLabel;
  wwdbcb:TwwDBComboBox;
  cb:TComboBox;
  rgp:TRadioGroup;
  cxclb:TcxCheckListBox;
  cxlv:TcxListView;
  cxnvb:TdxNavBar;
  cxcb:TcxComboBox;
  cxrgp:TcxRadioGroup;
  cxccb:TcxCheckComboBox;
  cxcg:TcxCheckGroup;
  cxdbcb:TcxDBComboBox;
begin
  if (fm.ClassName='TForm') then (fm as TForm).Caption:=S7200Tr((fm as TForm).Caption);
  if fm.InheritsFrom(TForm) then (fm as TForm).Caption:=S7200Tr((fm as TForm).Caption);
  for i:=0 to fm.ComponentCount-1 do begin
    cm:=fm.Components[i];
    s:=cm.ClassName;
    if cm.InheritsFrom(TControl) then begin
      if (cm as TControl).Hint<>'' then (cm as TControl).Hint:=S7200Tr((cm as TControl).Hint, 'ht');
    end;
    if cm.InheritsFrom(TFrame) then begin
      TrForm(cm);
    end;
    if s='TLabel' then begin
      (cm as TLabel).Caption:=S7200Tr((cm as TLabel).Caption, 'la');
    end
    else if s='TPanel' then begin
      (cm as TPanel).Caption:=S7200Tr((cm as TPanel).Caption, 'la');
    end
    else if s='TfcLabel' then begin
      fcla:=(cm as TFCLabel);
      fcla.Caption:=S7200Tr(fcla.Caption, 'la');
    end
    else if s='TMenuItem' then begin
      s:=(cm as TMenuItem).Caption;
      s:=Copy(s, 1, Pos('(', s)-1);
      if (s='') then s:=(cm as TMenuItem).Caption;
      s1:=S7200Tr(s, 'mn');
      if s1<>s then (cm as TMenuItem).Caption:=s1;
    end
    else if s='TButton' then begin
      (cm as TButton).Caption:=S7200Tr((cm as TButton).Caption, 'bt');
    end
    else if s='TSpeedButton' then begin
      (cm as TSpeedButton).Caption:=S7200Tr((cm as TSpeedButton).Caption, 'bt');
    end
    else if s='TBitBtn' then begin
      (cm as TBitBtn).Caption:=S7200Tr((cm as TBitBtn).Caption, 'bt');
    end
    else if s='TComboBox' then begin
      cb:=cm as TComboBox;
      for j:=0 to cb.Items.Count-1 do begin
        cb.Items.Strings[j]:=S7200Tr(cb.Items.Strings[j], 'lb');
      end;
    end
    else if s='TwwDBComboBox' then begin
      wwdbcb:=cm as TwwDBComboBox;
      for j:=0 to wwdbcb.Items.Count-1 do begin
        wwdbcb.Items.Strings[j]:=S7200Tr(wwdbcb.Items.Strings[j], 'lb');
      end;
    end
    else if s='TcxDBComboBox' then begin
      cxdbcb:=cm as TcxDBComboBox;
      for j:=0 to cxdbcb.Properties.Items.Count-1 do begin
        cxdbcb.Properties.Items.Strings[j]:=S7200Tr(cxdbcb.Properties.Items.Strings[j], 'lb');
      end;
    end
    else if s='TcxDBCheckBox' then begin
      (cm as TcxDBCheckBox).Caption:=S7200Tr((cm as TcxDBCheckBox).Caption, 'cx');
    end
    else if s='TGroupBox' then begin
      (cm as TGroupBox).Caption:=S7200Tr((cm as TGroupBox).Caption, 'gp');
    end
    else if s='TCheckBox' then begin
      (cm as TCheckBox).Caption:=S7200Tr((cm as TCheckBox).Caption, 'ck');
    end
    else if s='TRadioGroup' then begin
      rgp:=cm as TRadioGroup;
      rgp.Caption:=S7200Tr(rgp.Caption, 'rg');
      for j:=0 to rgp.Items.Count-1 do begin
        rgp.Items.Strings[j]:=S7200Tr(rgp.Items.Strings[j], 'lb');
      end;
    end
    else if s='TTabSheet' then begin
      (cm as TTabSheet).Caption:=S7200Tr((cm as TTabSheet).Caption, 'gp');
    end
    else if s='TTabControl' then begin
      for j:=0 to (cm as TTabControl).Tabs.Count-1 do begin
        (cm as TTabControl).Tabs[j]:=S7200Tr((cm as TTabControl).Tabs[j], 'gp');
      end;
    end

    else if s='TcxLabel' then begin
      (cm as TcxLabel).Caption:=S7200Tr((cm as TcxLabel).Caption, 'cx');
    end
    else if s='TcxGridDBColumn' then begin
      (cm as TcxGridDBColumn).Caption:=S7200Tr((cm as TcxGridDBColumn).Caption, 'cx');
    end
    else if s='TcxButton' then begin
      (cm as TcxButton).Caption:=S7200Tr((cm as TcxButton).Caption, 'cx');
    end
    else if s='TcxRadioButton' then begin
      (cm as TcxRadioButton).Caption:=S7200Tr((cm as TcxRadioButton).Caption, 'cx');
    end
    else if s='TcxCheckListBox' then begin
      cxclb:=cm as TcxCheckListBox;
      for j:=0 to cxclb.Count-1 do begin
        cxclb.Items[j].Text:=S7200Tr(cxclb.Items[j].Text, 'cx');
      end;
    end
    else if s='TcxTabSheet' then begin
      (cm as TcxTabSheet).Caption:=S7200Tr((cm as TcxTabSheet).Caption, 'cx');
    end
    else if s='TcxTabControl' then begin
      for j:=0 to (cm as TcxTabControl).Tabs.Count-1 do begin
        (cm as TcxTabControl).Tabs.Strings[j]:=S7200Tr((cm as TcxTabControl).Tabs.Strings[j], 'cx');
      end;
    end
    else if s='TcxListView' then begin
      cxlv:=cm as TcxListView;
      for j:=0 to cxlv.Items.Count-1 do begin
        cxlv.Items[j].Caption:=S7200Tr(cxlv.Items[j].Caption, 'cx');
      end;
    end
    else if s='TdxNavBar' then begin
      cxnvb:=cm as TdxNavBar;
      for j:=0 to cxnvb.Groups.Count-1 do begin
        cxnvb.Groups[j].Caption:=S7200Tr(cxnvb.Groups[j].Caption, 'cx');
      end;
    end
    else if s='TdxNavBarItem' then begin
      (cm as TdxNavBarItem).Caption:=S7200Tr((cm as TdxNavBarItem).Caption, 'cx');
    end
    else if s='TcxComboBox' then begin
      cxcb:=cm as TcxComboBox;
      for j:=0 to cxcb.Properties.Items.Count-1 do begin
        cxcb.Properties.Items.Strings[j]:=S7200Tr(cxcb.Properties.Items.Strings[j], 'cx');
      end;
    end
    else if s='TcxCheckBox' then begin
      (cm as TcxCheckBox).Caption:=S7200Tr((cm as TcxCheckBox).Caption, 'cx');
    end
    else if s='TcxRadioGroup' then begin
      cxrgp:=cm as TcxRadioGroup;
      cxrgp.Caption:=S7200Tr(cxrgp.Caption, 'cx');
      for j:=0 to cxrgp.Properties.Items.Count-1 do begin
        cxrgp.Properties.Items.Items[j].Caption:=S7200Tr(cxrgp.Properties.Items.Items[j].Caption, 'cx');
      end;
    end
    else if s='TcxCheckComboBox' then begin
      cxccb:=cm as TcxCheckComboBox;
      for j:=0 to cxccb.Properties.Items.Count-1 do begin
        cxccb.Properties.Items.Items[j].Description:=S7200Tr(cxccb.Properties.Items.Items[j].Description, 'cx');
      end;
    end
    else if s='TcxCheckGroup' then begin
      cxcg:=cm as TcxCheckGroup;
      cxcg.Caption:=S7200Tr(cxcg.Caption, 'cx');
      for j:=0 to cxcg.Properties.Items.Count-1 do begin
        cxcg.Properties.Items.Items[j].Caption:=S7200Tr(cxcg.Properties.Items.Items[j].Caption, 'cx');
      end;
    end

    else begin
    end;
  end;
end;

function TwtoHMS(tw:double):string;
var
  tm:dword;
begin
  tm:=Round(tw);
  Result:=Format('%2.2d:%2.2d:%2.2d', [tm div 3600, tm  div 60 mod 60, tm mod 60]);
end;

function HMStoTw(tm:string):double;
var
  h,m,s:double;
begin
  h:=StrToFloatDef(CopySubStr(tm, ':'), 0);
  m:=StrToFloatDef(CopySubStr(tm, ':'), 0);
  s:=StrToFloatDef(tm, 0);
  Result:=h*3600+m*60+s;
end;

procedure XwSocketHandle(mno:integer; Ip:string; Sockets:TClientSocket; var RPState, RPTick, RPTickLength:integer; var Error:boolean);
var
  s:string;
begin
  try
  if RPState=0 then begin              //激活连接
    if Sockets.Active then begin
      RecordError(IntToStr(mno)+':'+'Reactive '+Sockets.Address);
      Sockets.Active:=false;
    end
    else begin
      Sockets.Address:=ip;
      Sockets.Active:=true;
      RPState:=1;
      RPTick:=0;
      RPTickLength:=600;
    end;
  end
  else if RPState=1 then begin         //等待连接
    inc(RPTick);
    if (RPTick>=RPTickLength) then begin
      RPTick:=0;
      RPState:=0;
    end;
  end
  else if RPState=2 then begin         //连接成功
  end
  else if RPState=3 then begin         //连接错误
    RPState:=10;
    RPTick:=0;
    RPTickLength:=600;
    Error:=true;
  end
  else if RPState=5 then begin         //读取响应
    inc(RPTick);
    if (RPTick>=RPTickLength) then begin
      RPTick:=0;
      RPState:=0;
    end;
  end
  else if RPState=6 then begin         //连接断开
  end
  else if RPState=7 then begin         //等待响应
  end
  else if RPState=10 then begin        //处理完成，延时
    Sockets.Active:=false;
    inc(RPTick);
    if (RPTick>=RPTickLength) then begin
      RPTick:=0;
      RPState:=0;
    end;
  end

  else begin
  end;

  except
    on E: Exception do begin
      s:=IntToStr(mno)+':'+'S7200Timer '+Sockets.Address+' Active='+IntToStr(Integer(Sockets.Active))+' '+E.Message;
      RecordError(s);
      RPState:=10;
      RPTick:=0;
      RPTickLength:=1200;
    end;
  end;
end;

function YUY2toBmp(syuy2:string; w:integer; h:integer):string;
var
  s,srgb,head:string;
  i,j:integer;
  y1,u1,y2,v1:integer;
  c1,d1,e1,c2:integer;
  r,g,b:integer;
begin
  head:=BMPFILEHEAD320x240x24;
  head[19]:=char(w and $ff);
  head[20]:=char(w div 256);
  head[23]:=char(h and $ff);
  head[24]:=char(h div 256);

  s:=syuy2;
  setLength(srgb, Length(s)*6 div 4);
  i:=1;
  j:=1;
  while i<=Length(s) do begin
    y1:=Byte(s[i]); inc(i);
    u1:=Byte(s[i]); inc(i);
    y2:=Byte(s[i]); inc(i);
    v1:=Byte(s[i]); inc(i);

    c1:=y1-16;
    c2:=y2-16;
    d1:=u1-128;
    e1:=v1-128;

    R:= (298*C1 + 409*E1 + 128) shr 8; if (R>255) then R:=255;
    G:= (298*C1 - 100*D1 - 208*E1 + 128) shr 8; if (G>255) then G:=255;
    B:= (298*C1 + 516*D1 + 128) shr 8;  if (B>255) then B:=255;

    srgb[j]:=char(b); inc(j);
    srgb[j]:=char(g); inc(j);
    srgb[j]:=char(r); inc(j);

    R:= (298*C2 + 409*E1 + 128) shr 8; if (R>255) then R:=255;
    G:= (298*C2 - 100*D1 - 208*E1 + 128) shr 8; if (G>255) then G:=255;
    B:= (298*C2 + 516*D1 +128) shr 8; if (B>255) then B:=255;
    srgb[j]:=char(b); inc(j);
    srgb[j]:=char(g); inc(j);
    srgb[j]:=char(r); inc(j);
  end;
  s:=head+srgb;
  Result:=s;
end;

function StrToAge(s:string; var age, birthday:string):boolean;
var
  year,month,day:string;
  y,m,d,yy:Word;
  s2:string;
  i:integer;
begin
  Result:=true;
  DecodeDate(now, yy, m, d);

  if Length(s)<=3 then begin
    y:=StrToInt(s);
    d:=1;
    m:=1;
    y:=yy-y;
  end
  else if (Length(s)=4) and (Pos('-', s)=0) then begin
    y:=StrToInt(s);
    d:=1;
    m:=1;
  end
  else begin
    s2:='';
    for i:=1 to Length(s) do if ((s[i]>='0') and (s[i]<='9')) or (s[i]='-') then s2:=s2+s[i];
    year:=CopySubStr(s2, '-');
    month:=CopySubStr(s2, '-');
    day:=s2;
    if day='' then day:='1';
    if (year='') or (month='') or (day='') then begin
      s2:='';
      for i:=1 to Length(s) do if (s[i]>='0') and (s[i]<='9') then s2:=s2+s[i];
      s:=s2;

      day:=Copy(s, Length(s)-1, 2);
      month:=Copy(s, Length(s)-3, 2);
      year:=Copy(s, 1, Length(s)-4);
    end;

    d:=StrToInt(day);
    m:=StrToInt(month);
    y:=StrToInt(year);
    if y<100 then inc(y, 1900);
  end;

  birthday:=Format('%4.4d-%2.2d-%2.2d', [y, m, d]);
  age:=IntToStr(yy-y);

  if (d=0) or (d>31) or (m=0) or (m>12) then Result:=False;
end;

procedure JwdtoXy(jd,wd:double; var x,y:double);
begin
  x:=wd*cos(jd*pi/180);
  y:=wd*sin(jd*pi/180);
end;

procedure XytoJwd(x,y:double; var jd,wd:double);
begin
  if x=0 then begin
    jd:=90;
    if y<0 then jd:=270;
    if y=0 then jd:=0;
  end
  else begin
    jd:=abs(arctan(y/x));
    jd:=jd*180/pi;
    if (x<0) and (y>=0) then jd:=180-jd;
    if (x<0) and (y<0) then jd:=180+jd;
    if (x>0) and (y<0) then jd:=360-jd;
  end;
  wd:=sqrt(x*x+y*y);
end;

function dataToStr(const data:Pointer;size:Integer) :string ;
var
  str:string ;
  i:Integer ;
begin
  str:='';
  for i := 0 to size - 1 do
  begin
    str := str + Format('%.2x ', [Cardinal(PChar(data)[i])]);
  end;
  Result:=str;
end;

//procedure reverseArr(arr:array of ShortInt;startIndex,endIndex:Integer);
procedure reverseArr(arr:PShortInt;startIndex,endIndex:Integer);
var
  temp:ShortInt ;
  addr1:PShortInt;
  addr2:PShortInt;
begin
     while startIndex<endIndex do
     begin
//        temp:=arr[startIndex];
//        arr[startIndex]:=arr[endIndex];
//        arr[endIndex]:=temp;
        addr1 := arr;
        addr2 := arr;
        Inc(addr1,startIndex-1);
        Inc(addr2,endIndex-1);
        temp:=addr1^;
        addr1^:=addr2^;
        addr2^:=temp;
        startIndex:=startIndex+1;
        endIndex:=endIndex-1;
//          temp:=arr^;
//          arr^:=100;
     end;
end;

var
  s:string;
  i:integer;

initialization
  ExeFileName:='';
  ExeFileExt:='';
  s:=ExtractFileName(ParamStr(0));
  for i:=Length(s) downto 1 do
  begin
    if s[i]='.' then begin
      ExeFileName:=Copy(s, 1, i-1);
      ExeFileExt:=Copy(s, i+1, Length(s));
      break;
    end;
  end;
////  ExeFilePath:=ExtractFilePath(ParamStr(0));
  if ParamStr(1)<>'' then begin
    ExeFilePath2:=ExtractFilePath(ParamStr(0))+ParamStr(1)+'\';
  end
  else begin
    ExeFilePath2:=ExtractFilePath(ParamStr(0))+'0\';
  end;
  Randomize;
  Trk:=TStringList.Create;
  if FileExists(ExeFilePath+'Tr.TXT') then Trk.LoadFromFile(ExeFilePath+'Tr.TXT');
  DateSeparator:='-';
  ShortDateFormat:='yyyy-mm-dd';
  LongDateFormat:='yyyy-mm-dd';
  ShortTimeFormat:='hh:mm:ss';
  LongTimeFormat:='hh:mm:ss';

finalization
  Trk.Free;

end.
