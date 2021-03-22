unit paramcastmove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxPC, ComCtrls, Xwxh,
  cxCheckBox, cxDBEdit, DB, DBTables, Wwtable;

type
  TFParamCastMove = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtOk: TcxButton;
    Page: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    EtSF_Number: TcxTextEdit;
    cxLabel19: TcxLabel;
    EtRx3: TcxTextEdit;
    cxLabel10: TcxLabel;
    EtRx2: TcxTextEdit;
    EtRx1: TcxTextEdit;
    LbStrategy: TListBox;
    TbPt: TwwTable;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    EtStimulus_Color: TcxComboBox;
    cxLabel6: TcxLabel;
    EtStrategy: TcxComboBox;
    cxLabel3: TcxLabel;
    EtStimulus_Size: TcxComboBox;
    cxLabel14: TcxLabel;
    EtBackground_Color: TcxComboBox;
    cxLabel30: TcxLabel;
    EtDot_Number: TcxTextEdit;
    EtRange: TcxTextEdit;
    EtAlarm_Mode: TcxComboBox;
    cxLabel8: TcxLabel;
    cxLabel2: TcxLabel;
    EtMoveSpeed: TcxComboBox;
    cxLabel7: TcxLabel;
    EtDynamic_Value: TcxTextEdit;
    cxLabel1: TcxLabel;
    EtMoveMode: TcxComboBox;
    cxLabel9: TcxLabel;
    EtMoveDistance: TcxComboBox;
    cxLabel13: TcxLabel;
    EtFixation_Mode: TcxComboBox;
    EtDB0: TcxComboBox;
    EtDB1: TcxComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    cxCheckBoxBlind: TcxCheckBox;
    procedure BtOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EtDB0PropertiesChange(Sender: TObject);
    procedure EtDB1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckData:TCheckData;
  end;

var
  FParamCastMove: TFParamCastMove;

implementation

uses Myutils;

{$R *.dfm}

procedure TFParamCastMove.BtOkClick(Sender: TObject);
begin
  CheckData.pm.Strategy:=EtStrategy.ItemIndex+30;
  CheckData.pm.Stimulus_Color:=EtStimulus_Color.ItemIndex;
  CheckData.pm.Fixation_Mode:=EtFixation_Mode.ItemIndex;
  CheckData.pm.Alarm_Mode:=EtAlarm_Mode.ItemIndex+1;
  CheckData.pm.Stimulus_Size:=EtStimulus_Size.ItemIndex;
  CheckData.pm.Background_Color:=EtBackground_Color.ItemIndex;
  CheckData.pm.Rx:=EtRx.ItemIndex;

  CheckData.pm.Range:=StrtoInt(EtRange.Text);
  CheckData.pm.Hold_Time:=StrtoInt(EtHold_Time.Text);
  CheckData.pm.Delay_Time:=StrtoInt(EtDelay_Time.Text);
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

  CheckData.pm.MoveSpeed:=EtMoveSpeed.ItemIndex;
  CheckData.pm.Dynamic_Value:=StrtoInt(EtDynamic_Value.Text);
  CheckData.pm.MoveMode:=EtMoveMode.ItemIndex;
  CheckData.pm.MoveDistance:=EtMoveDistance.ItemIndex;
  CheckData.pm.Fovea:=0;
end;

procedure TFParamCastMove.FormShow(Sender: TObject);
var
  db0,db1:integer;
begin
  EtStrategy.ItemIndex:=CheckData.pm.Strategy-30;

  EtStimulus_Color.ItemIndex:=CheckData.pm.Stimulus_Color;
  EtFixation_Mode.ItemIndex:=CheckData.pm.Fixation_Mode;
  EtAlarm_Mode.ItemIndex:=CheckData.pm.Alarm_Mode-1;
  EtStimulus_Size.ItemIndex:=CheckData.pm.Stimulus_Size;
  EtBackground_Color.ItemIndex:=CheckData.pm.Background_Color;
  EtRx.ItemIndex:=CheckData.pm.Rx;

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

  EtMoveSpeed.ItemIndex:=CheckData.pm.MoveSpeed;
  EtDynamic_Value.Text:=IntToStr(CheckData.pm.Dynamic_Value);
  DBtoDB2(CheckData.pm.Dynamic_Value, db0, db1);
  EtDb0.ItemIndex:=db0;
  EtDb1.ItemIndex:=db1;
  EtMoveMode.ItemIndex:=CheckData.pm.MoveMode;
  EtMoveDistance.ItemIndex:=CheckData.pm.MoveDistance;
end;

procedure TFParamCastMove.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  EtAlarm_Mode.Enabled:=XwData.EyeMove;
end;

procedure TFParamCastMove.EtDB0PropertiesChange(Sender: TObject);
begin
  EtDynamic_Value.Text:=IntToStr(DB2toDB(EtDB0.ItemIndex, EtDB1.ItemIndex));
end;

procedure TFParamCastMove.EtDB1PropertiesChange(Sender: TObject);
begin
  EtDynamic_Value.Text:=IntToStr(DB2toDB(EtDB0.ItemIndex, EtDB1.ItemIndex));
end;

end.
