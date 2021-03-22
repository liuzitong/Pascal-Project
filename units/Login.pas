unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFLogin = class(TForm)
    EtPassword: TEdit;
    BtOk: TButton;
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses Myutils, xwxh;

{$R *.DFM}

procedure TFLogin.BtOkClick(Sender: TObject);
var
  ps:integer;
begin
  ps:=StrToIntDef(EtPassword.Text, 0);
  if ps=13579 then XwData.OpRank:=3
  else if (ps=XwData.oprank2pass) then XwData.OpRank:=2
  else if (ps=XwData.oprank1pass) then XwData.OpRank:=1
  else XwData.OpRank:=0;
  ModalResult:=mrOk;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  TrForm(Self);
end;

end.
