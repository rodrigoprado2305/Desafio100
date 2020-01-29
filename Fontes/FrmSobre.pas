unit FrmSobre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TFormSobre = class(TForm)
    Layout1: TLayout;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    barCabecalho: TToolBar;
    btnVoltar: TSpeedButton;
    Label1: TLabel;
    LogoCircle: TCircle;
    LogoImage: TImage;
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

uses frmLogin;

{$R *.fmx}

procedure TFormSobre.btnVoltarClick(Sender: TObject);
begin
 Close;
end;

end.
