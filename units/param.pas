unit param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxPC, ComCtrls, Xwxh,
  cxCheckBox, cxDBEdit, DB, DBTables, Wwtable, Spin, uProglog,Myutils;

type
  TFParam = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtOk: TcxButton;
    Page: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxLabel4: TcxLabel;
    EtRange: TcxTextEdit;
    cxLabel5: TcxLabel;
    EtStimulus_Color: TcxComboBox;
    cxLabel6: TcxLabel;
    EtStrategy: TcxComboBox;
    cxLabel7: TcxLabel;
    EtFixation_Mode: TcxComboBox;
    EtAlarm_Mode: TcxComboBox;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    EtSF: TcxComboBox;
    cxLabel17: TcxLabel;
    EtFovea: TcxComboBox;
    cxLabel14: TcxLabel;
    EtBackground_Color: TcxComboBox;
    cxLabel11: TcxLabel;
    EtHold_Time: TcxTextEdit;
    cxLabel12: TcxLabel;
    EtDelay_Time: TcxTextEdit;
    cxLabel21: TcxLabel;
    EtFixation_Value: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    EtRx: TcxComboBox;
    cxLabel30: TcxLabel;
    EtDot_Number: TcxTextEdit;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel37: TcxLabel;
    EtFalse_POS_Cycle: TcxTextEdit;
    EtFalse_NEG_Cycle: TcxTextEdit;
    EtFixation_Cycle: TcxTextEdit;
    EtEB_Light_sv: TcxTextEdit;
    EtB_Light_sv: TcxTextEdit;
    BtCancel: TcxButton;
    EtInit_Strategy: TcxComboBox;
    cxLabel34: TcxLabel;
    EtSF_Number: TcxTextEdit;
    cxLabel19: TcxLabel;
    EtRx3: TcxTextEdit;
    cxLabel10: TcxLabel;
    EtRx2: TcxTextEdit;
    EtRx1: TcxTextEdit;
    cxLabel13: TcxLabel;
    EtFixation_Monitor: TcxComboBox;
    LbStrategy: TListBox;
    TbPt: TwwTable;
    EtInit_Value: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EtDelay_Mode: TcxComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    cxLabel15: TcxLabel;
    EtLightSpinEdit: TSpinEdit;
    cxCheckBoxBlind: TcxCheckBox;
    EtJgSpinEdit: TSpinEdit;
    procedure BtOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EtDelay_ModePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckData:TCheckData;
  end;

var
  FParam: TFParam;

implementation


{$R *.dfm}

procedure TFParam.BtOkClick(Sender: TObject);
begin
  if EtStrategy.ItemIndex<>-1 then CheckData.pm.Strategy:=StrtoInt(LbStrategy.Items[EtStrategy.ItemIndex]);
  TLogFile.GetInstance.Trace(LogLevel,'CheckData.pm.Strategy value is',IntToStr(CheckData.pm.Strategy));
  CheckData.pm.Stimulus_Color:=EtStimulus_Color.ItemIndex;

  //去掉了空白项
  if (EtFixation_Mode.ItemIndex>0) then
  begin
    CheckData.pm.Fixation_Mode:=EtFixation_Mode.ItemIndex+2;
  end
  else
  begin
    CheckData.pm.Fixation_Mode:=EtFixation_Mode.ItemIndex;
  end;

  CheckData.pm.Alarm_Mode:=EtAlarm_Mode.ItemIndex+1;
  CheckData.pm.SF:=EtSF.ItemIndex;
  CheckData.pm.Delay_Mode:=EtDelay_Mode.ItemIndex;
  CheckData.pm.Stimulus_Size:=2;
  CheckData.pm.Fovea:=EtFovea.ItemIndex;
  CheckData.pm.Background_Color:=EtBackground_Color.ItemIndex;
  CheckData.pm.Rx:=EtRx.ItemIndex;
  CheckData.pm.Init_Strategy:=EtInit_Strategy.ItemIndex;
  CheckData.pm.Init_Value:=StrtoInt(EtInit_Value.Text);
  CheckData.pm.Fixation_Monitor:=EtFixation_Monitor.ItemIndex;

  CheckData.pm.Range:=StrtoInt(EtRange.Text);
  CheckData.pm.Hold_Time:=StrtoInt(EtHold_Time.Text);
  CheckData.pm.Delay_Time:=StrtoInt(EtDelay_Time.Text);

  CheckData.pm.Delay_Time := EtJgSpinEdit.Value;

  CheckData.pm.Fixation_Value:=StrtoInt(EtFixation_Value.Text);
  CheckData.pm.Blind_Value:=StrtoInt(EtFixation_Value.Text);
  CheckData.pm.Dot_Number:=StrtoInt(EtDot_Number.Text);
  CheckData.pm.False_POS_Cycle:=StrtoInt(EtFalse_POS_Cycle.Text);
  CheckData.pm.False_NEG_Cycle:=StrtoInt(EtFalse_NEG_Cycle.Text);
  CheckData.pm.Fixation_Cycle:=StrtoInt(EtFixation_Cycle.Text);
  CheckData.pm.SF_Number:=StrtoInt(EtSF_Number.Text);
  CheckData.pm.Rx1:=StrtoInt(EtRx1.Text);
  CheckData.pm.Rx2:=StrtoInt(EtRx2.Text);
  CheckData.pm.Rx3:=StrtoInt(EtRx3.Text);
  CheckData.pm.B_Light_sv:=StrtoInt(EtB_Light_sv.Text);
  CheckData.pm.EB_Light_sv:=StrtoInt(EtEB_Light_sv.Text);

  TLogFile.GetInstance.Trace(WarningLevel,'Checkdata.pm:',dataToStr(@CheckData.pm,SizeOf(CheckData.pm)));
end;

procedure TFParam.FormShow(Sender: TObject);
var
  i:integer;
begin
  EtStrategy.Properties.Items.Clear;
  LbStrategy.Items.Clear;
  if TbPt.FieldByName('Strategy0').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy0'));
    LbStrategy.Items.Add('0');
  end;
  if TbPt.FieldByName('Strategy1').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy1'));
    LbStrategy.Items.Add('1');
  end;
  if TbPt.FieldByName('Strategy2').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy2'));
    LbStrategy.Items.Add('2');
  end;
  if TbPt.FieldByName('Strategy3').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy3'));
    LbStrategy.Items.Add('3');
  end;
  if TbPt.FieldByName('Strategy10').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy10'));
    LbStrategy.Items.Add('10');
  end;
  if TbPt.FieldByName('Strategy11').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy11'));
    LbStrategy.Items.Add('11');
  end;
  if TbPt.FieldByName('Strategy12').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy12'));
    LbStrategy.Items.Add('12');
  end;
  if TbPt.FieldByName('Strategy13').AsInteger<>0 then begin
    EtStrategy.Properties.Items.Add(Tr('Strategy13'));
    LbStrategy.Items.Add('13');
  end;

  for i:=0 to LbStrategy.Items.Count-1 do begin
    if IntToStr(CheckData.pm.Strategy)=LbStrategy.Items[i] then begin
      EtStrategy.ItemIndex:=i;
      break;
    end;
  end;

  EtStimulus_Color.ItemIndex:=CheckData.pm.Stimulus_Color;

  //去掉了空白项
  if (CheckData.pm.Fixation_Mode>2) then
  begin
    EtFixation_Mode.ItemIndex:=CheckData.pm.Fixation_Mode-2;
  end
  else
  begin
    EtFixation_Mode.ItemIndex:=CheckData.pm.Fixation_Mode;
  end;

  EtAlarm_Mode.ItemIndex:=CheckData.pm.Alarm_Mode-1;
  EtSF.ItemIndex:=CheckData.pm.SF;
  EtDelay_Mode.ItemIndex:=CheckData.pm.Delay_Mode;

  if EtDelay_Mode.ItemIndex=1 then
  begin
    EtJgSpinEdit.Visible := True;
    EtLightSpinEdit.Visible := false;
  end
  else
  begin
    EtJgSpinEdit.Visible := false;
    EtLightSpinEdit.Visible := True;
  end;
  EtJgSpinEdit.Value := CheckData.pm.Delay_Time;

  EtFovea.ItemIndex:=CheckData.pm.Fovea;
  EtBackground_Color.ItemIndex:=CheckData.pm.Background_Color;
  EtRx.ItemIndex:=CheckData.pm.Rx;
  EtInit_Strategy.ItemIndex:=CheckData.pm.Init_Strategy;
  EtInit_Value.Text:=IntToStr(CheckData.pm.Init_Value);
  EtFixation_Monitor.ItemIndex:=CheckData.pm.Fixation_Monitor;

  EtRange.Text:=IntToStr(CheckData.pm.Range);
  EtHold_Time.Text:=IntToStr(CheckData.pm.Hold_Time);
  EtDelay_Time.Text:=IntToStr(CheckData.pm.Delay_Time);
  EtFixation_Value.Text:=IntToStr(CheckData.pm.Fixation_Value);
  EtDot_Number.Text:=IntToStr(CheckData.pm.Dot_Number);
  EtFalse_POS_Cycle.Text:=IntToStr(CheckData.pm.False_POS_Cycle);
  EtFalse_NEG_Cycle.Text:=IntToStr(CheckData.pm.False_NEG_Cycle);
  EtFixation_Cycle.Text:=IntToStr(CheckData.pm.Fixation_Cycle);
  EtSF_Number.Text:=IntToStr(CheckData.pm.SF_Number);
  EtRx1.Text:=IntToStr(CheckData.pm.Rx1);
  EtRx2.Text:=IntToStr(CheckData.pm.Rx2);
  EtRx3.Text:=IntToStr(CheckData.pm.Rx3);
  EtB_Light_sv.Text:=IntToStr(CheckData.pm.B_Light_sv);
  EtEB_Light_sv.Text:=IntToStr(CheckData.pm.EB_Light_sv);
end;

procedure TFParam.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  EtAlarm_Mode.Enabled:=XwData.EyeMove;
end;


procedure TFParam.EtDelay_ModePropertiesChange(Sender: TObject);
begin
  if EtDelay_Mode.ItemIndex=1 then
  begin
    EtJgSpinEdit.Visible := true;
    EtLightSpinEdit.Visible := false;
  end
  else
  begin
    EtJgSpinEdit.Visible := false;
    EtLightSpinEdit.Visible := True;
  end;
end;

end.
