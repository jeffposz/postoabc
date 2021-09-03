unit postoabc.conexao.datamodule;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, Vcl.Forms, Vcl.Dialogs, Vcl.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TConnectionParams = record
    Server: String;
    Port: Integer;
    Database: String;
    Password: String;
    UserName: String;
    procedure GetConnectionInfo;
    procedure SetConnectionInfo;
  end;

  TdmConexao = class(TDataModule)
    fdconBomba: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryListarBombas: TFDQuery;
    qryListarBombasTANQUE_ID: TIntegerField;
    qryListarBombasBOMBA_ID: TIntegerField;
    qryListarBombasTIPO_TANQUE: TStringField;
    qryListarBombasVALORUNIT: TBCDField;
    qryBuscarDadosBomba: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    BCDField1: TBCDField;
    cmdSQL: TFDCommand;
    procedure DataModuleCreate(Sender: TObject);
  private
    FPrompt: String;
    procedure SetPrompt(const Value: String);
    { Private declarations }
  public
    function TestarConexao(Servidor: String; Porta: Integer; Usuario: String; Senha: String; Database: String): Boolean;
    property Prompt: String read FPrompt write SetPrompt;
  end;

var
  dmConexao: TdmConexao;
  MinhaConexao: TConnectionParams;


implementation

uses
  FireDAC.Phys.IBWrapper, postoabc.setup.connection.view;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  try
    MinhaConexao.GetConnectionInfo;
    {$IFDEF ConditionalExpressions}
      {$IF CompilerVersion >= 34.0 }
      with dmConexao.fdconBomba.Params as TFDPhysFBConnectionDefParams do
      begin
        Protocol := TIBProtocol.ipTCPIP;
        Server := MinhaConexao.Server;
        Port := MinhaConexao.Port;
        Database := MinhaConexao.Database;
        Password := MinhaConexao.Password;
        UserName := MinhaConexao.UserName;
      end;
      {$IFEND}
    {$ENDIF}

    {$IFDEF ConditionalExpressions}
      {$IF CompilerVersion >= 27.0 }
      with dmConexao.fdconBomba.Params do
      begin
        Add('User_Name='+MinhaConexao.UserName);
        Add('Password='+MinhaConexao.Password);
        Add('Database='+MinhaConexao.Database);
        Add('Server='+MinhaConexao.Server);
        Add('Port='+MinhaConexao.Port.ToString);
        Add('CharacterSet=WIN1252');
        Add('DriverID=FB');
        Add('PageSize=8192');
      end;
      {$IFEND}
    {$ENDIF}

    fdconBomba.Open;
    if not fdconBomba.Connected then
    begin
      Application.MessageBox('N�o foi poss�vel abrir uma conex�o com o banco de dados!', 'Conex�o com banco de dados');
      Application.Terminate;
    end;
  except on E: Exception do
    begin
      Prompt := 'Ocorreu um erro ao tentar iniciar as conex�es com o banco de dados!'+#13#10+'Motivo: '+E.Message;
      ShowMessage(Prompt);
      Application.Terminate;
    end;
  end;
end;

procedure TConnectionParams.GetConnectionInfo;
var
  ArquivoIni: TIniFile;
begin
  try
    if not FileExists(ExtractFilePath(Application.ExeName)+'bomba.ini') then
    begin
      if not assigned(frmSetupConnection) then
        frmSetupConnection := TfrmSetupConnection.Create(nil);
      frmSetupConnection.ShowModal;
      if frmSetupConnection.ModalResult = mrOk then
      begin
        ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'bomba.ini');
        Server := ArquivoIni.ReadString('database', 'server', 'localhost');
        Port := ArquivoIni.ReadInteger('database', 'port', 3050);
        Database := ArquivoIni.ReadString('database', 'pathdb', '');
        Password := ArquivoIni.ReadString('database', 'password', '');
        UserName := ArquivoIni.ReadString('database', 'user', '');
      end
      else
        Application.Terminate;
    end
    else begin
      ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'bomba.ini');
      Server := ArquivoIni.ReadString('database', 'server', 'localhost');
      Port := ArquivoIni.ReadInteger('database', 'port', 3050);
      Database := ArquivoIni.ReadString('database', 'pathdb', '');
      Password := ArquivoIni.ReadString('database', 'password', '');
      UserName := ArquivoIni.ReadString('database', 'user', '');
    end;
  finally
    ArquivoIni.Free;
  end;
end;

procedure TdmConexao.SetPrompt(const Value: String);
begin
  FPrompt := Value;
end;

function TdmConexao.TestarConexao(Servidor: String; Porta: Integer; Usuario, Senha, Database: String): Boolean;
begin
  result := False;
  try
    {$IFDEF ConditionalExpressions}
      {$IF CompilerVersion >= 34.0 }
      with dmConexao.fdconBomba.Params as TFDPhysFBConnectionDefParams do
      begin
        Protocol := TIBProtocol.ipTCPIP;
        Server := MinhaConexao.Server;
        Port := MinhaConexao.Port;
        Database := MinhaConexao.Database;
        Password := MinhaConexao.Password;
        UserName := MinhaConexao.UserName;
      end;
      {$IFEND}
    {$ENDIF}

    {$IFDEF ConditionalExpressions}
      {$IF CompilerVersion >= 27.0 }
      with dmConexao.fdconBomba.Params do
      begin
        Add('User_Name='+MinhaConexao.UserName);
        Add('Password='+MinhaConexao.Password);
        Add('Database='+MinhaConexao.Database);
        Add('Server='+MinhaConexao.Server);
        Add('Port='+MinhaConexao.Port.ToString);
        Add('CharacterSet=WIN1252');
        Add('DriverID=FB');
        Add('PageSize=8192');
      end;
      {$IFEND}
    {$ENDIF}
    fdconBomba.Open;
    result := fdconBomba.Connected;
  except on E: Exception do
    begin
      Prompt := 'Ocorreu um erro ao tentar iniciar as conex�es com o banco de dados!'+#13#10+'Motivo: '+E.Message;
      ShowMessage(Prompt);
      Application.Terminate;
    end;
  end;
end;

procedure TConnectionParams.SetConnectionInfo;
var
  ArquivoIni: TIniFile;
begin
  try
    ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'bomba.ini');
    ArquivoIni.WriteString('database', 'server', Server);
    ArquivoIni.WriteInteger('database', 'port', Port);
    ArquivoIni.WriteString('database', 'pathdb', Database);
    ArquivoIni.WriteString('database', 'password', Password);
    ArquivoIni.WriteString('database', 'user', UserName);
  finally
    ArquivoIni.Free;
  end;
end;

end.
