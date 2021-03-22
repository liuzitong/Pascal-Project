unit programset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DB, Wwdatsrc,
  DBTables, Wwtable, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, Xwxh,
  DBActns, ActnList, wwSpeedButton, wwDBNavigator, wwclearpanel, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxPC,
  cxCheckBox, cxDBEdit, Buttons;

type
  TFProgram = class(TFrame)
    Panel2: TPanel;
    Panel3: TPanel;
    TbPt: TwwTable;
    DsPt: TwwDataSource;
    Panel4: TPanel;
    EtPtName: TwwDBGrid;
    Panel5: TPanel;
    PaPt: TPanel;
    Timer: TTimer;
    ActionList: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    EtDotNum: TPanel;
    TbPtXY: TwwTable;
    DsPtXY: TwwDataSource;
    GridXY: TwwDBGrid;
    Panel7: TPanel;
    EtXYP: TPanel;
    EtGrid: TcxSpinEdit;
    cxLabel1: TcxLabel;
    BtDeleteDot: TcxButton;
    BtInsertDot: TcxButton;
    Panel8: TPanel;
    ImagePt: TImage;
    EtRect: TShape;
    TbPtCopy: TwwTable;
    Panel6: TPanel;
    PcReport: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    cxDBCheckBox5: TcxDBCheckBox;
    cxDBCheckBox6: TcxDBCheckBox;
    cxDBCheckBox7: TcxDBCheckBox;
    cxDBCheckBox8: TcxDBCheckBox;
    cxDBCheckBox9: TcxDBCheckBox;
    cxDBCheckBox10: TcxDBCheckBox;
    cxTabSheet3: TcxTabSheet;
    cxDBCheckBox11: TcxDBCheckBox;
    cxDBCheckBox12: TcxDBCheckBox;
    cxDBCheckBox13: TcxDBCheckBox;
    TabType: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    cxTabSheet9: TcxTabSheet;
    cxDBCheckBox14: TcxDBCheckBox;
    cxDBCheckBox15: TcxDBCheckBox;
    cxDBCheckBox16: TcxDBCheckBox;
    Panel1: TPanel;
    btNew: TcxButton;
    BtParam: TcxButton;
    BtDelete: TcxButton;
    BtClear: TcxButton;
    BtCopy: TcxButton;
    BtCricle: TcxButton;
    BtRect: TcxButton;
    BtXy: TcxButton;
    BtUnLock: TcxButton;
    BtTestPT: TcxButton;
    btCancel: TcxButton;
    btSave: TcxButton;
    Label1: TLabel;
    EtXY: TcxLabel;
    OpenDialogBin: TOpenDialog;
    BitBtn1: TcxButton;
    procedure TimerTimer(Sender: TObject);
    procedure TbPtAfterInsert(DataSet: TDataSet);
    procedure TbPtAfterPost(DataSet: TDataSet);
    procedure TbPtAfterScroll(DataSet: TDataSet);
    procedure TbPtBeforePost(DataSet: TDataSet);
    procedure BtParamClick(Sender: TObject);
    procedure ImagePtMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtDeleteDotClick(Sender: TObject);
    procedure BtInsertDotClick(Sender: TObject);
    procedure BtCricleClick(Sender: TObject);
    procedure BtRectClick(Sender: TObject);
    procedure ImagePtMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImagePtMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtClearClick(Sender: TObject);
    procedure GridXYKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtCopyClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure BtXyClick(Sender: TObject);
    procedure TbPtBeforeDelete(DataSet: TDataSet);
    procedure TbPtAfterDelete(DataSet: TDataSet);
    procedure BtUnLockClick(Sender: TObject);
    procedure EtXYPMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabTypeChange(Sender: TObject);
    procedure BtTestPTClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    PassState:integer;
    bRefresh:boolean;
    bShow:boolean;
    CheckData:TCheckData;
    bSelect:integer;
    XSelect:integer;
    YSelect:integer;
    procedure Refresh;
    procedure DeleteDotXY(cx,cy:integer);
    procedure InsertDotXY;
    procedure GridToCheckData;
    procedure CheckDataToGrid;

    procedure AddToHistory(Str: string);
  public
    { Public declarations }
  end;

implementation

uses main, param, circle, rectangle, Myutils, language, Login, paramcast,
  paramcastmove;

{$R *.dfm}

procedure TFProgram.AddToHistory(Str: string);
var
  f:integer;
  s:string;
begin
  if  FMain.CheckBoxDebug.Checked then
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
  end;
end;

procedure TFProgram.GridToCheckData;
var
  x,y,jd,wd:double;
  xs,ys:string;
  i:integer;
begin
  CheckData.pm.Dot_Number:=0;
  TbPtXY.DisableControls;
  TbPtXY.First;
  for i:=1 to 300 do begin
    xs:=Trim(TbPtXY.FieldByName('X').AsString);
    ys:=Trim(TbPtXY.FieldByName('Y').AsString);
    if xs='' then break;
    if ys='' then break;
    x:=StrToInt(xs);
    y:=StrToInt(ys);
    if checkdata.pm.Strategy>=30 then begin
      JwdtoXy(y,x,jd,wd);
      x:=jd;
      y:=wd;
    end;
    CheckData.pt[i].x:=Round(x);
    CheckData.pt[i].y:=Round(y);
    inc(CheckData.pm.Dot_Number);
    TbPtXY.Next;
  end;
  TbPtXY.EnableControls;
end;

procedure TFProgram.CheckDataToGrid;
var
  i:integer;
  x,y,jd,wd:double;
begin
  TbPtXY.DisableControls;
  TbPtXy.First;
  for i:=1 to 300 do begin
    TbPtXy.Edit;
    if Trim(TbPtXy.FieldByName('X').AsString)='' then break;
    TbPtXy.FieldByName('X').AsString:='';
    TbPtXy.FieldByName('Y').AsString:='';
    TbPtXy.Post;
    TbPtXy.Next;
  end;

  TbPtXy.First;
  for i:=1 to CheckData.pm.Dot_Number do begin
    TbPtXy.Edit;
    x:=CheckData.pt[i].x;
    y:=CheckData.pt[i].y;
    if checkdata.pm.Strategy>=30 then begin
      XytoJwd(x,y,jd,wd);
      x:=wd;
      y:=jd;
    end;
    TbPtXy.FieldByName('X').AsInteger:=Round(x);
    TbPtXy.FieldByName('Y').AsInteger:=Round(y);
    TbPtXy.Post;
    TbPtXy.Next;
  end;
  TbPtXY.EnableControls;
end;

procedure TFProgram.TimerTimer(Sender: TObject);
begin
  EtDotNum.Caption:=Format('[%d]', [CheckData.pm.Dot_Number]);
  BtParam.Enabled:=BtDelete.Enabled;
  if FMain.PcMain.ActivePageIndex=2 then
  begin
    if not bShow then bRefresh:=true;
    bShow:=True;
    TrwwDBGrid(EtPtName);
  end
  else
  begin
    if TabType.Enabled then
    begin
      TabType.ActivePageIndex:=3;
      TabTypeChange(Sender);
    end;
  end;
  if bRefresh then
  begin
    bRefresh:=False;
    Refresh;
  end;

  BitBtn1.Visible:=(Xwdata.oprank>=3);  //固件升级
   //限制了其他类型显示
  TabType.Pages[0].TabVisible:=(Xwdata.oprank>=3);
  TabType.Pages[1].TabVisible:=(Xwdata.oprank>=3);
  TabType.Pages[2].TabVisible:=(Xwdata.oprank>=3);
  TabType.Pages[4].TabVisible:=(Xwdata.oprank>=3) and (DemoCheckData.devicetype=1);
  TabType.Pages[5].TabVisible:=(DemoCheckData.devicetype=1);

  if TabType.Pages[4].TabVisible then TabType.Height:=60 else TabType.Height:=30;
end;

procedure TFProgram.TbPtAfterInsert(DataSet: TDataSet);
var
  s:string;
begin
  CheckData:=DefaultCheckData;
  CheckData.pm.Stimulus_Size:=2;

  SetLength(s, sizeof(CheckData));
  Move(CheckData, s[1], sizeof(CheckData));
  CheckData.pm.Range:=90;

  TbPt.FieldByName('Type').AsInteger:=TabType.ActivePageIndex;
  TbPt.FieldByName('CheckData').AsString:=s;

  EtPtName.SetFocus;
end;

procedure TFProgram.TbPtAfterPost(DataSet: TDataSet);
begin
  if bShow then bRefresh:=True;
  if (TabType.ActivePageIndex=3) then
  begin
//    TbPt.Edit;
    cxDBCheckBox2.Checked := false;
    cxDBCheckBox3.Checked := false;
//    TbPt.Post;
  end;
end;

procedure TFProgram.TbPtAfterScroll(DataSet: TDataSet);
begin
  if bShow then bRefresh:=True;
end;

procedure TFProgram.Refresh;
var
  s:string;
begin
  CheckData:=DefaultCheckData;
  SetLength(s, sizeof(CheckData));
  if not TbPt.Eof then
  begin
    s:=TbPt.FieldByName('CheckData').AsString;
    MoveCheckData(s, checkdata);
  end;

  CheckDataToGrid;

  DrawAxis(ImagePt.canvas, 0, 0, ImagePt.Width, ImagePt.Height, CheckData);
  DrawPtDot(ImagePt.canvas, 0, 0, ImagePt.Width, ImagePt.Height, CheckData);
end;

procedure TFProgram.TbPtBeforePost(DataSet: TDataSet);
var
  s,sn:string;
  i:integer;
begin
  GridToCheckData;
  SetLength(s, sizeof(CheckData));
  Move(CheckData, s[1], sizeof(CheckData));
  sn:=TbPt.FieldByName('Name').AsString;
  for i:=1 to Length(sn) do s[i]:=sn[i];
  TbPt.FieldByName('CheckData').AsString:=s;
end;

procedure TFProgram.BtParamClick(Sender: TObject);
begin
  if TbPt.FieldByName('Type').AsInteger>=4 then //投射
  begin
    FParamCastMove:=TFParamCastMove.Create(Self);
    FParamCastMove.CheckData:=CheckData;
    FParamCastMove.Page.Pages[1].TabVisible:=False;
    FParamCastMove.TbPt.Filter:='ID='+TbPt.FieldByName('ID').AsString;
    if FParamCastMove.ShowModal=mrOK then
    begin
      CheckData.pm:=FParamCastMove.CheckData.pm;
      TbPt.Edit;
      TbPt.Post;
    end;
    FParamCastMove.Free;
  end
  else
  begin
    if DemoCheckData.devicetype=0 then        //布点
    begin
      FParam:=TFParam.Create(Self);
      FParam.CheckData:=CheckData;
      FParam.TbPt.Filter:='ID='+TbPt.FieldByName('ID').AsString;
      if FParam.ShowModal=mrOK then begin
        CheckData.pm:=FParam.CheckData.pm;
        TbPt.Edit;
        TbPt.Post;
      end;
      FParam.Free;
    end
    else
    begin
      FParamCast:=TFParamCast.Create(Self);
      FParamCast.CheckData:=CheckData;
      FParamCast.TbPt.Filter:='ID='+TbPt.FieldByName('ID').AsString;
      if FParamCast.ShowModal=mrOK then begin
        CheckData.pm:=FParamCast.CheckData.pm;
        TbPt.Edit;
        TbPt.Post;
      end;
      FParamCast.Free;
    end;
  end;
end;

procedure TFProgram.ImagePtMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then bSelect:=1;
  XSelect:=x;
  YSelect:=y;
  EtRect.Left:=x;
  EtRect.Top:=y;
  EtRect.Width:=0;
  EtRect.Height:=0;
  EtRect.Visible:=False;
end;

procedure TFProgram.ImagePtMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  id:integer;
  cx,cy:integer;
begin
  if bSelect<>0 then begin
    EtRect.Visible:=True;
    if X>XSelect then begin
      EtRect.Left:=XSelect;
      EtRect.Width:=X-XSelect;
    end
    else begin
      EtRect.Left:=X;
      EtRect.Width:=XSelect-X;
    end;

    if Y>YSelect then begin
      EtRect.Top:=YSelect;
      EtRect.Height:=Y-YSelect;
    end
    else begin
      EtRect.Top:=Y;
      EtRect.Height:=YSelect-Y;
    end;
  end;
  GetCxCy(x, y, ImagePt.Width, ImagePt.Height, CheckData.pm.Range, 1, cx, cy);
  EtXY.Caption:=Format('(%d,%d) ', [cx, cy]);
  id:=FindXyStep(cx, cy, EtGrid.Value, CheckData);
  TbPtXy.Locate('Id', id, []);
end;

procedure TFProgram.ImagePtMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  bSelect:=0;
  EtRect.Visible:=False;
  if Button=mbLeft then begin
    InsertDotXY;
  end
  else if Button=mbRight then begin
    if bSelect=0 then begin
      GetCxCy(x, y, ImagePt.Width, ImagePt.Height, CheckData.pm.Range, 0, x, y);
      DeleteDotXY(x, y);
    end;
  end;
end;

procedure TFProgram.GridXYKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TbPtXy.State=dsEdit then TbPt.Edit;
end;

procedure TFProgram.DeleteDotXY(cx,cy:integer);
var
  i,x,y,r,minr,mini:integer;
begin
  minr:=999999;
  mini:=-1;
  for i:=1 to CheckData.pm.Dot_Number do begin
    x:=CheckData.pt[i].x;
    y:=CheckData.pt[i].y;
    r:=(x-cx)*(x-cx)+(y-cy)*(y-cy);
    if r<minr then begin
      minr:=r;
      mini:=i;
      if r=0 then break;
    end;
  end;
  if mini=-1 then exit;
  for i:=mini to CheckData.pm.Dot_Number do begin
    CheckData.pt[i]:=CheckData.pt[i+1];
  end;
  dec(CheckData.pm.Dot_Number);
  CheckDataToGrid;
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.InsertDotXY;
var
  i,n:integer;
  pt:array[1..4096] of  TCHECKPOINT;
  x0,y0,x1,y1:integer;
  xx0,yy0,xx1,yy1:integer;
begin
  GetCxCy(EtRect.Left, EtRect.Top, ImagePt.Width, ImagePt.Height, CheckData.pm.Range, EtGrid.Value, x0, y0);
  GetCxCy(EtRect.Left+EtRect.Width, EtRect.Top+EtRect.Height, ImagePt.Width, ImagePt.Height, CheckData.pm.Range, EtGrid.Value, x1, y1);
  if (EtRect.Width>=30) or (EtRect.Height>=30) then begin
    GetCxCy(EtRect.Left, EtRect.Top, ImagePt.Width, ImagePt.Height, CheckData.pm.Range, 1, xx0, yy0);
    GetCxCy(EtRect.Left+EtRect.Width, EtRect.Top+EtRect.Height, ImagePt.Width, ImagePt.Height, CheckData.pm.Range, 1, xx1, yy1);
    if x0<xx0 then x0:=x0+EtGrid.Value;
    if y0>yy0 then y0:=y0-EtGrid.Value;
    if x1>xx1 then x1:=x1-EtGrid.Value;
    if y1<yy1 then y1:=y1+EtGrid.Value;
    if x1<x0 then x1:=x0;
    if y1>y0 then y1:=y0;
  end
  else begin
    if FindXY(x0, y0, CheckData)<>0 then begin
      DeleteDotXY(x0, y0);
      CheckDataToGrid;
      TbPt.Edit;
      TbPt.Post;
      exit;
    end;
  end;
  n:=XwCreatePT2(x0, y0, x1, y1, EtGrid.Value, @pt);
  for i:=1 to n do begin
    if FindXY(pt[i].x, pt[i].y, CheckData)<>0 then Continue;
    if CheckData.pm.Dot_Number>=300 then break;
    inc(CheckData.pm.Dot_Number);
    CheckData.pt[CheckData.pm.Dot_Number]:=pt[i];
  end;
  CheckDataToGrid;
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.BtDeleteDotClick(Sender: TObject);
var
  i,id:integer;
  d:boolean;
begin
  d:=False;
  id:=TbPtXY.FieldByName('Id').AsInteger;
  for i:=id to CheckData.pm.Dot_Number do begin
    d:=True;
    CheckData.pt[i]:=CheckData.pt[i+1];
  end;
  if not d then exit;
  if Xwxx('Delete')<>IDYES then exit;
  dec(CheckData.pm.Dot_Number);
  CheckDataToGrid;
  TbPtXy.Locate('Id', id, []);
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.BtInsertDotClick(Sender: TObject);
var
  i,id:integer;
begin
  id:=TbPtXY.FieldByName('Id').AsInteger;
  for i:=CheckData.pm.Dot_Number downto id do begin
    CheckData.pt[i+1]:=CheckData.pt[i];
  end;
  inc(CheckData.pm.Dot_Number);
  CheckData.pt[id].x:=0;
  CheckData.pt[id].y:=0;
  CheckDataToGrid;
  TbPtXy.Locate('Id', id, []);
  TbPtXy.Edit;
  TbPtXy.FieldByName('X').AsString:='';
  TbPtXy.FieldByName('Y').AsString:='';
  TbPt.Edit;
end;

procedure TFProgram.BtCricleClick(Sender: TObject);
var
  i:integer;
begin
  FCircle:=TFCircle.Create(Self);
  if FCircle.ShowModal=mrOk then begin
    CheckData.pm.Dot_Number:=FCircle.CheckData.pm.Dot_Number;
    CheckData.pm.Range:=FCircle.CheckData.pm.Range;
    for i:=1 to CheckData.pm.Dot_Number do begin
      CheckData.pt[i].x:=FCircle.CheckData.pt[i].x;
      CheckData.pt[i].y:=FCircle.CheckData.pt[i].y;
    end;
  end;
  FCircle.Free;
  CheckDataToGrid;
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.BtRectClick(Sender: TObject);
var
  i:integer;
begin
  FRect:=TFRect.Create(Self);
  if FRect.ShowModal=mrOk then begin
    CheckData.pm.Dot_Number:=FRect.CheckData.pm.Dot_Number;
    for i:=1 to CheckData.pm.Dot_Number do begin
      CheckData.pt[i]:=FRect.CheckData.pt[i];
    end;
  end;
  FRect.Free;
  CheckDataToGrid;
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.BtClearClick(Sender: TObject);
begin
  if Xwxx('Clear')<>IDYES then exit;
  CheckData.pm.Dot_Number:=0;
  CheckDataToGrid;
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.BtCopyClick(Sender: TObject);
var
  s:array[1..200] of string;
  name:string;
  i:integer;
begin
  for i:=1 to TbPt.FieldCount-1 do s[i]:=TbPt.Fields[i].AsString;
  name:=TbPt.FieldByName('Name').AsString;

  TbPtCopy.Active:=True;
  TbPtCopy.Append;
  for i:=1 to TbPt.FieldCount-1 do TbPtCopy.Fields[i].AsString:=s[i];
  TbPtCopy.FieldByName('Name').AsString:=name+'*';
  TbPtCopy.Post;
  TbPtCopy.Active:=False;

  TbPt.Refresh;
end;

procedure TFProgram.BtSaveClick(Sender: TObject);
begin
  BtParamClick(Sender);
end;

procedure TFProgram.BtXyClick(Sender: TObject);
var
  i,j,x,y:integer;
begin
  for i:=1 to CheckData.pm.Dot_Number do begin
    for j:=i+1 to CheckData.pm.Dot_Number do begin
      if CheckData.pt[j].y>CheckData.pt[i].y then begin
        x:=CheckData.pt[j].x;
        CheckData.pt[j].x:=CheckData.pt[i].x;
        CheckData.pt[i].x:=x;

        y:=CheckData.pt[j].y;
        CheckData.pt[j].y:=CheckData.pt[i].y;
        CheckData.pt[i].y:=y;
      end;
    end;
  end;

  i:=1;
  while i<=CheckData.pm.Dot_Number do begin
    y:=CheckData.pt[i].y;
    for j:=i+1 to CheckData.pm.Dot_Number do begin
      if y<>CheckData.pt[j].y then begin
        break;
      end;
      if CheckData.pt[j].x<CheckData.pt[i].x then begin
        x:=CheckData.pt[j].x;
        CheckData.pt[j].x:=CheckData.pt[i].x;
        CheckData.pt[i].x:=x;

        y:=CheckData.pt[j].y;
        CheckData.pt[j].y:=CheckData.pt[i].y;
        CheckData.pt[i].y:=y;
      end;
    end;
    inc(i);
  end;

  CheckDataToGrid;
  TbPt.Edit;
  TbPt.Post;
end;

procedure TFProgram.TbPtBeforeDelete(DataSet: TDataSet);
begin
  if Xwxx('Delete')<>IDYES then Abort;
end;

procedure TFProgram.TbPtAfterDelete(DataSet: TDataSet);
begin
  TbPt.FlushBuffers;
end;

procedure TFProgram.BtUnLockClick(Sender: TObject);
begin
  if XwData.oprank=3 then begin
    BtUnLock.Visible:=False;
    BtTestPT.Visible:=False;
    XwData.oprank:=1;
    exit;
  end;
  FLogin:=TFLogin.Create(Self);
  FLogin.ShowModal;
  FLogin.Free;
end;

procedure TFProgram.EtXYPMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  w,cx:integer;
begin
  w:=(Sender as TPanel).Width;
  cx:=w div 2;
  if (PassState=2) and (x>=(w-40)) then begin
    BtUnLock.Visible:=True;
    BtTestPT.Visible:=True;
    PassState:=0;
  end;
  if (PassState=1) and (x>=(cx-40)) and (x<=(cx+40)) then begin
    PassState:=1;
    exit;
  end;
  if (PassState=0) and (x<100) then begin
    PassState:=2;
    exit;
  end;
  PassState:=0;
end;

procedure TFProgram.TabTypeChange(Sender: TObject);
begin
  TbPt.Filter:='Type='+IntToStr(TabType.ActivePageIndex);
  //控制自定义不能智能
  if (TabType.ActivePageIndex=3) then
  begin
    cxDBCheckBox2.Checked := false;
    cxDBCheckBox3.Checked := false;

    cxDBCheckBox4.Visible := false;
    cxDBCheckBox16.Visible := false;

    cxDBCheckBox2.Enabled := false;
    cxDBCheckBox3.Enabled := false;
  end
  else
  begin
    cxDBCheckBox2.Enabled := true;
    cxDBCheckBox3.Enabled := true;

    //cxDBCheckBox4.Visible := true;
    //cxDBCheckBox16.Visible := true;
  end;

end;

procedure TFProgram.BtTestPTClick(Sender: TObject);
var
  checkdata:TCheckData;
begin
  if DemoCheckData.Ready=0 then exit;
  checkdata.runstate:=3;
  checkdata.runstate30:=0;
  if not WriteXwRunstate(checkdata) then;
end;



procedure TFProgram.BitBtn1Click(Sender: TObject);
var
  iFileHandle: Integer;
  iFileLength: Integer;
  iBytesRead: Integer;
//  Buffer: PChar;
  Buffer: array[0..58796] of Byte;
  i,j,k: Integer;
  updateok: boolean;
  myCount,StartTime,LI:TLARGEINTEGER;

  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite,mywrited: Cardinal;
  Str: string;
  Err: DWORD;
begin
  if application.messagebox('是否升级固件?','系统管理',mb_yesno or mb_ICONinformation)=idyes then
  begin
    updateok := true;
    Fillchar(Buffer, sizeof(Buffer), $FF);
    if OpenDialogBin.Execute then
    begin
      if application.messagebox('升级中途严禁断电，若出现异常情况，请与设备制造商联系，是否确认升级固件?','系统管理',mb_yesno or mb_ICONinformation)=idyes then
      begin
        try
          iFileHandle := FileOpen(OpenDialogBin.FileName, fmOpenRead);
          iFileLength := FileSeek(iFileHandle,0,2);
          FileSeek(iFileHandle,0,0);
          iBytesRead := FileRead(iFileHandle, Buffer[1], iFileLength);

          //StatusBarBottom.SimpleText := '';

          Buffer[0] := StrToIntDef('$00', 0);

          FileClose(iFileHandle);

          Fillchar(Buf, sizeof(Buf), 0);
          Buf[0] := StrToIntDef('$00', 0);
          Buf[1]:=$bb;
          Buf[2]:=$0c;
          Buf[3]:=$dd;
          Buf[4]:=$c9;

          Buf[56]:=$44;
          ToWrite := FMain.CurrentDevice.Caps.OutputReportByteLength;

          Buf[63]:=$0e;
          Buf[64]:=$0f;

          if not FMain.CurrentDevice.WriteFile(Buf, ToWrite, Written) then
          begin
            Err := GetLastError;
    //        AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
            //StatusBarBottom.SimpleText := '写入44出错！';
            updateok := false;
            exit;
          end;
          sleep(30);

          Fillchar(Buf, sizeof(Buf), 0);
          Buf[0] := StrToIntDef('$00', 0);
          Buf[1]:=$bb;
          Buf[2]:=$0c;
          Buf[3]:=$dd;
          Buf[4]:=$c9;

          Buf[56]:=$88;
    //      Buf[56]:=$44;
          Buf[57]:=iFileLength div 256;
          Buf[58]:=iFileLength mod 256;

          ToWrite := FMain.CurrentDevice.Caps.OutputReportByteLength;

          Buf[63]:=$0e;
          Buf[64]:=$0f;
          i := 1;
          while (not FMain.CurrentDevice.WriteFile(Buf, ToWrite, Written)) and (i<10) do
          begin
            Err := GetLastError;
            AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
            //StatusBarBottom.SimpleText := inttostr(i)+'次 写入88出错！';
            //StatusBarBottom.Refresh;
            i := i+1;
            sleep(30);
          end;

          j := iFileLength div 64;
          if Assigned(FMain.CurrentDevice) then
          begin
            i := 1;
            while i<=j+1 do
            begin
              Fillchar(Buf, sizeof(Buf), $FF);
              Buf[0] := StrToIntDef('$00', 0);
              ToWrite := FMain.CurrentDevice.Caps.OutputReportByteLength;
              Move(Buffer[(i-1)*64+1], Buf[1], 64);
              if not FMain.CurrentDevice.WriteFile(Buf, ToWrite, Written) then
              begin
                Err := GetLastError;
                AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
                //StatusBarBottom.SimpleText := '固件第：'+inttostr(i)+' 出错！';
                updateok := false;
                break;
              end
              else
              begin
                Str := Format('W %.2x  ', [Buf[0]]);
                for k := 1 to Written-1 do
                  Str := Str + Format('%.2x ', [Buf[k]]);
                //AddToHistory(Str);
                //StatusBarBottom.SimpleText := '固件第：'+inttostr(i)+' OK ';

               /////等待间隔时间
                QueryPerformanceFrequency(li);
                myCount:=round((li/1000)*8); //li* pubPrefer.flashtime;
                QueryPerformanceCounter(StartTime);
                repeat
                  Application.ProcessMessages;
                  QueryPerformanceCounter(li);
                until li-StartTime > myCount;
              end;
              i := i+1;
            end;
          end;
          if updateok then
            application.messagebox('固件升级成功，请退出系统后，重新进入！','系统管理')
          else
            application.messagebox('固件升级失败，请重新操作！','系统管理');
        finally
          //FreeMem(Buffer);
        end;
      end;
    end;

  end;
end;

end.
