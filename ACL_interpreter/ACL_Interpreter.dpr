program ACL_Interpreter;

uses
  Forms,
  inter_v1 in 'inter_v1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
