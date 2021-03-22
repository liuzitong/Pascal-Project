unit puwait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, IBCtrls, ComCtrls;

type
  TfrmPuwait = class(TForm)
    Panel1: TPanel;
    PanelMessage: TPanel;
    Panel2: TPanel;
    Animate1: TAnimate;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPuwait: TfrmPuwait;
  iconindex,imagenum:integer;
implementation
{$R *.DFM}

procedure TfrmPuwait.FormShow(Sender: TObject);
begin
  animate1.play(animate1.startframe,animate1.stopframe,0);
end;

procedure TfrmPuwait.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
