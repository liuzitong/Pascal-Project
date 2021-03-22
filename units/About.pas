unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ShellApi, ExtCtrls, fcLabel, jpeg, Menus,
  cxLookAndFeelPainters, cxButtons;

type
  TFAbout = class(TForm)
    Image: TImage;
    fcLabel1: TfcLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxButton1: TcxButton;
    Panel2: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    procedure mailtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbout: TFAbout;

implementation

uses Myutils;

{$R *.DFM}

procedure TFAbout.mailtoClick(Sender: TObject);
var
  s:string;
begin
  s:=(Sender as TLabel).Caption;
  ShellExecute(Handle, 'OPEN', PChar(s), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TFAbout.FormCreate(Sender: TObject);
var
  s:string;
begin
  TrForm(Self);
  s:=ExeFilePath+'About.BMP';
  if FileExists(s) then begin
    Image.Picture.LoadFromFile(s);
    exit;
  end;
  s:=ExeFilePath+'About.JPG';
  if FileExists(s) then begin
    Image.Picture.LoadFromFile(s);
    exit;
  end;
end;

procedure TFAbout.cxButton1Click(Sender: TObject);
begin
     Close;
end;

end.
