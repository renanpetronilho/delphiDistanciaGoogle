unit uMapsDistancia;

interface

uses
  IdHTTP, SysUtils,uJson;

type

  {Classe entidade Estado}
  TEstado = class
  private
    FidEstado: Integer;
    Fsigla: string;
    Fnome: string;
    procedure SetidEstado(const Value: Integer);
    procedure Setnome(const Value: string);
    procedure Setsigla(const Value: string);
  published
    public
      property idEstado : Integer read FidEstado write SetidEstado;
      property nome : string read Fnome write Setnome;
      property sigla : string read Fsigla write Setsigla;
  end;

  {Classe de entidade Cidade}
  TCidade = class
  private
    FidCidade: Integer;
    Fnome: string;
    Festado: TEstado;
    procedure Setestado(const Value: TEstado);
    procedure SetidCidade(const Value: Integer);
    procedure Setnome(const Value: string);  
  public
      property idCidade : Integer read FidCidade write SetidCidade;
      property nome : string read Fnome write Setnome;
      property estado : TEstado read Festado write Setestado;
  end;

  {Classe de entidade Distancia}
  TDistancia = class
  private
    Fdistancia: Real;
    Ftempo: Real;
    FcidadeDestino: TCidade;
    FcidadeOrigem: TCidade;
    procedure SetcidadeDestino(const Value: TCidade);
    procedure SetcidadeOrigem(const Value: TCidade);
    procedure Setdistancia(const Value: Real);
    procedure Settempo(const Value: Real);
  public
      property cidadeOrigem : TCidade read FcidadeOrigem write SetcidadeOrigem;
      property cidadeDestino : TCidade read FcidadeDestino write SetcidadeDestino;
      property distancia : Real read Fdistancia write Setdistancia;
      property tempo : Real read Ftempo write Settempo;
  end;


 {Classe de entidade Maps onde executa as busca na api google de matriz de distancia}
  TMaps = class
   public
      class function getDistancia(cidadeOrigem : TCidade; cidadeDestino : TCidade):TDistancia; overload;
      class function getDistancia(json : string):TDistancia;overload;
  end;

  {Constantes}
  const
    URL_GOOGLE_MAPS = 'http://maps.googleapis.com/maps/api/distancematrix/json';


implementation



{ TEstado }

procedure TEstado.SetidEstado(const Value: Integer);
begin
  FidEstado := Value;
end;

procedure TEstado.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TEstado.Setsigla(const Value: string);
begin
  Fsigla := Value;
end;



{ TCidade }
procedure TCidade.Setestado(const Value: TEstado);
begin
  Festado := Value;
end;

procedure TCidade.SetidCidade(const Value: Integer);
begin
  FidCidade := Value;
end;

procedure TCidade.Setnome(const Value: string);
begin
  Fnome := Value;
end;

{ TDistancia }

procedure TDistancia.SetcidadeDestino(const Value: TCidade);
begin
  FcidadeDestino := Value;
end;

procedure TDistancia.SetcidadeOrigem(const Value: TCidade);
begin
  FcidadeOrigem := Value;
end;

procedure TDistancia.Setdistancia(const Value: Real);
begin
  Fdistancia := Value;
end;

procedure TDistancia.Settempo(const Value: Real);
begin
  Ftempo := Value;
end;

{ TMaps }


/// <summary>
///  Função que retorna o Objeto TDistancia com seguintes atributos cidade origem, cidade destino,
///  Tempo em minutos e  Distancia em km
/// </summary>
/// <param name="cidadeOrigem:TCidade">Cidade de origem para busca</param>
/// <param name="cidadeDestino:TCidade">Cidade de Destino para busca</param>
/// <author>Renan Petronilho</author>
/// <version>1.0</version>
class function TMaps.getDistancia(cidadeOrigem,cidadeDestino: TCidade): TDistancia;
var
  http : TIdHTTP;
  url : String;
  resultado : String;
  origem,destino,ufOrigem,ufDestino : String;
  distancia : TDistancia;
begin
  distancia := TDistancia.Create;
  try
    //substitui os espaços por  %20
    origem  := StringReplace(cidadeOrigem.nome,' ','%20',[rfReplaceAll, rfIgnoreCase]);
    destino := StringReplace(cidadeDestino.nome,' ','%20',[rfReplaceAll, rfIgnoreCase]);
    ufOrigem := StringReplace(cidadeOrigem.estado.sigla,' ','%20',[rfReplaceAll, rfIgnoreCase]);
    ufDestino := StringReplace(cidadeDestino.estado.sigla,' ','%20',[rfReplaceAll, rfIgnoreCase]);
    
    url  :=  URL_GOOGLE_MAPS + '?origins='+origem+'%20'+ufOrigem+'&destinations='+destino+'%20'+ufDestino+'&mode=driving&language=pt-BR&sensor=false';
    http := TIdHTTP.Create(nil);
    http.Request.Clear;
    http.Request.CustomHeaders.Clear;
    http.Request.ContentType := 'application/json';
    http.Request.Accept := 'application/json';
    resultado := http.Get(url);
    distancia := getDistancia(resultado);
    distancia.cidadeDestino := cidadeDestino;
    distancia.cidadeOrigem  := cidadeOrigem;
  except
    {não precisa ser tratado o erro}
  end;
  Result := distancia;
end;




/// <summary>
///  Função que retorna o Objeto TDistancia com seguintes atributos cidade origem, cidade destino,
///  Tempo em minutos e  Distancia em km.
///  Essa função pega o json passado e transforma em TDistancia
/// </summary>
/// <param name="json:string">String com json recuperado do serviço do google</param>
/// <author>Renan Petronilho</author>
/// <version>1.0</version>
class function TMaps.getDistancia(json: string): TDistancia;
var
  jsonObj : TJSONObject;
  retorno : TDistancia;
  distance : TJSONObject;
  duration : TJSONObject;
begin
  try
    retorno := TDistancia.Create;
    try
      jsonObj := TJSONObject.create(json);
      distance := jsonObj.getJSONArray('rows').getJSONObject(0).getJSONArray('elements').getJSONObject(0).getJSONObject('distance');
      duration := jsonObj.getJSONArray('rows').getJSONObject(0).getJSONArray('elements').getJSONObject(0).getJSONObject('duration');

      retorno.distancia := Round(distance.getDouble('value')/1000);
      retorno.tempo := Round(duration.getDouble('value')/60);
    except
      {Não precisa ser tratado o erro}
    end;
  finally
     FreeAndNil(jsonObj);
  end;
  Result := retorno;
end;

end.
