unit FrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Edit,
  FMX.Platform, System.Permissions, FMX.MultiView, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.ImageList,
  FMX.ImgList, FMX.ListView, FMX.Effects, FMX.Filter.Effects, FMX.Media;

type
  TFormLogin = class(TForm)
    LayoutLogo: TLayout;
    btnAcessar: TButton;
    edtJogador: TEdit;
    UserImage: TImage;
    HeaderToolBar: TToolBar;
    DrawerMultiView: TMultiView;
    lvMenu: TListView;
    imgFiguras: TImageList;
    FillRGBEffect4: TFillRGBEffect;
    btnHamburguer: TSpeedButton;
    LogoCircle: TCircle;
    LogoImage: TImage;
    VertScrollBox1: TVertScrollBox;
    LayoutLogin: TLayout;
    LayoutLoginSub: TLayout;
    StyleBook1: TStyleBook;
    procedure btnAcessarClick(Sender: TObject);
    procedure edtJogadorKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lvMenuItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

uses
  FMX.DialogService, FrmMenu, Frmweb, FrmSobre;

{$R *.fmx}

procedure TFormLogin.btnAcessarClick(Sender: TObject);
begin
  {showmessage('GetHomePath: '+ system.IOUtils.TPath.GetHomePath); // /data/user/0/com.rodrigoprado.Desafio100/files
  showmessage('GetHomePath2: '+ GetHomePath); // /data/user/0/com.rodrigoprado.Desafio100/files
  //showmessage('GetDownloadsPath: '+ system.IOUtils.TPath.GetDownloadsPath); // /storage/emulated/0/Android/data/com.rodrigoprado.Desafio100/files/Download
//showmessage('GetShareddocumentsPath: '+ system.IOUtils.TPath.GetShareddocumentsPath()); // /storage/emulated/0/Documents
  //lst.SaveToFile(system.IOUtils.TPath.GetShareddocumentsPath() + '/testshared.txt');
             }
  if Trim(edtJogador.Text) = '' then
  begin
    showmessage('Informe o nome do jogador para continuar!');
    exit;
  end;
  FormMenu.Show;
end;

procedure TFormLogin.edtJogadorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) Or (Key = vkTab) then  // depois de digitar e teclar enter, focar o botao
    btnAcessar.SetFocus;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
    with lvMenu.Items.Add do
    begin
      Text := 'Privacidade';
      Detail := 'Política de ' + Text;
      ImageIndex := 0;
    end;

    with lvMenu.Items.Add do
    begin
      Text := 'Sobre';
      Detail := 'Informações da versão';
      ImageIndex := 1;
    end;
end;

procedure TFormLogin.lvMenuItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if pos('Privacidade', AItem.Text) > 0 then
  begin
    FormWeb.WebBrowser.URL := 'https://desafio100app.blogspot.com/p/blog-page.html';
    FormWeb.Show;
  end
  else
    FormSobre.Show;
end;

end.
