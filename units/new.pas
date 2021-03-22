unit new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox, Grids,
   cxTextEdit, cxLabel, StdCtrls, cxRadioGroup, cxMemo,
  cxGraphics, cxMaskEdit, cxDropDownEdit, Menus, cxLookAndFeelPainters,
  cxButtons, cxDBEdit, DB, DBTables, cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,StrUtils, cxButtonEdit, Wwdatsrc, Wwtable,
  DBActns, ActnList, Wwquery, Wwdbigrd, Wwdbgrid, Mask;

type
  TFNew = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    BtSave: TcxButton;
    BtStart: TcxButton;
    BtNew: TcxButton;
    Panel6: TPanel;
    Panel7: TPanel;
    BtDelete: TcxButton;
    BtCancel: TcxButton;
    PaEdits: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    EtNumber: TcxDBTextEdit;
    EtName: TcxDBTextEdit;
    EtPupil1: TcxDBTextEdit;
    EtPressure1: TcxDBTextEdit;
    EtVision1: TcxDBTextEdit;
    EtDesc: TcxDBMemo;
    cxLabel3: TcxLabel;
    lbdoctor11: TcxLabel;
    EtBirthDay: TcxDBTextEdit;
    EtDoctor: TcxDBComboBox;
    EtSex: TcxDBComboBox;
    TbCheck: TwwTable;
    DsCheck: TwwDataSource;
    ActionList: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    QueryDoctor: TwwQuery;
    cxLabel11: TcxLabel;
    EtEye: TcxDBComboBox;
    Timer: TTimer;
    wwDBGrid: TwwDBGrid;
    EtPupil0: TcxDBTextEdit;
    EtPressure0: TcxDBTextEdit;
    EtVision0: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxLabel12: TcxLabel;
    BtOther: TcxButton;
    Panel3: TPanel;
    procedure QueryDoctorAfterOpen(DataSet: TDataSet);
    procedure TbCheckAfterPost(DataSet: TDataSet);
    procedure TbCheckBeforePost(DataSet: TDataSet);
    procedure TbCheckAfterInsert(DataSet: TDataSet);
    procedure TbCheckBeforeDelete(DataSet: TDataSet);
    procedure EtNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtStartClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtOtherClick(Sender: TObject);
    procedure TbCheckAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    bShow:boolean;
    Number:integer;
    MainActivePageIndex:integer;
    function IsValidData: Boolean;
  public
    { Public declarations }
  end;


implementation

uses
  Myutils, xwxh, main;

{$R *.dfm}

procedure TFNew.QueryDoctorAfterOpen(DataSet: TDataSet);
begin
  EtDoctor.Properties.Items.Clear;
  QueryDoctor.First;
  while not QueryDoctor.Eof do begin
    EtDoctor.Properties.Items.Add(QueryDoctor.FieldByName('Doctor').AsString);
    QueryDoctor.Next;
  end;
  QueryDoctor.Close;
end;

procedure TFNew.TbCheckAfterPost(DataSet: TDataSet);
begin
  TbCheck.FlushBuffers;
  QueryDoctor.Active:=true;
end;

function TFNew.IsValidData:Boolean;
begin
  Result := true;

  if (Trim(EtEye.Text)= '') then
  begin
    EtEye.SetFocus;
    Result := False;
  end;
  if (Trim(EtSex.Text) = '') then
  begin
    EtSex.SetFocus;
    Result := False;
  end;
  if (Trim(EtBirthday.Text) = '') then
  begin
    EtBirthday.SetFocus;
    Result := False;
  end;
  if (Trim(EtName.Text) = '') then
  begin
    EtName.SetFocus;
    Result := False;
  end;
  if (Trim(EtNumber.Text) = '') then
  begin
    EtNumber.SetFocus;
    Result := False;
  end;
end;


procedure TFNew.TbCheckBeforePost(DataSet: TDataSet);
var
  age,birth:string;
begin
  if not IsValidData then begin
    Abort;
  end;
  if not StrToAge(DataSet.FieldByName('Birthday').AsString, age, birth) then begin
    EtBirthday.SetFocus;
    Abort;
  end;
  DataSet.FieldByName('Birthday').AsString:=birth;
  DataSet.FieldByName('Age').AsString:=age;
end;

procedure TFNew.TbCheckAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('Id').AsInteger:=MaxIDofCheck+1;
  DataSet.FieldByName('Number').AsString:=DateToGzr(now)+Format('%2.2d', [Number+1]);
  DataSet.FieldByName('State').AsString:='0';
  DataSet.FieldByName('Program').AsString:=Tr('30-2');
  DataSet.FieldByName('Pt').AsString:='30-2';
  DataSet.FieldByName('Strategy').AsString:=Tr('Strategy0');
  DataSet.FieldByName('Date').AsString:=DateToStr(now);
  DataSet.FieldByName('Time').AsString:=TimeToStr(now);
  EtNumber.SetFocus;
  inc(Number);
end;

procedure TFNew.TbCheckBeforeDelete(DataSet: TDataSet);
begin
  if Xwxx('Delect')<>IDYES then Abort;
end;

procedure TFNew.EtNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then Key:=VK_TAB;
end;

procedure TFNew.BtStartClick(Sender: TObject);
var
  checkdata:TCheckData;
  s,pt:string;
  age:integer;
  eye:integer;
begin
  s:=GetPtData(0, checkdata, pt);
  age:=TbCheck.FieldByName('Age').AsInteger;
  eye:=GetEyeValue(TbCheck.FieldByName('Eye').AsString);
  PrepareCheckData(age, eye, false, checkdata);
  DemoCheckData:=checkdata;
  if not WriteXwCheckData then ;

  ClearCheckState1;
  TbCheck.Edit;
  TbCheck.FieldByName('Program').AsString:=s;
  TbCheck.FieldByName('Pt').AsString:=pt;
  TbCheck.FieldByName('Strategy').AsString:=Tr('Strategy'+IntToStr(checkdata.pm.Strategy));
  TbCheck.FieldByName('State').AsInteger:=1;
  TbCheck.Post;
  TbCheck.FlushBuffers;
  FMain.PcMain.ActivePageIndex:=1;
end;

procedure TFNew.TimerTimer(Sender: TObject);
begin
  if not bShow then begin
    bShow:=true;
    TrwwDBGrid(wwDBGrid);
  end;
  if MainActivePageIndex<>FMain.PcMain.ActivePageIndex then begin
    MainActivePageIndex:=FMain.PcMain.ActivePageIndex;
    if MainActivePageIndex=0 then begin
      TbCheck.Refresh;
      TbCheck.Last;
    end;
  end;
  BtStart.Enabled:=BtDelete.Enabled and (TbCheck.State=dsBrowse) and (DemoCheckData.runstate=0);
  BtOther.Enabled:=BtDelete.Enabled;
end;

procedure TFNew.BtOtherClick(Sender: TObject);
begin
  CopyCheckRecord(TbCheck.FieldByName('ID').AsString);
  TbCheck.Refresh;
  TbCheck.Last;
end;

procedure TFNew.TbCheckAfterDelete(DataSet: TDataSet);
begin
  TbCheck.FlushBuffers;
end;

end.
