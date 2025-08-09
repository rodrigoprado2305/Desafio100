unit FrmErro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Advertising,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type

  TFormErro = class(TForm)
    btnRecomecar: TButton;
    Label1: TLabel;
    lytMeio: TLayout;
    Timer1: TTimer;
    imgErro: TImage;
    rectOkErro: TRectangle;
    procedure btnRecomecarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormErro: TFormErro;

implementation

uses FrmPrincipal, FrmLogin;

{$R *.fmx}

procedure TFormErro.btnRecomecarClick(Sender: TObject);
begin
  //FormPrincipal.reset(0); //Build 22, remover o anuncio intertitial
  FormPrincipal.reset(30+1);
  close;
end;

procedure TFormErro.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := False;
  btnRecomecar.Enabled := True;
  //btnVideo.Enabled := True; //Build 22, remover o anuncio intertitial
  FormPrincipal.reset(10+1);//(10+1); //se vc quer voltar duas fases, jogue 3, se for 10, jogue 11
  close;
end;

procedure TFormErro.FormShow(Sender: TObject);
begin
  Timer1.Enabled := False;
end;

end.


