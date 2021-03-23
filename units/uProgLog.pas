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
    FLogKeepDays: Integer; //日志保存时间
    FLogLevel: DWORD;      //日志级别
    FLogPath: string;      //日志保存路径，以"\"结尾
    FLogAppName: string;   //应用程序名(日志文件前缀)

    FCsWriteLogFile: TCriticalSection;
    FLogFile: TextFile;    //日志文件句柄
    FLogOpened: Boolean;   //日志文件是否打开
    FFileTimeStamp: TTimeStamp; //当前日志文件创建或打开时间

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
    //Describe: 记录日志到日志文件。如果日志文件路径不存在，会自动创建。如果日志文件不存在，
    //          则创建相应的日志文件；如果日子文件已存在，则打开相应的日志文件，并将日志添加到文件结尾。
    //Input   : severity: 日志级别。根据日志级别参数决定该级别日志是否需要保存，
    //            但LogLevel级别的日志不受日志级别参数影响，都保存到了日志文件。
    //          subject: 模块名称。
    //          desc: 日志内容。
    //Result : N/A
    //Catch Exception: No
    ////////////////////////////////////////////////////////////////////////////
    procedure Trace(severity: EnumSeverity; const subject, desc: string); overload;

    ////////////////////////////////////////////////////////////////////////////
    //Procedure/Function Name: Trace()
    //Describe: 记录日志到日志文件。如果日志文件路径不存在，会自动创建。如果日志文件不存在，
    //          则创建相应的日志文件；如果日子文件已存在，则打开相应的日志文件，并将日志添加到文件结尾。
    //Input   : severity: 日志级别。根据日志级别参数决定该级别日志是否需要保存，
    //            但LogLevel级别的日志不受日志级别参数影响，都保存到了日志文件。
    //          subject: 模块名称。
    //          descFormat: 包含格式化信息的日志内容。
    //          Args: 格式化参数数组。
    //Result : N/A
    //Catch Exception: No
    ////////////////////////////////////////////////////////////////////////////
    procedure Trace(severity: EnumSeverity; const subject, descFormat: string; const Args: array of const); overload;

    ////////////////////////////////////////////////////////////////////////////
    //Procedure/Function Name: DeleteLogFile()
    //Describe: 删除超过保存期限的日志文件。在日志文件路径中搜索超过保存期限的日志，将之删除。
    //          该方法只需在应用程序启动时调用一次，以删除超过保存期限的日志。
    //Input   : N/A
    //Result : Boolean 成功返回TRUE，失败返回FALSE
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
          // 按照文件创建日期删除文件
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
// 根据配置的日志级别决定是否写日志
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
// 根据配置的日志级别决定是否写日志
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


//进入临界区,保证多线程环境下此函数能安全执行
FCsWriteLogFile.Enter();
try
    currentTime := Now();      //注意这里得到的是local time
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
        // 2.1如果指定的日志目录不存在,则创建它
        if not DirectoryExists(FLogPath) then
          if not ForceDirectories(FLogPath) then exit;

        // 2.2 然后再打开当前日志文件
        szDate := Format('%4d%2d%2d%',
              [currentSQLTimeStamp.Year, currentSQLTimeStamp.Month, currentSQLTimeStamp.Day]);
        // Format函数不支持在宽度不足位添0，只好用replace添加
        szDate := StringReplace(szDate, ' ', '0', [rfReplaceAll]);

        fileName := Format('%s%s%s.log', [FLogPath, FLogAppName, szDate]);

        Assignfile(FLogFile, fileName);
        //if FileExists(fileName) then append(FLogFile)
        //else rewrite(FLogFile);

        //$1 modify by zhajl 2005-11-30
        // 如果无法打开日志文件，则退出
        try
          if FileExists(fileName) then append(FLogFile)
          else rewrite(FLogFile);
          FLogOpened := True;
        except
          // 如果无法打开日志文件
          FLogOpened := False;
          //这里用CloseFile会出现异常
          //CloseFile(FLogFile);
          exit;
        end;

        // 更新文件创建时间。要注意这里是 local time
        FFileTimeStamp := DateTimeToTimeStamp(currentTime);
      end;

      // 3. 写日志内容
      ASSERT(FLogOpened);
      if (FLogOpened) then
      begin
        szDate := Format('%4d%2d%2d%',
              [currentSQLTimeStamp.Year, currentSQLTimeStamp.Month, currentSQLTimeStamp.Day]);
        // Format函数不支持在宽度不足位添0，只好用replace添加
        szDate := StringReplace(szDate, ' ', '0', [rfReplaceAll]);
        szTime := Format('%2d:%2d:%2d',
              [currentSQLTimeStamp.Hour, currentSQLTimeStamp.Minute, currentSQLTimeStamp.Second]);
        szTime := StringReplace(szTime, ' ', '0', [rfReplaceAll]);

        buffer := Format('%s %s ', [szDate, szTime]); // '%4d/%2d/%2d %2d:%2d:%2d '
        buffer := buffer + szFormat;
        buffer := Format(buffer, Args);

        writeln(FLogFile, buffer);
        Flush(FLogFile); // 是否考虑性能而注释之？
      end;
    except
      //写日志文件操作中若有异常(如目录是只读的等),则忽略它
    end;
finally
    FCsWriteLogFile.Leave; //离开临界区
end;
result := true;
Memo.Lines.Append(buffer);;
end;

end.
