program PostoABC;

uses
  Vcl.Forms,
  postoabc.main.view in 'source\postoabc.main.view.pas' {frmMain},
  postoabc.formulario.padrao.view in 'source\postoabc.formulario.padrao.view.pas' {frmCadPadrao},
  postoabc.conexao.datamodule in 'source\postoabc.conexao.datamodule.pas' {dmConexao: TDataModule},
  postoabc.setup.connection.view in 'source\postoabc.setup.connection.view.pas' {frmSetupConnection},
  postoabc.tanque.view in 'source\postoabc.tanque.view.pas' {frmTanques},
  postoabc.bombas.view in 'source\postoabc.bombas.view.pas' {frmBombas},
  postoabc.report.abastecimento.view in 'source\postoabc.report.abastecimento.view.pas' {frmRelAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
