program JsonClient;

uses
  Forms,
  uPrinicipal in 'uPrinicipal.pas' {Form1},
  uMapsDistancia in 'uMapsDistancia.pas',
  uJSON in 'uJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
