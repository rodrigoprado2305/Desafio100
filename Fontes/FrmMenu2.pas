unit FrmMenu2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Edit;


type
  TFormMenu2 = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure iniciarJogo(iDisciplina: Integer);
  public
    { Public declarations }
  end;

var
  FormMenu2: TFormMenu2;

implementation

uses frmPrincipal, FrmLogin;

{$R *.fmx}

procedure TFormMenu2.Button1Click(Sender: TObject);
begin
  iniciarJogo(1);
end;

procedure TFormMenu2.Button2Click(Sender: TObject);
begin
  iniciarJogo(2);
end;

procedure TFormMenu2.Button3Click(Sender: TObject);
begin
  iniciarJogo(3);
end;

procedure TFormMenu2.Button4Click(Sender: TObject);
begin
  iniciarJogo(4);
end;

procedure TFormMenu2.iniciarJogo(iDisciplina: Integer);
begin
  //FormPrincipal := TFormNiveis.Create(Application);
  FormPrincipal.iDisciplina := iDisciplina;
  FormPrincipal.Show;
end;

procedure TFormMenu2.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
