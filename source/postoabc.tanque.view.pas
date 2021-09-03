unit postoabc.tanque.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  System.Actions, Vcl.ActnList, postoabc.formulario.padrao.view;

type
  TfrmTanques = class(TfrmCadPadrao)
    qryCadastroTANQUE_ID: TIntegerField;
    qryCadastroTIPO_TANQUE: TStringField;
    qryCadastroCAPACIDADE: TSingleField;
    qryCadastroVALORUNIT: TBCDField;
    Label2: TLabel;
    dbedtCodigo: TDBEdit;
    Label3: TLabel;
    dbedtCapacidade: TDBEdit;
    Label4: TLabel;
    dbedtValorUnit: TDBEdit;
    Label5: TLabel;
    dbcbxTipoTanque: TDBComboBox;
    qryCadastroESTOQUEATUAL: TSingleField;
    Label1: TLabel;
    dbedtEstoqueAtual: TDBEdit;
    procedure dbedtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
    procedure qryCadastroAfterEdit(DataSet: TDataSet);
  private

  public

  end;

var
  frmTanques: TfrmTanques;

implementation

{$R *.dfm}

procedure TfrmTanques.dbedtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    Key := 0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmTanques.qryCadastroAfterEdit(DataSet: TDataSet);
begin
  inherited;
  lblTitulo.Caption := 'Editar Tanque';
end;

procedure TfrmTanques.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  lblTitulo.Caption := 'Novo Tanque';
end;

end.



