unit FrmWeb;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.WebBrowser, FMX.Ani, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFormWeb = class(TForm)
    WebBrowser: TWebBrowser;
    barCabecalho: TToolBar;
    btnVoltar: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWeb: TFormWeb;

implementation

uses frmLogin;

{$R *.fmx}

procedure TFormWeb.btnVoltarClick(Sender: TObject);
begin
  close;
end;

end.
