unit untMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TfrmMensagem = class(TForm)
    pnlIcones: TPanel;
    Panel1: TPanel;
    pnlBotoes: TPanel;
    pnlMensagem: TPanel;
    pnlOk: TPanel;
    lblMensagem: TLabel;
    imgInformacao: TImage;
    imgErro: TImage;
    procedure pnlOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Mensagem(Texto: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  frmMensagem: TfrmMensagem;

const
  TITULO :String = 'BCryptDemo';

implementation

{$R *.dfm}

{ TfrmMensagem }

class function TfrmMensagem.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TfrmMensagem;

begin
  frm := TfrmMensagem.Create(nil);
  try
    frm.lblMensagem.Caption := Texto;
    frm.Caption := TITULO;

    case (Tipo) of
      'I': begin
             frm.imgInformacao.Visible := True;
             frm.Color := $00548C30;
           end;
      'E': begin
             frm.imgErro.Visible := True;
             frm.Color := $000E1670;
           end
    else
        frm.imgInformacao.Visible := True;
    end;

    frm.pnlOk.Color := frm.Color;
    frm.ShowModal;

    case (frm.ModalResult) of
      mrOk : result := True;
    else
      result := False;
    end;

  finally
    if (frm<>nil) then
      FreeAndNil(frm);
  end;
end;

procedure TfrmMensagem.pnlOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
