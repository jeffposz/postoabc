unit postoabc.report.abastecimento.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, postoabc.conexao.datamodule, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelAbastecimento = class(TForm)
    rlrepAbastecimento: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    lblPeriodo: TRLLabel;
    RLLabel2: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    qryRelAbastecimentos: TFDQuery;
    dsRelAbastecimentos: TDataSource;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand4: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDBText2: TRLDBText;
    RLBand6: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand7: TRLBand;
    RLDBResult3: TRLDBResult;
    RLLabel12: TRLLabel;
    RLDBResult4: TRLDBResult;
  private
    { Private declarations }
  public
    class procedure ShowRelatorio(DataInicial: TDateTime; DataFinal: TDateTime);
  end;

var
  frmRelAbastecimento: TfrmRelAbastecimento;

implementation

{$R *.dfm}

{ TfrmRelAbastecimento }

class procedure TfrmRelAbastecimento.ShowRelatorio(DataInicial, DataFinal: TDateTime);
begin
  if not assigned(frmRelAbastecimento) then
    frmRelAbastecimento := TfrmRelAbastecimento.Create(nil);
  frmRelAbastecimento.qryRelAbastecimentos.Close;
  frmRelAbastecimento.qryRelAbastecimentos.ParamByName('dataini').AsDateTime := DataInicial;
  frmRelAbastecimento.qryRelAbastecimentos.ParamByName('datafin').AsDateTime := DataFinal;
  frmRelAbastecimento.qryRelAbastecimentos.Open;
  frmRelAbastecimento.lblPeriodo.Caption := 'Per�odo: '+FormatDateTime('dd/mm/yyyy', DataInicial)+' at� '+
                                                        FormatDateTime('dd/mm/yyyy', DataFinal);
  frmRelAbastecimento.rlrepAbastecimento.Preview;

end;

end.
