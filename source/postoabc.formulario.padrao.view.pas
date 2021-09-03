unit postoabc.formulario.padrao.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, postoabc.conexao.datamodule, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, System.Actions, Vcl.ActnList;

type
  THackWinControl = class(TWinControl);

  TfrmCadPadrao = class(TForm)
    pcPrincipal: TPageControl;
    tbsListagem: TTabSheet;
    tbsDados: TTabSheet;
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    Panel1: TPanel;
    spdbtnExcluir: TSpeedButton;
    spdbtnEditar: TSpeedButton;
    spdbtnNovo: TSpeedButton;
    Panel2: TPanel;
    spdbtnSalvar: TSpeedButton;
    spdbtnCancelar: TSpeedButton;
    Panel3: TPanel;
    lblTitulo: TLabel;
    dbgListagem: TDBGrid;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ActionList1: TActionList;
    actNovo: TAction;
    actEditar: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    spdbtnAtualizar: TSpeedButton;
    actAtualizar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryCadastroAfterPost(DataSet: TDataSet);
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
    procedure actAtualizarExecute(Sender: TObject);
  private
    FIsNewRecord: Boolean;
    procedure SetIsNewRecord(const Value: Boolean);
    property IsNewRecord: Boolean read FIsNewRecord write SetIsNewRecord;
  public

  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

{$R *.dfm}

procedure TfrmCadPadrao.actAtualizarExecute(Sender: TObject);
begin
  qryCadastro.Refresh;
end;

procedure TfrmCadPadrao.actCancelarExecute(Sender: TObject);
begin
  if pcPrincipal.ActivePage = tbsDados then
  begin
    qryCadastro.Cancel;
    pcPrincipal.ActivePage := tbsListagem;
    if dbgListagem.CanFocus then
      dbgListagem.SetFocus;
  end
  else
    Close;
end;

procedure TfrmCadPadrao.actEditarExecute(Sender: TObject);
begin
  try
    pcPrincipal.ActivePage := tbsDados;
    THackWinControl(pcPrincipal.ActivePage).SelectFirst;
    qryCadastro.Edit;

  except on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao tentar editar esse registro.'+#13#10+'Motivo: '+E.Message);
    end;
  end;
end;

procedure TfrmCadPadrao.actNovoExecute(Sender: TObject);
begin
  try
    pcPrincipal.ActivePage := tbsDados;
    THackWinControl(pcPrincipal.ActivePage).SelectFirst;
    qryCadastro.Append;
  except on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao tentar criar um novo registro.'+#13#10+'Motivo: '+E.Message);
    end;
  end;
end;

procedure TfrmCadPadrao.actSalvarExecute(Sender: TObject);
begin
  try
    qryCadastro.Post;
    pcPrincipal.ActivePage := tbsListagem;
    if dbgListagem.CanFocus then
      dbgListagem.SetFocus;
  except on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao tentar salvar esse registro registro.'+#13#10+'Motivo: '+E.Message);
    end;
  end;
end;

procedure TfrmCadPadrao.dsCadastroDataChange(Sender: TObject; Field: TField);
begin
  spdbtnEditar.Enabled := not dsCadastro.DataSet.IsEmpty;
  spdbtnExcluir.Enabled := not dsCadastro.DataSet.IsEmpty;
  if dsCadastro.DataSet.State in [dsBrowse] then
    lblTitulo.Caption := 'Listagem de '+Self.Caption;
end;

procedure TfrmCadPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryCadastro.State in [dsInsert, dsEdit] then
    actCancelar.Execute;
end;

procedure TfrmCadPadrao.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to pcPrincipal.PageCount -1 do
    pcPrincipal.Pages[I].TabVisible := False;
  pcPrincipal.ActivePage := tbsListagem;

  if not qryCadastro.Active then
    qryCadastro.Active := True;
end;

procedure TfrmCadPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then

end;

procedure TfrmCadPadrao.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  IsNewRecord := True;
end;

procedure TfrmCadPadrao.qryCadastroAfterPost(DataSet: TDataSet);
begin
  if IsNewRecord then
  begin
    IsNewRecord := False;
    qryCadastro.Refresh;
  end;
end;

procedure TfrmCadPadrao.SetIsNewRecord(const Value: Boolean);
begin
  FIsNewRecord := Value;
end;

end.
