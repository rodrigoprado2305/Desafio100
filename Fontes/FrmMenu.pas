unit FrmMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Advertising,
  FMX.ImgList, System.ImageList, FMX.Effects, FMX.Filter.Effects;

type
  TFormMenu = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    layoutDisciplina01: TLayout;
    lblDisciplina01: TLabel;
    layoutDisciplina02: TLayout;
    lblDisciplina02: TLabel;
    layoutDisciplina03: TLayout;
    lblDisciplina03: TLabel;
    layoutDisciplina04: TLayout;
    lblDisciplina04: TLabel;
    lytDisciplina1: TLayout;
    lytDisciplina2: TLayout;
    lytDisciplina3: TLayout;
    lytDisciplina4: TLayout;
    UpperVertRect: TRectangle;
    UpperLeftRect: TRectangle;
    MiddleVertRect: TRectangle;
    UpperRightRect: TRectangle;
    barCabecalho: TToolBar;
    btnVoltar: TSpeedButton;
    imgDisciplina01: TImage;
    imgDisciplina02: TImage;
    imgDisciplina03: TImage;
    imgDisciplina04: TImage;
    lblTitulo: TLabel;
    imgDisciplinas: TImageList;
    procedure btnVoltarClick(Sender: TObject);
    procedure imgDisciplina01Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure iniciarJogo(iDisciplina: Integer);
  end;

var
  FormMenu: TFormMenu;

implementation

uses frmPrincipal, FrmLogin;

{$R *.fmx}

procedure TFormMenu.imgDisciplina01Click(Sender: TObject);
begin
  iniciarJogo(TImage(Sender).Tag);
end;

procedure TFormMenu.iniciarJogo(iDisciplina: Integer);
begin
  FormPrincipal.iDisciplina := iDisciplina;
  FormPrincipal.Show;
end;

procedure TFormMenu.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

end.


