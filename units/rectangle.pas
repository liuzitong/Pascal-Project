unit rectangle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, Xwxh,
  ExtCtrls;

type
  TFRect = class(TForm)

    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    BtOk: TcxButton;
    BtCancel: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Shape1: TShape;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    EtStep: TcxSpinEdit;
    EtX1: TcxSpinEdit;
    EtY1: TcxSpinEdit;
    EtX0: TcxSpinEdit;
    EtY0: TcxSpinEdit;
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckData:TCheckData;
  end;

var
  FRect: TFRect;

implementation

uses Myutils;

{$R *.dfm}

procedure TFRect.BtOkClick(Sender: TObject);
begin
  CheckData.pm.Dot_Number:=XwCreatePT2(EtX0.Value, EtY0.Value, EtX1.Value, EtY1.Value, EtStep.Value, @CheckData.pt);
  CheckData.pm.Range:=Round(Abs(EtX0.Value)+Abs(EtX1.Value));
end;

procedure TFRect.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

end.
