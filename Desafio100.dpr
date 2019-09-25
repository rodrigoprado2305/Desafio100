program Desafio100;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  frmInfo in 'Fontes\frmInfo.pas' {FormInfo},
  FrmLogin in 'Fontes\FrmLogin.pas' {FormLogin},
  FrmMenu in 'Fontes\FrmMenu.pas' {FormMenu},
  FrmPontuacao in 'Fontes\FrmPontuacao.pas' {FormPontuacao},
  FrmPrincipal in 'Fontes\FrmPrincipal.pas' {FormPrincipal},
  FrmWeb in 'Fontes\FrmWeb.pas' {FormWeb},
  FrmSobre in 'Fontes\FrmSobre.pas' {FormSobre},
  FrmErro in 'Fontes\FrmErro.pas' {FormErro};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormPontuacao, FormPontuacao);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormWeb, FormWeb);
  Application.CreateForm(TFormSobre, FormSobre);
  Application.CreateForm(TFormErro, FormErro);
  Application.Run;
end.
