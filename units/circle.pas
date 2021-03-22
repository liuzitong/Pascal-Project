unit circle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, Xwxh;

type
  TFCircle = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    EtStep: TcxSpinEdit;
    BtOk: TcxButton;
    BtCancel: TcxButton;
    EtOutter: TcxSpinEdit;
    EtInner: TcxSpinEdit;
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckData:TCheckData;
  end;

var
  FCircle: TFCircle;

implementation

uses Myutils;

{$R *.dfm}

procedure TFCircle.BtOkClick(Sender: TObject);
begin
  CheckData.pm.Dot_Number:=XwCreatePT(EtOutter.Value, EtInner.Value, EtStep.Value, @CheckData.pt);
  CheckData.pm.Range:=EtOutter.Value;
end;

procedure TFCircle.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

end.
