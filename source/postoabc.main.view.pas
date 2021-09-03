unit postoabc.main.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, postoabc.tanque.view,
  postoabc.bombas.view, Vcl.DBCGrids, postoabc.conexao.datamodule, Data.DB, Vcl.DBCtrls, Vcl.Imaging.pngimage;

type
  TfrmMain = class(TForm)
    pcPrincipal: TPageControl;
    tbsBombas: TTabSheet;
    tbsAjustes: TTabSheet;
    Panel3: TPanel;
    lblTitulo: TLabel;
    spdbtnMenu: TSpeedButton;
    btnTanques: TButton;
    Label1: TLabel;
    btnBombas: TButton;
    Label2: TLabel;
    dtpDataIni: TDateTimePicker;
    dtpDataFin: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnAbrirRelatorio: TButton;
    Panel1: TPanel;
    scbBombas: TScrollBox;
    tbsModelos: TTabSheet;
    pnlModelBombaGasolina: TPanel;
    imgModelBombaFoto: TImage;
    lblModelNumeroBomba: TLabel;
    lblModelValorCombustivel: TLabel;
    lblModelBombaCombustivel: TLabel;
    pnlModelBombaDiesel: TPanel;
    Image4: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Panel2: TPanel;
    edtQtde: TEdit;
    Label6: TLabel;
    lblCodigoBomba: TLabel;
    Label7: TLabel;
    lblTipoCombustivel: TLabel;
    Label9: TLabel;
    lblValorUnitCombustivel: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    edtSubTotal: TEdit;
    Label11: TLabel;
    edtTarifa: TEdit;
    Label12: TLabel;
    edtValorTarifa: TEdit;
    Label16: TLabel;
    edtTotalPagar: TEdit;
    btnSalvarAbastecimento: TButton;
    btnLimparCampos: TButton;
    btnAbastecimentos: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure spdbtnMenuClick(Sender: TObject);
    procedure btnTanquesClick(Sender: TObject);
    procedure btnBombasClick(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQtdeExit(Sender: TObject);
    procedure btnLimparCamposClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarAbastecimentoClick(Sender: TObject);
    procedure btnAbrirRelatorioClick(Sender: TObject);
    procedure btnAbastecimentosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FValorUnitCombustivel: Currency;
    FQtdeLitrosCombustivel: Double;
    FCodigoBombaCombustivel: Integer;
    FSubTotalCombustivel: Currency;
    FTarifaCombustivel: Double;
    FValorTarifa: Currency;
    procedure DblCliqueBomba(Sender: TObject);
    procedure CriarBomba(Codigo: Integer; TipoCombustivel: String; ValorCombustivel: String; CorBomba: Integer);
    procedure DestruirListaBombas;
    procedure InicializarTelaPrincipal;
    procedure BuscarDadosBomba(CodigoBomba: Integer);
    procedure CalcularCombustivel;
    procedure LimparCampos;
    procedure SetCodigoBombaCombustivel(const Value: Integer);
    procedure SetQtdeLitrosCombustivel(const Value: Double);
    procedure SetValorUnitCombustivel(const Value: Currency);
    procedure SetSubTotalCombustivel(const Value: Currency);
    procedure SetTarifaCombustivel(const Value: Double);
    procedure SetValorTarifa(const Value: Currency);
    function SalvarAbastecimento(CodigoBomba: Integer; Qtde: Double; ValorUnit: Currency; SubTotal: Currency; Tarifa: Double; ValorTarifa: Currency): Boolean;
  public
    property QtdeLitrosCombustivel: Double read FQtdeLitrosCombustivel write SetQtdeLitrosCombustivel;
    property ValorUnitCombustivel: Currency read FValorUnitCombustivel write SetValorUnitCombustivel;
    property CodigoBombaCombustivel: Integer read FCodigoBombaCombustivel write SetCodigoBombaCombustivel;
    property TarifaCombustivel: Double read FTarifaCombustivel write SetTarifaCombustivel;
    property SubTotalCombustivel: Currency read FSubTotalCombustivel write SetSubTotalCombustivel;
    property ValorTarifa: Currency read FValorTarifa write SetValorTarifa;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses postoabc.report.abastecimento.view, postoabc.setup.connection.view;

procedure TfrmMain.btnAbastecimentosClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbsBombas;
  InicializarTelaPrincipal;
end;

procedure TfrmMain.btnAbrirRelatorioClick(Sender: TObject);
begin
  if dtpDataIni.Date > dtpDataFin.Date then
  begin
    ShowMessage('A data inicial n�o pode ser maior que a data final, verifique novamente!');
    if dtpDataIni.CanFocus then
      dtpDataIni.SetFocus;
    Exit;
  end;
  TfrmRelAbastecimento.ShowRelatorio(dtpDataIni.Date, dtpDataFin.Date);
end;

procedure TfrmMain.btnBombasClick(Sender: TObject);
begin
  if not assigned(frmBombas) then
    frmBombas := TfrmBombas.Create(nil);
  frmBombas.ShowModal;
  FreeAndNil(frmBombas);
end;

procedure TfrmMain.btnTanquesClick(Sender: TObject);
begin
  if not assigned(frmTanques) then
    frmTanques := TfrmTanques.Create(nil);
  frmTanques.ShowModal;
  FreeAndNil(frmTanques);
end;

procedure TfrmMain.BuscarDadosBomba(CodigoBomba: Integer);
begin
  try
    dmConexao.qryBuscarDadosBomba.Close;
    dmConexao.qryBuscarDadosBomba.ParamByName('id').AsInteger := CodigoBomba;
    dmConexao.qryBuscarDadosBomba.Open;
    if dmConexao.qryBuscarDadosBomba.RecordCount = 1 then
    begin
      CodigoBombaCombustivel := dmConexao.qryBuscarDadosBomba.FieldByName('bomba_id').AsInteger;
      lblCodigoBomba.Caption := Format('%2.2d', [CodigoBombaCombustivel]);
      lblTipoCombustivel.Caption := dmConexao.qryBuscarDadosBomba.FieldByName('tipo_tanque').AsString;
      ValorUnitCombustivel := dmConexao.qryBuscarDadosBomba.FieldByName('valorunit').AsFloat;
      lblValorUnitCombustivel.Caption := FormatFloat('#.###', ValorUnitCombustivel);
    end;
  except on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao tentar buscar os dados da bomba selecionada. '+#13#10+'Motivo: '+E.Message);
    end;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if not Assigned(frmSetupConnection) then
    frmSetupConnection := TfrmSetupConnection.Create(nil);
  frmSetupConnection.ShowModal;
  FreeAndNil(frmSetupConnection);
end;

procedure TfrmMain.btnSalvarAbastecimentoClick(Sender: TObject);
begin
  if edtTotalPagar.Text = '0,00' then
  begin
    Application.MessageBox('Antes de salvar � necess�rio escolher uma bomba e depois colocar a qtde de litros abastecido.', 'Controle de Abastecimentos');
    btnLimparCamposClick(Sender);
    Exit;
  end;
  if SalvarAbastecimento(CodigoBombaCombustivel, QtdeLitrosCombustivel, ValorUnitCombustivel, SubTotalCombustivel, TarifaCombustivel,
                        ValorTarifa) then
  begin
    Application.MessageBox('Abastecimento salvo com sucesso.', 'Controle de Abastecimentos');
    btnLimparCamposClick(Sender);
  end;
end;

procedure TfrmMain.btnLimparCamposClick(Sender: TObject);
begin
  LimparCampos;
  if edtQtde.CanFocus then
  begin
    edtQtde.SetFocus;
    edtQtde.SelStart := 0;
    edtQtde.SelectAll;
  end;
end;

procedure TfrmMain.CalcularCombustivel;
begin
  QtdeLitrosCombustivel := StrToFloat(edtQtde.Text);
  TarifaCombustivel := StrToFloat(edtTarifa.Text);
  edtSubTotal.Text := FormatFloat('#,##0.00', QtdeLitrosCombustivel * ValorUnitCombustivel);
  SubTotalCombustivel := StrToCurr(edtSubTotal.Text);
  edtValorTarifa.Text := FormatFloat('#,##0.00', (TarifaCombustivel * SubTotalCombustivel) / 100);
  ValorTarifa := StrToCurr(edtValorTarifa.Text);
  edtTotalPagar.Text := FormatFloat('#,##0.00', SubTotalCombustivel + ValorTarifa);
end;

procedure TfrmMain.CriarBomba(Codigo: Integer; TipoCombustivel, ValorCombustivel: String; CorBomba: Integer);
var
  lblNumeroBomba: TLabel;
  lblTipoBomba: TLabel;
  lblValorCombustivel: TLabel;
  pnlBomba: TPanel;
  imgBomba: TImage;
begin
  // panel Bomba
  pnlBomba := TPanel.Create(Self);
  pnlBomba.Parent := scbBombas;
  pnlBomba.Width := 96;
  pnlBomba.BevelOuter := bvNone;
  pnlBomba.Align := alLeft;
  pnlBomba.AlignWithMargins := true;
  pnlBomba.Margins.Left := 10;
  pnlBomba.Margins.Top := 10;
  pnlBomba.Margins.Right := 10;
  pnlBomba.Margins.Bottom := 10;
  pnlBomba.ParentBackground := False;
  pnlBomba.ParentColor := False;
  pnlBomba.Color := CorBomba;

  // Label Numero da Bomba
  lblNumeroBomba := TLabel.Create(Self);
  lblNumeroBomba.Parent := pnlBomba;
  lblNumeroBomba.Alignment := taCenter;
  lblNumeroBomba.Font.Color := clWhite;
  lblNumerobomba.Font.Name := 'Courier New';
  lblNumerobomba.Font.Size := 12;
  lblNumeroBomba.Caption := Format('%2.2d', [dmConexao.qryListarBombasBOMBA_ID.AsInteger]);
  lblNumeroBomba.Left := 35;
  lblNumeroBomba.Top := 31;
  lblNumeroBomba.Width := 20;
  lblNumeroBomba.Height := 18;

  // Label Tipo de Comb�stivel
  lblTipoBomba := TLabel.Create(Self);
  lblTipoBomba.Parent := pnlBomba;
  lblTipoBomba.Alignment := taCenter;
  lblTipoBomba.Font.Color := clWhite;
  lblTipoBomba.Font.Name := 'Courier New';
  lblTipoBomba.Font.Size := 12;
  lblTipoBomba.Caption := dmConexao.qryListarBombasTIPO_TANQUE.AsString;
  lblTipoBomba.Left := 3;
  lblTipoBomba.Top := 2;
  lblTipoBomba.Width := 90;
  lblTipoBomba.Height := 18;

  // Label Valor do Comb�stivel
  lblValorCombustivel := TLabel.Create(Self);
  lblValorCombustivel.Parent := pnlBomba;
  lblValorCombustivel.Alignment := taCenter;
  lblValorCombustivel.Font.Color := clWhite;
  lblValorCombustivel.Font.Name := 'Courier New';
  lblValorCombustivel.Font.Size := 12;
  lblValorCombustivel.Caption := FormatFloat('#,##0.000', dmConexao.qryListarBombasVALORUNIT.AsFloat);
  lblValorCombustivel.Left := 3;
  lblValorCombustivel.Top := 91;
  lblValorCombustivel.Width := 90;
  lblValorCombustivel.Height := 18;

  imgBomba := TImage.Create(Self);
  //imgBomba.Name := 'imgBomba'+ dmConexao.qryListarBombasBOMBA_ID.AsString;
  imgBomba.Parent := pnlBomba;
  imgBomba.Align := alClient;
  imgBomba.Center := True;
  imgBomba.Picture.Assign(imgModelBombaFoto.Picture);
  imgBomba.Tag := dmConexao.qryListarBombasBOMBA_ID.AsInteger;
  imgBomba.OnDblClick := DblCliqueBomba;
end;

procedure TfrmMain.DblCliqueBomba(Sender: TObject);
begin
  BuscarDadosBomba(TImage(Sender).Tag);
  if edtQtde.CanFocus then
  begin
    edtQtde.SetFocus;
    edtQtde.SelStart := 0;
    edtQtde.SelectAll;
  end;
end;

procedure TfrmMain.DestruirListaBombas;
var
  I: Integer;
begin
  for I := scbBombas.ControlCount -1 downto 0 do
  begin
    scbBombas.Controls[I].Free;
  end;
  scbBombas.Update;
end;

procedure TfrmMain.edtQtdeExit(Sender: TObject);
begin
  if Trim(edtQtde.Text) = '' then
    Exit;
  CalcularCombustivel;
end;

procedure TfrmMain.edtQtdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMain.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', FormatSettings.DecimalSeparator]) then
  begin
    Key := #0;
  end
  else if (Key = FormatSettings.DecimalSeparator) and
          (Pos(Key, TEdit(Sender).Text) > 0) then begin
    Key := #0;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to pcPrincipal.PageCount -1 do
    pcPrincipal.Pages[I].TabVisible := False;
  pcPrincipal.ActivePage := tbsBombas;
  lblCodigoBomba.Caption := '';
  lblTipoCombustivel.Caption := '';
  lblValorUnitCombustivel.Caption := '';
  InicializarTelaPrincipal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if edtQtde.CanFocus then
  begin
    edtQtde.SetFocus;
    edtQtde.SelStart := 0;
    edtQtde.SelectAll;
  end;
end;

procedure TfrmMain.InicializarTelaPrincipal;
var
  Combustivel: String;
  Valor: Currency;
  Numero: Integer;
  CorDaBomba: Integer;
begin
  LimparCampos;
  DestruirListaBombas;
  if not dmConexao.qryListarBombas.Active then
    dmConexao.qryListarBombas.Open;
  dmConexao.qryListarBombas.First;
  while not dmConexao.qryListarBombas.Eof do
  begin
    Combustivel := dmConexao.qryListarBombasTIPO_TANQUE.AsString;
    Valor := dmConexao.qryListarBombasVALORUNIT.AsCurrency;
    Numero := dmConexao.qryListarBombasBOMBA_ID.AsInteger;
    if Combustivel = 'DIESEL' then
      CorDaBomba := clBlack
    else if Combustivel = 'GASOLINA' then
      CorDaBomba := $004080FF;

    CriarBomba(Numero, Combustivel, FormatFloat('#.###', Valor), CorDaBomba);
    dmConexao.qryListarBombas.Next;
  end;
  dmConexao.qryListarBombas.Close;
end;

procedure TfrmMain.LimparCampos;
begin
  QtdeLitrosCombustivel := 0;
  TarifaCombustivel := 0;
  ValorTarifa := 0;
  SubTotalCombustivel := 0;
  edtValorTarifa.Text := '0,00';
  edtSubTotal.Text := '0,00';
  edtTotalPagar.Text := '0,00';
  edtQtde.Text := '0,000';
  lblCodigoBomba.Caption := '';
  lblTipoCombustivel.Caption := '';
  lblValorUnitCombustivel.Caption := '';
end;

function TfrmMain.SalvarAbastecimento(CodigoBomba: Integer; Qtde: Double; ValorUnit, SubTotal: Currency; Tarifa: Double;
  ValorTarifa: Currency): Boolean;
begin
  try
    dmConexao.cmdSQL.ParamByName('bombaid').AsInteger := CodigoBomba;
    dmConexao.cmdSQL.ParamByName('data').AsDateTime := Date;
    dmConexao.cmdSQL.ParamByName('hora').AsDateTime := Time;
    dmConexao.cmdSQL.ParamByName('qtde').AsFloat := Qtde;
    dmConexao.cmdSQL.ParamByName('valorunit').AsCurrency := ValorUnit;
    dmConexao.cmdSQL.ParamByName('subtotal').AsCurrency := SubTotal;
    dmConexao.cmdSQL.ParamByName('tarifa').AsFloat := Tarifa;
    dmConexao.cmdSQL.ParamByName('valortarifa').AsCurrency := ValorTarifa;
    dmConexao.cmdSQL.Prepared := True;
    dmConexao.cmdSQL.Execute;
    result := (dmConexao.cmdSQL.RowsAffected = 1);
  except on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao tentar salvar esse abastecimento.'+#13#10+'Motivo: '+E.Message);
    end;
  end;
end;

procedure TfrmMain.SetCodigoBombaCombustivel(const Value: Integer);
begin
  FCodigoBombaCombustivel := Value;
end;

procedure TfrmMain.SetQtdeLitrosCombustivel(const Value: Double);
begin
  FQtdeLitrosCombustivel := Value;
end;

procedure TfrmMain.SetSubTotalCombustivel(const Value: Currency);
begin
  FSubTotalCombustivel := Value;
end;

procedure TfrmMain.SetTarifaCombustivel(const Value: Double);
begin
  FTarifaCombustivel := Value;
end;

procedure TfrmMain.SetValorTarifa(const Value: Currency);
begin
  FValorTarifa := Value;
end;

procedure TfrmMain.SetValorUnitCombustivel(const Value: Currency);
begin
  FValorUnitCombustivel := Value;
end;

procedure TfrmMain.spdbtnMenuClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbsAjustes;
end;

end.
