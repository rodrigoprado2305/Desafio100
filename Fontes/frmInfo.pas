unit frmInfo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TFormInfo = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    lblNomeJogador: TLabel;
    imgLogo: TImage;
    Rectangle2: TRectangle;
    lblPergunta: TLabel;
    barCabecalho: TToolBar;
    btnVoltar: TSpeedButton;
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInfo: TFormInfo;

implementation

uses FrmLogin;

{$R *.fmx}

procedure TFormInfo.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
