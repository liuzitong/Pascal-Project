program perimeter;

uses
  ShareMem,
  Forms,
  Windows,
  SysUtils,
  ShellApi,
  DateUtils,
  main in 'units\main.pas' {FMain},
  new in 'units\new.pas' {FNew: TFrame},
  Myutils in 'units\Myutils.pas',
  paramcastmove in 'units\paramcastmove.pas' {FParamCastMove},
  programselect in 'units\programselect.pas' {FProgramSelect},
  programset in 'units\programset.pas' {FProgram: TFrame},
  rectangle in 'units\rectangle.pas' {FRect},
  circle in 'units\circle.pas' {FCircle},
  language in 'units\language.pas' {Flanguage},
  Welcome in 'units\welcome.pas' {FWelcome},
  About in 'units\About.pas' {FAbout},
  dm in 'units\dm.pas' {FDm: TDataModule},
  home in 'units\home.pas' {FHome: TFrame},
  edit in 'units\edit.pas' {FEdit},
  diagnosis in 'units\diagnosis.pas' {FDiagnosis},
  tridimension in 'units\tridimension.pas' {Ftridimension},
  diagnosis2 in 'units\diagnosis2.pas' {FDiagnosis2},
  Login in 'units\Login.pas' {FLogin},
  paramcast in 'units\paramcast.pas' {FParamCast},
  param in 'units\param.pas' {FParam},
  movexy in 'units\movexy.pas' {FMoveXY},
  gpa in 'units\gpa.pas' {FGpa},
  runpic in 'units\runpic.pas' {FRunpic: TFrame},
  xwxh in 'units\xwxh.pas' {FXwxh},
  usbr in 'units\usbr.pas' {FUsbr},
  xwzp in 'units\xwzp.pas' {FXwzp},
  rx in 'units\rx.pas' {FRx},
  pubpas in 'units\pubpas.pas',
  puwait in 'units\puwait.pas',
  uProgLog in 'units\uProgLog.pas',
  cfrmXtdl in 'units\cfrmXtdl.pas',
  myIniFiles in 'units\myIniFiles.pas';

{$R *.res}

var
  FMain: TFMain;
  Mutex:THandle;
  year,month,day,dow:Word;
begin
//  ShellExecute(0, 'OPEN', PChar('regasm.exe'), Pchar(ExeFilePath+'pupilposition.dll'), nil, SW_HIDE);
  ShellExecute(0, 'OPEN', PChar('powercfg'), '-h off', nil, SW_HIDE);

  Application.CreateForm(TFDm, FDm);
  FDm.CreateLw;

  FWelcome:=TFWelcome.Create(Application);
  FWelcome.ShowModal;
  FWelcome.Update;
  if isPrevInst(ExeFileName) or (not pubpassword) then
  begin
    PostMessage(HWND_BROADCAST, RegisterWindowMessage(Pchar(ParamStr(0))), 0, 0);
    exit;
  end;
  Mutex:=CreateMutex(nil, true, Pchar(UpperCase(ExeFileName)));
  Application.Initialize;
  if ParamCount>=1 then Sleep(2000);

  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFXwxh, FXwxh);
  Application.CreateForm(TFUsbr, FUsbr);
  Application.CreateForm(TFXwzp, FXwzp);
  FWelcome.Free;
  Application.Run;
  CloseHandle(mutex);
  FDm.Session.Active:=False;
  DecodeDateFully(now, year, month, day, dow);
  ShellExecute(0, 'OPEN', 'xcopy', Pchar('/XYI DBFS D'+Format('%2.2d', [day])), nil, SW_HIDE);
  if ReStart then ShellExecute(0, 'OPEN', PChar(ExeFilePath+'perimeter.exe'), '1', nil, SW_SHOW);

end.
