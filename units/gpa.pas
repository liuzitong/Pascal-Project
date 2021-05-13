unit gpa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Wwdatsrc, DBTables, Wwtable, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxContainer, cxLabel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxDBLabel, xwxh, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, Math;

type
  TFGpa = class(TForm)
    TbCheck: TwwTable;
    DsCheck: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    GridTbCheck: TcxGrid;
    GridTbCheckDBTableView1: TcxGridDBTableView;
    GridTbCheckLevel1: TcxGridLevel;
    GridTbCheckDBTableView1Number: TcxGridDBColumn;
    GridTbCheckDBTableView1Age: TcxGridDBColumn;
    GridTbCheckDBTableView1Date: TcxGridDBColumn;
    GridTbCheckDBTableView1Eye: TcxGridDBColumn;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxLabel6: TcxLabel;
    GridTbCheckDBTableView1FL: TcxGridDBColumn;
    GridTbCheckDBTableView1CheckData: TcxGridDBColumn;
    BtRemove: TcxButton;
    BtRestore: TcxButton;
    BtGpaBaseline: TcxButton;
    GridTbCheckDBTableView1MD: TcxGridDBColumn;
    GridTbCheckDBTableView1PSD: TcxGridDBColumn;
    BtGpaFollow: TcxButton;
    BtGpaSingle: TcxButton;
    GridTbCheckDBTableView1Program: TcxGridDBColumn;
    GridTbCheckDBTableView1Strategy: TcxGridDBColumn;
    GridTbCheckDBTableView1FN: TcxGridDBColumn;
    GridTbCheckDBTableView1FP: TcxGridDBColumn;
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    cxButtonReturn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure GridTbCheckDBTableView1FLGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure BtRemoveClick(Sender: TObject);
    procedure BtRestoreClick(Sender: TObject);
    procedure GridTbCheckDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure BtGpaBaselineClick(Sender: TObject);
    procedure GridTbCheckDBTableView1MDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridTbCheckDBTableView1PSDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure BtGpaFollowClick(Sender: TObject);
    procedure BtGpaSingleClick(Sender: TObject);
    procedure GridTbCheckDBTableView1FNGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridTbCheckDBTableView1FPGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridTbCheckDBTableView1CanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure cxButtonReturnClick(Sender: TObject);
  private
    { Private declarations }
    checkdata:TCheckData;
    checkresult:TCheckResult;
    RecordIndex:integer;
    procedure DrawGpaMDLine(canvas:TCanvas; x0,y0,w,h:integer);
    procedure GetGpaParam;
    procedure GpaFollowUp;
  public
    { Public declarations }
  end;

var
  FGpa: TFGpa;

implementation

uses Myutils, main;

{$R *.dfm}

procedure TFGpa.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

procedure TFGpa.GridTbCheckDBTableView1MDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  s:string;
begin
  s:=ARecord.Values[0];
  if Length(s)>0 then Move(s[1], checkdata, sizeof(checkdata));
  GetCheckResult(checkdata, checkresult);
  AText:=Format('%0.2f', [checkresult.MD]);
end;

procedure TFGpa.GridTbCheckDBTableView1PSDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=Format('%0.2f', [checkresult.PSD]);
end;

procedure TFGpa.GridTbCheckDBTableView1FLGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  d:double;
begin
  d:=0;
  if checkdata.fixationlength>0 then d:=checkdata.fixationcount/checkdata.fixationlength;
  AText:=Format('%0.2f', [d]);
end;

procedure TFGpa.GridTbCheckDBTableView1FNGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  d:double;
begin
  d:=0;
  if checkdata.neglength>0 then d:=checkdata.negcount/checkdata.neglength;
  AText:=Format('%0.2f', [d]);
end;

procedure TFGpa.GridTbCheckDBTableView1FPGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  d:double;
begin
  d:=0;
  if checkdata.poslength>0 then d:=checkdata.poscount/checkdata.poslength;
  AText:=Format('%0.2f', [d]);
end;

procedure TFGpa.BtRemoveClick(Sender: TObject);
begin
  TbCheck.Delete;
end;

procedure TFGpa.BtRestoreClick(Sender: TObject);
begin
  TbCheck.Active:=False;
  TbCheck.Active:=True;
end;

procedure TFGpa.GridTbCheckDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.Index<2) and (ACanvas.Brush.Color<>clRed) then ACanvas.Brush.Color:=clGray;
end;

procedure TFGpa.BtGpaBaselineClick(Sender: TObject);
var
  id1,id2:string;
begin
  GetGpaParam;
  TbCheck.First;
  id1:=TbCheck.FieldByName('Id').AsString;
  TbCheck.Next;
  id2:=TbCheck.FieldByName('Id').AsString;
  FMain.FHome1.TbCheck2.Filter:='(ID='+id1+') or (ID='+id2+')';
  DrawGpaMDLine(FMain.FHome1.ImageGpaMDLine.Canvas, 0, 0, FMain.FHome1.ImageGpaMDLine.Width, FMain.FHome1.ImageGpaMDLine.Height);
  FMain.FHome1.PrepareReport(FMain.FHome1.TbCheck2.Filter);
  FMain.FHome1.BtGpaBaselineClick(Sender);
end;

procedure TFGpa.GpaFollowUp;
var
  i,len:integer;
  s,d1,d2,id:string;

begin
  TbCheck.Prior;
  d2:=TbCheck.FieldByName('Date').AsString;
  TbCheck.Prior;
  d1:=TbCheck.FieldByName('Date').AsString;
  GpaFollowDate:=d1+'     '+d2;

  len:=3;
  GpaSingle:=3;
  if RecordIndex=2 then begin
    TbCheck.Next;
    TbCheck.Next;
    len:=1;
    GpaSingle:=1;
  end
  else if RecordIndex=3 then begin
    TbCheck.Next;
    len:=2;
    GpaSingle:=2;
  end;

  s:='(id<0)';
  for i:=1 to len do begin
    if TbCheck.Eof then break;
    id:=TbCheck.FieldByName('Id').AsString;
    s:=s+' or (id='+id+')';
    TbCheck.Next;
  end;

  GetGpaParam;
  FillChar(GpaDevPE, sizeof(GpaDevPE), 0);
  FMain.FHome1.TbCheck2.Filter:=s;
  FMain.FHome1.PrepareReport(FMain.FHome1.TbCheck2.Filter);
end;

procedure TFGpa.BtGpaFollowClick(Sender: TObject);
begin
  GpaFollowUp;
  FMain.FHome1.BtGpaFollowClick(Sender);
end;

procedure TFGpa.BtGpaSingleClick(Sender: TObject);
var
  id:string;
begin
  id:=TbCheck.FieldByName('Id').AsString;
  GpaFollowUp;
  GpaSingle:=0;
  FMain.FHome1.TbCheck2.Filter:='ID='+id;
  FMain.FHome1.PrepareReport(FMain.FHome1.TbCheck2.Filter);
  FMain.FHome1.BtGpaSingleClick(Sender);
end;

procedure TFGpa.GetGpaParam;
var
  i:integer;
  c1,c2:TCheckData;
  r1,r2:TCheckResult;
  s,d1,d2:string;
  i1,i2,x,y,v1,v2,md:integer;
begin
  fillchar(c1, sizeof(c1), 0);
  fillchar(c2, sizeof(c2), 0);

  TbCheck.First;
  s:=TbCheck.FieldByName('CheckData').AsString;
  d1:=TbCheck.FieldByName('Date').AsString;
  MoveCheckData(s, c1);
  TbCheck.Next;
  s:=TbCheck.FieldByName('CheckData').AsString;
  d2:=TbCheck.FieldByName('Date').AsString;
  MoveCheckData(s, c2);
  GetCheckResult(c1, r1);
  GetCheckResult(c2, r2);

  Gpa30_2:=(c1.pm.Dot_Number=76) or (c2.pm.Dot_Number=76);
  Gpa24_2:=(c1.pm.Dot_Number=54) or (c2.pm.Dot_Number=54);
  GpaDot_Number:=c1.pm.Dot_Number;
  GpaCheckData:=c1;
  if c2.pm.Dot_Number=54 then begin
    GpaDot_Number:=c2.pm.Dot_Number;
    GpaCheckData:=c2;
  end;

  GetCheckResult(c1, r1);
  GetCheckResult(c2, r2);

  for i:=1 to GpaDot_Number do begin
    x:=GpaCheckData.pt[i].x;
    y:=GpaCheckData.pt[i].y;
    i1:=FindXy(x,y,c1);
    i2:=FindXy(x,y,c2);
    GpaCheckResult.Dev[i]:=(r1.Dev[i1]+r2.Dev[i2]) div 2;
    GpaCheckResult.MDev[i]:=(r1.MDev[i1]+r2.MDev[i2]) div 2;
    md:=GpaCheckResult.Dev[i]-GpaCheckResult.MDev[i];
    v1:=GetCheckV(c1.v[i1]);
    v2:=GetCheckV(c2.v[i2]);
    GpaCheckResult.MDevPE[i]:=GetPE_VALUE(x, y, ((v1+v2) div 2)-md, c1);
  end;

  GpaMD:=Tr('Baseline MD:')+Format('%0.2f', [(r1.MD+r2.MD)/2]);
  GpaPT:='30-2';
  if GpaDot_Number=54 then GpaPT:='24-2';
  GpaBaselineDate:=d1+'     '+d2;
end;

procedure TFGpa.DrawGpaMDLine(canvas:TCanvas; x0,y0,w,h:integer);
var
  md:double;
  i,x,y:integer;
  s:string;
  rect:TRect;
  dt0,dt1:TDate;
  md0,md1,rate:double;
  r,minr,maxr:double;
begin
  TbCheck.First;
  i:=1;
  rect.Left:=0;
  rect.Top:=0;
  rect.Right:=w;
  rect.Bottom:=h;
  canvas.FillRect(rect);
  dt0:=0;
  md0:=0;
  rate:=0;
  minr:=9999;
  maxr:=-9999;
  while not TbCheck.Eof do begin
    s:=TbCheck.FieldByName('CheckData').AsString;
    MoveCheckData(s, checkdata);
    GetCheckResult(checkdata, checkresult);
    md:=checkresult.MD;
    x:=Round(GetY(0, x0, 15, x0+w, i));
    y:=Round(GetY(1, y0, -13, y0+h, md));
    canvas.Rectangle(x-2, y-2, x+2, y+2);
    if i=1 then begin
      canvas.MoveTo(x,y);
      dt0:=TbCheck.FieldByName('Date').AsDateTime;
      md0:=md;
    end
    else begin
      canvas.LineTo(x,y);
      dt1:=TbCheck.FieldByName('Date').AsDateTime;
      md1:=md;
      if (dt1<=dt0) then dt1:=dt0+1;
      r:=(md1-md0)/(dt1-dt0);
      rate:=rate+r;
      dt0:=dt1;
      md0:=md1;
      if r<minr then minr:=r;
      if r>maxr then maxr:=r;
    end;
    TbCheck.Next;
    inc(i);
  end;
  if (i>2) then rate:=365*rate/(i-2);
  GpaRate:=Tr('Rate of Progression:')+Format('%0.2f + %0.2f'+Tr('DB/YEAR'), [rate, 365*(minr+maxr)/2-rate]);
  if rate<-100.0 then GpaSlope:=Tr('Slope signification') else GpaSlope:=Tr('Slope not signification');
end;

procedure TFGpa.GridTbCheckDBTableView1CanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  BtGpaFollow.Enabled:=ARecord.RecordIndex>=2;
  BtGpaSingle.Enabled:=BtGpaFollow.Enabled;
  RecordIndex:=ARecord.RecordIndex;
end;

procedure TFGpa.cxButtonReturnClick(Sender: TObject);
begin
   Close();
end;

end.
