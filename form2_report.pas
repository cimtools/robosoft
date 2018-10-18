unit form2_report;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls, ComCtrls,printers, Buttons,inifiles;

type
  TForm2 = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  ini: tinifile;
implementation

uses ats_acl_full;

{$R *.DFM}

procedure TForm2.BitBtn1Click(Sender: TObject);


begin
 
 if opendialog1.Execute then
  begin
   edit1.text:=opendialog1.FileName;
   ini:=Tinifile.create(edit1.text);
  end;
 end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   if edit1.Text<>''then
    begin
     ini:=Tinifile.create(edit1.text);
   if radiobutton1.Checked=true then
    begin
     RoboMain.Panel12.Caption:='                  Terminal do Controlador TIPO A';
     ini.WriteString('Controlador','Tipo A', 'yes');
     ini.WriteString('Controlador','Tipo B', 'no');
     ini.WriteString('Controlador','Tipo AC', 'no');
    end;

   if radiobutton2.Checked=true then
    begin
     RoboMain.Panel12.Caption:='                  Terminal do Controlador TIPO B';
     ini.WriteString('Controlador','Tipo A', 'no');
     ini.WriteString('Controlador','Tipo B', 'yes');
     ini.WriteString('Controlador','Tipo AC', 'no');
    end;

   if radiobutton3.Checked=true then
    begin
     RoboMain.Panel12.Caption:='                  Terminal do Controlador TIPO AC';
     ini.WriteString('Controlador','Tipo A', 'no');
     ini.WriteString('Controlador','Tipo B', 'no');
     ini.WriteString('Controlador','Tipo AC', 'yes');
    end;
  ini.Free;
  form2.Hide;
  end else begin
    showmessage('Selecione o arquivo de configuração');
    end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
ini:=tinifile.create('c:\Arquivos de Programas\RoboSoft\robosoft.ini');
edit1.Text:='c:\Arquivos de Programas\RoboSoft\robosoft.ini';
if ini.readstring('Controlador','Tipo A','')='yes' then radiobutton1.Checked:=true;
if ini.readstring('Controlador','Tipo B','')='yes' then radiobutton2.Checked:=true;
if ini.readstring('Controlador','Tipo AC','')='yes' then radiobutton3.Checked:=true;
end;

end.
