unit uProgLog;

interface

uses
Windows, SysUtils, SyncObjs,Forms,StdCtrls;

const
C_LOG_LEVEL_TRACE   = $00000001;
C_LOG_LEVEL_WARNING = $00000002;
C_LOG_LEVEL_ERROR   = $00000004;
type
EnumSeverity = (TraceLevel, WarningLevel, ErrorLevel, LogLevel);

function SeverityDesc(severity: EnumSeverity): string;

type
TLogFile = class(TObject)
private
    FLogKeepDays: Integer; //��־����ʱ��
    FLogLevel: DWORD;      //��־����
    FLogPath: string;      //��־����·������"\"��β
    FLogAppName: string;   //Ӧ�ó�����(��־�ļ�ǰ׺)

    FCsWriteLogFile: TCriticalSection;
    FLogFile: TextFile;    //��־�ļ����
    FLogOpened: Boolean;   //��־�ļ��Ƿ��
    FFileTimeStamp: TTimeStamp; //��ǰ��־�ļ��������ʱ��

    function GetLogKeepDays(): Integer;
    procedure SetLogKeepDays(days: Integer);
    function GetLogLevel(): DWORD;
    procedure SetLogLevel(level: DWORD);
    function GetLogPath(): string;
    procedure SetLogPath(path: string);
    function GetLogAppName(): string;
    procedure SetLogAppName(name: string);
protected
    function WriteLogFile(const szFormat: string; const Args: array of const): Boolean;
public
    Memo:TMemo;
    ////////////////////////////////////////////////////////////////////////////
    //Procedure/Function Name: Trace()
    //Describe: ��¼��־����־�ļ��������־�ļ�·�������ڣ����Զ������������־�ļ������ڣ�
    //          �򴴽���Ӧ����־�ļ�����������ļ��Ѵ��ڣ������Ӧ����־�ļ���������־��ӵ��ļ���β��
    //Input   : severity: ��־���𡣸�����־������������ü�����־�Ƿ���Ҫ���棬
    //            ��LogLevel�������־������־�������Ӱ�죬�����浽����־�ļ���
    //          subject: ģ�����ơ�
    //          desc: ��־���ݡ�
    //Result : N/A
    //Catch Exception: No
    ////////////////////////////////////////////////////////////////////////////
    procedure Trace(severity: EnumSeverity; const subject, desc: string); overload;

    ////////////////////////////////////////////////////////////////////////////
    //Procedure/Function Name: Trace()
    //Describe: ��¼��־����־�ļ��������־�ļ�·�������ڣ����Զ������������־�ļ������ڣ�
    //          �򴴽���Ӧ����־�ļ�����������ļ��Ѵ��ڣ������Ӧ����־�ļ���������־��ӵ��ļ���β��
    //Input   : severity: ��־���𡣸�����־������������ü�����־�Ƿ���Ҫ���棬
    //            ��LogLevel�������־������־�������Ӱ�죬�����浽����־�ļ���
    //          subject: ģ�����ơ�
    //          descFormat: ������ʽ����Ϣ����־���ݡ�
    //          Args: ��ʽ���������顣
    //Result : N/A
    //Catch Exception: No
    ////////////////////////////////////////////////////////////////////////////
    procedure Trace(severity: EnumSeverity; const subject, descFormat: string; const Args: array of const); overload;

    ////////////////////////////////////////////////////////////////////////////
    //Procedure/Function Name: DeleteLogFile()
    //Describe: ɾ�������������޵���־�ļ�������־�ļ�·�������������������޵���־����֮ɾ����
    //          �÷���ֻ����Ӧ�ó�������ʱ����һ�Σ���ɾ�������������޵���־��
    //Input   : N/A
    //Result : Boolean �ɹ�����TRUE��ʧ�ܷ���FALSE
    //Catch Exception: No
    ////////////////////////////////////////////////////////////////////////////
    function DeleteLogFile(): Boolean;

    constructor Create();

    Destructor Destroy(); override;
    
    class function GetInstance(): TLogFile;
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;


    property LogKeepDays: Integer read GetLogKeepDays write SetLogKeepDays;
    property Level: DWORD read GetLogLevel write SetLogLevel;
    property LogPath: string read GetLogPath write SetLogPath;
    property LogAppName: string read GetLogAppName write SetLogAppName;

end;

function BooleanDesc(Value : Boolean): string;



implementation

uses SqlTimSt;

var GlobalSingle: TLogFile;


function BooleanDesc(Value : Boolean): string;
begin
if Value then Result := 'TRUE'
else Result := 'FALSE';
end;

function SeverityDesc(severity: EnumSeverity): string;
begin
if (severity = ErrorLevel) then result := 'X'
else if (severity = WarningLevel) then result := '!'
else result := ' ';
end;

{ TLogFile }

constructor TLogFile.Create;
begin
FLogOpened := False;
FCsWriteLogFile := TCriticalSection.Create;

FLogKeepDays := 31;
FLogLevel := C_LOG_LEVEL_TRACE or C_LOG_LEVEL_WARNING or C_LOG_LEVEL_ERROR;
FLogPath := ExtractFilePath(Application.ExeName) + 'Log\';
FLogAppName := ChangeFileExt(ExtractFileName(Application.ExeName),'');
end;


procedure TLogFile.FreeInstance;
begin
  inherited;
  GlobalSingle := nil;
end;


class function TLogFile.GetInstance: TLogFile;
begin
  if not Assigned(GlobalSingle) then
  begin
    GlobalSingle := TLogFile.Create();
  end;
  Result := GlobalSingle;
end;
 
class function TLogFile.NewInstance: TObject;
begin
  if not Assigned(GlobalSingle) then
    GlobalSingle := TLogFile(inherited NewInstance);
  Result := GlobalSingle;
end;

function TLogFile.DeleteLogFile(): Boolean;
var
rc : DWORD;
SearchRec: TSearchRec;
bResult: Boolean;
FileMask: string;
LocalFileTime: TFileTime;
FileTime: Integer;
begin
result := false;
rc := GetFileAttributes(PChar(FLogPath));
if (rc = $FFFFFFFF) or (FILE_ATTRIBUTE_DIRECTORY and rc = 0) then exit;

FileMask := FLogPath + FLogAppName + '*.log';
bResult := FindFirst(FileMask, faAnyFile, SearchRec) = 0;
try
    if bResult then
    begin
      repeat
        if (SearchRec.Name[1] <> '.') and
          (SearchRec.Attr and faVolumeID <> faVolumeID) and
          (SearchRec.Attr and faDirectory <> faDirectory) then
        begin
          FileTimeToLocalFileTime(SearchRec.FindData.ftCreationTime, LocalFileTime);
          FileTimeToDosDateTime(LocalFileTime, LongRec(FileTime).Hi, LongRec(FileTime).Lo);
          // �����ļ���������ɾ���ļ�
          if FileDateToDateTime(FileTime) <= Now() - GetLogKeepDays() then
            DeleteFile(FLogPath + SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    end;
finally
    FindClose(SearchRec);
end;
end;

destructor TLogFile.Destroy;
begin
if (FLogOpened) then CloseFile(FLogFile);
FCsWriteLogFile.Free();
inherited;
end;

function TLogFile.GetLogAppName: string;
begin
result := FLogAppName;
end;

function TLogFile.GetLogKeepDays: Integer;
begin
result := FLogKeepDays;
end;

function TLogFile.GetLogLevel: DWORD;
begin
result := FLogLevel;
end;

function TLogFile.GetLogPath: string;
begin
result := FLogPath;
end;

procedure TLogFile.SetLogAppName(name: string);
begin
FLogAppName := ChangeFileExt(name, '');
end;

procedure TLogFile.SetLogKeepDays(days: Integer);
begin
FLogKeepDays := days;
end;

procedure TLogFile.SetLogLevel(level: DWORD);
begin
FLogLevel := level;
end;

procedure TLogFile.SetLogPath(path: string);
begin
if Trim(path) = '' then exit;
if path[Length(path)] <> '\' then FLogPath := path + '\'
else FLogPath := path;
end;

procedure TLogFile.Trace(severity: EnumSeverity; const subject, desc: string);
begin
// �������õ���־��������Ƿ�д��־
if ((severity = LogLevel) or
   ((severity = ErrorLevel) and (FLogLevel and C_LOG_LEVEL_ERROR = C_LOG_LEVEL_ERROR)) or
   ((severity = WarningLevel) and (FLogLevel and C_LOG_LEVEL_WARNING = C_LOG_LEVEL_WARNING)) or
   ((severity = TraceLevel) and (FLogLevel and C_LOG_LEVEL_TRACE = C_LOG_LEVEL_TRACE))) then
begin
   //WriteLogFile('%s @@ %s @ %s $ %s', [SeverityDesc(severity), FLogAppName, subject, desc]);
   WriteLogFile('%s @ %s $ %s', [SeverityDesc(severity), subject, desc]);
end;
end;

procedure TLogFile.Trace(severity: EnumSeverity; const subject,
descFormat: string; const Args: array of const);
var
desc: string;
begin
// �������õ���־��������Ƿ�д��־
if ((severity = LogLevel) or
   ((severity = ErrorLevel) and (FLogLevel and C_LOG_LEVEL_ERROR = C_LOG_LEVEL_ERROR)) or
   ((severity = WarningLevel) and (FLogLevel and C_LOG_LEVEL_WARNING = C_LOG_LEVEL_WARNING)) or
   ((severity = TraceLevel) and (FLogLevel and C_LOG_LEVEL_TRACE = C_LOG_LEVEL_TRACE))) then
begin
    desc := Format(descFormat, Args);
   //WriteLogFile('%s @@ %s @ %s $ %s', [SeverityDesc(severity), FLogAppName, subject, desc]);
   WriteLogFile('%s @ %s $ %s', [SeverityDesc(severity), subject, desc]);
end;
end;


function TLogFile.WriteLogFile(const szFormat: string;
const Args: array of const): Boolean;
var
fileName: string;
currentTime: TDateTime;
currentTimeStamp: TTimeStamp;
currentSQLTimeStamp: TSQLTimeStamp;
buffer: string;
szDate, szTime: string;
begin
result := false;


//�����ٽ���,��֤���̻߳����´˺����ܰ�ȫִ��
FCsWriteLogFile.Enter();
try
    currentTime := Now();      //ע������õ�����local time
    currentSQLTimeStamp := DateTimeToSQLTimeStamp(currentTime);
    currentTimeStamp := DateTimeToTimeStamp(currentTime);

    try
      // 1. close the current log file?
      if (FLogOpened and
          (currentTimeStamp.Date <> FFileTimeStamp.Date)) then
      begin
        CloseFile(FLogFile);
        FLogOpened := False;
      end;

      // 2. whether to open a new log file?
      if (not FLogOpened) then
      begin
        // 2.1���ָ������־Ŀ¼������,�򴴽���
        if not DirectoryExists(FLogPath) then
          if not ForceDirectories(FLogPath) then exit;

        // 2.2 Ȼ���ٴ򿪵�ǰ��־�ļ�
        szDate := Format('%4d%2d%2d%',
              [currentSQLTimeStamp.Year, currentSQLTimeStamp.Month, currentSQLTimeStamp.Day]);
        // Format������֧���ڿ�Ȳ���λ��0��ֻ����replace���
        szDate := StringReplace(szDate, ' ', '0', [rfReplaceAll]);

        fileName := Format('%s%s%s.log', [FLogPath, FLogAppName, szDate]);

        Assignfile(FLogFile, fileName);
        //if FileExists(fileName) then append(FLogFile)
        //else rewrite(FLogFile);

        //$1 modify by zhajl 2005-11-30
        // ����޷�����־�ļ������˳�
        try
          if FileExists(fileName) then append(FLogFile)
          else rewrite(FLogFile);
          FLogOpened := True;
        except
          // ����޷�����־�ļ�
          FLogOpened := False;
          //������CloseFile������쳣
          //CloseFile(FLogFile);
          exit;
        end;

        // �����ļ�����ʱ�䡣Ҫע�������� local time
        FFileTimeStamp := DateTimeToTimeStamp(currentTime);
      end;

      // 3. д��־����
      ASSERT(FLogOpened);
      if (FLogOpened) then
      begin
        szDate := Format('%4d%2d%2d%',
              [currentSQLTimeStamp.Year, currentSQLTimeStamp.Month, currentSQLTimeStamp.Day]);
        // Format������֧���ڿ�Ȳ���λ��0��ֻ����replace���
        szDate := StringReplace(szDate, ' ', '0', [rfReplaceAll]);
        szTime := Format('%2d:%2d:%2d',
              [currentSQLTimeStamp.Hour, currentSQLTimeStamp.Minute, currentSQLTimeStamp.Second]);
        szTime := StringReplace(szTime, ' ', '0', [rfReplaceAll]);

        buffer := Format('%s %s ', [szDate, szTime]); // '%4d/%2d/%2d %2d:%2d:%2d '
        buffer := buffer + szFormat;
        buffer := Format(buffer, Args);

        writeln(FLogFile, buffer);
        Flush(FLogFile); // �Ƿ������ܶ�ע��֮��
      end;
    except
      //д��־�ļ������������쳣(��Ŀ¼��ֻ���ĵ�),�������
    end;
finally
    FCsWriteLogFile.Leave; //�뿪�ٽ���
end;
result := true;
Memo.Lines.Append(buffer);;
end;

end.
