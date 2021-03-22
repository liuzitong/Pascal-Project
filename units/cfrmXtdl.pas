unit cfrmXtdl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons,inifiles,Mask, ComCtrls,
  ActnList, cxControls, cxContainer, cxEdit, cxLabel, Wwquery, DB, DBTables,
  Wwtable;

type
  TfrmXtdl = class(TForm)
    BitBtnok: TBitBtn;
    BitBtnfq: TBitBtn;
    Editkl: TEdit;
    Label1: TLabel;
    QueryDl: TwwQuery;
    Labelyh: TcxLabel;
    Labelkl: TcxLabel;
    ComboBoxyh: TComboBox;
    Panel2: TPanel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnokClick(Sender: TObject);
    procedure BitBtnfqClick(Sender: TObject);
    procedure ComboBoxyhKeyPress(Sender: TObject; var Key: Char);
    procedure EditklKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    myhmc,mdlmmc: string;

    function Isoktz:boolean;
  public
    { Public declarations }
  end;

var
  frmXtdl: TfrmXtdl;

implementation

uses dm;

{$R *.DFM}
procedure TfrmXtdl.FormCreate(Sender: TObject);
begin
  pubpassword := isoktz();
  ActiveControl:=ComboBoxyh;
  ComboBoxyh.itemindex:=0;
  pubpassword:=False;
end;

function TfrmXtdl.Isoktz:boolean;
var
  mysql: string;
begin
  result:=False;
  with QueryDl do
  begin
    Close;
    open;
    first;
    comboboxyh.items.clear;
    while not Eof do
    begin
      comboboxyh.items.add(fieldbyname('username').AsString);
      next;
    end;
    if (comboboxyh.items.Count>0) then
    begin
      comboboxyh.enabled:=True;
      comboboxyh.color:=clwhite;
      editkl.text:='';
      editkl.enabled:=True;
      editkl.color:=clwhite;
      BitBtnok.enabled:=True;
      result:=True;
    end;
  end;
end;

procedure TfrmXtdl.BitBtnokClick(Sender: TObject);
var
  prmypass,prtmpstr,prstr,mymess:string;
begin
  pubpassword := False;
  prmypass := '';
  if comboboxyh.ItemIndex>=0 then
  begin
    prtmpstr:=trim(comboboxyh.Items[comboboxyh.ItemIndex]);
    with QueryDl do
    begin
      first;
      if Locate('username',prtmpstr,[loCaseInsensitive]) then
      begin
        prmypass := trim(fieldbyname('passw').asstring);
        if prmypass=trim(editkl.text) then
        begin
          pubpassword:=True;
          pubDlr := prtmpstr;
          pubAdmin := fieldbyname('adminuser').AsBoolean;
        end
        else
          Application.MessageBox('密码错误','系统提示', mb_OK+mb_DefButton1+mb_iconstop);
      end
      else
          Application.MessageBox('用户不存在','系统提示', mb_OK+mb_DefButton1+mb_iconstop);
    end;
  end;

  if pubpassword then
  begin
    QueryDl.Close;
  {
    if pubAdmin=false then
    with frmDataUnit.PatientTable do
    begin
      frmDataUnit.PatientTable.Filter := 'Physician='''+prtmpstr+'''';
    end;
    }
    Close;
  end;
end;

procedure TfrmXtdl.BitBtnfqClick(Sender: TObject);
begin
  pubpassword:=False;
  Close;
end;

procedure TfrmXtdl.ComboBoxyhKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  if Editkl.Enabled then Editkl.SetFocus;
end;

procedure TfrmXtdl.EditklKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  if BitBtnok.Enabled then
    BitBtnokClick(BitBtnok);
end;

procedure TfrmXtdl.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    ComboBoxyh.SetFocus;
end;


end.
