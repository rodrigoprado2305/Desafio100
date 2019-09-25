unit FrmMenu3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFormMenu3 = class(TForm)
    lvNiveis: TListView;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure lvNiveisItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure iniciarJogo(iDisciplina: Integer);
  public
    { Public declarations }
  end;

var
  FormMenu3: TFormMenu3;

implementation

uses frmPrincipal, FrmLogin;

{$R *.fmx}

procedure TFormMenu3.iniciarJogo(iDisciplina: Integer);
begin
  //FormPrincipal := TFormNiveis.Create(Application);
  FormPrincipal.iDisciplina := iDisciplina;
  FormPrincipal.Show;
end;

procedure TFormMenu3.FormShow(Sender: TObject);
var
  liItem: TListViewItem;
begin
  lvNiveis.Items.Clear;
  lvNiveis.BeginUpdate;
  try
      liItem := lvNiveis.Items.Add;
      liItem.Text := 'Matemática';

      liItem := lvNiveis.Items.Add;
      liItem.Text := 'Português';

      liItem := lvNiveis.Items.Add;
      liItem.Text := 'Geografia';

      liItem := lvNiveis.Items.Add;
      liItem.Text := 'Conhecimentos Gerais';
  finally
    lvNiveis.EndUpdate;
  end;
end;

procedure TFormMenu3.lvNiveisItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

    iniciarJogo(1)
  else if pos('Por', AItem.Text) > 0 then
    iniciarJogo(2)
  else if pos('Geo', AItem.Text) > 0 then
    iniciarJogo(3)
  else
    iniciarJogo(4);
end;

procedure TFormMenu3.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
