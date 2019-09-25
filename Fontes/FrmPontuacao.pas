unit FrmPontuacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Math.Vectors, FMX.Objects,
  FMX.Layouts, FMX.Controls3D, FMX.Layers3D, FMX.Ani, FMX.Effects,
  FMX.Filter.Effects, System.ImageList, FMX.ImgList;

type
  TFormPontuacao = class(TForm)
    LayoutGeral: TLayout;
    lblParabens: TLabel;
    lblResultados: TLabel;
    lblLinhaTop: TLabel;
    lblLinhaBot: TLabel;
    lblNome: TLabel;
    barCabecalho: TToolBar;
    btnSair: TSpeedButton;
    Rectangle1: TRectangle;
    btnCompartilhar: TButton;
    UserImage: TImage;
    FillRGBEffect4: TFillRGBEffect;
    imgVitoria: TImage;
    LayoutVitoria: TLayout;
    procedure btnSairClick(Sender: TObject);
    procedure btnCompartilharClick(Sender: TObject);
  private
    { Private declarations }
   { procedure whatsapp;
    procedure WhatsAppImage;
    procedure WhatsAppImageLanderson;
    procedure WhatsAppEmbarcadero;   }
  public
    { Public declarations }
    sDisciplina: String;
  end;

var
  FormPontuacao: TFormPontuacao;

implementation

uses
{$IFDEF ANDROID}
  FMX.Helpers.Android, Androidapi.Jni.GraphicsContentViewText,
  Androidapi.Jni.Net, Androidapi.Jni.JavaTypes, idUri, Androidapi.Jni,
  Androidapi.JNIBridge, Androidapi.Helpers,
  FMX.Platform.Android, AndroidApi.Jni.App, AndroidAPI.jni.OS,
{$ENDIF}
   frmLogin, frmPrincipal,System.IOUtils, FrmMenu;

{$R *.fmx}

(*procedure TFormPontuacao.whatsapp;
var
{$IFDEF ANDROID}
  IntentWhats : JIntent;
{$ENDIF}
  mensagem : string;
begin
  mensagem := 'Acesse o site: https://desafio100app.blogspot.com   ';
  mensagem := 'Jogador: '+FormLogin.edtJogador.Text+' - '+lblResultados.Text+sLineBreak+mensagem;
  //'Enviado do jogo: Delphi 10.3 Rio  - Rod - Primeiro teste de envio de mensagem... www.google.com.br';

{$IFDEF ANDROID}
  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,
      StringToJString(mensagem));
  IntentWhats.setPackage(StringToJString('com.whatsapp'));
  SharedActivity.startActivity(IntentWhats);
{$ENDIF}
  showmessage('Resultado compartilhado com sucesso!');
end;  *)

{procedure TFormPontuacao.WhatsAppImageLanderson;
var
  IntentWhatsApp: JIntent;
  FileUri: Jnet_Uri;
  lst: JArrayList;
begin
  lst:= TJArrayList.Create;

  FileUri := TJNet_Uri.JavaClass.fromFile(TJFile.JavaClass.init(StringToJString(system.IOUtils.TPath.GetDownloadsPath + '/jujubinha.jpg')));

  lst.add(0,FileUri);

  IntentWhatsApp := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhatsApp.setType(StringToJString('text/plain'));
  IntentWhatsApp.putExtra(TJIntent.JavaClass.EXTRA_TEXT,StringToJString('Teste de envio do WhatsAPP com Delphi 10.3 Rio.'));

  IntentWhatsApp.setType(StringToJString('image/jpg'));
  IntentWhatsApp.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM,lst);
  IntentWhatsApp.setPackage(StringToJString('com.whatsapp'));

  SharedActivity.startActivity(IntentWhatsApp);
end;   }


(*procedure TFormPontuacao.WhatsAppImage;
var
  IntentWhats :JIntent;
  FileUri :Jnet_Uri;
  iArq :integer;
  mensagem, sArqOrig1, sArqEnv1: string;
  ListArqs :JArrayList;
  img: TBitmap;

  AttachmentFile: JFile;

  SigStream : TMemoryStream;
begin
    img := Layout1.MakeScreenshot;


 { showmessage('Passo 01');
  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);

  IntentWhats.setPackage(StringToJString('com.whatsapp'));

  showmessage('Passo 02');
  AttachmentFile := TJFile.JavaClass.init(
    StringToJString(
      system.IOUtils.TPath.Combine(
        system.IOUtils.TPath.GetShareddocumentsPath(),'teste.jpg')));

  showmessage('Passo 03');
  FileUri := TJnet_Uri.JavaClass.fromFile(AttachmentFile);
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,StringToJString(mensagem));
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((FileUri as ILocalObject).GetObjectID));
  IntentWhats.setType(StringToJString('image/*'));
  IntentWhats.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
  SharedActivity.startActivity(IntentWhats);   }

  {SigStream := TMemoryStream.Create;
  Layout1.MakeScreenshot.SaveToStream(SigStream);

  //img.SaveToFile(system.IOUtils.TPath.GetShareddocumentsPath()+'/'+'teste.jpg');
  //sArqOrig1 := system.IOUtils.TPath.GetShareddocumentsPath()+'/'+'teste.jpg';

  mensagem := 'Acesse o site: https://desafio100app.blogspot.com   ';
  mensagem := 'Jogador: '+FormLogin.edtJogador.Text+' - '+lblResultados.Text+sLineBreak+mensagem;
  //'Enviado do jogo: Delphi 10.3 Rio  - Rod - Primeiro teste de envio de mensagem... www.google.com.br';

  //sArqOrig1:='/storage/emulated/0/Download/calendario.jpg';
  //sArqOrig2:='sua_pasta/arquivo2.jpg';

  //os arquivos devem ser copiados para uma pasta que o Whatapp possa ter acesso,
  //como a pasta temporária do seu app (TPath.GetTempPath)
  //sArqEnv1:=TPath.GetTempPath +'/'+ ExtractFileName(sArqOrig1);  //System.IOUtils
  //sArqEnv2:=TPath.GetTempPath +'/'+ ExtractFileName(sArqOrig2);

  //então copiamos os arquivos para a pasta TPath.GetTempPath
  //depois é aconselhável deletá-los
  //Tfile.Copy(sArqOrig1,sArqEnv1);
 // Tfile.Copy(sArqOrig2,sArqEnv2);

  //criar o array para colocarmoa a lista de arquivos a serem enviados
  ListArqs:= TJArrayList.Create;

  FileUri:=TJNet_Uri.JavaClass.fromFile(TJFile.JavaClass.init(StringToJString(sArqOrig1)));
  iArq:=0;
  ListArqs.add(iArq,FileUri);

  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,StringToJString(mensagem));

  //para audio (‘audio/mp3’) ou (‘audio/mpeg3’) ou ainda (‘audio/*’)
  IntentWhats.setType(StringToJString('image/jpg'));
  IntentWhats.putExtra()
  IntentWhats.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM,ListArqs);
  IntentWhats.setPackage(StringToJString('com.whatsapp'));

  //compartilhar diretamente com o WhatsApp
  SharedActivity.startActivity(IntentWhats);

  //substiua a próxima linha pela a anterior se quiser ter a opção de escolher com qual app compartilhar
  //SharedActivity.startActivity (TJIntent.JavaClass.createChooser(IntentWhats,StrToJCharSequence(‘Compartilhar com?’))); }
 end;  *)

{procedure TFormPontuacao.WhatsAppEmbarcadero;
var
IntentWhats : JIntent;
Uri: Jnet_Uri;
texto : string;
AttachmentFile: JFile;
begin
  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhats.setPackage(StringToJString('com.whatsapp'));

  AttachmentFile := TJFile.JavaClass.init(StringToJString(system.IOUtils.TPath.Combine(system.IOUtils.TPath.GetDownloadsPath,'Vini.jpg')));
  Uri := TJnet_Uri.JavaClass.fromFile(AttachmentFile);

  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,StringToJString(texto));
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((Uri as ILocalObject).GetObjectID));
  IntentWhats.setType(StringToJString('image/*'));
  IntentWhats.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
  SharedActivity.startActivity(IntentWhats);
end;    }

procedure TFormPontuacao.btnCompartilharClick(Sender: TObject);
var
{$IFDEF ANDROID}
  IntentWhats : JIntent;
  IntentWhatsApp: JIntent;
  FileUri: Jnet_Uri;
  lst: JArrayList;
{$ENDIF}
  img: TBitmap;
  sMensagem: String;
begin
  sMensagem := 'Acesse o site: https://desafio100app.blogspot.com   ';
  sMensagem := 'O Jogador: '+FormLogin.edtJogador.Text+' - concluiu o desafio 100 de '+sDisciplina+', '+sLineBreak+sMensagem;

  img := LayoutVitoria.MakeScreenshot;

  try
    img.SaveToFile(TPath.combine(TPath.GetDownloadsPath, 'screenshot_temp.jpg'));
  except
     on E : Exception do
     begin
       ShowMessage('Erro ao salvar a imagem da pontuação: '+E.Message);
     end;
  end;

  {$IFDEF ANDROID}
  lst:= TJArrayList.Create;

  FileUri := TJNet_Uri.JavaClass.fromFile(TJFile.JavaClass.init(StringToJString(system.IOUtils.TPath.GetDownloadsPath + '/screenshot_temp.jpg')));

  lst.add(0,FileUri);

  IntentWhatsApp := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhatsApp.setType(StringToJString('text/plain'));
  IntentWhatsApp.putExtra(TJIntent.JavaClass .EXTRA_TEXT,StringToJString(sMensagem));

  IntentWhatsApp.setType(StringToJString('image/jpg'));
  IntentWhatsApp.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM,lst);
  IntentWhatsApp.setPackage(StringToJString('com.whatsapp'));

  SharedActivity.startActivity(IntentWhatsApp);
  {$ENDIF}
end;

procedure TFormPontuacao.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
