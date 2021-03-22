unit movexy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Xwxh;

type
  TFMoveXY = class(TForm)
    cxLabel4: TcxLabel;
    EtX0: TcxTextEdit;
    cxLabel1: TcxLabel;
    EtY0: TcxTextEdit;
    cxLabel2: TcxLabel;
    EtX1: TcxTextEdit;
    cxLabel3: TcxLabel;
    EtY1: TcxTextEdit;
    BtOk: TcxButton;
    BtCancel: TcxButton;
    procedure BtOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckData:TCheckData;
  end;

var
  FMoveXY: TFMoveXY;

implementation

uses Myutils;

{$R *.dfm}

procedure TFMoveXY.BtOkClick(Sender: TObject);
var
  jd0,wd0,jd1,wd1:double;
  x0,y0,x1,y1:double;
begin
  wd0:=StrToFloat(EtX0.Text);
  jd0:=StrToFloat(EtY0.Text);
  wd1:=StrToFloat(EtX1.Text);
  jd1:=StrToFloat(EtY1.Text);
  JwdToXy(jd0,wd0,x0,y0);
  JwdToXy(jd1,wd1,x1,y1);

  CheckData.pm.MoveX0:=round(x0);
  CheckData.pm.MoveY0:=round(y0);
  CheckData.pm.MoveX1:=round(x1);
  CheckData.pm.MoveY1:=round(y1);
end;

procedure TFMoveXY.FormShow(Sender: TObject);
var
  jd0,wd0,jd1,wd1:double;
  x0,y0,x1,y1:double;
begin
  x0:=CheckData.pm.MoveX0;
  y0:=CheckData.pm.MoveY0;
  x1:=CheckData.pm.MoveX1;
  y1:=CheckData.pm.MoveY1;
  XyToJwd(x0,y0,jd0,wd0);
  XyToJwd(x1,y1,jd1,wd1);

  EtX0.Text:=IntToStr(round(wd0));
  EtY0.Text:=IntToStr(round(jd0));
  EtX1.Text:=IntToStr(round(wd1));
  EtY1.Text:=IntToStr(round(jd1));
end;

end.
