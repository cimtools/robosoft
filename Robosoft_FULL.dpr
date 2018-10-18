program Robosoft_FULL;

uses
  Windows,
  Messages,
  Dialogs,
  Forms,
  ats_acl_full in 'ats_acl_full.pas' {RoboMain},
  form2_report in 'form2_report.pas' {Form2},
  remove_form_4 in 'remove_form_4.pas' {Form3},
  Splash in 'Splash.pas' {Form4},
  Log_Term in 'Log_Term.pas' {Form5},
  log_tcpip in 'log_tcpip.pas' {Form7},
  l_coman_help in 'l_coman_help.pas' {L_Comandos},
  comandos in 'comandos.pas' {Acess_Comados},
  user in 'user.pas' {User_control};

//Menu_download in 'Menu_download.pas' {Form6};

//remove_form_2 in 'remove_form_2.pas' {form3}

{$R *.RES}

var
hwnd: THandle;
i: integer;
s,s1,s2: string;
begin
hwnd:=findWindow('TRoboMain',nil);
s:='Testando comunicação ';
s1:='.';
s2:='.';
if hwnd=0 then
begin
  Application.Initialize;
  form4:=TForm4.Create(Application);
  form4.show;
  form4.Refresh;
  for i:=0 to 8 do
  begin
   form4.Label3.Caption:= s + s1;
   form4.Label3.Refresh;
   sleep(300);
   s1:=s1+s2;
  end;

  Application.CreateForm(TRoboMain, RoboMain);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TL_Comandos, L_Comandos);
  Application.CreateForm(TAcess_Comados, Acess_Comados);
  Application.CreateForm(TUser_control, User_control);
  form4.Hide;
  form4.free;
  Application.Run;
end
else
begin
 messagedlg('Não há necessidade de executar mais de um ROBOSOFT ao mesmo tempo.' ,mtinformation,[mbOk],0);
end;
end.


