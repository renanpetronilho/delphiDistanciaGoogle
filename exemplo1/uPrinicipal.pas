unit uPrinicipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IdHTTP, StdCtrls,uMapsDistancia, Buttons, ActnList;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    gpOrigem: TGroupBox;
    edUFOrigem: TEdit;
    edOrigem: TEdit;
    gpDestino: TGroupBox;
    edDestino: TEdit;
    edUFDestino: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnBuscar: TBitBtn;
    ActionList1: TActionList;
    ac_buscar: TAction;
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }


procedure TForm1.btnBuscarClick(Sender: TObject);
var
  citOrigem, citDestino : TCidade;
  ufOrigem, ufDestino : TEstado;
  distancia : TDistancia;
begin
  citOrigem := TCidade.Create;
  citOrigem.nome := Trim(edOrigem.Text);

  citDestino := TCidade.Create;
  citDestino.nome := Trim(edDestino.Text);

  ufOrigem := TEstado.Create;
  ufOrigem.sigla := edUFOrigem.Text;

  ufDestino := TEstado.Create;
  ufDestino.sigla := edUFDestino.Text;

  citOrigem.estado := ufOrigem;
  citDestino.estado := ufDestino;

  distancia := TDistancia.Create;
  distancia := TMaps.getDistancia(citOrigem,citDestino);
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Origem : ' + distancia.cidadeOrigem.nome+' - '+distancia.cidadeOrigem.estado.sigla);
  Memo1.Lines.Add('Destino : ' + distancia.cidadeDestino.nome+' - '+distancia.cidadeDestino.estado.sigla);
  Memo1.Lines.Add('Distancia : ' + FloatToStr(distancia.distancia) + 'KM');
  Memo1.Lines.Add('Tempo : ' + FloatToStr(distancia.tempo));
end;

end.
