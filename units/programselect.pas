unit programselect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ComCtrls, cxControls, cxContainer,
  cxListView, StdCtrls, cxButtons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DB,
  Wwdatsrc, DBTables, Wwtable, cxPC, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TFProgramSelect = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    TbPt: TwwTable;
    DsPt: TwwDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    BtOk: TcxButton;
    BtCancel: TcxButton;
    TabType: TcxTabControl;
    EtPtNameDBTableView1: TcxGridDBTableView;
    EtPtNameLevel1: TcxGridLevel;
    EtPtName: TcxGrid;
    EtPtNameDBTableView1Name: TcxGridDBColumn;
    EtPtNameDBTableView1Id: TcxGridDBColumn;
    EtPtNameDBTableView1Type: TcxGridDBColumn;
    EtPtNameDBTableView1State: TcxGridDBColumn;
    EtPtNameDBTableView1Gray: TcxGridDBColumn;
    EtPtNameDBTableView1GHT: TcxGridDBColumn;
    EtPtNameDBTableView1Dev: TcxGridDBColumn;
    EtPtNameDBTableView1Xby: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy0: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy1: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy2: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy3: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy4: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy5: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy6: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy7: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy8: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy9: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy10: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy11: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy12: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy13: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy14: TcxGridDBColumn;
    EtPtNameDBTableView1Strategy15: TcxGridDBColumn;
    EtPtNameDBTableView1Report0: TcxGridDBColumn;
    EtPtNameDBTableView1Report1: TcxGridDBColumn;
    EtPtNameDBTableView1Report2: TcxGridDBColumn;
    EtPtNameDBTableView1Report3: TcxGridDBColumn;
    EtPtNameDBTableView1Report4: TcxGridDBColumn;
    EtPtNameDBTableView1Report5: TcxGridDBColumn;
    EtPtNameDBTableView1Report6: TcxGridDBColumn;
    EtPtNameDBTableView1Report7: TcxGridDBColumn;
    EtPtNameDBTableView1Report8: TcxGridDBColumn;
    EtPtNameDBTableView1Report9: TcxGridDBColumn;
    EtPtNameDBTableView1Report10: TcxGridDBColumn;
    EtPtNameDBTableView1Report11: TcxGridDBColumn;
    EtPtNameDBTableView1Report12: TcxGridDBColumn;
    EtPtNameDBTableView1Report13: TcxGridDBColumn;
    EtPtNameDBTableView1Report14: TcxGridDBColumn;
    EtPtNameDBTableView1Report15: TcxGridDBColumn;
    EtPtNameDBTableView1Res1: TcxGridDBColumn;
    EtPtNameDBTableView1Res2: TcxGridDBColumn;
    EtPtNameDBTableView1Res3: TcxGridDBColumn;
    EtPtNameDBTableView1Res4: TcxGridDBColumn;
    EtPtNameDBTableView1Res5: TcxGridDBColumn;
    EtPtNameDBTableView1Res6: TcxGridDBColumn;
    EtPtNameDBTableView1Res7: TcxGridDBColumn;
    EtPtNameDBTableView1Res8: TcxGridDBColumn;
    EtPtNameDBTableView1Res9: TcxGridDBColumn;
    EtPtNameDBTableView1Res10: TcxGridDBColumn;
    EtPtNameDBTableView1CheckData: TcxGridDBColumn;
    Panel5: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    procedure TabTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EtPtNameDBTableView1DblClick(Sender: TObject);
    procedure EtPtNameDBTableView1NameGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
  public
    { Public declarations }
  end;

var
  FProgramSelect: TFProgramSelect;

implementation

uses Myutils, xwxh;

{$R *.dfm}

procedure TFProgramSelect.TabTypeChange(Sender: TObject);
var
  s:string;
begin
  s:='(Type='+IntToStr(TabType.TabIndex)+')';
  if DemoCheckData.devicetype=0 then s:=s+' and (cast<>1)';  //≤ºµ„
  if DemoCheckData.devicetype=1 then s:=s+' and (cast<>2)';  //Õ∂…‰
  TbPt.Filter:=s;
end;

procedure TFProgramSelect.FormCreate(Sender: TObject);
begin
  TrForm(Self);
  if DemoCheckData.devicetype=1 then
  begin
    TabType.Tabs.Add(Tr('Move'));
    TabType.Tabs.Add(Tr('MoveCustom'));
  end;
end;

procedure TFProgramSelect.EtPtNameDBTableView1DblClick(Sender: TObject);
begin
  Self.ModalResult:=mrOk;
end;

procedure TFProgramSelect.EtPtNameDBTableView1NameGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText:=GetPTName(AText, ARecord.Values[2]);
end;

end.
