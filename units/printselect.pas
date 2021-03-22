unit printselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, Wwtable, ComCtrls, ExtCtrls,
  RpCon, RpConDS, RpConBDE, RpBase, RpSystem, RpDefine, RpRave, Menus,
  cxLookAndFeelPainters, cxButtons, xwxh, cxControls, cxContainer, cxEdit,
  cxLabel;

type
  TFPrintSelect = class(TForm)
    Pages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet6: TTabSheet;
    ImageField: TImage;
    ImageScreen: TImage;
    ImageGray: TImage;
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    RvTableConnection: TRvTableConnection;
    TbCheckResult: TwwTable;
    TbCheck: TwwTable;
    ImageDepth: TImage;
    ImageDev: TImage;
    ImageDevPE: TImage;
    ImageMdev: TImage;
    ImageMdevPE: TImage;
    Panel1: TPanel;
    BtSingle: TcxButton;
    Bt3in1: TcxButton;
    BtScreen: TcxButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    ImageNormal: TImage;
    cxLabel6: TcxLabel;
    ImageEyeMove: TImage;
    cxLabel7: TcxLabel;
    BtOverview: TcxButton;
    ImageBabie: TImage;
    cxLabel1: TcxLabel;
    procedure BtSingleClick(Sender: TObject);
    procedure Bt3in1Click(Sender: TObject);
    procedure BtScreenClick(Sender: TObject);
    procedure BtOverviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    thresholdonly:boolean;
    checkdata:TCheckData;
    checkresult:TCheckResult;
    checkreport:TCheckReport;
  public
    { Public declarations }
    procedure PrepareReport(filter:string);
  end;

var
  FPrintSelect: TFPrintSelect;

implementation

uses runpic, Myutils;

{$R *.dfm}

procedure TFPrintSelect.PrepareReport(filter:string);
var
  s:string;
  i:integer;
  rect:TRect;
begin
  TbCheck.Filter:=filter;
  TbCheckResult.Filter:='ID>0';

  TbCheck.First;
  for i:=1 to 10 do begin
    if TbCheck.Eof then exit;
    s:=TbCheck.FieldByName('checkdata').AsString;
    if Length(s)>0 then Move(s[1], checkdata, sizeof(checkdata));
    if thresholdonly then begin
      if (checkdata.pm.Strategy=10) or (checkdata.pm.Strategy=11) then begin
        TbCheck.Next;
        Continue;
      end;
    end;

//    GetCheckResult(checkdata, true, checkresult);
    GetCheckReport2(checkdata, checkresult, tbcheck, checkreport);
    DrawValue2(ImageField.Canvas, 0, 0, ImageField.Width, ImageField.Height, checkData, checkResult, 0, 100);
    DrawValue2(ImageDev.Canvas, 0, 0, ImageDev.Width, ImageDev.Height, checkData, checkResult, 1, 100);
    DrawValue2(ImageDevPE.Canvas, 0, 0, ImageDevPE.Width, ImageDevPE.Height, checkData, checkResult, 2, 100);
    DrawValue2(ImageMDev.Canvas, 0, 0, ImageMDev.Width, ImageMDev.Height, checkData, checkResult, 3, 100);
    DrawValue2(ImageMDevPE.Canvas, 0, 0, ImageMDevPE.Width, ImageMDevPE.Height, checkData, checkResult, 4, 100);
    DrawValue2(ImageScreen.Canvas, 0, 0, ImageScreen.Width, ImageScreen.Height, checkData, checkResult, 5, 100);
    DrawValue2(ImageDepth.Canvas, 0, 0, ImageDepth.Width, ImageDepth.Height, checkData, checkResult, 6, 100);
    DrawValue2(ImageNormal.Canvas, 0, 0, ImageNormal.Width, ImageNormal.Height, checkData, checkResult, 9, 100);

    rect.Left:=0;
    rect.Top:=0;
    rect.Right:=ImageGray.Width;
    rect.Bottom:=ImageGray.Height;
    ImageGray.Canvas.FillRect(rect);
    DrawGray(ImageGray.Canvas, ImageGray.Width div 2, ImageGray.Height div 2, checkData, checkResult);
    if FileExists(ExeFilePath+'babie.bmp') then FXwxh.ImageBabie.Picture.LoadFromFile(ExeFilePath+'babie.bmp');
    DrawBabie(ImageBabie.Canvas, 0, 0, ImageBabie.Width, ImageBabie.Height, checkData, checkResult);

    TbCheckResult.Append;
    TbCheckResult.FieldByName('Id').AsString:=TbCheck.FieldByName('Id').AsString;
    TbCheckResult.FieldByName('Name').AsString:=Tr('Name')+':'+TbCheck.FieldByName('Name').AsString;
    TbCheckResult.FieldByName('Number').AsString:=Tr('ID')+':'+TbCheck.FieldByName('Number').AsString;
    TbCheckResult.FieldByName('Sex').AsString:=Tr('Sex')+':'+TbCheck.FieldByName('Sex').AsString;
    TbCheckResult.FieldByName('Pt').AsString:=TbCheck.FieldByName('Program').AsString;
    TbCheckResult.FieldByName('Eye').AsString:=Tr('Eye')+':'+checkreport.Eye;
    TbCheckResult.FieldByName('Dot_Number').AsInteger:=checkdata.pm.Dot_Number;
    TbCheckResult.FieldByName('Fixation_Monitor').AsString:=Tr('Fixation Monitor')+':'+checkreport.Fixation_Monitor;
    TbCheckResult.FieldByName('Fixation_Target').AsString:=Tr('Fixation Target')+':'+checkreport.Fixation_Target;
    TbCheckResult.FieldByName('Fixation_Loss').AsString:=Tr('Fixation Losses')+':'+checkreport.Fixation_Losses;
    TbCheckResult.FieldByName('False_POS').AsString:=Tr('False POS Errors')+':'+checkreport.False_POS_Errors;
    TbCheckResult.FieldByName('False_NEG').AsString:=Tr('False NEG Errors')+':'+checkreport.False_NEG_Errors;
    TbCheckResult.FieldByName('Test_Duration').AsString:=Tr('Test_Duration')+':'+checkreport.Test_Duration;
    TbCheckResult.FieldByName('Fovea').AsString:=Tr('Fovea')+':'+checkreport.Fovea;
    TbCheckResult.FieldByName('FoveaDB').AsString:=Tr('Central Reference')+':'+checkreport.FoveaDB;
    TbCheckResult.FieldByName('FoveaAndDB').AsString:=TbCheckResult.FieldByName('Fovea').AsString;
    if checkdata.pm.Fovea=1 then TbCheckResult.FieldByName('FoveaAndDB').AsString:=TbCheckResult.FieldByName('FoveaDB').AsString;
    TbCheckResult.FieldByName('Stimulus').AsString:=Tr('Stimulus')+':'+checkreport.Stimulus;
    TbCheckResult.FieldByName('Background').AsString:=Tr('Background')+':'+checkreport.Background;
    TbCheckResult.FieldByName('Strategy').AsString:=Tr('Strategy')+':'+checkreport.Strategy;
    TbCheckResult.FieldByName('Pupil').AsString:=Tr('Pupil Diameter')+':'+checkreport.Pupil_Diameter;
    TbCheckResult.FieldByName('Visual').AsString:=Tr('Visual Acuity')+':'+checkreport.Visual_Acuity;
    TbCheckResult.FieldByName('Rx').AsString:=Tr('Rx')+':'+checkreport.RX;
    TbCheckResult.FieldByName('DOB').AsString:=Tr('DOB')+':'+TbCheck.FieldByName('Birthday').AsString;
    TbCheckResult.FieldByName('Date').AsString:=Tr('Date')+':'+TbCheck.FieldByName('Date').AsString;
    TbCheckResult.FieldByName('Time').AsString:=Tr('Time')+':'+TbCheck.FieldByName('Time').AsString;
    TbCheckResult.FieldByName('Age').AsString:=Tr('Age')+':'+checkreport.Age;
    TbCheckResult.FieldByName('GHT').AsString:=checkreport.GHT;
    TbCheckResult.FieldByName('MD').AsString:=Tr('MD')+':'+checkreport.MD;
    TbCheckResult.FieldByName('PSD').AsString:=Tr('PSD')+':'+checkreport.PSD;
    TbCheckResult.FieldByName('Range').AsString:='('+IntToStr(checkdata.pm.Range)+')';
    TbCheckResult.FieldByName('Seen').AsString:=Tr('Seen')+':'+checkreport.seen;
    TbCheckResult.FieldByName('NotSeen').AsString:=Tr('Not Seen')+':'+checkreport.notseen;

    TbCheckResult.FieldByName('DevTitle').AsString:=Tr('Total Deviation');
    TbCheckResult.FieldByName('MDevTitle').AsString:=Tr('Pattern Deviation');
    TbCheckResult.FieldByName('DepthTitle').AsString:=Tr('Defect Depth')+'(dB)';
    TbCheckResult.FieldByName('DepthExample').AsString:=Tr('=Within 4 dB of Expected');
    TbCheckResult.FieldByName('ThresholdTitle').AsString:=Tr('Threshold')+'(dB)';
    TbCheckResult.FieldByName('GrayTitle').AsString:=Tr('Threshold Graytone');
    TbCheckResult.FieldByName('BlindSpotTitle').AsString:=Tr('Blind Spot');
    TbCheckResult.FieldByName('BabieTitle').AsString:=Tr('Babie Curve');

    TbCheckResult.FieldByName('Field').Assign(ImageField.Picture.Bitmap);
    TbCheckResult.FieldByName('Gray').Assign(ImageGray.Picture.Graphic);
    TbCheckResult.FieldByName('Dev').Assign(ImageDev.Picture.Graphic);
    TbCheckResult.FieldByName('MDev').Assign(ImageMDev.Picture.Graphic);
    TbCheckResult.FieldByName('DevPE').Assign(ImageDevPE.Picture.Graphic);
    TbCheckResult.FieldByName('MDevPE').Assign(ImageMDevPE.Picture.Graphic);
    TbCheckResult.FieldByName('EyeMove').Assign(ImageBabie.Picture.Graphic);
    TbCheckResult.FieldByName('Babie').Assign(ImageBabie.Picture.Graphic);
    TbCheckResult.FieldByName('Depth').Assign(ImageDepth.Picture.Graphic);
    TbCheckResult.FieldByName('Screen').Assign(ImageScreen.Picture.Graphic);

    TbCheckResult.Post;

    TbCheck.Next;

    if (checkdata.pm.Strategy=10) or (checkdata.pm.Strategy=11) then begin
      Pages.ActivePageIndex:=1;
      BtScreen.Enabled:=True;
    end
    else begin
      Pages.ActivePageIndex:=0;
      BtSingle.Enabled:=True;
      Bt3in1.Enabled:=True;
      BtOverview.Enabled:=True;
    end;
  end;
end;

procedure TFPrintSelect.BtSingleClick(Sender: TObject);
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

procedure TFPrintSelect.Bt3in1Click(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Three in One');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('Rp3in1', false);
  RvProject.Execute;
end;

procedure TFPrintSelect.BtScreenClick(Sender: TObject);
begin
  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:='';
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpScreen', false);
  RvProject.Execute;
end;

procedure TFPrintSelect.BtOverviewClick(Sender: TObject);
var
  s:string;
begin
  thresholdonly:=True;
  TbCheckResult.Active:=False;
  TbCheckResult.Active:=True;
  s:=FilterOfPenson(TbCheck);
  PrepareReport(s);

  TbCheckResult.First;
  while not TbCheckResult.Eof do begin
    TbCheckResult.Edit;
    TbCheckResult.FieldByName('Title').AsString:=Tr('Overview');
    TbCheckResult.Post;
    TbCheckResult.Next;
  end;
  RvProject.SelectReport('RpOverview', false);
  RvProject.Execute;
  Close;
end;

procedure TFPrintSelect.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  RvProject.ProjectFile:=ExeFilePath+'rp.rav';
  thresholdonly:=False;
end;

end.
