unit myIniFiles;


interface

uses
  IniFiles,SysUtils;

type
  TMyIniFiles=class(TObject)
private
  m_Inifiles:TIniFile;

public

  constructor Create();

  Destructor Destroy(); override;

  class function GetIniFile(): TIniFile;

end;
implementation

var GlobalSingle: TMyIniFiles;

constructor TMyIniFiles.Create;
  var filename:string;
begin
  filename:=ExtractFilePath(Paramstr(0))+'perimeter.ini';
  m_Inifiles:=Tinifile.Create(filename);
end;

destructor TMyIniFiles.Destroy;
begin
  m_Inifiles.Destroy;
end;


class function TMyIniFiles.GetIniFile:TIniFile;
begin
  if not Assigned(GlobalSingle) then
  begin
    GlobalSingle := TMyIniFiles.Create();
  end;
  Result :=GlobalSingle.m_Inifiles;
end;

end.

