unit diagnosis2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxPC, Wwdatsrc, DBTables, Wwtable,
  ExtCtrls, cxMaskEdit, cxDropDownEdit, cxLabel;

type
  TFDiagnosis2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TbTerm: TwwTable;
    DsTerm: TwwDataSource;
    EtType: TcxTabControl;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridDBTableView1Number: TcxGridDBColumn;
    GridDBTableView1V0: TcxGridDBColumn;
    GridDBTableView1V1: TcxGridDBColumn;
    GridDBTableView1V2: TcxGridDBColumn;
    GridDBTableView1V3: TcxGridDBColumn;
    GridDBTableView1V4: TcxGridDBColumn;
    GridDBTableView1V5: TcxGridDBColumn;
    GridDBTableView1V6: TcxGridDBColumn;
    GridDBTableView1V7: TcxGridDBColumn;
    GridDBTableView1V8: TcxGridDBColumn;
    GridDBTableView1V9: TcxGridDBColumn;
    GridDBTableView1V10: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    EtDiagnosis: TcxMemo;
    BtOk: TcxButton;
    BtCancel: TcxButton;
    Timer1: TTimer;
    EtDelta: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure EtTypeChange(Sender: TObject);
    procedure GridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiagnosis2: TFDiagnosis2;

implementation

uses Myutils;

{$R *.dfm}

procedure TFDiagnosis2.EtTypeChange(Sender: TObject);
begin
  TbTerm.Filter:='Type='+IntToStr(EtType.TabIndex+1);
end;

procedure TFDiagnosis2.GridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  s,s1,s2:string;
begin
  s:=EtDiagnosis.Lines.Text;
  s1:=Copy(s, 1, EtDiagnosis.SelStart);
  s2:=Copy(s, EtDiagnosis.SelStart+EtDiagnosis.SelLength+1, Length(s));
  EtDiagnosis.Lines.Text:=s1+ACellViewInfo.Text+EtDelta.Text+s2;
  EtDiagnosis.SelStart:=Length(s1+ACellViewInfo.Text+EtDelta.Text);
end;

procedure TFDiagnosis2.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

end.
