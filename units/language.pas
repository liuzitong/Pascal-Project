unit language;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb, ShellApi,
  cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxCheckBox, Grids, pubpas,
  ComCtrls, Menus, cxLookAndFeelPainters, cxButtons, DB, Wwdatsrc,
  DBTables, Wwtable, DBGrids, DBCtrls;

type
  TFlanguage = class(TForm)
    EtYkFilter: TcxCheckBox;
    GridYK3x3: TStringGrid;
    BitBtn1: TBitBtn;
    OpenDialogBin: TOpenDialog;
    LabelBbh: TLabel;
    LabelSbbhV: TLabel;
    LabelCsch: TLabel;
    Label1: TLabel;
    EtCountry: TwwDBComboBox;
    EtHospital: TcxTextEdit;
    Label2: TLabel;
    EtName2: TcxCheckBox;
    EtEyeMove: TcxCheckBox;
    StatusBarBottom: TStatusBar;
    Panel2: TPanel;
    Label3: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    DBNavigator2: TDBNavigator;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    USERLOGOTable: TwwTable;
    userlogoS: TwwDataSource;
    BtSave: TcxButton;
    cxButton2: TcxButton;
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EtCountryCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    language:boolean;

    procedure AddToHistory(Str: string);
  public
    { Public declarations }
  end;

var
  Flanguage: TFlanguage;
  ReStart:boolean;

implementation

uses Myutils, dm, xwxh, main;

{$R *.dfm}

var
  Country:array[0..1] of string=('en', 'cn');

procedure TFlanguage.BtOkClick(Sender: TObject);
begin
  if not language then
  begin
    Close;
    exit;
  end;
  if EtCountry.ItemIndex=0 then begin
    if ShellExecute(0, 'OPEN', PChar('xcopy'), Pchar('/y '+ExeFilePath+'en\*.* '+ExeFilePath), nil, SW_HIDE)<=32 then Jgxx('Error Copy');
  end
  else if EtCountry.ItemIndex=1 then begin
    if ShellExecute(0, 'OPEN', PChar('xcopy'), Pchar('/y '+ExeFilePath+'cn\*.* '+ExeFilePath), nil, SW_HIDE)<=32 then Jgxx('Error Copy');
  end;
  if Xwxx('Restart software')<>IDYES then exit;

  Application.Terminate;
  ReStart:=True;
end;

procedure TFlanguage.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  EtHospital.Text:=XwData.Hospital;
  EtName2.Checked:=XwData.Name2;
  EtEyeMove.Checked:=XwData.EyeMove;
  EtYkFilter.Checked:=XwData.YkFilter;
  GridYK3x3.Cells[0, 0]:=Format('%0.1f', [XwData.Yk3x3[1, 1]]);
  GridYK3x3.Cells[0, 1]:=Format('%0.1f', [XwData.Yk3x3[2, 1]]);
  GridYK3x3.Cells[0, 2]:=Format('%0.1f', [XwData.Yk3x3[3, 1]]);
  GridYK3x3.Cells[1, 0]:=Format('%0.1f', [XwData.Yk3x3[1, 2]]);
  GridYK3x3.Cells[1, 1]:=Format('%0.1f', [XwData.Yk3x3[2, 2]]);
  GridYK3x3.Cells[1, 2]:=Format('%0.1f', [XwData.Yk3x3[3, 2]]);
  GridYK3x3.Cells[2, 0]:=Format('%0.1f', [XwData.Yk3x3[1, 3]]);
  GridYK3x3.Cells[2, 1]:=Format('%0.1f', [XwData.Yk3x3[2, 3]]);
  GridYK3x3.Cells[2, 2]:=Format('%0.1f', [XwData.Yk3x3[3, 3]]);

  if SaveDataHead.DEVTYPE = $8800 then
  begin
    LabelSbbhV.Caption := '设备号：'+inttostr(SaveDataBd.DEVID);
    LabelBbh.Caption := '版本号：'+inttostr(SaveDataBd.VERSION);
    LabelCsch.Caption := '校验号：'+inttostr(SaveDataBd.SerialNo);
  end
  else if SaveDataHead.DEVTYPE = $0088 then
  begin
    LabelSbbhV.Caption := '设备号：'+inttostr(SaveDataTs.DEVID);
    LabelBbh.Caption := '版本号：'+inttostr(SaveDataTs.VERSION);
    LabelCsch.Caption := '校验号：'+inttostr(SaveDataTs.SerialNo);
  end;
 {
  if pubAdmin  then
  begin
    Panel4.Visible := true;
    BitBtn1.Visible := true;
    Height:=738;
  end;
  }

  //if XwData.oprank=3 then Height:=303;
end;

procedure TFlanguage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  XwData.Hospital:=EtHospital.Text;
  XwData.Name2:=EtName2.Checked;
  XwData.EyeMove:=EtEyeMove.Checked;
  XwData.YkFilter:=EtYkFilter.Checked;
  XwData.Yk3x3[1, 1]:=StrToFloat(GridYK3x3.Cells[0, 0]);
  XwData.Yk3x3[2, 1]:=StrToFloat(GridYK3x3.Cells[0, 1]);
  XwData.Yk3x3[3, 1]:=StrToFloat(GridYK3x3.Cells[0, 2]);
  XwData.Yk3x3[1, 2]:=StrToFloat(GridYK3x3.Cells[1, 0]);
  XwData.Yk3x3[2, 2]:=StrToFloat(GridYK3x3.Cells[1, 1]);
  XwData.Yk3x3[3, 2]:=StrToFloat(GridYK3x3.Cells[1, 2]);
  XwData.Yk3x3[1, 3]:=StrToFloat(GridYK3x3.Cells[2, 0]);
  XwData.Yk3x3[2, 3]:=StrToFloat(GridYK3x3.Cells[2, 1]);
  XwData.Yk3x3[3, 3]:=StrToFloat(GridYK3x3.Cells[2, 2]);
  SaveXwData;
end;

procedure TFlanguage.EtCountryCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  language:=True;
end;

procedure TFlanguage.BitBtn1Click(Sender: TObject);
var
  iFileHandle: Integer;
  iFileLength: Integer;
  iBytesRead: Integer;
//  Buffer: PChar;
  Buffer: array[0..58796] of Byte;
  i,j,k: Integer;
  updateok: boolean;
  myCount,StartTime,LI:TLARGEINTEGER;

  Buf: array [0..64] of Byte;
  Written: Cardinal;
  ToWrite,mywrited: Cardinal;
  Str: string;
  Err: DWORD;
begin
  if application.messagebox('是否升级固件?','系统管理',mb_yesno or mb_ICONinformation)=idyes then
  begin
    updateok := true;
    Fillchar(Buffer, sizeof(Buffer), $FF);
    if OpenDialogBin.Execute then
    begin
      if application.messagebox('升级中途严禁断电，若出现异常情况，请与设备制造商联系，是否确认升级固件?','系统管理',mb_yesno or mb_ICONinformation)=idyes then
      begin
        try
          iFileHandle := FileOpen(OpenDialogBin.FileName, fmOpenRead);
          iFileLength := FileSeek(iFileHandle,0,2);
          FileSeek(iFileHandle,0,0);
          iBytesRead := FileRead(iFileHandle, Buffer[1], iFileLength);

          StatusBarBottom.SimpleText := '';

          Buffer[0] := StrToIntDef('$00', 0);

          FileClose(iFileHandle);

          Fillchar(Buf, sizeof(Buf), 0);
          Buf[0] := StrToIntDef('$00', 0);
          Buf[1]:=$bb;
          Buf[2]:=$0c;
          Buf[3]:=$dd;
          Buf[4]:=$c9;

          Buf[56]:=$44;
          ToWrite := FMain.CurrentDevice.Caps.OutputReportByteLength;

          Buf[63]:=$0e;
          Buf[64]:=$0f;

          if not FMain.CurrentDevice.WriteFile(Buf, ToWrite, Written) then
          begin
            Err := GetLastError;

            AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));

            StatusBarBottom.SimpleText := '写入44出错！';
            updateok := false;
            exit;
          end;
          sleep(30);

          Fillchar(Buf, sizeof(Buf), 0);
          Buf[0] := StrToIntDef('$00', 0);
          Buf[1]:=$bb;
          Buf[2]:=$0c;
          Buf[3]:=$dd;
          Buf[4]:=$c9;

          Buf[56]:=$88;
    //      Buf[56]:=$44;
          Buf[57]:=iFileLength div 256;
          Buf[58]:=iFileLength mod 256;

          ToWrite := FMain.CurrentDevice.Caps.OutputReportByteLength;

          Buf[63]:=$0e;
          Buf[64]:=$0f;
          i := 1;
          while (not FMain.CurrentDevice.WriteFile(Buf, ToWrite, Written)) and (i<10) do
          begin
            Err := GetLastError;

            AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));

            StatusBarBottom.SimpleText := inttostr(i)+'次 写入88出错！';
            StatusBarBottom.Refresh;
            i := i+1;
            sleep(30);
          end;

          j := iFileLength div 64;
          if Assigned(FMain.CurrentDevice) then
          begin
            i := 1;
            while i<=j+1 do
            begin
              Fillchar(Buf, sizeof(Buf), $FF);
              Buf[0] := StrToIntDef('$00', 0);
              ToWrite := FMain.CurrentDevice.Caps.OutputReportByteLength;
              Move(Buffer[(i-1)*64+1], Buf[1], 64);
              if not FMain.CurrentDevice.WriteFile(Buf, ToWrite, Written) then
              begin
                Err := GetLastError;

                AddToHistory(Format('WRITE ERROR: %s (%x)', [SysErrorMessage(Err), Err]));
                StatusBarBottom.SimpleText := '固件第：'+inttostr(i)+' 出错！';
                updateok := false;
                break;
              end
              else
              begin
                Str := Format('W %.2x  ', [Buf[0]]);
                for k := 1 to Written-1 do
                  Str := Str + Format('%.2x ', [Buf[k]]);
    //            AddToHistory(Str);
                StatusBarBottom.SimpleText := '固件第：'+inttostr(i)+' OK ';

               /////等待间隔时间
                QueryPerformanceFrequency(li);
                myCount:=round((li/1000)*8); //li* pubPrefer.flashtime;
                QueryPerformanceCounter(StartTime);
                repeat
                  Application.ProcessMessages;
                  QueryPerformanceCounter(li);
                until li-StartTime > myCount;
              end;
              i := i+1;
            end;
          end;
          if updateok then
            application.messagebox('固件升级成功，请退出系统后，重新进入！','系统管理')
          else
            application.messagebox('固件升级失败，请重新操作！','系统管理');
        finally
          //FreeMem(Buffer);
        end;
      end;
    end;

  end;
end;

procedure TFlanguage.AddToHistory(Str: string);
var
  f:integer;
  s:string;
begin
  if  FMain.CheckBoxDebug.Checked then
  begin
    s:=ExeFilePath+'DEBUG.txt';
    if not FileExists(s) then begin
      f:=FileCreate(s);
    end
    else begin
      f:=FileOpen(s, fmOpenWrite);
      FileSeek(f, 0, 2);
    end;
    s:=Str+#13#10;
    FileWrite(f, s[1], Length(s));
    FileClose(f);
  end;
end;

procedure TFlanguage.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFlanguage.SpeedButton2Click(Sender: TObject);
begin
  with USERLOGOTable do
  begin
    if recordcount<2 then
      exit;
    if application.messagebox('确认删除?','提示',mb_yesno or mb_ICONinformation)=idno then
      exit;
    Delete;
  end;
end;

end.
