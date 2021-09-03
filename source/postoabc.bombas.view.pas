unit postoabc.bombas.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, postoabc.formulario.padrao.view, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, System.Actions, Vcl.ActnList, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmBombas = class(TfrmCadPadrao)
    qryCadastroTANQUE_ID: TIntegerField;
    qryCadastroBOMBA_ID: TIntegerField;
    qryTanques: TFDQuery;
    dsTanques: TDataSource;
    qryCadastroTIPO_COMBUSTIVEL: TStringField;
    qryCadastroESTOQUEATUAL: TFloatField;
    qryCadastroVALORLITRO: TCurrencyField;
    Label1: TLabel;
    dbedtCodigo: TDBEdit;
    Label2: TLabel;
    dblkpcbxTipoCombustivel: TDBLookupComboBox;
    qryTanquesTANQUE_ID: TIntegerField;
    qryTanquesTIPO_TANQUE: TStringField;
    qryTanquesDESCRICAO: TStringField;
    qryTanquesCAPACIDADE: TSingleField;
    qryTanquesESTOQUEATUAL: TSingleField;
    qryTanquesVALORUNIT: TBCDField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBombas: TfrmBombas;

implementation

{$R *.dfm}

procedure TfrmBombas.FormCreate(Sender: TObject);
begin
  inherited;
  if not qryTanques.Active then
    qryTanques.Active := True;
end;

end.
