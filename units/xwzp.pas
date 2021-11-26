unit xwzp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Comobj, pubpas,uProgLog;

type
  DoubleArray=array[0..1000] of double;

  TFXwzp = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FXwzp: TFXwzp;

var
  ZpDll:Variant;
  BmpSize:integer=320*240*3;
  bmptype:integer=32;
  BmpWidth:integer=320;
  BmpHeight:integer=240;
  Pupildx:integer=0;
  Pupildy:integer=0;
  Pupilx:integer=0;
  Pupily:integer=0;
  Pupilwx:integer=0;
  Pupilwy:integer=0;
  Pupilwx0:double=0;
  Pupilwy0:double=0;
  PupilD:double=0;
  Pupilok:integer=0;
  PupilScore:integer=0;
  Count:Integer=0;
  BmpBrightness:integer;
  Bmpbuf:WideString;
  BmpData:string;
  ZpDllCount:integer;

  PupilMoveRL,PupilMoveUD:byte; //1R,2L,1U,2D,0
  PupilMoveB: boolean;

  PupilxBuf:DoubleArray;
  PupilyBuf:DoubleArray;
  PupildxBuf:DoubleArray;
  PupildyBuf:DoubleArray;
  PupilwxBuf:DoubleArray;
  PupilwyBuf:DoubleArray;
  PupilokBuf:DoubleArray;

  GrayValue:double;
  Graybuf:DoubleArray;

  Histogram:DoubleArray;


function GetEyeMove(x,y,dx,dy,wx,wy:integer):double;
function GetPupil:string;
procedure AutoPupil;
procedure GetGray;
function BmpToBlackWhite(data:string; v:integer):string;
function FindPupil(data:string; var px,py,pdx,pdy,pwx,pwy:integer):integer;
procedure GetHistogram(data:string);

implementation

uses Myutils, usbr, Xwxh, runpic, main;

{$R *.dfm}

procedure NewValueToBuffer(var buffer:DoubleArray; newvalue:double; len:integer);
var
  i:integer;
begin
  for i:=1 to len-1 do buffer[len-i+1]:=buffer[len-i];
  buffer[1]:=newvalue;
end;

function MidFilter(buffer:DoubleArray; len,ofs:integer):double;
var
  i,j:integer;
  t:double;
begin
  for i:=1 to len do
  begin
    for j:=i+1 to len do
    begin
      if buffer[j]<buffer[i] then
      begin
        t:=buffer[j];
        buffer[j]:=buffer[i];
        buffer[i]:=t;
      end;
    end;
  end;
  result:=buffer[len div 2 +1+ofs];
end;

function AvgFilter(buffer:DoubleArray; len:integer):double;
var
  i:integer;
  min,max,avg:double;
begin
  min:=999999;
  max:=-999999;
  avg:=0;
  for i:=1 to len do
  begin
    avg:=avg+buffer[i];
    if buffer[i]>max then max:=buffer[i];
    if buffer[i]<min then min:=buffer[i];
  end;
  avg:=(avg-max-min)/(len-2);
  Result:=avg;
end;

function RcFilter(x,y:double; rc:double):double;
begin
  Result:=x*rc+(1-rc)*y;
end;

const
  MIDFILTERNUM=3;




procedure AutoPupil;
var
  svx,enx,unx:double;
  svy,eny,uny:double;
begin
  Fillchar(Server2Lower, sizeof(Server2Lower), 0);
  Server2Lower.gillcon:=$c2;
//  Server2Lower.lowerstatus:=$c5;
//  Server2Lower.lowerbuzy:=$ff;

  Server2Lower.head[1]:=$bb;
  Server2Lower.head[2]:=$0c;
  Server2Lower.head[3]:=$dd;

  Server2Lower.ending[1]:=$0e;
  Server2Lower.ending[2]:=$0f;

  if Pupilok=1 then
  begin
    svx:=160;
    enx:=svx-(Pupilx+Pupilx+Pupildx) div 2;
    unx:=1.5*enx;
    if unx>=5 then
    begin
        Server2Lower.gillright:=$ff;
      if PupilMoveRL<>1 then
      begin
        PupilMoveRL := 1;
        PupilMoveB := true;
      end;
      //右
    end
    else if unx<=-5 then
    begin
        Server2Lower.gillleft:=$ff;
      if PupilMoveRL<>2 then
      begin
        PupilMoveRL := 2;
        PupilMoveB := true;
      end;
    end
    else
    begin
      if PupilMoveRL<>0 then
      begin
        PupilMoveRL := 0;
        PupilMoveB := true;
      end;
    end;

    svy:=120;
    eny:=svy-(Pupily+Pupily+Pupildy) div 2;
    uny:=1.5*eny;
    if uny>=5 then
    begin
        Server2Lower.gilldown:=$ff;
      if PupilMoveUD<>2 then
      begin
        PupilMoveUD := 2;
        PupilMoveB := true;
      end;
    end
    else if uny<=-5 then
    begin
        Server2Lower.gillup:=$ff;
      if PupilMoveUD<>1 then
      begin
        PupilMoveUD := 1;
        PupilMoveB := true;
      end;
    end
    else
    begin
      if PupilMoveUD<>0 then
      begin
        PupilMoveUD := 0;
        PupilMoveB := true;
      end;
    end;
  end
  else
  begin
      if PupilMoveRL<>0 then
      begin
        PupilMoveRL := 0;
        PupilMoveB := true;
      end;
      if PupilMoveUD<>0 then
      begin
        PupilMoveUD := 0;
        PupilMoveB := true;
      end;
  end;
  if PupilMoveB then
  begin
    FMain.Write2Device;
//    ChinDown:=true;
//    ChinUp:=true;

    PupilMoveB := false;
  end;
end;

const
  GrayX0:integer=150;
  GrayY0:integer=110;
  GrayX1:integer=170;
  GrayY1:integer=130;

function GetXYV(data:string; x,y:integer; var b1,b2,b3:integer):integer;
var
  i:integer;
begin
  y:=239-y;
  i:=1+y*320*3+x*3;
  b1:=Byte(data[i+0]);
  b2:=Byte(data[i+1]);
  b3:=Byte(data[i+2]);
  Result:=b1*256*256+b2*256+b3;
end;

function GetXYVB(data:string; x,y:integer):integer;
var
  i,b1,b2,b3:integer;
begin
  y:=239-y;
  i:=1+y*320*3+x*3;
  b1:=Byte(data[i+0]);
  b2:=Byte(data[i+1]);
  b3:=Byte(data[i+2]);
  Result:=b1*256*256+b2*256+b3;
  if Result<>0 then Result:=1;
end;

function GetGrayOfBmp(data:string; x0,y0,x1,y1:integer):double;
var
  x,y,k:integer;
  r,g,b:integer;
  v:double;
begin
  k:=1;
  v:=0;
  for y:=y0 to y1 do begin
    for x:=x0 to x1 do begin
      r:=Byte(data[k+2]);
      g:=Byte(data[k+1]);
      b:=Byte(data[k+0]);
      GetXYV(data, x, y, r, g, b);
      v:=v+((R*299)+(G*587)+(B*114))/1000;
      inc(k, 3);
    end;
  end;
  Result:=v;
end;

function GetGrayValue(data:string; var v1,v2:double):double;
begin
  v1:=GetGrayOfBmp(data, GrayX0, GrayY0, GrayX1, GrayY1);
  v2:=GetGrayOfBmp(data, GrayX0-80, GrayY0-80, GrayX1-80, GrayY1-80);
  Result:=v1-v2;
end;

procedure GetGray;
var
  v,v1,v2:double;
begin
  v:=GetGrayValue(BmpData, v1, v2);
  NewValueToBuffer(GrayBuf, v, 20);
  GrayValue:=AvgFilter(GrayBuf, 20);
end;

function BmpToBlackWhite(data:string; v:integer):string;
var
  i,j,k:integer;
  x0,y0,x,y,d,d2:int64;
  r,g,b,c:integer;
begin
  k:=1;
  x0:=160;
  y0:=120;
  x:=50;
  y:=50;
////  d2:=(x-x0)*(x-x0)*240*240+(y-y0)*(y-y0)*320*320;
  d2:=(x-x0)*(x-x0)+(y-y0)*(y-y0);
  BmpBrightness:=0;
  for i:=1 to 240 do begin
    for j:=1 to 320 do begin
      r:=Byte(data[k+2]);
      g:=Byte(data[k+1]);
      b:=Byte(data[k+0]);
      c:=((R*299)+(G*587)+(B*114)) div 1000;
      BmpBrightness:=BmpBrightness+c;
    end;
  end;
  BmpBrightness:=BmpBrightness div integer(320*240);

  for i:=1 to 240 do begin
    for j:=1 to 320 do begin
      r:=Byte(data[k+2]);
      g:=Byte(data[k+1]);
      b:=Byte(data[k+0]);
      c:=((R*299)+(G*587)+(B*114)) div 1000;
      x:=j-1;
      y:=240-i;
////      d:=(x-x0)*(x-x0)*240*240+(y-y0)*(y-y0)*320*320;
      d:=(x-x0)*(x-x0)+(y-y0)*(y-y0);
      if d<d2 then d:=1 else d:=0;
      data[k+0]:=#$ff;
      data[k+1]:=#$ff;
      data[k+2]:=#$ff;
////      if (c<v) and (d<=1) then begin
      if (c<=v) and (d=1) then begin
        data[k+0]:=#$00;
        data[k+1]:=#$00;
        data[k+2]:=#$00;
      end;
      inc(k, 3);
    end;
  end;
  Result:=data;
end;

function FindWhiteY(data:string; x, y, dir:integer):integer;
var
  i:integer;
begin
  Result:=0;
  for i:=1 to 40 do
////  for i:=1 to 60 do
  begin
    inc(y, dir);
    if GetXYVB(data, x, y)<>0 then
    begin
      Result:=y;
      break;
    end;
  end;
end;

function isWhiteYLine(data:string; x, y:integer):boolean;
var
  i,n:integer;
begin
  n:=0;
  for i:=1 to 20 do
  begin
    if GetXYVB(data, x, y+i-1)=0 then inc(n);
  end;
  Result:=n<=2;
end;

function FindWhiteYLine(data:string; x, y:integer):integer;
var
  i:integer;
begin
  Result:=0;
  for i:=1 to 40 do begin
    inc(x);
    if isWhiteYLine(data, x, y) then begin
      if i<10 then exit;
      if i>=10 then begin
        Result:=x;
        exit;
      end;
    end;
  end;
end;

function PupilFeature(data:string; x, y, x1, y1:integer):boolean;
var
  i,d,n,dir,dirc:integer;
  maxh,maxyh0,minyh0,avgyh0,maxyh1,minyh1,avgyh1:integer;
  yh0,yh1:array[1..240] of integer;
begin
  Result:=False;
  d:=0;
  n:=x1-x;
  yh0[1]:=y;
  yh1[1]:=y1;
  maxh:=0;
  minyh0:=240;
  maxyh0:=0;
  minyh1:=240;
  maxyh1:=0;
  avgyh0:=0;
  avgyh1:=0;
  for i:=2 to n do begin
    yh0[i]:=FindWhiteY(data, x+i-1, y, -1);
    yh1[i]:=FindWhiteY(data, x+i-1, y, +1);
    if (yh1[i]-yh0[i])>maxh then maxh:=yh1[i]-yh0[i];
    if yh0[i]>maxyh0 then maxyh0:=yh0[i];
    if yh0[i]<minyh0 then minyh0:=yh0[i];
    if yh1[i]>maxyh1 then maxyh1:=yh1[i];
    if yh1[i]<minyh1 then minyh1:=yh1[i];
    avgyh0:=avgyh0+yh0[i];
    avgyh1:=avgyh1+yh1[i];
  end;
  avgyh0:=avgyh0 div (n-1);
  avgyh1:=avgyh1 div (n-1);

  if maxh<10 then exit;
  if (maxyh0-minyh0)<=3 then exit;
  if (maxyh1-minyh1)<=3 then exit;
  if (2*avgyh0)>(y+y1) then exit;
  if (2*avgyh1)<(y+y1) then exit;
  if (avgyh1-avgyh0)<10 then exit;
  if abs(maxyh1-minyh0-n)>10 then exit;

  dirc:=0;
  for i:=2 to n do begin
    dir:=0;
    if (2*i)>(n+1) then dir:=-1;
    if (2*i)<(n-1) then dir:=+1;

    if (dir=1) then begin
      if (yh0[i]-yh0[i-1])<=0 then inc(d) else inc(dirc);
      if (yh1[i]-yh1[i-1])>=0 then inc(d) else inc(dirc);
    end
    else if (dir=-1) then begin
      if (yh0[i]-yh0[i-1])>=0 then inc(d) else inc(dirc);
      if (yh1[i]-yh1[i-1])<=0 then inc(d) else inc(dirc);
    end
    else begin
      if abs(yh0[i]-yh0[i-1])<=1 then inc(d);
      if abs(yh1[i]-yh1[i-1])<=1 then inc(d);
    end;
  end;
  if 20*dirc>4*n then exit;
  d:=d-dirc;
  PupilScore:=abs(d)*100 div (2*n);
  Result:=abs(d)>=2*n*60 div 100;
end;

function FindPupilAtXY(data:string; x, y:integer; var px,py,pdx,pdy:integer):boolean;
var
  x1,y1:integer;
  i,j,n:integer;
begin
  Result:=False;
  y1:=FindWhiteY(data, x, y, +1);
  if y1=0 then exit;
  if (y1-y)>15 then exit;
  if not isWhiteYLine(data, x-1, (y+y1) div 2 - 10) then exit;
  x1:=FindWhiteYLine(data, x, (y+y1) div 2 - 10);
  if x1=0 then exit;
  n:=0;
  for i:=1 to 10 do begin
    for j:=1 to 10 do begin
      if GetXYVB(data, x+i, y+j)=0 then inc(n);
    end;
  end;
  if (n<70) then exit;
  if not PupilFeature(data, x, y, x1, y1) then exit;

  px:=x;
  pdx:=x1-x;
  py:=(y+y1-pdx) div 2;
  pdy:=pdx;
  Result:=True;
end;

function FindWhiteDot(data:string; x0,y0,x1,y1:integer; var x, y:integer):boolean;
var
  i,j:integer;
begin
  Result:=False;
  for i:=y0 to y1 do begin
    for j:=x0 to x1 do begin
      if GetXYVB(data, j, i)=1 then
      begin
        x:=j;
        y:=i;
        Result:=True;
        exit;
      end;
    end;
  end;
end;

function FindPupil(data:string; var px,py,pdx,pdy,pwx,pwy:integer):integer;
var
  x,y,v,x0,y0,x1,y1:integer;
  gow:boolean;
  bwdata:string;
begin
  Result:=0;
  x:=50;
  y:=50;
  gow:=false;
//  bwdata:=BmpToBlackWhite(data, SaveData.BlackValue);
  bwdata:=BmpToBlackWhite(data, PupilBlackValue);


  while true do
  begin
    v:=GetXYVB(bwdata, x, y);
    if gow then
    begin
      if v<>0 then gow:=false;
    end
    else
    begin
      if v=0 then
      begin
        if FindPupilAtXY(bwdata, x, y, px, py, pdx, pdy) then
        begin
          break;
        end
        else
        begin
          gow:=true;
        end;
      end;
    end;

    inc(y);
    if y>190 then
    begin
      y:=50;
      inc(x);
      if x>270 then exit;
    end;
  end;

///////////////
  bwdata:=BmpToBlackWhite(data, 250);

  x:=px-30;
  y:=py+10;
  x1:=(px+px+pdx) div 2;
  y1:=py+50;
  while true do
  begin
  ////  if not FindWhiteDot(bwdata, x, y, x1, y1, x0, y0) then exit;
    if not FindWhiteDot(bwdata, x, y, x1, y1, x0, y0) then
    begin
//      x0 := px+10;
//      y0 := py+10;
      break;
    end;

    if FindWhiteDot(bwdata, x0+20, y0-2, x0+40, y0+2, x1, y1) then break;

    x:=x0+1;
    if x>270 then
    begin
      x:=px-30;
      inc(y);
      //if y>y1 then exit;
      if y>y1 then
        break;
    end;
  end;

  pwx:=(x0+x1) div 2;
  pwy:=(y0+y1) div 2;
  Result:=1;
end;


function GetEyeMove(x,y,dx,dy,wx,wy:integer):double;
var
  xd,yd:double;
begin
  xd:=(x+x+dx)/2-wx-Pupilwx0;
  yd:=(y+y+dy)/2-wy-Pupilwy0;
  Result:=2.0*sqrt(xd*xd+yd*yd*0.02);
//  Result:=3.0*sqrt(xd*xd+yd*yd);
//  Result:=1.0*sqrt(xd*xd+yd*yd);
end;

function GetPupil:string;
var
  i:integer;
  dx,dy,x,y,wx,wy:integer;
  vdx,vdy,vx,vy,vwx,vwy,vok,d:double;
begin
  Result:='Error';
  dx:=0;
  dy:=0;
  x:=0;
  y:=0;
  wx:=0;
  wy:=0;
  i:=FindPupil(BmpData, x, y, dx, dy, wx, wy);
  d:=GetEyeMove(x, y, dx, dy, wx, wy);
  Count:=Count+1;
  if Count mod 100=0 then
  begin
    Result:=Format('i:%d, (x:%d, y:%d), (dx:%d, dy:%d), (wx:%d, wy:%d),blackval:%d, %0.1f', [i, x, y, dx,dy, wx, wy,PupilBlackValue ,d]);
    TLogFile.GetInstance.Trace(LogLevel,'pupilInfo',Result);
  end;

  vok:=0.0;
//  if (i<>0) and (dx>=10) and (dx<=51) then
  if (i<>0) and (dx>=10) and (dx<=71) then
  begin
//    inc(ZpDllCount);
//    if ZpDllCount>=3 then
    begin
      NewValueToBuffer(PupildxBuf, dx, MIDFILTERNUM);
      vdx:=MidFilter(PupildxBuf, MIDFILTERNUM, 0);

      NewValueToBuffer(PupildyBuf, dy, MIDFILTERNUM);
      vdy:=MidFilter(PupildyBuf, MIDFILTERNUM, 0);

      NewValueToBuffer(PupilxBuf, x, MIDFILTERNUM);
      vx:=MidFilter(PupilxBuf, MIDFILTERNUM, 0);

      NewValueToBuffer(PupilyBuf, y, MIDFILTERNUM);
      vy:=MidFilter(PupilyBuf, MIDFILTERNUM, 0);

      NewValueToBuffer(PupilwxBuf, wx, MIDFILTERNUM);
      vwx:=MidFilter(PupilwxBuf, MIDFILTERNUM, 0);

      NewValueToBuffer(PupilwyBuf, wy, MIDFILTERNUM);
      vwy:=MidFilter(PupilwyBuf, MIDFILTERNUM, 0);

      Pupilx:=trunc(vx);
      Pupily:=trunc(vy);
      Pupildx:=trunc(vdx);
      Pupildy:=trunc(vdy);
      Pupilwx:=trunc(vwx);
      Pupilwy:=trunc(vwy);
      PupilD:=GetEyeMove(Pupilx, Pupily, Pupildx, Pupildy, Pupilwx, Pupilwy);
      vok:=1.0;
    end;
  end
  else
  begin
    ZpDllCount:=0;
  end;
  NewValueToBuffer(PupilokBuf, vok, MIDFILTERNUM); //将VOK填入PUPILOKBUF中第一个
  vok:=MidFilter(PupilokBuf, MIDFILTERNUM, 1); //取中位数VOK
  Pupilok:=trunc(vok);
end;

procedure GetHistogram(data:string);
var
  i,j,k:integer;
  r,g,b,c:integer;
begin
  for i:=0 to 256 do Histogram[i]:=0;

  k:=1;
  for i:=1 to 240 do begin
    for j:=1 to 320 do begin
      r:=Byte(data[k+2]);
      g:=Byte(data[k+1]);
      b:=Byte(data[k+0]);
      inc(k);

      c:=((R*299)+(G*587)+(B*114)) div 1000;
      Histogram[c]:=Histogram[c]+1;
    end;
  end;
end;

end.
