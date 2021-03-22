unit diagnosis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxPC, Wwdatsrc, DBTables, Wwtable,
  ExtCtrls;

type
  TFDiagnosis = class(TForm)
    Panel2: TPanel;
    BtOk: TcxButton;
    BtCancel: TcxButton;
    EtDiagnosis: TcxMemo;
    BtDetail: TcxButton;
    procedure BtDetailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiagnosis: TFDiagnosis;

implementation

uses Myutils, diagnosis2;

{$R *.dfm}

procedure TFDiagnosis.BtDetailClick(Sender: TObject);
begin
  FDiagnosis2:=TFDiagnosis2.Create(Self);
  FDiagnosis2.EtDiagnosis.Text:=EtDiagnosis.Text;
  if FDiagnosis2.ShowModal=mrOk then begin
    EtDiagnosis.Text:=FDiagnosis2.EtDiagnosis.Text;
  end;
  FDiagnosis2.Free;
end;

procedure TFDiagnosis.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

end.
