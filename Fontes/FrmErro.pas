unit FrmErro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Advertising,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts
            {
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  , , FMX.Advertising,
  FMX.Controls.Presentation; }

 {$IFDEF ANDROID}
  ,Androidapi.JNI.AdMob, Androidapi.JNIBridge, Androidapi.JNI.Embarcadero,Androidapi.JNI.JavaTypes
  , FMX.Platform.Android, Androidapi.Helpers, FMX.Helpers.Android,
   Androidapi.JNI.PlayServices
 {$ENDIF}
  ;

type

 {$IFDEF ANDROID}
  TMyAdViewListener = class(TJavaLocal, JIAdListener)
  private
    FAD: JInterstitialAd;
  public
    constructor Create(AAD: JInterstitialAd);
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(errorCode: Integer); cdecl;
    procedure onAdLeftApplication; cdecl;
    procedure onAdOpened; cdecl;
    procedure onAdLoaded; cdecl;
  end;
 {$ENDIF}

  TFormErro = class(TForm)
    btnVideo: TButton;
    btnRecomecar: TButton;
    Label1: TLabel;
    lytMeio: TLayout;
    Timer1: TTimer;
    lblLembrete: TLabel;
    imgErro: TImage;
    rectOkErro: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure btnRecomecarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
  private
    { Private declarations }
    //iTempo: integer;
    LAdViewListener: TMyAdViewListener;
    FInterStitial: JInterstitialAd;
    procedure anuncioPremiado;
  public
    { Public declarations }
  end;

var
  FormErro: TFormErro;

implementation

uses FrmPrincipal, FrmLogin;

{$R *.fmx}

procedure TFormErro.anuncioPremiado;
var
  LADRequestBuilder: JAdRequest_Builder;
  LadRequest: JAdRequest;
begin
  LADRequestBuilder := TJAdRequest_Builder.Create;                                           // deixar o getdeviceID para modo Teste
  LADRequestBuilder.addTestDevice(StringToJString('ca-app-pub-9350000386173480~1001141581'));//(MainActivity.getDeviceID);
  LadRequest := LADRequestBuilder.build();
  LAdViewListener := TMyAdViewListener.Create(FInterStitial);
  CallInUIThread(
    procedure
    begin
      FInterStitial.setAdListener(TJAdListenerAdapter.JavaClass.init
        (LAdViewListener));
      FInterStitial.loadAd(LadRequest);
    end);

  Timer1.Enabled := True;
end;

procedure TFormErro.btnRecomecarClick(Sender: TObject);
begin
  FormPrincipal.reset(0);
  close;
end;

procedure TFormErro.btnVideoClick(Sender: TObject);
begin
  anunciopremiado;
  btnRecomecar.Enabled := False;
  btnVideo.Enabled := False;
end;

procedure TFormErro.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := False;
  btnRecomecar.Enabled := True;
  btnVideo.Enabled := True;
  FormPrincipal.reset(10+1); //se vc quer voltar duas fase, jogue 3, se for 10, jogue 11
  close;
end;

{ TMyAdViewListener }

procedure TFormErro.FormCreate(Sender: TObject);
begin
  FInterStitial := TJInterstitialAd.JavaClass.init(MainActivity);
  FInterStitial.setAdUnitId
    //(StringToJString('ca-app-pub-9350000386173480/8402629629')); // Rewarded
    (StringToJString('ca-app-pub-9350000386173480/6705570423')); // InterStitial
   //(StringToJString('ca-app-pub-9350000386173480~1001141581')); // InterStitial
end;

procedure TFormErro.FormShow(Sender: TObject);
begin
  Timer1.Enabled := False;
end;

constructor TMyAdViewListener.Create(AAD: JInterstitialAd);
begin
  inherited Create;
  FAD := AAD;
end;

procedure TMyAdViewListener.onAdClosed;
begin
//
end;

procedure TMyAdViewListener.onAdFailedToLoad(errorCode: Integer);
begin
//
end;

procedure TMyAdViewListener.onAdLeftApplication;
begin
//
end;

procedure TMyAdViewListener.onAdLoaded;
begin
  FAD.show;
end;

procedure TMyAdViewListener.onAdOpened;
begin
//
end;

end.


