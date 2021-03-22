unit edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxMemo,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, DB, Wwdatsrc, DBTables,
  Wwtable, Wwquery, ExtCtrls, cxCalendar, pubpas, dxGDIPlusClasses;

type
  TFEdit = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    EtNumber: TcxDBTextEdit;
    EtName: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    lbdoctor11: TcxLabel;
    EtDoctor: TcxDBComboBox;
    EtSex: TcxDBComboBox;
    cxLabel11: TcxLabel;
    EtEye: TcxDBComboBox;
    TbCheck: TwwTable;
    DsCheck: TwwDataSource;
    QueryDoctor: TwwQuery;
    cxLabel4: TcxLabel;
    BtDeleteDoctor: TcxButton;
    EtIDNo: TcxDBTextEdit;
    Image1: TImage;
    cxLabel5: TcxLabel;
    EtIOP1: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    EtCDR1: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    EtRx1_1: TcxDBTextEdit;
    EtRx2_1: TcxDBTextEdit;
    EtRx3_1: TcxDBTextEdit;
    EtIOP0: TcxDBTextEdit;
    EtCDR0: TcxDBTextEdit;
    EtRx1_0: TcxDBTextEdit;
    EtRx2_0: TcxDBTextEdit;
    EtRx3_0: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    BtRx: TcxButton;
    EtName1: TcxDBTextEdit;
    EtName2: TcxDBTextEdit;
    cxLabel14: TcxLabel;
    EtBirthDay: TcxDateEdit;
    Label32: TLabel;
    Panel1: TPanel;
    cxButton1: TcxButton;
    BtSave: TcxButton;
    BtNext: TcxButton;
    BtCancel: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure TbCheckAfterInsert(DataSet: TDataSet);
    procedure BtSaveClick(Sender: TObject);
    procedure BtCancelClick(Sender: TObject);
    procedure TbCheckAfterPost(DataSet: TDataSet);
    procedure TbCheckBeforePost(DataSet: TDataSet);
    procedure QueryDoctorAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure EtRx1_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtNextClick(Sender: TObject);
    procedure BtDeleteDoctorClick(Sender: TObject);
    procedure BtRxClick(Sender: TObject);
    procedure TbCheckAfterEdit(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    function IsValidData: Boolean;
  public
    { Public declarations }
    TbCheckMain: TDataset;
  end;

var
  FEdit: TFEdit;

implementation

uses Myutils, xwxh, main, rx;

{$R *.dfm}

procedure TFEdit.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  EtName.Visible:=not XwData.Name2;
  EtName1.Visible:=XwData.Name2;
  EtName2.Enabled:=XwData.Name2;
  pubentertest := false;
end;

function TFEdit.IsValidData:Boolean;
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
    if EtName.Visible then EtName.SetFocus;
    if EtName1.Visible then EtName1.SetFocus;
    Result := False;
  end;
  if (Trim(EtNumber.Text) = '') then
  begin
    EtNumber.SetFocus;
    Result := False;
  end;
end;

procedure TFEdit.QueryDoctorAfterOpen(DataSet: TDataSet);
begin
  EtDoctor.Properties.Items.Clear;
  QueryDoctor.First;
  while not QueryDoctor.Eof do begin
    EtDoctor.Properties.Items.Add(QueryDoctor.FieldByName('Doctor').AsString);
    QueryDoctor.Next;
  end;
  QueryDoctor.Close;
end;

procedure TFEdit.BtSaveClick(Sender: TObject);
begin
  TbCheck.Post;
  Close;
end;

procedure TFEdit.BtCancelClick(Sender: TObject);
begin
  TbCheck.Cancel;
  pubentertest := false;
  Close;
end;

procedure TFEdit.TbCheckAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('Id').AsInteger:=MaxIDofCheck+1;
  DataSet.FieldByName('Number').AsString:=NumberOfCheck;
  DataSet.FieldByName('State').AsString:='0';
  DataSet.FieldByName('Program').AsString:='30-2';
  DataSet.FieldByName('Strategy').AsString:=Tr('Strategy0');
  DataSet.FieldByName('DoctorDeleted').AsInteger:=0;
  DataSet.FieldByName('Stimulus_Color').AsString:='1';
  DataSet.FieldByName('Stimulus_Size').AsString:='2';
  DataSet.FieldByName('Stimulus').AsString:=Tr('StimulusSize2')+','+Tr('StimulusColor0');
  EtBirthday.Date:=EnCodeDate(1971, 1, 1);
end;

procedure TFEdit.TbCheckAfterPost(DataSet: TDataSet);
begin
  TbCheck.FlushBuffers;
  QueryDoctor.Active:=true;
end;

procedure TFEdit.TbCheckBeforePost(DataSet: TDataSet);
var
  age,birth:string;
begin
  if XwData.Name2 then DataSet.FieldByName('Name').AsString:=DataSet.FieldByName('Name1').AsString+' '+DataSet.FieldByName('Name2').AsString;
  DataSet.FieldByName('Birthday').AsString:=DateToStr(EtBirthday.Date);

  if not IsValidData then
  begin
    pubentertest := false;
    Abort;
  end;

  if not StrToAge(DataSet.FieldByName('Birthday').AsString, age, birth) then
  begin
    pubentertest := false;
    EtBirthday.SetFocus;
    Abort;
  end;
  DataSet.FieldByName('Birthday').AsString:=birth;
  DataSet.FieldByName('Age').AsString:=age;
  DataSet.FieldByName('Date').AsString:=DateToStr(now);
  DataSet.FieldByName('Time').AsString:=TimeToStr(now);
end;

procedure TFEdit.EtRx1_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then Key:=VK_TAB;
end;

procedure TFEdit.BtNextClick(Sender: TObject);
begin
  TbCheck.Post;
  TbCheck.Insert;
  EtNumber.SetFocus;
  if TbCheckMain<>nil then TbCheckMain.Refresh;
end;

procedure TFEdit.BtDeleteDoctorClick(Sender: TObject);
begin
  if Xwxx('Delete')<>IDYES then exit;
  DeleteDoctor(EtDoctor.Text);
  QueryDoctor.Active:=true;
  EtDoctor.Text:='';
end;

procedure TFEdit.BtRxClick(Sender: TObject);
var
  rx1_0,rx2_0,rx3_0,rx1_1,rx2_1,rx3_1:double;
  age,birth:string;
begin
  TbCheck.FieldByName('Birthday').AsString:=EtBirthDay.Text;
  if not StrToAge(TbCheck.FieldByName('Birthday').AsString, age, birth) then begin
    Tsxx('Input birthday first, Please');
    exit;
  end;
  FRx:=TFRx.Create(Self);
  FRx.Age:=StrToInt(age);
  FRx.EtRx1_0.Text:=EtRx1_0.Text;
  FRx.EtRx2_0.Text:=EtRx2_0.Text;
  FRx.EtRx3_0.Text:=EtRx3_0.Text;
  FRx.EtRx1_1.Text:=EtRx1_1.Text;
  FRx.EtRx2_1.Text:=EtRx2_1.Text;
  FRx.EtRx3_1.Text:=EtRx3_1.Text;
  if FRx.ShowModal=mrOk then begin
    rx1_0:=FRx.EtRx1_0.Value;
    rx2_0:=FRx.EtRx2_0.Value;
    rx3_0:=FRx.EtRx3_0.Value;
    rx1_1:=FRx.EtRx1_1.Value;
    rx2_1:=FRx.EtRx2_1.Value;
    rx3_1:=FRx.EtRx3_1.Value;
    TbCheck.FieldByName('Rx1_1').AsString:=Format('%0.2f', [rx1_1]);
    TbCheck.FieldByName('Rx2_1').AsString:=Format('%0.2f', [rx2_1]);
    TbCheck.FieldByName('Rx3_1').AsString:=Format('%0.0f', [rx3_1]);
    TbCheck.FieldByName('Rx1_0').AsString:=Format('%0.2f', [rx1_0]);
    TbCheck.FieldByName('Rx2_0').AsString:=Format('%0.2f', [rx2_0]);
    TbCheck.FieldByName('Rx3_0').AsString:=Format('%0.0f', [rx3_0]);
  end;
  FRx.Free;
end;

procedure TFEdit.TbCheckAfterEdit(DataSet: TDataSet);
begin
  if TbCheck.FieldByName('Birthday').AsString<>'' then EtBirthDay.Date:=StrToDate(TbCheck.FieldByName('Birthday').AsString);
end;

procedure TFEdit.cxButton1Click(Sender: TObject);
begin
  pubentertest := true;
  pubentertestmode := 1;
  TbCheck.Post;
  pubcurid:=TbCheck.FieldByName('ID').AsString;
  Close;
end;

end.
