unit rx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxDBEdit, cxControls, cxContainer, cxEdit, cxLabel, cxMaskEdit,
  cxSpinEdit;

type
  TFRx = class(TForm)
    cxLabel7: TcxLabel;
    BtAuto: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    EtRx1_1: TcxSpinEdit;
    EtRx2_1: TcxSpinEdit;
    EtRx3_1: TcxSpinEdit;
    EtRx1_0: TcxSpinEdit;
    EtRx2_0: TcxSpinEdit;
    EtRx3_0: TcxSpinEdit;
    BtManual: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure BtAutoClick(Sender: TObject);
    procedure BtManualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Age:integer;
  end;

var
  FRx: TFRx;

implementation

uses Myutils;

{$R *.dfm}

function GetRx(rx1,rx2,rx3:double; age:integer):double;
var
  x,y,z,a:double;
begin
  x:=rx1;
  y:=0;
  if age>=60 then y:=3.25
  else if age>=55 then y:=3.00
  else if age>=50 then y:=2.50
  else if age>=45 then y:=2.00
  else if age>=40 then y:=1.50
  else if age>=30 then y:=1.00;
  a:=rx2;
  if abs(a)<0.5 then a:=0;
  if abs(a)>1.25 then a:=0;
  a:=a/2;
  a:=round(a*25*100)/2500;
  z:=x+y+a;
  Result:=z;
end;

procedure TFRx.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

procedure TFRx.BtAutoClick(Sender: TObject);
begin
  EtRx1_1.Value:=GetRx(EtRx1_1.Value, EtRx2_1.Value, EtRx3_1.Value, Age);
  EtRx1_0.Value:=GetRx(EtRx1_0.Value, EtRx2_0.Value, EtRx3_1.Value, Age);
  Self.ModalResult:=mrOk;
end;

procedure TFRx.BtManualClick(Sender: TObject);
begin
  Self.ModalResult:=mrOk;
end;

end.
