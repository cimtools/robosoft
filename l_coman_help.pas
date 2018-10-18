unit l_coman_help;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls;

type THelp = class
  private
   Nome_comando: string;
   Sintaxe: string;
   Descricao: string;
   Notas: string;
   Exemplo: string;

  public
   constructor create;
   procedure compara;
//   procedure set_Comando;
   procedure set_Nome_comando(s: string);
   procedure set_Sintaxe(s: string);
   procedure set_Descricao(s: string);
   procedure set_Notas(s: string);
   procedure set_Exemplo(s: string);

   function get_Nome_comando: string;
   function get_Sintaxe: string;
   function get_Descricao: string;
   function get_Notas: string;
   function get_Exemplo: string;
 end;

type
  TL_Comandos = class(TForm)
    GroupBox1: TGroupBox;
    TreeView1: TTreeView;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    RichEdit1: TRichEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  L_Comandos: TL_Comandos;
  help1: Thelp;

implementation
uses ats_acl_full;

{$R *.DFM}


constructor Thelp.create;
begin
descricao:='';
exemplo:='';
nome_comando:='';
notas:='';
sintaxe:='';
end;


procedure THelp.compara;
begin

if help1.get_Nome_comando = 'MOVE/MOVED' then
begin
  l_comandos.RichEdit1.Lines.Add(help1.get_nome_comando);
//******************************************************************************
  help1.set_Sintaxe(#13+'SINTAXE:' + #13 +
                    'MOVE <pos> {<tempo>}' + #13
                    + 'MOVED <pos> {<tempo>}' + #13
                    + 'Onde:' + #13 +
                    '<pos> é o nome definido pelo usuário.' + #13 +
                    '<tempo> é uma variável ou constante definida.');
//******************************************************************************
  help1.set_Descricao(#13+'DESCRIÇÃO:' +#13+
                      'O comando MOVE deposita um movimento no buffer de movimento.' +
                      ' O programa usa o comando MOVE mas não espera que o movimento' +
                      ' acabe para começar o próximo.' + #13 +
                      'O comando MOVED deposita um movimento no buffer de movimento e' +
                      ' só executa o próximo comando quando o comando corrente acabou.');
//******************************************************************************
  help1.set_Exemplo(#13 + 'EXEMPLOS:' + #13 +
                    'PROGRAM EX1    // Não existe sincronismo entre os movimentos' + #13 +
                    ' MOVE POS1     // Move para POS1' + #13 +
                    ' MOVE POS2 800 // Move para POS2 em 8 segundos' + #13 +
                    ' MOVE POS3     // Move para POS3' + #13 +
                    'END' +#13#13 +

                    'PROGRAM EX2    // Existe sincronismo entre os movimentos' + #13 +
                    ' MOVE POS4     // Move para POS4' + #13 +
                    ' MOVE POS5 900 // Move para POS5 em 9 segundos' + #13 +
                    ' MOVE POS6     // Move para POS6' + #13 +
                    'END' +#13#13);
//******************************************************************************
 l_comandos.RichEdit1.Lines.Add(help1.get_sintaxe);
 l_comandos.RichEdit1.Lines.Add(help1.get_descricao);
 l_comandos.RichEdit1.Lines.Add(help1.get_exemplo);
end;
end;


procedure THelp.set_Nome_comando(s: string);
begin
nome_comando:=s;
end;

procedure THelp.set_Sintaxe(s: string);
begin
sintaxe:=s;
end;

procedure Thelp.set_Descricao(s: string);
begin
descricao:=s;
end;

procedure THelp.set_Notas(s: string);
begin
Notas:=s;
end;

procedure Thelp.set_Exemplo(s: string);
begin
exemplo:=s;
end;

function Thelp.get_Nome_comando: string;
begin
l_comandos.RichEdit1.SelAttributes.Name:='MS Sans Serif';
l_comandos.RichEdit1.SelAttributes.Size:=14;
l_comandos.RichEdit1.SelAttributes.Style:=[fsbold];
result:= nome_comando;
end;

function Thelp.get_Sintaxe: string;
begin
l_comandos.RichEdit1.SelAttributes.Name:='MS Sans Serif';
l_comandos.RichEdit1.SelAttributes.Size:=8;
l_comandos.RichEdit1.SelAttributes.Style:=[];
result:= sintaxe;

end;

function Thelp.get_Descricao: string;
begin
l_comandos.RichEdit1.SelAttributes.Name:='MS Sans Serif';
l_comandos.RichEdit1.SelAttributes.Size:=8;
result:= descricao;
end;

function Thelp.get_Notas: string;
begin
l_comandos.RichEdit1.SelAttributes.Name:='MS Sans Serif';
l_comandos.RichEdit1.SelAttributes.Size:=8;
result:=Notas;
end;

function Thelp.get_Exemplo: string;
begin
l_comandos.RichEdit1.SelAttributes.Size:=8;
l_comandos.RichEdit1.SelAttributes.Name:='Courier New';
result:=exemplo;
end;

procedure TL_Comandos.BitBtn1Click(Sender: TObject);
begin
L_Comandos.Hide;
robomain.Refresh;
end;

procedure TL_Comandos.TreeView1Click(Sender: TObject);
begin
richedit1.Clear;
help1.set_Nome_comando(treeview1.Selected.Text);
help1.compara;
end;

procedure TL_Comandos.FormCreate(Sender: TObject);
begin
help1:=Thelp.create;
end;

end.
