unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, BCrypt, untMensagem;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    edtSenha: TEdit;
    Label1: TLabel;
    pnlButton: TPanel;
    pnlGenerateHash: TPanel;
    DBGrid1: TDBGrid;
    pnlCompareHash: TPanel;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    FDMemTable1hash: TStringField;
    FDMemTable1senha: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure pnlGenerateHashClick(Sender: TObject);
    procedure pnlCompareHashClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FDMemTable1.Open;
end;

procedure TfrmPrincipal.pnlCompareHashClick(Sender: TObject);
begin
  if not FDMemTable1.IsEmpty then
  begin
    if TBCrypt.CompareHash(edtSenha.Text, FDMemTable1.FieldByName('hash').AsString) then
      TfrmMensagem.Mensagem(PChar('A senha digitada CONFERE com o Hash selecionado!'+#13+#13+
                                   'Senha digitada: '+edtSenha.Text+#13+
                                   'Hash selecionado: '+FDMemTable1.FieldByName('hash').AsString),'I',[mbOk])
    else
      TfrmMensagem.Mensagem(PChar('A senha digitada NÃO CONFERE com o Hash selecionado!'+#13+#13+
                                   'Senha digitada: '+edtSenha.Text+#13+
                                   'Hash selecionado: '+FDMemTable1.FieldByName('hash').AsString+#13+
                                   'Hash para a senha: '+FDMemTable1.FieldByName('senha').AsString),'E',[mbOk]);
  end
  else
    TfrmMensagem.Mensagem(PChar('Nenhum Hash para ser selecionado!'),'E',[mbOk]);
end;

procedure TfrmPrincipal.pnlGenerateHashClick(Sender: TObject);
begin
  FDMemTable1.Append;
  FDMemTable1.FieldByName('senha').AsString := edtSenha.Text;
  FDMemTable1.FieldByName('hash').AsString := TBCrypt.GenerateHash(edtSenha.Text);
  FDMemTable1.Post;
end;

end.
