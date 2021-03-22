unit Welcome;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg;

type
  TFWelcome = class(TForm)
    Image: TImage;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWelcome: TFWelcome;

implementation

uses Myutils,cfrmXtdl,dm;

{$R *.DFM}

procedure TFWelcome.FormCreate(Sender: TObject);
var
  s:string;
begin
  s:=ExeFilePath+'WELCOME.BMP';
  if FileExists(s) then begin
    Image.Picture.LoadFromFile(s);
    exit;
  end;
  s:=ExeFilePath+'WELCOME.JPG';
  if FileExists(s) then begin
    Image.Picture.LoadFromFile(s);
    exit;
  end;
  TrForm(Self);
end;

procedure TFWelcome.TimerTimer(Sender: TObject);
begin
  ImageClick(nil);
end;

procedure TFWelcome.ImageClick(Sender: TObject);
begin
  Timer.Enabled := False;
  
  //ÃâµÇÂ½
  pubpassword := True;
  pubDlr := 'sa';
  pubAdmin := true;

  {
  frmXtdl := TfrmXtdl.Create(nil);
  frmXtdl.ShowModal;
  frmXtdl.Free;
  }
  Close;
end;

end.
