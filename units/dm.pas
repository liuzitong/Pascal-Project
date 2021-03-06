unit dm;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TFDm = class(TDataModule)
    Session: TSession;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateLw;
  end;

var
  FDm: TFDm;
  pubpassword,pubAdmin: boolean;
  pubDlr: string;

implementation

uses Myutils;

{$R *.dfm}

procedure TFDm.CreateLw;
begin
  Session.DeleteAlias('lw');
  Session.AddStandardAlias('lw', ExeFilePath+'DBFS', '');
end;

end.
