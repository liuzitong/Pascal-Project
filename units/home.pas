unit home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Wwdatsrc, DBTables, Wwtable, StdCtrls, ExtCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxLabel, ComCtrls, wwSpeedButton,
  wwDBNavigator, wwclearpanel, RpRave, RpBase, RpSystem, RpDefine, RpCon,
  RpConDS, RpConBDE, xwxh, cxListBox, cxTextEdit, cxMemo, cxDBLabel,
  cxDBEdit, jpeg, RpRender, RpRenderCanvas, RpRenderPreview, RpFiler,pubpas,
  cxButtonEdit,Myutils,myIniFiles,uProgLog;

type
  TFHome = class(TFrame)
    TbCheck2: TwwTable;
    DsCheck2: TwwDataSource;
    Panel1: TPanel;
    PanelNewList: TPanel;
    PanelDocList: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel5A: TPanel;
    Panel7: TPanel;
    EtQuery: TEdit;
    Panel8: TPanel;
    GridTbCheckDBTableView1: TcxGridDBTableView;
    GridTbCheckLevel1: TcxGridLevel;
    GridTbCheck: TcxGrid;
    GridTbCheck2DBTableView1: TcxGridDBTableView;
    GridTbCheck2Level1: TcxGridLevel;
    GridTbCheck2: TcxGrid;
    DsCheck: TwwDataSource;
    TbCheck: TwwTable;
    GridTbCheck2DBTableView1Number: TcxGridDBColumn;
    GridTbCheck2DBTableView1Name: TcxGridDBColumn;
    GridTbCheckDBTableView1Number: TcxGridDBColumn;
    GridTbCheckDBTableView1Name: TcxGridDBColumn;
    BtDelete: TcxButton;
    wwDBNavigator1: TwwDBNavigator;
    TbCheckInsert: TwwNavButton;
    TbCheckDelete: TwwNavButton;
    TbCheckEdit: TwwNavButton;
    TbCheckPost: TwwNavButton;
    TbCheckCancel: TwwNavButton;
    TbCheckRefresh: TwwNavButton;
    wwDBNavigator2: TwwDBNavigator;
    TbCheck2Insert: TwwNavButton;
    TbCheck2Delete: TwwNavButton;
    TbCheck2Edit: TwwNavButton;
    TbCheck2Post: TwwNavButton;
    TbCheck2Cancel: TwwNavButton;
    TbCheck2Refresh: TwwNavButton;
    Timer: TTimer;
    RvTcCheckResult: TRvTableConnection;
    RvSystem: TRvSystem;
    RvProject: TRvProject;
    TbCheckResult: TwwTable;
    TbCheck3: TwwTable;
    ID: TcxGridDBColumn;
    Panel10: TPanel;
    BtStart: TcxButton;
    BtDelete2: TcxButton;
    cxLabel8: TcxLabel;
    EtSex: TcxDBLabel;
    cxLabel9: TcxLabel;
    EtAge: TcxDBLabel;
    DsSelect: TwwDataSource;
    GridTbCheck2DBTableView1Eye: TcxGridDBColumn;
    GridTbCheckDBTableView1Eye: TcxGridDBColumn;
    cxLabel6: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxLabel7: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    BtRecheck: TcxButton;
    BtEdit: TcxButton;
    BtEdit2: TcxButton;
    BtNew: TcxButton;
    TbCheckID: TcxGridDBColumn;
    RvTcCheckMove: TRvTableConnection;
    TbCheckMove: TwwTable;
    cxLabel10: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    GridTbCheck2DBTableView1Sex: TcxGridDBColumn;
    GridTbCheck2DBTableView1Birthday: TcxGridDBColumn;
    GridTbCheck2DBTableView1Age: TcxGridDBColumn;
    GridTbCheck2DBTableView1Program: TcxGridDBColumn;
    GridTbCheck2DBTableView1Strategy: TcxGridDBColumn;
    GridTbCheck2DBTableView1Date: TcxGridDBColumn;
    GridTbCheckDBTableView1Sex: TcxGridDBColumn;
    GridTbCheckDBTableView1Birthday: TcxGridDBColumn;
    GridTbCheckDBTableView1Age: TcxGridDBColumn;
    GridTbCheckDBTableView1IDNo: TcxGridDBColumn;
    GridTbCheck2DBTableView1IDNo: TcxGridDBColumn;
    Panel2: TPanel;
    Panel6: TPanel;
    BtSingle: TcxButton;
    Bt3in1: TcxButton;
    BtScreen: TcxButton;
    BtOverview: TcxButton;
    BtPrint: TcxButton;
    BtMove: TcxButton;
    BtMove2: TcxButton;
    BtGpaBaseline: TcxButton;
    BtGpaFollow: TcxButton;
    BtGpaSingle: TcxButton;
    BtQuery: TcxButton;
    BtLast10: TcxButton;
    BtAll: TcxButton;
    BtDiagnosis: TcxButton;
    BtGpa: TcxButton;
    Bttridimension: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    Pages: TPageControl;
    TabSheet1: TTabSheet;
    ImageField: TImage;
    ImageGray: TImage;
    ImageDepth: TImage;
    ImageDev: TImage;
    ImageDevPE: TImage;
    ImageMdev: TImage;
    ImageMdevPE: TImage;
    ImageBabie: TImage;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel1: TcxLabel;
    EtResult: TcxLabel;
    LbID: TListBox;
    TabSheet6: TTabSheet;
    ImageScreen: TImage;
    TabSheet3: TTabSheet;
    ImageMove: TImage;
    TabSheet2: TTabSheet;
    ImageEmpty: TImage;
    TabSheet4: TTabSheet;
    ImageGpaMDLine: TImage;
    ImageGpaDev: TImage;
    ImageGpaDevPE: TImage;
    ImageGpaDevPESingle: TImage;
    TabSheet5: TTabSheet;
    ImageGray2: TImage;
    ImageField2: TImage;
    ImageDev2: TImage;
    ImageDevPE2: TImage;
    ImageMDev2: TImage;
    ImageMDevPE2: TImage;
    ImageEyeMove: TImage;
    TabSheet7: TTabSheet;
    ImageFieldNasal: TImage;
    ImageDepthNasal: TImage;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    switcPage: TButton;
    pnl1: TPanel;
    procedure BtNewClick(Sender: TObject);
    procedure BtEditClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure TbCheckAfterDelete(DataSet: TDataSet);
    procedure BtDeleteClick(Sender: TObject);
    procedure GridTbCheckEnter(Sender: TObject);
    procedure GridTbCheck2Enter(Sender: TObject);
    procedure TbCheck2AfterDelete(DataSet: TDataSet);
    procedure BtRecheckClick(Sender: TObject);
    procedure TbCheck2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure EtQueryChange(Sender: TObject);
    procedure BtQueryClick(Sender: TObject);
    procedure BtStartClick(Sender: TObject);
    procedure BtSingleClick(Sender: TObject);
    procedure Bt3in1Click(Sender: TObject);
    procedure BtScreenClick(Sender: TObject);
    procedure BtOverviewClick(Sender: TObject);
    procedure GridTbCheck2DBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure BtPrintClick(Sender: TObject);
    procedure BttridimensionClick(Sender: TObject);
    procedure BtDiagnosisClick(Sender: TObject);
    procedure TbCheck2AfterPost(DataSet: TDataSet);
    procedure BtAllClick(Sender: TObject);
    procedure BtLast10Click(Sender: TObject);
    procedure BtSave2Click(Sender: TObject);
    procedure BtEdit2Click(Sender: TObject);
    procedure BtMoveClick(Sender: TObject);
    procedure BtMove2Click(Sender: TObject);
    procedure BtGpaClick(Sender: TObject);
    procedure BtGpaBaselineClick(Sender: TObject);
    procedure BtGpaFollowClick(Sender: TObject);
    procedure BtGpaSingleClick(Sender: TObject);
    procedure switcPageClick(Sender: TObject);
  private
    { Private declarations }
    TbSelected:integer;
    bShow:boolean;
    MainActivePageIndex:integer;
    checkdata:TCheckData;
    checkreport:TCheckReport;
    checkresult:TCheckResult;
    QueryText:string;
  public
    { Public declarations }
    procedure PrepareReport(filter:string);
  end;

  var
  showWaitRoom:boolean;

implementation

uses edit, main, tridimension, diagnosis, Gpa;

{$R *.dfm}

procedure TFHome.TimerTimer(Sender: TObject);
var
  i:integer;
begin
  if not bShow then begin
    bShow:=true;
    if FileExists(ExeFilePath+'empty.jpg') then ImageEmpty.Picture.LoadFromFile(ExeFilePath+'empty.jpg');
    MainActivePageIndex:=-1;
    PrepareReport('ID='+IntToStr(IdOfLastChecked));
  end;
  if MainActivePageIndex<>FMain.PcMain.ActivePageIndex then begin
    MainActivePageIndex:=FMain.PcMain.ActivePageIndex;
    if MainActivePageIndex=0 then begin
      BtLast10Click(Sender);
      TbCheck2.Refresh;
      TbCheck2.First;
    end
    else begin
      TbSelected:=0;
    end;
  end;

  BtNew.Enabled:=TbCheckInsert.Enabled;
  BtEdit.Enabled:=TbCheckDelete.Enabled and (TbSelected=1);
  BtDelete.Enabled:=(TbCheckDelete.Enabled and (TbSelected=1));
  BtEdit2.Enabled:=TbCheck2Delete.Enabled and (TbSelected=2);
  BtDelete2.Enabled:=(TbCheck2Delete.Enabled and (TbSelected=2));
  BtRecheck.Enabled:=TbCheck2Delete.Enabled and (TbSelected=2) and (DemoCheckData.runstate=0);
  BtStart.Enabled:=BtEdit.Enabled and (DemoCheckData.runstate=0);
  BtDiagnosis.Enabled:=BtRecheck.Enabled;

end;

procedure TFHome.BtNewClick(Sender: TObject);
begin
  FEdit:=TFEdit.Create(Self);
  FEdit.TbCheck.Insert;
  FEdit.TbCheckMain:=TbCheck;
  FEdit.ShowModal;
  FEdit.Free;
  //TbCheck.Last;
  //TbCheck.Refresh;
  if pubentertest then
  begin
    TbCheck.Filter:='ID='+pubcurid;
    //TbCheck.Locate('ID',pubcurid,[]);
    TbCheck.Refresh;
    BtStartClick(BtStart);
  end
  else
  begin
    //FMain.ImageHomeClick(nil);
    FMain.PcMain.ActivePageIndex:=4;
    FMain.LabelPatient.Visible:=false;
    FMain.LabelXtmc.Visible:=true;
    FMain.PanelBottomMain.Visible:=true;
    FMain.PanelBottomQuery.Visible:=false;
    FMain.PanelBottomProgram.Visible:=false;
    FMain.PanelBottomRunpic.Visible:=false;
  end;
end;

procedure TFHome.BtEditClick(Sender: TObject);
begin
  FEdit:=TFEdit.Create(Self);
  FEdit.TbCheckMain:=TbCheck;
  FEdit.BtNext.Enabled:=False;
  //FEdit.TbCheck.Filter:='ID='+TbCheck.FieldByName('ID').AsString;
  FEdit.TbCheck.Filter:='ID='+pubcurid;
  //TbCheck.Last;
  //TbCheck.Refresh;
  FEdit.TbCheck.Edit;
  FEdit.ShowModal;
  FEdit.Free;
  
  if pubentertest then
  begin
    TbCheck.Filter:='ID='+pubcurid;
    //TbCheck.Locate('ID',pubcurid,[]);
    TbCheck.Refresh;
    BtStartClick(BtStart);
  end
  else
  begin
    //FMain.ImageHomeClick(nil);
    FMain.PcMain.ActivePageIndex:=4;
    FMain.LabelPatient.Visible:=false;
    FMain.LabelXtmc.Visible:=true;
    FMain.PanelBottomMain.Visible:=true;
    FMain.PanelBottomQuery.Visible:=false;
    FMain.PanelBottomProgram.Visible:=false;
    FMain.PanelBottomRunpic.Visible:=false;
  end;  
end;

procedure TFHome.TbCheckAfterDelete(DataSet: TDataSet);
begin
  TbCheck.FlushBuffers;
end;

procedure TFHome.TbCheck2AfterDelete(DataSet: TDataSet);
begin
  TbCheck2.FlushBuffers;
end;

procedure TFHome.BtDeleteClick(Sender: TObject);
begin
  if Xwxx('Delect')<>IDYES then exit;
  if TbSelected=1 then TbCheck.Delete else TbCheck2.Delete;
end;

procedure TFHome.GridTbCheckEnter(Sender: TObject);
begin
  TbSelected:=1;
  DsSelect.DataSet:=TbCheck;
end;

procedure TFHome.GridTbCheck2Enter(Sender: TObject);
begin
  TbSelected:=2;
  DsSelect.DataSet:=TbCheck2;
end;

procedure TFHome.BtRecheckClick(Sender: TObject);
begin
  if Xwxx('ReCheck')<>IDYES then exit;
  CopyCheckRecord(TbCheck2.FieldByName('ID').AsString, 0, false);

  //TbCheck.Active:=false;
  //TbCheck.Active:=True;
  TbCheck.Refresh;
  //TbCheck.Last;

  TbCheck.Filter:='ID='+inttostr(MaxIDofCheck);  //这个地方找到最近期的病人
  TbCheck.Refresh;
  BtStartClick(BtStart);

         {
  //2019.11.4改
  if TbCheck.Locate('ID',MaxIDofCheck,[]) then
  begin
    BtStartClick(Sender);
  end;
  }
end;

procedure TFHome.TbCheck2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  s,sv,v:string;
  i:integer;
  ts:TStrings;
  b:boolean;
begin
  s:=UpperCase(QueryText);
  if s='' then exit;

  sv:='';
  for i:=1 to DataSet.Fields.Count-1-2 do begin
    v:=DataSet.Fields[i].AsString;
    sv:=sv+v+'*';
  end;
  sv:=UpperCase(sv);

  ts:=TStringList.Create;

  while true do begin
    s:=Trim(s);
    if s='' then break;
    ts.Add(CopySubStr(s, ' '));
  end;

  b:=true;
  for i:=0 to ts.Count-1 do begin
    if Pos(ts.Strings[i], sv)=0 then b:=false;
  end;

  Accept:=b;
  ts.Free;
end;

procedure TFHome.EtQueryChange(Sender: TObject);
begin
  if EtQuery.Text='' then begin
    QueryText:=EtQuery.Text;
    TbCheck2.Refresh;
    TbCheck2.First;
  end;
end;

procedure TFHome.BtQueryClick(Sender: TObject);
begin
  QueryText:=EtQuery.Text;
  TbCheck2.Refresh;
  TbCheck2.First;
end;

procedure TFHome.BtStartClick(Sender: TObject);
var
  checkdata:TCheckData;
  s,pt:string;
  age:integer;
  eye:integer;
  prtmpform:Tform;
begin
  TLogFile.GetInstance.Trace(LogLevel,'TFHome','BtStartClick called');
//  application.OnMessage := nil;
  //prtmpform:=mymessagebox('','正在初始化硬件,请稍侯...');
  prtmpform:=mymessagebox('','Please waiting......');
  Panel1.Enabled := false;
  //FMain.LabelPatient.Visible:=true;

  repeat
    begin
      Application.ProcessMessages;
    end;
  until (not pubMotoBuzy);

  FMain.ResetMotor0; //复位

  pubblindon := true;
  pubtestover := false;
  //////

//  s:=GetPtData(0, checkdata, pt);   //取出的右眼坐标1 左眼？
  s:=GetPtData(XwData.CurPtId, checkdata, pt);   //根据CurPtId 取出checkdata,pt,checkdata是由pt.db取出
  OldPId := XwData.CurPtId;
  changeparm := false;

  age:=TbCheck.FieldByName('Age').AsInteger;
  eye:=GetEyeValue(TbCheck.FieldByName('Eye').AsString);
  PrepareCheckData(age, eye, false, checkdata);   //取正常值改变CHECKDATA中的PT 和 SV
  {
  //在此确定有无自动眼位
  if pubEyeMoveYN then
    XwData.EyeMove := true
  else
    XwData.EyeMove := false;
   }
  FMain.TabControl.Enabled := true;

  DemoCheckData:=checkdata;               //初始化DemoCheckData
//  if not WriteXwCheckData then ;
//
//  if ((DemoCheckData.pm.Fovea=1) and (DemoCheckData.pm.Strategy<30)) then
//    FMain.LightOther(1,0) // 大菱形固视
//  else
//    FMain.LightOther(DemoCheckData.pm.Fixation_Mode,0);  //一般情况

  //走颜色及光斑大小
  //sleep(3000);
  if (SaveDataHead.DEVTYPE = $0088) then  //投射
  begin
    repeat
      begin
        Application.ProcessMessages;
      end;
    until (not pubMotoBuzy);
  end;

  FMain.LightColorGb; //走光斑和颜色
//    Stimulus_Color:integer;                              //刺激颜色
//    Stimulus_Size:integer;                               //光标尺寸

//  application.OnMessage := FMain.OnAppMessage;

  prtmpform.free;
  Panel1.Enabled := true;

  ClearCheckState1;

  FMain.SetTestStyle;  //改变界面

  TbCheck.Edit;
  TbCheck.FieldByName('Program').AsString:=s;
  TbCheck.FieldByName('Pt').AsString:=pt;
  TbCheck.FieldByName('Strategy').AsString:=Tr('Strategy'+IntToStr(checkdata.pm.Strategy));
  TbCheck.FieldByName('State').AsInteger:=1;
  TbCheck.Post;
  TbCheck.FlushBuffers;
  FMain.PcMain.ActivePageIndex:=1;
  FMain.TabControl.TabIndex:=1;
  FMain.FRunpic1.isEyeMove:=True;
  xwDownload:=true;
end;

const
  MoveDb1:array[0..11] of string=('A', 'A''', 'B', 'B''', 'C', 'C''', 'D', 'D''', 'E', 'E''', 'X', 'XX');

procedure TFHome.PrepareReport(filter:string); //打印报告
var
  s:string;
  i,j,xy,vi:integer;
  rect:TRect;
  strategy:integer;
  xby:string;
  dev:boolean;
  db0,db1,db:integer;
  x0,y0,jd0,wd0:double;
  x1,y1,jd1,wd1:double;
  movea:string;
  dotValueMagnification:double;
//  arrV:array[1..76] of Shortint ;

  //测试数据
//  const arrByte: Array[1..76] of Shortint =
//  (
//            26, 26, 23, 27,
//        29, 31, 30, 29, 28, 27,
//    27, 28, 28, 30, 30, 28, 27, 30,
//30, 29, 28, 28, 29, 29, 29, 26, 31, 30,
//25, 28, 29, 19, 17, 30, 0,  23, 30, 31,
//27, 29, 31, 33, 33, 33, 30, 0,  30, 30,
//25, 34, 32, 33, 32, 32, 28, 29, 31, 28,
//    31, 32, 32, 31, 32, 32, 31, 29,
//        28, 34, 30, 30, 31, 32,
//            31, 29, 30, 31
//  );


begin

  RvProject.ProjectFile:=ExeFilePath+'rp.rav';

  TbCheck3.Filter:=filter;
  TbCheckResult.Active:=False;
  TbCheckResult.Active:=True;
  TbCheckResult.Filter:='ID>0';
  TbCheckMove.Active:=False;
  TbCheckMove.Active:=True;

  TbCheck3.First;
  strategy:=0;
  dotValueMagnification:=TMyIniFiles.GetIniFile.ReadFloat('report','dotValue magnification',1);
  for i:=1 to 20 do begin
    if TbCheck3.Eof then exit;
    s:=TbCheck3.FieldByName('checkdata').AsString;
    MoveCheckData(s, checkdata);

//测试数据覆盖
//    Move(arrByte, arrV, SizeOf(arrByte));
//        眼别  0 L,1 R
//    checkdata.pm.Eye:=1;
//    checkdata.pm.Age:=62;
//    reverseArr(@arrV,1,4);
//    reverseArr(@arrV,1,4);reverseArr(@arrV,5,10);reverseArr(@arrV,11,18);
//    reverseArr(@arrV,19,28);reverseArr(@arrV,29,38);reverseArr(@arrV,39,48);reverseArr(@arrV,49,58);
//    reverseArr(@arrV,59,66);reverseArr(@arrV,67,72);reverseArr(@arrV,73,76);
//    for vi:=1 to checkdata.pm.Dot_Number do begin
//      checkdata.v[vi]:=arrV[vi];
//    end;

    for vi:=1 to checkdata.pm.Dot_Number do begin       //数据放大
      checkdata.v[vi]:= Trunc(checkdata.v[vi]* dotValueMagnification);
    end;

    if XwData.YkFilter then checkdata:=YkFilter(checkdata);
    if i=1 then strategy:=checkdata.pm.Strategy
    else begin
      if (checkdata.pm.Strategy div 10)<>(strategy div 10) then begin
        TbCheck3.Next;
        Continue;
      end;
    end;

    GetCheckResult(checkdata, checkresult);
    GetCheckReport2(checkdata, checkresult, tbcheck3, checkreport);
    xby:=PtParamOfName(TbCheck3.FieldByName('Pt').AsString, 'Xby');
    xy:=100;
    if xby<>'' then xy:=StrToInt(xby);
    if PtParamOfName(TbCheck3.FieldByName('Pt').AsString, 'Gray')='0' then begin
      checkresult.GrayXCount:=0;
      checkresult.GrayYCount:=0;
      Bttridimension.Enabled:=False;
    end
    else begin
      Bttridimension.Enabled:=True;
    end;
    BtGpa.Enabled:=Bttridimension.Enabled;
    if checkdata.pm.Range=5 then GetGray(Checkdata, Checkresult, 5, false);

    dev:=PtParamOfName(TbCheck3.FieldByName('Pt').AsString, 'Dev')<>'0';
    DrawValue2(ImageField.Canvas, 0, 0, ImageField.Width, ImageField.Height, checkData, checkResult, 0, xy, true);
    DrawValue2(ImageField2.Canvas, 0, 0, ImageField2.Width, ImageField2.Height, checkData, checkResult, 0, xy, true);
    DrawValue2(ImageFieldNasal.Canvas, 0, 0, ImageFieldNasal.Width, ImageFieldNasal.Height, checkData, checkResult, 0, xy, true);

    if ((checkdata.pm.Stimulus_Color=0) and (checkdata.pm.Stimulus_Size=2)) or
       ((checkdata.pm.Stimulus_Color=2) and (checkdata.pm.Stimulus_Size=4)) then begin
      DrawValue2(ImageDev.Canvas, 0, 0, ImageDev.Width, ImageDev.Height, checkData, checkResult, 1, xy, dev);
      DrawValue2(ImageDev2.Canvas, 0, 0, ImageDev2.Width, ImageDev2.Height, checkData, checkResult, 1, xy, dev);
      DrawValue2(ImageDevPE.Canvas, 0, 0, ImageDevPE.Width, ImageDevPE.Height, checkData, checkResult, 2, xy, dev);
      DrawValue2(ImageDevPE2.Canvas, 0, 0, ImageDevPE2.Width, ImageDevPE2.Height, checkData, checkResult, 2, xy, dev);
      DrawValue2(ImageMDev.Canvas, 0, 0, ImageMDev.Width, ImageMDev.Height, checkData, checkResult, 3, xy, dev);
      DrawValue2(ImageMDev2.Canvas, 0, 0, ImageMDev2.Width, ImageMDev2.Height, checkData, checkResult, 3, xy, dev);
      DrawValue2(ImageMDevPE.Canvas, 0, 0, ImageMDevPE.Width, ImageMDevPE.Height, checkData, checkResult, 4, xy, dev);
      DrawValue2(ImageMDevPE2.Canvas, 0, 0, ImageMDevPE2.Width, ImageMDevPE2.Height, checkData, checkResult, 4, xy, dev);
    end
    else begin
      DrawValue2(ImageDev.Canvas, 0, 0, ImageDev.Width, ImageDev.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageDev2.Canvas, 0, 0, ImageDev2.Width, ImageDev2.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageDevPE.Canvas, 0, 0, ImageDevPE.Width, ImageDevPE.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageDevPE2.Canvas, 0, 0, ImageDevPE2.Width, ImageDevPE2.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageMDev.Canvas, 0, 0, ImageMDev.Width, ImageMDev.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageMDev2.Canvas, 0, 0, ImageMDev2.Width, ImageMDev2.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageMDevPE.Canvas, 0, 0, ImageMDevPE.Width, ImageMDevPE.Height, checkData, checkResult, -2, xy, dev);
      DrawValue2(ImageMDevPE2.Canvas, 0, 0, ImageMDevPE2.Width, ImageMDevPE2.Height, checkData, checkResult, -2, xy, dev);
    end;

//    DrawValue2(ImageScreen.Canvas, 0, 0, ImageScreen.Width, ImageScreen.Height, checkData, checkResult, 5, xy, true);
    DrawValue4(ImageScreen.Canvas, 0, 0, ImageScreen.Width, ImageScreen.Height, checkData, checkResult, 5, xy, true);
    DrawValue2(ImageDepth.Canvas, 0, 0, ImageDepth.Width, ImageDepth.Height, checkData, checkResult, 6, xy, true);
    DrawValue2(ImageDepthNasal.Canvas, 0, 0, ImageDepthNasal.Width, ImageDepthNasal.Height, checkData, checkResult, 6, xy, true);
    DrawAxis(ImageMove.canvas, 0, 0, ImageMove.Width, ImageMove.Height, checkdata);
    DrawValue(ImageMove.Canvas, 0, 0, ImageMove.Width, ImageMove.Height, checkData, true);
    DrawValue2(ImageGpaDev.Canvas, 0, 0, ImageGpaDev.Width, ImageGpaDev.Height, checkData, checkResult, 7, xy, true);
    DrawValue2(ImageGpaDevPE.Canvas, 0, 0, ImageGpaDevPE.Width, ImageGpaDevPE.Height, checkData, checkResult, 8, xy, true);
    if i=GpaSingle then ImageGpaDevPESingle.Picture.Assign(ImageGpaDevPE.Picture);
    DrawEyeMove(ImageEyeMove.Canvas, 0, 0, ImageEyeMove.Width, ImageEyeMove.Height, checkData);

    rect.Left:=0;
    rect.Top:=0;
    rect.Right:=ImageGray.Width;
    rect.Bottom:=ImageGray.Height;
    ImageGray.Canvas.FillRect(rect);
    if (checkResult.GrayXCount>0) and (checkResult.GrayYCount>0) then DrawGray(ImageGray.Canvas, ImageGray.Width div 2, ImageGray.Height div 2, checkData, checkResult);

    rect.Left:=0;
    rect.Top:=0;
    rect.Right:=ImageGray2.Width;
    rect.Bottom:=ImageGray2.Height;
    ImageGray2.Canvas.FillRect(rect);
    if (checkResult.GrayXCount>0) and (checkResult.GrayYCount>0) then DrawGray2(ImageGray2.Canvas, ImageGray2.Width div 2, ImageGray2.Height div 2, checkData, checkResult);

    if FileExists(ExeFilePath+'babie.bmp') then FXwxh.ImageBabie.Picture.LoadFromFile(ExeFilePath+'babie.bmp');
    DrawBabie(ImageBabie.Canvas, 0, 0, ImageBabie.Width, ImageBabie.Height, checkData, checkResult);

    TbCheckResult.Insert;
    TbCheckResult.FieldByName('Id').AsString:=TbCheck3.FieldByName('Id').AsString;
    TbCheckResult.FieldByName('Doctor').AsString:=Tr('Doctor')+':'+TbCheck3.FieldByName('Doctor').AsString;
    TbCheckResult.FieldByName('Version').AsString:=Tr('AboutLine1');
    TbCheckResult.FieldByName('Diagnosis').AsString:=Tr('Diagnosis')+':'+TbCheck3.FieldByName('Describe').AsString;
    TbCheckResult.FieldByName('Hospital').AsString:=XwData.Hospital;
    TbCheckResult.FieldByName('Name').AsString:=Tr('Name')+':'+TbCheck3.FieldByName('Name').AsString;
    TbCheckResult.FieldByName('Number').AsString:=Tr('ID')+':'+TbCheck3.FieldByName('IDNo').AsString;
    TbCheckResult.FieldByName('Sex').AsString:=Tr('Sex')+':'+TbCheck3.FieldByName('Sex').AsString;
    ////将杯盘比改为视力放在这
    TbCheckResult.FieldByName('Res1').AsString:=Tr('CDR')+':'+
                                                Tr('OD')+' '+Format('%-4.4s', [TbCheck3.FieldByName('CDR1').AsString])+
                                                Tr('OS')+' '+Format('%-4.4s', [TbCheck3.FieldByName('CDR0').AsString]);
    ////
    TbCheckResult.FieldByName('Pt').AsString:=Tr('Program')+':'+TbCheck3.FieldByName('Program').AsString;
    TbCheckResult.FieldByName('Eye').AsString:=Tr('Eye')+':'+checkreport.Eye;
    TbCheckResult.FieldByName('Dot_Number').AsInteger:=checkdata.pm.Dot_Number;
    TbCheckResult.FieldByName('Fixation_Monitor').AsString:=Tr('Fixation Monitor')+':'+checkreport.Fixation_Monitor;
    TbCheckResult.FieldByName('Fixation_Target').AsString:=Tr('Fixation Target')+':'+checkreport.Fixation_Target;
    TbCheckResult.FieldByName('Fixation_Loss').AsString:=Tr('Fixation Losses')+':'+checkreport.Fixation_Losses;
    TbCheckResult.FieldByName('False_POS').AsString:=Tr('False POS Errors')+':'+checkreport.False_POS_Errors;
    TbCheckResult.FieldByName('False_NEG').AsString:=Tr('False NEG Errors')+':'+checkreport.False_NEG_Errors;
    TbCheckResult.FieldByName('Test_Duration').AsString:=Tr('Test_Duration')+':'+checkreport.Test_Duration;

    TbCheckResult.FieldByName('Fovea').AsString:=Tr('Fovea')+':'+checkreport.FoveaDB;
    TbCheckResult.FieldByName('FoveaDB').AsString:=Tr('Central Reference')+':'+checkreport.FoveaDB;
    TbCheckResult.FieldByName('FoveaAndDB').AsString:=TbCheckResult.FieldByName('Fovea').AsString;

    if checkdata.pm.Fovea=1 then TbCheckResult.FieldByName('FoveaAndDB').AsString:=TbCheckResult.FieldByName('FoveaDB').AsString;

    TbCheckResult.FieldByName('VFI').AsString:=Tr('VFI')+':'+inttostr(round(checkresult.VFI*100))+'%'; // checkreport.VFI;

    TbCheckResult.FieldByName('Stimulus').AsString:=Tr('Stimulus')+':'+checkreport.Stimulus;
    TbCheckResult.FieldByName('Background').AsString:=Tr('Background')+':'+checkreport.Background;
    TbCheckResult.FieldByName('Strategy').AsString:=Tr('Strategy')+':'+checkreport.Strategy;
    TbCheckResult.FieldByName('Pupil').AsString:=Tr('Pupil Diameter')+':'+checkreport.Pupil_Diameter;
    TbCheckResult.FieldByName('Visual').AsString:=Tr('Visual Acuity')+':'+checkreport.Visual_Acuity;
    if checkdata.pm.Eye=0 then begin
      TbCheckResult.FieldByName('Rx').AsString:=Tr('Rx')+':'+Format('%-4.4s', [TbCheck3.FieldByName('Rx1_0').AsString])+
                                                Tr('DS')+' '+Format('%-4.4s', [TbCheck3.FieldByName('Rx2_0').AsString])+
                                                Tr('DC')+' X'+Format('%-4.4s', [TbCheck3.FieldByName('Rx3_0').AsString]);
    end
    else begin
      TbCheckResult.FieldByName('Rx').AsString:=Tr('Rx')+':'+Format('%-4.4s', [TbCheck3.FieldByName('Rx1_1').AsString])+
                                                Tr('DS')+' '+Format('%-4.4s', [TbCheck3.FieldByName('Rx2_1').AsString])+
                                                Tr('DC')+' X'+Format('%-4.4s', [TbCheck3.FieldByName('Rx3_1').AsString]);
    end;
    TbCheckResult.FieldByName('DOB').AsString:=Tr('DOB')+':'+TbCheck3.FieldByName('Birthday').AsString;
    TbCheckResult.FieldByName('Date').AsString:=Tr('Date')+':'+TbCheck3.FieldByName('Date').AsString;
    TbCheckResult.FieldByName('Time').AsString:=Tr('Time')+':'+TbCheck3.FieldByName('Time').AsString;
    TbCheckResult.FieldByName('Age').AsString:=Tr('Age')+':'+checkreport.Age;
    TbCheckResult.FieldByName('GHT').AsString:=Tr('GHT')+':'+checkreport.GHT;
    if PtParamOfName(TbCheck3.FieldByName('Pt').AsString, 'GHT')='0' then TbCheckResult.FieldByName('GHT').AsString:='';
    TbCheckResult.FieldByName('MD').AsString:=Tr('MD')+':'+checkreport.MD;
    TbCheckResult.FieldByName('PSD').AsString:=Tr('PSD')+':'+checkreport.PSD;
    TbCheckResult.FieldByName('Range').AsString:='('+IntToStr(checkdata.pm.Range)+')';
    TbCheckResult.FieldByName('Seen').AsString:=Tr('Seen')+':'+checkreport.seen;
    TbCheckResult.FieldByName('NotSeen').AsString:=Tr('Not Seen')+':'+checkreport.notseen;
    db:=checkdata.pm.Dynamic_Value;
    DBtoDB2(db, db0, db1);
    movea:=Tr('StimulusSize'+IntToStr(checkdata.pm.Stimulus_Size))+' '+
           IntToStr(db0+1)+' '+
           MoveDb1[db1];

    TbCheckResult.FieldByName('MoveA').AsString:='A:'+movea+Tr('MoveSpeed'+IntToStr(checkdata.pm.MoveSpeed))+'"/sec.'+Tr('StimulusColor'+IntToStr(checkdata.pm.Stimulus_Color));

    TbCheckResult.FieldByName('DevTitle').AsString:=Tr('Total Deviation');
    TbCheckResult.FieldByName('MDevTitle').AsString:=Tr('Pattern Deviation');
    TbCheckResult.FieldByName('DepthTitle').AsString:=Tr('Defect Depth')+'(dB)';
    TbCheckResult.FieldByName('DepthExample').AsString:='='+Tr('Within 4 dB of Expected');
    TbCheckResult.FieldByName('ThresholdTitle').AsString:=Tr('Threshold')+'(dB)';
    if (checkResult.GrayXCount>0) and (checkResult.GrayYCount>0) then TbCheckResult.FieldByName('GrayTitle').AsString:=Tr('Threshold Graytone');
    TbCheckResult.FieldByName('BlindSpotTitle').AsString:=Tr('Blind Spot');
    TbCheckResult.FieldByName('BabieTitle').AsString:=Tr('Bebie Curve');
    TbCheckResult.FieldByName('GpaDevTitle').AsString:=Tr('Deviation From Baseline');
    TbCheckResult.FieldByName('GpaDevPETitle').AsString:=Tr('Progression Analysis');

    TbCheckResult.FieldByName('Field').Assign(ImageField.Picture.Bitmap);
    TbCheckResult.FieldByName('Field2').Assign(ImageField2.Picture.Bitmap);
    TbCheckResult.FieldByName('FieldNasal').Assign(ImageFieldNasal.Picture.Bitmap);
    TbCheckResult.FieldByName('Gray').Assign(ImageGray.Picture.Graphic);
    TbCheckResult.FieldByName('Gray2').Assign(ImageGray2.Picture.Graphic);
    TbCheckResult.FieldByName('Dev').Assign(ImageDev.Picture.Graphic);
    TbCheckResult.FieldByName('Dev2').Assign(ImageDev2.Picture.Graphic);
    TbCheckResult.FieldByName('MDev').Assign(ImageMDev.Picture.Graphic);
    TbCheckResult.FieldByName('MDev2').Assign(ImageMDev2.Picture.Graphic);
    TbCheckResult.FieldByName('DevPE').Assign(ImageDevPE.Picture.Graphic);
    TbCheckResult.FieldByName('DevPE2').Assign(ImageDevPE2.Picture.Graphic);
    TbCheckResult.FieldByName('MDevPE').Assign(ImageMDevPE.Picture.Graphic);
    TbCheckResult.FieldByName('MDevPE2').Assign(ImageMDevPE2.Picture.Graphic);
    TbCheckResult.FieldByName('Babie').Assign(ImageBabie.Picture.Graphic);
    TbCheckResult.FieldByName('Depth').Assign(ImageDepth.Picture.Graphic);
    TbCheckResult.FieldByName('DepthNasal').Assign(ImageDepthNasal.Picture.Graphic);
    TbCheckResult.FieldByName('Move').Assign(ImageMove.Picture.Graphic);
    TbCheckResult.FieldByName('Screen').Assign(ImageScreen.Picture.Graphic);
    TbCheckResult.FieldByName('GpaMDLine').Assign(ImageGpaMDLine.Picture.Graphic);
    TbCheckResult.FieldByName('GpaDev').Assign(ImageGpaDev.Picture.Graphic);
    TbCheckResult.FieldByName('GpaDevPE').Assign(ImageGpaDevPE.Picture.Graphic);
    TbCheckResult.FieldByName('GpaDevPESingle').Assign(ImageGpaDevPESingle.Picture.Graphic);
    TbCheckResult.FieldByName('EyeMove').Assign(ImageEyeMove.Picture.Graphic);

    TbCheckResult.FieldByName('MoveA1').AsString:=Tr('MoveA1');
    TbCheckResult.FieldByName('MoveA2').AsString:=Tr('MoveA2');
    TbCheckResult.FieldByName('MoveA3').AsString:=Tr('MoveA3');
    TbCheckResult.FieldByName('MoveA4').AsString:=Tr('MoveA4');
    TbCheckResult.FieldByName('MoveA5').AsString:=Tr('MoveA5');
    TbCheckResult.FieldByName('MoveA6').AsString:=Tr('MoveA6');
    TbCheckResult.FieldByName('MoveA7').AsString:=Tr('MoveA7');
    TbCheckResult.FieldByName('MoveA8').AsString:=Tr('MoveA8');

    TbCheckResult.FieldByName('GpaRate').AsString:=GpaRate;
    TbCheckResult.FieldByName('GpaSlope').AsString:=GpaSlope;
    TbCheckResult.FieldByName('GpaMD').AsString:=GpaMD;
    TbCheckResult.FieldByName('GpaPT').AsString:=GpaPT;
    TbCheckResult.FieldByName('GpaProgression').AsString:=GpaProgression;
    TbCheckResult.FieldByName('GpaBaseline').AsString:=Tr('Baseline Exams:');
    TbCheckResult.FieldByName('GpaBaselineDate').AsString:=GpaBaselineDate;
    TbCheckResult.FieldByName('GpaFollow').AsString:=Tr('Previous Follow-up Exams:');
    TbCheckResult.FieldByName('GpaFollowDate').AsString:=GpaFollowDate;
    TbCheckResult.FieldByName('GpaPE0').AsString:='P<5% '+tr('Deferioration');
    TbCheckResult.FieldByName('GpaPE1').AsString:='P<5% (2'+tr('consecutive')+')';
    TbCheckResult.FieldByName('GpaPE2').AsString:='P<5% (3+'+tr('consecutive')+')';
    TbCheckResult.FieldByName('GpaPE3').AsString:=tr('Out of Range');
    TbCheckResult.FieldByName('MPEL1').AsString:=tr('Pattern Deviation not');
    TbCheckResult.FieldByName('MPEL2').AsString:=tr('Shown for serverely');
    TbCheckResult.FieldByName('MPEL3').AsString:=tr('Depressed fields. Refer');
    TbCheckResult.FieldByName('MPEL4').AsString:=tr('to Total Deviation');

    TbCheckResult.Post;

    for j:=1 to 36 do
    begin
      TbCheckMove.Insert;
      TbCheckMove.FieldByName('ID').AsString:=TbCheckResult.FieldByName('Id').AsString;
      TbCheckMove.FieldByName('No').AsInteger:=j;
      if j<=checkdata.pm.Dot_Number then
      begin
        TbCheckMove.FieldByName('A1').AsString:='A';
        x0:=checkdata.pt[j].x;
        y0:=checkdata.pt[j].y;
        x1:=checkdata.v[j];
        y1:=checkdata.sfv[j];

        TbCheckMove.FieldByName('A7').AsString:=Tr('SEEN');

        if checkdata.pm.Strategy=30 then
        begin
          if (x1=0) and (y1=0) then
          begin
            TbCheckMove.FieldByName('A7').AsString:=Tr('NOSEEN');
          end;
        end
        else
        begin
          //if (x1=-99) and (y1=-99) then
          if (x1=x0) and (y1=y0) then
          begin
            TbCheckMove.FieldByName('A7').AsString:=Tr('NOSEEN');
          end;
        end;

        if checkdata.pm.Strategy=30 then
        begin
        end
        else if checkdata.pm.Strategy=31 then
        begin
          if (x1=-99) and (y1=-99) then
          begin
            x1:=x0;
            y1:=y0;
          end;
          x0:=14;
          y0:=-1;
          if checkdata.pm.Eye=0 then x0:=-14;
        end
        else if checkdata.pm.Strategy=32 then
        begin
          x0:=checkdata.pm.MoveX0;
          y0:=checkdata.pm.MoveY0;
          if (x1=-99) and (y1=-99) then
          begin
            x1:=checkdata.pm.MoveX1;
            y1:=checkdata.pm.MoveY1;
          end;
        end;

        XytoJwd(x0,y0,jd0,wd0);
        XytoJwd(x1,y1,jd1,wd1);

        TbCheckMove.FieldByName('A2').AsInteger:=Round(wd0);
        TbCheckMove.FieldByName('A3').AsInteger:=Round(jd0);
        TbCheckMove.FieldByName('A4').AsInteger:=Round(wd1);
        TbCheckMove.FieldByName('A5').AsInteger:=Round(jd1);
        TbCheckMove.FieldByName('A6').AsString:=movea;
        TbCheckMove.FieldByName('A8').AsString:=Tr('STANDARD');
      end;
      TbCheckMove.Post;
    end;

    EtResult.Caption:=TbCheckResult.FieldByName('GHT').AsString+'    '+
                      TbCheckResult.FieldByName('MD').AsString+'    '+
                      TbCheckResult.FieldByName('PSD').AsString;
    TbCheck3.Next;

//    if (checkdata.pm.Strategy>=30) then begin
//      Pages.ActivePageIndex:=2;
//    end
//    else if (checkdata.pm.Strategy=10) or (checkdata.pm.Strategy=11) or (checkdata.pm.Strategy=12) then
//    begin
//      Pages.ActivePageIndex:=1;
//    end
//    else if (TbCheck3.FieldByName('Pt').AsString='Nasal-step') then
//    begin
//      Pages.ActivePageIndex:=6;
//    end
//    else begin
//      Pages.ActivePageIndex:=0;
//    end;
  end;
end;

procedure TFHome.BtPrintClick(Sender: TObject);
begin
  if (Pages.ActivePageIndex=0) or (Pages.ActivePageIndex=6) then
  begin
    if FMain.BtSingle.Visible then
      BtSingleClick(Sender)
    else
      Bt3in1Click(Sender);
  end
  else if Pages.ActivePageIndex=1 then
    BtScreenClick(Sender)
  else
    BtMoveClick(Sender);
end;

procedure TFHome.BtSingleClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Single Field Analysis');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpSingle', false);
  RvProject.Execute;
end;

procedure TFHome.Bt3in1Click(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Three in One');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  if TbCheck2.FieldByName('Pt').AsString='Nasal-step' then RvProject.SelectReport('Rp3in1Nasal', false) else RvProject.SelectReport('Rp3in1', false);
  RvProject.Execute;
end;

procedure TFHome.BtScreenClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Screen');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpScreen', false);
  RvProject.Execute;
end;

procedure TFHome.BtMoveClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do
  begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Move');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpMove', false);
  RvProject.Execute;
end;

procedure TFHome.BtMove2Click(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do
  begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Move2');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpMove2', false);
  RvProject.Execute;
end;

procedure TFHome.BtOverviewClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Overview');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpOverview', false);
  RvProject.Execute;
end;

procedure TFHome.BtGpaBaselineClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('GPA-Baseline');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  if RvProject.SelectReport('RpGpaBaseline', false) then RvProject.Execute;
end;

procedure TFHome.BtGpaFollowClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('GPA-Last Three Follow-up');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  if RvProject.SelectReport('RpGpaFollow', false) then RvProject.Execute;
end;

procedure TFHome.BtGpaSingleClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Single Field Analysis-GPA');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  if RvProject.SelectReport('RpGpaSingle', false) then RvProject.Execute;
end;

procedure TFHome.GridTbCheck2DBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
var
  i:integer;
  s,s2:string;
begin
  LBID.Items.Clear;                                                            //已经被隐藏的界面，在Threshold strategy的一个方框
  for i:=0 to GridTbCheck2DBTableView1.Controller.SelectedRowCount-1 do begin
    s:=GridTbCheck2DBTableView1.Controller.SelectedRecords[i].Values[0];
    s2:=GridTbCheck2DBTableView1.Controller.SelectedRecords[i].Values[1];
    if s<>s2 then LBID.Items.Add(s);
  end;

  s:='';
  for i:=0 to LBID.Count-1 do begin
    if s='' then s:='ID='+LBID.Items[i] else s:=s+' or ID='+LBID.Items[i];
  end;

  if s<>'' then PrepareReport(s);
end;

procedure TFHome.BttridimensionClick(Sender: TObject);
begin
  Ftridimension:=TFtridimension.Create(Self);
  GetGray(Checkdata, Checkresult, 41, true);
  Ftridimension.Checkdata:=checkdata;
  Ftridimension.Checkresult:=checkresult;
  Ftridimension.ShowModal;
  Ftridimension.Free;
end;

procedure TFHome.BtDiagnosisClick(Sender: TObject);
begin
  Panel2.Visible := true;
  FDiagnosis:=TFDiagnosis.Create(Self);
  FDiagnosis.Left:=Screen.Width-FDiagnosis.Width;
  FDiagnosis.Top:=Screen.Height-FDiagnosis.Height;
  FDiagnosis.EtDiagnosis.Text:=TbCheck2.FieldByName('Describe').AsString;
  if FDiagnosis.ShowModal=mrOk then
  begin
    TbCheck2.Edit;
    TbCheck2.FieldByName('Describe').AsString:=FDiagnosis.EtDiagnosis.Text;
    TbCheck2.Post;
    GridTbCheck2DBTableView1SelectionChanged(nil);
  end;
//  FDiagnosis.Show;
  FDiagnosis.Free;
  Panel2.Visible := false;
end;

procedure TFHome.TbCheck2AfterPost(DataSet: TDataSet);
begin
  TbCheck2.FlushBuffers;
end;

procedure TFHome.BtAllClick(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to GridTbCheckDBTableView1.ColumnCount-1 do GridTbCheckDBTableView1.Columns[i].SortOrder:=soNone;
  for i:=0 to GridTbCheck2DBTableView1.ColumnCount-1 do GridTbCheck2DBTableView1.Columns[i].SortOrder:=soNone;
  GridTbCheck2DBTableView1.Columns[0].SortOrder:=soDescending;
  TbCheck2.Filter:='(State=2) or (State=3)';
  TbCheck2.Last;  
end;

procedure TFHome.BtLast10Click(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to GridTbCheckDBTableView1.ColumnCount-1 do GridTbCheckDBTableView1.Columns[i].SortOrder:=soNone;
  for i:=0 to GridTbCheck2DBTableView1.ColumnCount-1 do GridTbCheck2DBTableView1.Columns[i].SortOrder:=soNone;
  i:=Last10IDofChecked;
  GridTbCheck2DBTableView1.Columns[0].SortOrder:=soDescending;
  TbCheck2.Filter:='((State=2) or (State=3)) and id>= '+IntToStr(i);
  TbCheck2.First;
end;

procedure TFHome.BtSave2Click(Sender: TObject);
begin
  TbCheck2.Post;
end;

procedure TFHome.BtEdit2Click(Sender: TObject);
begin
  FEdit:=TFEdit.Create(Self);
  FEdit.BtNext.Enabled:=False;
  FEdit.TbCheck.Filter:='ID='+TbCheck2.FieldByName('ID').AsString;
  FEdit.TbCheck.Edit;

//  FEdit.EtNumber.Enabled := false;
  FEdit.EtBirthDay.Enabled := false;
  FEdit.EtEye.Enabled := false;
//  FEdit.EtIDNo.Enabled := false;
  FEdit.EtDoctor.Enabled := false;
  FEdit.EtCDR0.Enabled := false;
  FEdit.EtCDR1.Enabled := false;

  FEdit.cxButton1.Visible := false;
  FEdit.BtSave.Visible := true;

  FEdit.ShowModal;
  FEdit.Free;
  TbCheck2.Refresh;
end;

procedure TFHome.BtGpaClick(Sender: TObject);
begin
  FGpa:=TFGpa.Create(Self);
  FGpa.TbCheck.Filter:=FilterOfGPA(TbCheck2);
  FGpa.TbCheck.Active:=True;
  FGpa.ShowModal;
  FGpa.Free;
  BtLast10Click(Self);
end;

procedure TFHome.switcPageClick(Sender: TObject);
begin
  Pages.ActivePageIndex:=  Pages.ActivePageIndex+1;
end;

end.



