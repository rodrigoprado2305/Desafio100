unit FrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, IniFiles, FMX.Advertising,
  FMX.Objects, FMX.Layouts, FMX.Effects, FMX.Filter.Effects, FMX.Media;

type
  TFormPrincipal = class(TForm)
    lytMeio: TLayout;
    lblPergunta: TLabel;
    btnResp01: TButton;
    btnResp02: TButton;
    lblFase: TLabel;
    rectFase: TRectangle;
    barCabecalho: TToolBar;
    btnVoltar: TSpeedButton;
    btnInfo: TSpeedButton;
    lblTitulo: TLabel;
    lblLembrete: TLabel;
    BannerAd1: TBannerAd;
    rectOkErro: TRectangle;
    imgErro: TImage;
    imgOk: TImage;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    chkEfeitosSonoros: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnResp01Click(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chkEfeitosSonorosChange(Sender: TObject);
  private
    { Private declarations }
    iFaseAtual, iNFases: ShortInt;
    sResp: String;
    IniMem: TMemIniFile;
    lstDados:  TStringList;
    bMusica: Boolean;
    procedure proximaFase;
    procedure tocaSom(sArqNome: String);
  public
    { Public declarations }
    iDisciplina: Integer;
    pResposta: Array[0..1] of string;
    procedure reset(iFase: integer);
  end;

var
  FormPrincipal: TFormPrincipal;

const
  ESPACAMENTO_LBLFASE = 'Pergunta          ';

implementation

{$R *.fmx}

uses
  frmInfo, FrmPontuacao, FrmLogin, FrmErro, FrmMenu, System.IOUtils;

{
procedure TForm1.Button2Click(Sender: TObject);
var
  IniMemx: TMemIniFile;
  lstDadosx:  TStringList;
begin
 { lstDadosx := TStringList.Create;
  IniMemx := TMemIniFile.Create('');
  //lstStream := TStringStream.Create('',TEncoding.UTF8);
  try
    lstDadosx.LoadFromStream(TResourceStream.Create(HInstance,'rsrcDados',RT_RCDATA),TEncoding.UTF8);
    IniMemx.SetStrings(lstDadosx);
    lblTitulo.Text := IniMemx.ReadString('Config','NomeJogo','');
    lblPergunta.Text := IniMemx.ReadString('Jogo','PERGUNTA1','');
    mmoTexto.Lines.Text := IniMemx.ReadString('Jogo','TEXTO1','');
  finally
    lstDadosx.Free;
    IniMemx.Free;
  end;
end;
}

procedure TFormPrincipal.reset(iFase: integer);
begin
  if iFase > 0 then
  begin
    iFaseAtual := iFaseAtual - iFase;
    if iFaseAtual < 0 then
      iFaseAtual := 0;
  end
  else
    iFaseAtual := 0;

  imgOk.Visible := False;
  imgErro.Visible := False;

  iNFases := IniMem.ReadInteger('Config','NumFases',0);
  lblTitulo.Text := IniMem.ReadString('Config','NomeJogo','');

  proximaFase;
end;

procedure TFormPrincipal.btnVoltarClick(Sender: TObject);
begin
  close;
end;

procedure TFormPrincipal.chkEfeitosSonorosChange(Sender: TObject);
begin
  bMusica := not bMusica;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  timer1.Enabled := False;
  pResposta[0] := '';
  pResposta[1] := '';

  BannerAd1.LoadAd;
  lstDados := TStringList.Create;
  IniMem := TMemIniFile.Create('');
  try
    iFaseAtual := 0;
    case iDisciplina of
      1: lstDados.LoadFromStream(TResourceStream.Create(HInstance,'rsrcDisc01',RT_RCDATA),TEncoding.UTF8);
      2: lstDados.LoadFromStream(TResourceStream.Create(HInstance,'rsrcDisc02',RT_RCDATA),TEncoding.UTF8);
      3: lstDados.LoadFromStream(TResourceStream.Create(HInstance,'rsrcDisc03',RT_RCDATA),TEncoding.UTF8);
      4: lstDados.LoadFromStream(TResourceStream.Create(HInstance,'rsrcDisc04',RT_RCDATA),TEncoding.UTF8);
    end;
    IniMem.SetStrings(lstDados);
    iNFases := IniMem.ReadInteger('Config','NumFases',0);
    lblTitulo.Text := IniMem.ReadString('Config','NomeJogo','');
    proximaFase;
  except
    On E : Exception do
    begin
      lstDados.Free;
      IniMem.Free;
      showmessage('Erro ao iniciar jogo: ' + e.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(lstDados) then
    lstDados.Free;
  if Assigned(IniMem) then
    IniMem.Free;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  BannerAd1.AdUnitID := 'ca-app-pub-9350000386173480/4464322998';
  bMusica := True;
end;

procedure TFormPrincipal.proximaFase;
var
  iIndex: integer;
begin
  // modo teste fase
  //if iFaseAtual = 3 then
  if iFaseAtual = iNFases then
  begin
    FormPontuacao.lblNome.Text := FormLogin.edtJogador.Text;
    FormPontuacao.sDisciplina := lblTitulo.Text;
    FormPontuacao.lblResultados.Text := 'Você concluiu o desafio 100 de ' + lblTitulo.Text;

    FormPontuacao.imgVitoria.Bitmap.Assign(
      FormMenu.imgDisciplinas.Bitmap(FormPontuacao.imgVitoria.Size.Size, iDisciplina-1)
    );

    FormPontuacao.show;
  end
  else
  begin
    imgOk.Visible := False;
    imgErro.Visible := False;

    Inc(iFaseAtual);

    if (iFaseAtual = 5) or (iFaseAtual = 10) or
       (iFaseAtual = 15) or (iFaseAtual = 20) or
       (iFaseAtual = 25) or (iFaseAtual = 30) or
       (iFaseAtual = 35) or (iFaseAtual = 40) or
       (iFaseAtual = 45) or (iFaseAtual = 50) or
       (iFaseAtual = 55) or (iFaseAtual = 60) or
       (iFaseAtual = 65) or (iFaseAtual = 70) or
       (iFaseAtual = 75) or (iFaseAtual = 80) or
       (iFaseAtual = 85) or (iFaseAtual = 90) or
       (iFaseAtual = 95) or (iFaseAtual = 100) then
      BannerAd1.LoadAd;

    lblFase.Text := ESPACAMENTO_LBLFASE + IntToStr(iFaseAtual)+'/'+IntToStr(iNFases);
    lblPergunta.Text := IniMem.ReadString('Jogo','PERGUNTA'+IntToStr(iFaseAtual)+'1','');

    sResp := UpperCase(Trim(IniMem.ReadString('Jogo','RESP'+IntToStr(iFaseAtual)+'1','')));

    randomize;
    //Random(100);    // The 100 value gives a range 0..99
    //By the way, it is trivial to 'somehow' exclude zero. Just do Random(6) + 1.]
    iIndex := Random(2)+1;
    btnResp01.Text := Trim(IniMem.ReadString('Jogo','RESP'+IntToStr(iFaseAtual)+IntToStr(iIndex),''));
    if iIndex = 1 then
      btnResp02.Text := Trim(IniMem.ReadString('Jogo','RESP'+IntToStr(iFaseAtual)+'2',''))
    else
      btnResp02.Text := Trim(IniMem.ReadString('Jogo','RESP'+IntToStr(iFaseAtual)+'1',''));
  end;
end;

procedure TFormPrincipal.btnInfoClick(Sender: TObject);
begin
  FormInfo.Show;
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  if pResposta[0] = pResposta[1] then
  begin
    //tocaSom;
    proximaFase;
  end
  else
  begin
    //tocaSom;
    FormErro.Show;
  end;

  timer1.Enabled := False;
  btnResp01.Enabled := True;
  btnResp02.Enabled := True;
  pResposta[0] := '';
  pResposta[1] := '';
end;

procedure TFormPrincipal.tocaSom(sArqNome: String);
var
  ResStream: TResourceStream;
  TmpFile: string;
begin
  if bMusica then
  begin
    if sArqNome = 'rsrcOk' then
    begin
      ResStream := TResourceStream.Create(HInstance, sArqNome, RT_RCDATA);
      try
        TmpFile := TPath.Combine(System.IOUtils.TPath.GetDownloadsPath, 'ok.mp3');
        ResStream.Position := 0;
        ResStream.SaveToFile(TmpFile);
        MediaPlayer1.FileName := TmpFile;
        MediaPlayer1.Play;
      finally
        ResStream.Free;
      end;
    end
    else if sArqNome = 'rsrcErro' then
    begin
      ResStream := TResourceStream.Create(HInstance, sArqNome, RT_RCDATA);
      try
        //TmpFile := TPath.Combine(TPath.GetTempPath, 'ok.mp3');
        //system.IOUtils.TPath.GetDownloadsPath + '/screenshot_temp.jpg'  //System.IOUtils;
        TmpFile := TPath.Combine(System.IOUtils.TPath.GetDownloadsPath, 'erro.mp3');
        ResStream.Position := 0;
        ResStream.SaveToFile(TmpFile);
        MediaPlayer1.FileName := TmpFile;
        MediaPlayer1.Play;
      finally
        ResStream.Free;
      end;
    end;
  end;
end;

procedure TFormPrincipal.btnResp01Click(Sender: TObject);
begin
  pResposta[0] := AnsiUpperCase(TButton(Sender).Text);
  pResposta[1] := AnsiUpperCase(sResp);

  btnResp01.Enabled := False;
  btnResp02.Enabled := False;
  MediaPlayer1.Clear;

  {TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      if pResposta[0] = pResposta[1] then
      begin
        imgOk.Visible := True;
        imgErro.Visible := False;
      end
      else
      begin
        imgOk.Visible := False;
        imgErro.Visible := True;
      end;
    end);
  end).Start; }

  if pResposta[0] = pResposta[1] then
  begin
    imgOk.Visible := True;
    imgErro.Visible := False;
    tocaSom('rsrcOk');
  end
  else
  begin
    imgOk.Visible := False;
    imgErro.Visible := True;
    tocaSom('rsrcErro');
  end;
  timer1.Enabled := True;
end;

end.

