unit query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxGraphics, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, DB, cxDBEdit,
  cxMemo,DBTables,DateUtils,cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Wwdatsrc, Wwtable, cxDBLabel,
  Wwdbigrd, Wwdbgrid;

type
  TFQuery = class(TFrame)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    DsCheck: TwwDataSource;
    Timer: TTimer;
    BtReport: TcxButton;
    PaEdits: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel2: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel5: TcxLabel;
    cxDBLabel5: TcxDBLabel;
    Panel9: TPanel;
    Panel5: TPanel;
    BtQuery: TcxButton;
    EtQuery: TEdit;
    cxLabel6: TcxLabel;
    cxDBLabel6: TcxDBLabel;
    Panel11: TPanel;
    TbCheck: TwwTable;
    BtDelete: TcxButton;
    DbGridDBTableView1: TcxGridDBTableView;
    DbGridLevel1: TcxGridLevel;
    DbGrid: TcxGrid;
    DbGridDBTableView1Number: TcxGridDBColumn;
    DbGridDBTableView1Name: TcxGridDBColumn;
    DbGridDBTableView1Sex: TcxGridDBColumn;
    DbGridDBTableView1Birthday: TcxGridDBColumn;
    DbGridDBTableView1Age: TcxGridDBColumn;
    DbGridDBTableView1Eye: TcxGridDBColumn;
    DbGridDBTableView1Vision0: TcxGridDBColumn;
    DbGridDBTableView1Pressure0: TcxGridDBColumn;
    DbGridDBTableView1Pupil0: TcxGridDBColumn;
    DbGridDBTableView1Vision1: TcxGridDBColumn;
    DbGridDBTableView1Pressure1: TcxGridDBColumn;
    DbGridDBTableView1Pupil1: TcxGridDBColumn;
    DbGridDBTableView1Doctor: TcxGridDBColumn;
    DbGridDBTableView1Program: TcxGridDBColumn;
    DbGridDBTableView1Date: TcxGridDBColumn;
    DbGridDBTableView1Time: TcxGridDBColumn;
    EtAccord: TRadioGroup;
    BtOther: TcxButton;
    BtShowOrigin: TcxButton;
    Panel10: TPanel;
    cxDBLabel7: TcxDBLabel;
    cxLabel7: TcxLabel;
    DbGridDBTableView1Strategy: TcxGridDBColumn;
    procedure BtQueryClick(Sender: TObject);
    procedure TbCheckFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure EtQueryChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtDeleteClick(Sender: TObject);
    procedure DbGridDBTableView1DblClick(Sender: TObject);
    procedure BtReportClick(Sender: TObject);
    procedure EtAccordClick(Sender: TObject);
    procedure BtOtherClick(Sender: TObject);
    procedure BtShowOriginClick(Sender: TObject);
    procedure TbCheckAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    bRefresh:boolean;
    MainActivePageIndex:integer;
    procedure CancelSort;
  public
    { Public declarations }
  end;

implementation

uses
  Xwxh, Myutils, main;

{$R *.dfm}

procedure TFQuery.BtQueryClick(Sender: TObject);
begin
  bRefresh:=True;
end;

procedure TFQuery.TbCheckFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  s,sv,v:string;
  i:integer;
  ts:TStrings;
  b:boolean;
begin
  s:=UpperCase(EtQuery.Text);
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

procedure TFQuery.EtQueryChange(Sender: TObject);
begin
  if EtQuery.Text='' then begin
    TbCheck.Refresh;
    TbCheck.First;
  end;
end;

procedure TFQuery.TimerTimer(Sender: TObject);
begin
  Timer.Enabled:=False;
  if MainActivePageIndex<>FMain.PcMain.ActivePageIndex then begin
    MainActivePageIndex:=FMain.PcMain.ActivePageIndex;
    if FMain.PcMain.ActivePageIndex=3 then begin
      EtAccordClick(Sender);
      bRefresh:=true;
    end;
  end;

  if bRefresh then begin
    bRefresh:=False;
    TbCheck.Refresh;
  end;

  BtReport.Enabled:=not TbCheck.Eof;
  BtDelete.Enabled:=BtReport.Enabled;
  BtOther.Enabled:=BtReport.Enabled;
  Timer.Enabled:=True;
end;

procedure TFQuery.BtDeleteClick(Sender: TObject);
begin
  if Xwxx('Delete')<>IDYES then exit;
  TbCheck.Delete;
end;

procedure TFQuery.DbGridDBTableView1DblClick(Sender: TObject);
begin
  BtReportClick(Sender);
end;

procedure TFQuery.BtReportClick(Sender: TObject);
begin
  FPrintSelect:=TFPrintSelect.Create(Self);
  FPrintSelect.PrepareReport('ID='+TbCheck.FieldByName('Id').AsString);
  FPrintSelect.ShowModal;
  FPrintSelect.Free;
end;

procedure TFQuery.EtAccordClick(Sender: TObject);
var
  year,month,day:Word;
begin
  DecodeDate(now, year, month, day);
  case EtAccord.ItemIndex of
    1:TbCheck.Filter:='(State=2 or State=3) and (Date='''+DateToStr(now)+''')';
    2:TbCheck.Filter:='(State=2 or State=3) and (Date='''+DateToStr(now-1)+''')';
    3:TbCheck.Filter:='(State=2 or State=3) and (Date>='''+Format('%d-%2.2d-01', [year, month])+''') and (Date<='''+Format('%d-%2.2d-31', [year, month])+''')';
    4:begin
      month:=1+(month-1) div 3 *3;
      TbCheck.Filter:='(State=2 or State=3) and (Date>='''+Format('%d-%2.2d-01', [year, month])+''') and (Date<='''+Format('%d-%2.2d-31', [year, month+2])+''')';
    end;
    5:TbCheck.Filter:='(State=2 or State=3) and (Date>='''+Format('%d-01-01', [year])+''') and (Date<='''+Format('%d-12-31', [year])+''')';
    else TbCheck.Filter:='State=2 or State=3';
  end;
end;

procedure TFQuery.BtOtherClick(Sender: TObject);
begin
  if Xwxx('ReCheck')<>IDYES then exit;
  CopyCheckRecord(TbCheck.FieldByName('ID').AsString, 0, false);
  TbCheck.Refresh;
  FMain.PcMain.ActivePageIndex:=0;
end;

procedure TFQuery.CancelSort;
var
  i:integer;
begin
  for i:=0 to DbGridDBTableView1.ColumnCount-1 do DbGridDBTableView1.Columns[i].SortOrder:=soNone;
end;

procedure TFQuery.BtShowOriginClick(Sender: TObject);
begin
  CancelSort;
end;

procedure TFQuery.TbCheckAfterDelete(DataSet: TDataSet);
begin
  TbCheck.FlushBuffers;
end;

end.
