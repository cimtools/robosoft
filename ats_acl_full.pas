unit ats_acl_full;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus, CPort, CPortCtl, ToolWin, printers, ExtCtrls,
  QuickRpt, Qrctrls, ImgList, Buttons, SynEditHighlighter,
  SynHighlighterGeneral, SynEdit, SynCompletionProposal, mdMailSlot, jpeg, inifiles,
  Db, DBTables, ScktComp;

//---- Controle da utilização do robosoft pelo usuario -------------------------
type TUsuario = class
 private
  nome_usuario: string;
  nome_computador: string;
  connect: integer;

 public
   constructor create;
   procedure setusuario;
   procedure setcomputador;
   procedure SetConnect(conn: integer);
   function GetConnect: integer;
   function Getusuario: string;
   function Getcomputador: string;
end;

//---- Classe de controle dos comandos de variáveis ----------------------------

type TComandos = class
 private
  n_vardefine: integer;
  n_varglobal: integer;
  conta: integer;
  contag: integer;
  define_var: array[0..100] of string;
  global_var: array[0..100] of string;

 public
  procedure ini;
  constructor create;

  procedure setvardefine(s: string; l: integer);
  procedure definestorage(s: string);
  procedure liststorage;

  procedure setvarglobal(s: string; l: integer);
  procedure globalstorage(s: string);
  procedure liststorageg;

  function Umespaco(s: string): string;
end;

//----- Classe de controle das definições das posições off-line ----------------

type TPosicao = class
 private
 l_positions: integer;
 l_endpos: integer;

 public
  function sendpos: boolean;
  function findpos: boolean;
  function findendpos: boolean;
  procedure setlpositions(l:integer);
  procedure setlendpos(l:integer);
  function getlposition: integer;
  function getlendpos: integer;
 end;

//----- Classe de mensagens ao usuario -------------------------------------
type TMensagens = class
 private
  erro: string;
  errot2: string;
  alerta: string;
  msg: string;
  cool: string;
  linha_msg: integer;
  linha_erro: integer;

 public
  procedure setcool(s: string);
  procedure getcool;
  procedure seterro(s: string);
  procedure geterro;
  procedure seterrot2(s: string;l: integer);
  procedure geterrot2;
  procedure setmsg(s: string;l: integer);
  procedure setalerta(s: string);
  procedure getalerta;
  procedure getmsg;
  constructor create;
end;

//------ Classe que controla alguns valores de controle do programa ------------
type TControle = class
  private
  sinal : integer;
  resp: integer;
  mail: integer;
  soma: integer;
  page: integer;
  name_pc: string;

  public
  constructor create;
  function esp_prompt: string;
  procedure no_echo;
  procedure echo;
  procedure setsinal(si: integer);
  function getsinal: integer;
  procedure setResp(r: integer);
  function getResp: integer;
  procedure setMail(m: integer);
  function getMail: integer;
  procedure setsoma;
  procedure resetsoma;
  function getsoma: integer;
  procedure setpage(p: integer);
  function getpage: integer;
  procedure setnamepc(n: string);
  function getnamepc: string;
end;

//------- Classe que controla a posição do programa no editor e avalia a linha -
type TProgram = class
 private
 l_program: integer;
 l_end: integer;
 nomedoprograma: string;
 n_progs: integer;
 n_ends: integer;

 public
  constructor create;
  procedure setnumprogs;
  function getnumprogs: integer;
  procedure setnumends;
  function getnumends: integer;
  procedure setini;
  function sendprog: boolean;
  function findprog: boolean;
  procedure setnomeprog(p: string);
  function getnomeprog: string;
  function findend: boolean;
  procedure setlprogram(l:integer);
  procedure setlend(l:integer);
  function getlprogram: integer;
  function getlend: integer;
  function tiracom(s: string): string;
  function get_esp_carac(s: string): boolean;
 end;

//----- Controla a posição do FOR no programa e conta o numero total -----------
type TFindFor = class
 private
 n_for: integer;
 l_for: integer;

 public
 constructor create;
 procedure setfor;
 procedure setini;
 function getfor: integer;
 function getlfor: integer;
 end;

//------Controla a posição do ENDFOR programa e conta o numero total -----------
type TFindEndFor = class
 private
 n_endfor: integer;
 l_endfor: integer;

 public
 constructor create;
 procedure setendfor;
 procedure setini;
 function getendfor: integer;
 function getlendfor: integer;
 end;

//------------------------------------------------------------------------------
type TCompEstrut = class
 public
  function setcomparafor: boolean;
  function setcomparaif: boolean;
end;
//------------------------------------------------------------------------------

type TFindIf = class
 private
 n_if: integer;
 l_if: integer;

 public
  constructor create;
  procedure setif;
  procedure setini;
  function getif: integer;
  function getlif: integer;
end;

//------------------------------------------------------------------------------
type TFindEndIf = class
 private
 n_endif: integer;
 l_endif: integer;

 public
  constructor create;
  procedure setendif;
  procedure setini;
  function getendif: integer;
  function getlendif: integer;
end;
//------------------------------------------------------------------------------

type TListaerros = class
 public
  function FatalTA(s,s1: string;l: integer): integer;
  function FatalTB(s,s1: string;l: integer): integer;
  function FatalQQ(s: string;l: integer): integer;
end;

//------------------------------------------------------------------------------
type TVerCommands = class
 public
  function FindCommad: boolean;
end;
//------------------------------------------------------------------------------


type
  TRoboMain = class(TForm)
    ComPort1: TComPort;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Open1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    ComPort2: TComPort;
    Fe1: TMenuItem;
    Download1: TMenuItem;
    ComunanicaodaEstao1: TMenuItem;
    BotesdeControle1: TMenuItem;
    Configuraes1: TMenuItem;
    Reconectar1: TMenuItem;
    RunHomes1: TMenuItem;
    R1: TMenuItem;
    N3: TMenuItem;
    ControlEnable1: TMenuItem;
    ControlDisable1: TMenuItem;
    Iinitc1: TMenuItem;
    ComDataPacket1: TComDataPacket;
    SynGeneralSyn1: TSynGeneralSyn;
    PopupMenu2: TPopupMenu;
    Copiar1: TMenuItem;
    Copiar2: TMenuItem;
    Recortar1: TMenuItem;
    N6: TMenuItem;
    Novo1: TMenuItem;
    PopupMenu3: TPopupMenu;
    RunHomes2: TMenuItem;
    RunShutd1: TMenuItem;
    RunINITC1: TMenuItem;
    N7: TMenuItem;
    Configuraes2: TMenuItem;
    RemoveroPrograma1: TMenuItem;
    ListaroPrograma1: TMenuItem;
    SynCompletionProposal1: TSynCompletionProposal;
    ImageList2: TImageList;
    N4: TMenuItem;
    Help2: TMenuItem;
    ComDataPacket2: TComDataPacket;
    mdMailSlot1: TmdMailSlot;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Panel1: TPanel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    ComTerminal1: TComTerminal;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    ListView3: TListView;
    Panel6: TPanel;
    ListView2: TListView;
    Panel8: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    Panel9: TPanel;
    RichEdit1: TRichEdit;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel10: TPanel;
    RichEdit2: TRichEdit;
    SpeedButton22: TSpeedButton;
    ImageList3: TImageList;
    Panel11: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel12: TPanel;
    Image1: TImage;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Panel13: TPanel;
    ProgressBar1: TProgressBar;
    PageControl2: TPageControl;
    Image2: TImage;
    SpeedButton9: TSpeedButton;
    Controlador1: TMenuItem;
    SpeedButton2: TSpeedButton;
    FindDialog1: TFindDialog;
    SpeedButton10: TSpeedButton;
    StatusBar1: TStatusBar;
    SpeedButton12: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton11: TSpeedButton;
    TabSheet4: TTabSheet;
    ListView4: TListView;
    Panel14: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel15: TPanel;
    ListView1: TListView;
    Panel16: TPanel;
    ListView5: TListView;
    Userdados: TMenuItem;
    ClientSocket1: TClientSocket;
    Timer1: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    function Esp_interroga : string;
    function Esp_prompt :  string;
    procedure salvar;
    procedure abrir;
    procedure download_A;
    procedure download_B;
    procedure imprimir;
    procedure novo;
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Download1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure Reconectar1Click(Sender: TObject);
    procedure RunHomes1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure ControlEnable1Click(Sender: TObject);
    procedure ControlDisable1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton7MouseMove(Sender: TObject; Shift: TShiftState; X,y: Integer);
    procedure Copiar2Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Recortar1Click(Sender: TObject);
    procedure Download2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure RunHomes2Click(Sender: TObject);
    procedure RunShutd1Click(Sender: TObject);
    procedure RunINITC1Click(Sender: TObject);
    procedure Reconectar2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Removerprograma1Click(Sender: TObject);
    procedure reconect;
    procedure config;
    procedure Configuraes2Click(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: String);
    procedure ComTerminal1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComTerminal1KeyPress(Sender: TObject; var Key: Char);
    procedure Iinitc1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ExecutaroPrograma1Click(Sender: TObject);
    procedure ListaroPrograma1Click(Sender: TObject);
    procedure RemoveroPrograma1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton9MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton8MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton4MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton10MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton11MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton12MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton14MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton15MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton16MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure habilita_botoes;
    procedure desabilita_botoes;
    procedure executar;
    procedure ComDataPacket2Packet(Sender: TObject; const Str: String);
    procedure mdMailSlot1MessageAvail(Sender: TObject; Msg: String);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    function GetComputerNetName: string;
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure RichEdit1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RichEdit1KeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton17MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton18MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton19MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton20MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton21MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SpeedButton22MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure novo_editor;
    procedure select_edit;
    procedure remove_proj;
    procedure deselect_edit;
    procedure modo_terminal;
    procedure Controlador1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ComTerminal1StrRecieved(Sender: TObject; var Str: String);
    function  test_download: integer;
    function  test_comunica: integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Help2Click(Sender: TObject);
    function caracter_especial(str_f: string;linha_cont:integer) : integer;
    procedure UserdadosClick(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);


published

Editor0:tsynedit;
Editor1:tsynedit;
Editor2:tsynedit;
Editor3:tsynedit;
Editor4:tsynedit;
Editor5:tsynedit;
editor6:tsynedit;
editor7:tsynedit;
editor8:tsynedit;
editor9:tsynedit;
editor10:tsynedit;
editor11:tsynedit;
Editor12:tsynedit;
editor13:tsynedit;
editor14:tsynedit;
editor15:tsynedit;
editor16:tsynedit;
editor17:tsynedit;
editor18:tsynedit;
editor19:tsynedit;
editor20:tsynedit;
editor21:tsynedit;
editor22:tsynedit;
editor23:tsynedit;
editor24:tsynedit;
editor25:tsynedit;
editor26:tsynedit;
editor27:tsynedit;
editor28:tsynedit;
editor29:tsynedit;
editor30:tsynedit;
editor31:tsynedit;
editor: tsynedit;
listitem: TListItem;

  private
    { Private declarations }
  public
    { Public declarations }
  procedure WMGetMinMaxInfo(var MSG: TMessage); message WM_GetMinMaxInfo;

  end;

var
  RoboMain: TRoboMain;
  Controle: TControle;
  Posicao: TPosicao;
  Programa: TProgram;
  Mensagem: TMensagens;
  NFor: TFindFor;
  NEndFor: TFindEndFor;
  NIf: TFindIf;
  NEndIf: TFindEndIf;
  Estrutura: TCompEstrut;
  ListaErro: TListaErros;
  VerCommands: TVerCommands;
  Comands: Tcomandos;
  UserStat: TUsuario;
//------------------------------------------------------------------------------

  ini: TINIFile;

implementation

uses remove_form_4, form2_report, Log_Term, menu_download, Splash, log_tcpip,
     l_coman_help, comandos,user;

{$R *.DFM}

constructor TUsuario.create;
begin
connect:=0;
end;

procedure TUsuario.SetConnect(conn: integer);
begin
connect:=conn;
end;

function TUsuario.GetConnect: integer;
begin
result:=connect;
end;

function TUsuario.Getusuario: string;
begin
 result:=nome_usuario;
end;

function TUsuario.Getcomputador: string;
begin
 result:=nome_computador;
end;

procedure TUsuario.setusuario;
var
username: string;
usernamelen: Dword;
begin
Usernamelen:= 255;
setlength(username, usernamelen);

if getusername(Pchar(username), usernamelen) then
  nome_usuario:= lowercase(copy(username,1,usernamelen-1))
else
  nome_usuario:= 'Usuário desconhecido';
end;

//*****************************
procedure TUsuario.setcomputador;
var
computername: string;
computernamelen: dword;
begin
computernamelen:=255;
setlength(computername,computernamelen);

if getcomputername(Pchar(computername), computernamelen) then
 nome_computador := lowercase(copy(computername,1,computernamelen))
else
 nome_computador:= 'Desconhecido';
end;


//******************************************************************************

constructor TComandos.create;
var
i: integer;
begin
n_vardefine:=0;
n_varglobal:=0;
conta:=0;
contag:=0;
for i:=0 to 100 do
begin
 define_var[i]:=' ';
 global_var[i]:=' ';
end;
end;

procedure TComandos.ini;
var
i: integer;
begin
n_vardefine:=0;
n_varglobal:=0;
conta:=0;
contag:=0;
for i:=0 to 100 do
begin
 define_var[i]:=' ';
 global_var[i]:=' ';
end;
end;

function TComandos.Umespaco(s: string): string;
var
tam,i, posi: integer;
str, aux: string;
begin
str:=trim(s)+' ';
tam:=length(str);
aux:='';
posi:=1;

for i:=1 to tam do
 begin
   if str[i] = ' ' then
    begin
    aux:= trim(aux) + ' ' + trim(copy(str,posi,i-posi));
    posi:=i;
   end;
end;
result:= trim(aux);
end;

procedure TComandos.definestorage(s: string);
begin
define_var[conta]:=s;
end;

procedure TComandos.liststorage;
var
i: integer;
begin
//for i:=n_vardefine to conta-1 do
if conta>0 then
begin
for i:=0 to conta-1 do
begin
 with robomain.listview5 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=6;
 robomain.ListItem.Caption:='LOCAL';
 robomain.ListItem.SubItems.Add(trim(lowercase(define_var[i])));
 robomain.listview5.Refresh;
end;
end;
end;
end;

procedure TComandos.globalstorage(s: string);
begin
global_var[contag]:=s;
end;

procedure TComandos.liststorageg;
var
i: integer;
begin
//for i:=n_varglobal to contag-1 do
if contag > 0 then
begin
for i:=0 to contag-1 do
begin
 with robomain.listview5 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=7;
 robomain.ListItem.Caption:='GLOBAL';
 robomain.ListItem.SubItems.Add(trim(lowercase(global_var[i])));
 robomain.listview5.Refresh;
end;
end;
end;
end;

procedure TComandos.setvardefine(s: string; l: integer);
var
str: string;
tam,i,aux,soma: integer;
begin
str := Umespaco(s) + ' ';
tam := length(str);
soma:= 0;
aux := 0;
for i:=1 to tam do
begin
 if str[i] = ' ' then
  begin
   definestorage(copy(str,aux,i-aux));
   inc(soma);
   inc(conta);
   aux:=i;
   end;
end;

if soma > 12 then
begin
 listaerro.FatalQQ('1000',l);
end else begin
 n_vardefine:=conta;
end;
end;

procedure TComandos.setvarglobal(s: string; l: integer);
var
str: string;
tam,i,aux,soma: integer;
begin
str := Umespaco(s) + ' ';
tam:= length(str);
soma:=0;
aux:=0;
for i:=1 to tam do
begin
 if str[i] = ' ' then
  begin
    globalstorage(copy(str,aux,i-aux));
    inc(soma);
    inc(contag);
    aux:=i;
   end;
end;

if soma > 12 then
begin
 listaerro.FatalQQ('1001',l);
end else begin
 n_varglobal:=contag;
end;

end;

function TVerCommands.FindCommad: boolean;
var
str,s, argumentos: string;
i,f,x,r1,r2,tam : integer;

begin
result:=true;
robomain.select_edit;
r2:=0;

for x:=programa.getlprogram+1 to programa.getlend - 1 do
begin
 r1:=0;
 s:= trim(uppercase(programa.tiracom(robomain.Editor.Lines[x]))) + ' ';
 tam:= length(trim(s));
 f:=pos(' ',s);
 str:=trim(copy(s,0,f));
 argumentos:=trim(copy(s,f,(tam-f)+1));

 if (programa.get_esp_carac(s) = true) and (s<>'') then
 begin
  mensagem.seterrot2('Utilização de caracter especial.',x+1);
  mensagem.geterrot2;
  inc(r2);
 end;

  if str<>'' then
  begin
    for i:=0 to robomain.SynGeneralSyn1.KeyWords.Count - 1 do
    begin
     if str = robomain.SynGeneralSyn1.KeyWords.Strings[i] then //verifica o comando
     begin
      inc(r1);
      if uppercase(str) = 'DEFINE' then comands.setvardefine(argumentos,x+1);
      if uppercase(str) = 'GLOBAL' then comands.setvarglobal(argumentos,x+1);
     end;
     end;

  if r1 = 0 then
  begin
   mensagem.seterrot2('Comando desconhecido: ' + trim(uppercase(programa.tiracom(str))), x + 1);
   mensagem.geterrot2;
   result:=false;
  end;

 end;

end;
 if r2>0 then result:=false;
end;

//--------------- Erros gerais para verifação antes do download
function TListaErros.FatalQQ(s:string;l: integer): integer;
begin
result:=0;
if s = '1000' then
 begin
 result:=2;
 mensagem.setmsg(' Foi definido mais de 12 variáveis em DEFINE, pode ocorrer falhas na execução do programa. ',l);
 mensagem.getmsg;
 end;

if s = '1001' then
 begin
 result:=2;
 mensagem.setmsg(' Foi definido mais de 12 variáveis em GLOBAL, pode ocorrer falhas na execução do programa. ',l);
 mensagem.getmsg;
 end;

if s = '1002' then
 begin
 result:=2;
 mensagem.setmsg('Variável com mais de 5 caracteres. ',l);
 mensagem.getmsg;
 end;


end;

function TListaErros.FatalTB(s,s1: string;l: integer): integer;
begin
result:=0;

 if pos('(3)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Comando desconhecido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(6)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Programa especificado não existe: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(39)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Número incorreto de argumentos: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(63)',uppercase(trim(s))) <> 0 then
 begin
  result:=2;
  mensagem.setmsg('Nome da variável já existe: ' + trim(uppercase(s1)),l);
  mensagem.getmsg;
 end;

 if pos('(100)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Sem memória - PROGRAMAS ' + trim(uppercase(s1)),0);
  mensagem.geterrot2;
 end;

 if pos('(101)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Erros sintaxe: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(102)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(103)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Argumento desconhecido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(104)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Programa indefinido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(105)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida - PRIORITY: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

  if pos('(106)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida - PEND/POST/QPEND/QPOST: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(109)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Sem memória - LINHAS DE PROGRAMA: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(110)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Posição indefinida, não gravada: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(111)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Sem memória - VARIÁVEIS ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(113)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Nome da posição inválido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(114)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Primeira variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(115)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Segunda variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(116)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida - SPEED: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(117)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Sem memória - STRINGS ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(118)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Argumento inválido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(119)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(120)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável inválida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(121)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Terceira variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(122)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida - TRIGGER: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(123)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Input/output inválido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(124)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Eixo indefinido ou inválido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(125)',uppercase(trim(s))) <> 0 then
 begin
  result:=2;
  mensagem.setmsg('Nome da posição já existe:' + trim(uppercase(s1)),l);
  mensagem.getmsg;

 end;

 if pos('(126)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Dimensão inválida do vetor: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(127)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Erro sintaxe no índice do vetor: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(128)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Valor da constante é muito grande: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(129)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Seqüência inválida no programa: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(135)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Número do LABEL está repetido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(136)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Sem operador ou operador inválido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(137)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Sem argumento para o SPEED: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(138)',uppercase(trim(s))) <> 0 then
 begin
  result:=2;
  mensagem.setmsg('Nome do vetor já existe: ' + trim(uppercase(s1)),l);
  mensagem.getmsg;
 end;

 if pos('(140)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Nome da variável muito longo, máximo 5 caracteres: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(144)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Argumento muito longo, máximo 10 caracteres: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(145)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Posição não foi definida ou não é um vetor: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(146)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Nome inválido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('(147)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Número da porta serial inválida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

end;

//--------- ERROS PARA MANIPUAÇÃO COM VARIAVEL TIPO A --------------------------
function TListaErros.FatalTA(s,s1: string;l: integer): integer;
begin
result:=0;

 if pos('*UNRECOGNIZEDCOMMAND*',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Comando desconhecido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('FIRSTVARIABLEUNDEFINED',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Primeira variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('SECONDVARIABLEUNDEFINED',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Segunda variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('UNDEFINEDORILLEGALVARIABLE(S)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('MISSING(ORBAD)OPERATOR',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Operador desconhecido: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if (pos('NAMEALREADYINUSE.',uppercase(trim(s))) <> 0) or
    (pos('ALREADYEXISTS',uppercase(trim(s))) <> 0) then
 begin
  result:=2;
  mensagem.setmsg('Nome da variável ou vetor já existe: ' + trim(uppercase(s1)),l);
  mensagem.getmsg;
 end;

//---------------------- ERROS PARA MANIPULACAO DE POSICAO ---------------------

 if pos('UNDEFINEDPOINTORINCOMPATIBLEGROUP',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Posição indefinida: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('NAMEALREADYINUSEORBADAXIS',uppercase(trim(s))) <> 0 then
 begin
  result:=2;
  mensagem.setmsg('Nome da posição já existe: ' + trim(uppercase(s1)),l);
  mensagem.getmsg;
 end;

//---------------------- ERRO NO DIMENSIONAMENTO DO VETOR ----------------------

 if pos('ILLEGALDIMENTION',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Erro de dimensionamento no vetor: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

//------------------ PROGRAMA INEXISTENTE --------------------------------------
 if pos('UNDEFINEDPROGRAM',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Programa da subrotina inexistente: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

//------------------ Erros no argumentos do read e print(ln) -------------------
 if pos('BADARGUMENT(S)',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Argumento inválido, variável desconhecida ou erro na mensagem: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

//----------------- Laço FOR erro das variaveis --------------------------------
 if pos('SYNTAXERROR',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Erro sintaxe: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('UNDEFINEDLOOPCOUNTER',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Variável contadora do laço não está declarada: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;

 if pos('THIRDVARIABLEUNDEFINED',uppercase(trim(s))) <> 0 then
 begin
  result:=1;
  mensagem.seterrot2('Terceira variável não está declarada: ' + trim(uppercase(s1)),l+1);
  mensagem.geterrot2;
 end;
end; //FIM


//------------------------------------------------------------------------------
function TCompEstrut.setcomparafor: boolean;
begin
NFor.setini;
NEndFor.setini;

NFor.setfor;
NEndfor.setendfor;

 if NFor.getfor = NEndFor.getendfor then
 begin
  result:=true;
 end else begin
  if NFor.getfor < NEndFor.getendfor then
   begin
    mensagem.seterrot2('Não exite "FOR" para o "ENDFOR".',NEndFor.getlendfor+1);
    mensagem.geterrot2;
   end else begin
    mensagem.seterrot2('Não exite "ENDFOR" para o "FOR".',NFor.getlfor+1);
    mensagem.geterrot2;
   end;
   result:=false;
 end;
end;
//------------------------------------------------------------------------------

function TCompEstrut.setcomparaif: boolean;
begin
Nif.setini;
NEndif.setini;

Nif.setif;
NEndif.setendif;

 if Nif.getif = NEndif.getendif then
 begin
  result:=true;
 end else begin
  if Nif.getif < NEndif.getendif then
   begin
    mensagem.seterrot2('Não exite "IF" para o "ENDIF".',NEndif.getlendif+1);
    mensagem.geterrot2;
   end else begin
    mensagem.seterrot2('Não exite "ENDIF" para o "IF".',NIf.getlIf+1);
    mensagem.geterrot2;
   end;
   result:=false;
 end;
end;

//------------------------------------------------------------------------------
constructor TFindIf.create;
begin
l_if:=0;
n_if:=0;
end;

procedure TFindIf.setini;
begin
l_if:=0;
n_if:=0;
end;

procedure TFindIf.setif;
var
str,ppif: string;
i,esp: integer;
begin
robomain.select_edit;
str:='';

 for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
  str:=trim(lowercase(programa.tiracom(robomain.Editor.Lines[i])))+ ' ';
  esp:=pos(' ',str);
  ppif:=trim(copy(str,0,esp));
 if ppif = 'if' then
 begin
  n_if:=n_if+1;
  l_if:=i;                                                     
 end;
 end;
end;

function TFindIf.getif: integer;
begin
result:=n_if;
end;

function TFindIf.getlif: integer;
begin
result:=l_if;
end;
//------------------------------------------------------------------------------
constructor TFindEndif.create;
begin
l_endif:=0;
n_endif:=0;
end;

procedure TFindEndif.setini;
begin
l_endif:=0;
n_endif:=0;
end;

procedure TFindEndif.setendif;
var
str_endif: string;
i: integer;
begin
robomain.select_edit;
str_endif:='';
 for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
  str_endif:=trim(programa.tiracom(robomain.Editor.Lines[i]));
  if trim(lowercase(str_endif)) = 'endif' then
   begin
    n_endif:=n_endif+1;
    l_endif:=i;
   end;
 end;
end;

function TFindendif.getendif: integer;
begin
result:=n_endif;
end;

function TFindendif.getlendif: integer;
begin
result:=l_endif;
end;


//------------------------------------------------------------------------------
constructor TFindFor.create;
begin
l_for:=0;
n_for:=0;
end;

procedure TFindFor.setini;
begin
l_for:=0;
n_for:=0;
end;

procedure TFindFor.setfor;
var
str,ppos: string;
i,esp: integer;
begin
robomain.select_edit;
str:='';

 for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
  str:=trim(lowercase(programa.tiracom(robomain.Editor.Lines[i]))) + ' ';
  esp:=pos(' ',str);
  ppos:=trim(copy(str,0,esp));
 if ppos = 'for' then
 begin
  n_for:=n_for+1;
  l_for:=i;
 end;
 end;
end;

//------------------------------------------------------------------------------

function TFindFor.getfor: integer;
begin
result:=n_for;
end;

function TFindfor.getlfor: integer;
begin
result:= l_for;
end;

//------------------------------------------------------------------------------
constructor TFindEndFor.create;
begin
l_endfor:=0;
n_endfor:=0;
end;

procedure TFindEndFor.setini;
begin
l_endfor:=0;
n_endfor:=0;
end;

procedure TFindEndFor.setendfor;
var
str_endfor: string;
i: integer;
begin
robomain.select_edit;
str_endfor:='';
 for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
  str_endfor:=trim(programa.tiracom(robomain.Editor.Lines[i]));
  if trim(lowercase(str_endfor)) = 'endfor' then
   begin
    n_endfor:=n_endfor+1;
    l_endfor:=i;
   end;
 end;
end;

function TFindendfor.getendfor: integer;
begin
result:=n_endfor;
end;

function TFindendfor.getlendfor: integer;
begin
result:=l_endfor;
end;
//------------------------------------------------------------------------------




//------------------------------------------------------------------------------
constructor TProgram.create;
begin
l_end:=0;
l_program:=0;
nomedoprograma:='';
n_progs:=0;
n_ends:=0;
end;

function TProgram.get_esp_carac(s: string): boolean;
var
tam,i: integer;
c: boolean;
begin
tam:=length(s);
c:=false;
for i:=1 to tam do
 begin
  if (int64(s[i]) > 191) and (int64(s[i]) < 256)// then
      or (int64(s[i])=94) or (int64(s[i])=126)
      or (int64(s[i])=168) or (int64(s[i])=180)  then
   begin
      c:=true;
   end;
 end;

 if c = true then
 begin
 result:=true;
 end else begin
 result:=false;
 end;
end;


procedure TProgram.setini;
begin
l_end:=0;
l_program:=0;
nomedoprograma:='';
n_progs:=0;
n_ends:=0;
end;

procedure TProgram.setnumprogs;
begin
inc(n_progs);
end;

function TProgram.getnumprogs: integer;
begin
result:=n_progs;
end;

procedure TProgram.setnumends;
begin
inc(n_ends);
end;

function TProgram.getnumends: integer;
begin
result:=n_ends;
end;

function TProgram.sendprog: boolean;
var
c,v_prog,v_end, esp_nome: boolean;

begin
c:=false;
programa.setini;
v_prog:=programa.findprog;
v_end:=programa.findend;
esp_nome:=programa.get_esp_carac(programa.getnomeprog);

if esp_nome = false then
begin

 if (programa.getnumprogs  < 2) and (programa.getnumends < 2 ) then // Se tiver apenas 1 program e 1 end
 begin

 if (v_prog = true) and (v_end=true) then
 begin

  if programa.getlprogram < programa.getlend then
  begin
   c:=true;
  end else begin
   mensagem.seterro('Posição do "END" está antes do "PROGRAM".');
   mensagem.geterro;
  end;

 end else begin


       if (v_prog = false) and (v_end = false) then
       begin
      //  mensagem.seterro('Não existe programa para download');
      //  mensagem.geterro;
        c:=false;
       end else begin

//------------------------------------------------------------------------------
         if v_prog = false then
         begin
          mensagem.seterro('Falha na definição "PROGRAM".');
          mensagem.geterro;
         end;

         if v_end = false then
          begin
          mensagem.seterro('Faltou a definição "END".');
          mensagem.geterro;
         end;
//------------------------------------------------------------------------------

       end;
 end;

end else begin
  c:=false;
  if programa.getnumprogs > 1 then
   begin
   mensagem.seterro('Só é permitido um PROGRAM por programa.');
   mensagem.geterro;
   end;

  if programa.getnumends > 1 then
   begin
   mensagem.seterro('Só é permitido um END por programa.');
   mensagem.geterro;
   end;

end;
end else begin
   mensagem.seterrot2('Utilização de caracter especial no nome do programa.',programa.getlprogram+1);
   mensagem.geterrot2;
end;


 if c= true then
 begin
  result:=true;
 end else begin
  result:=false;
 end;

end;
//------------------------------------------------------------------------------

procedure TProgram.setlend(l: integer);
begin
l_end:= l;
end;
//------------------------------------------------------------------------------

function TProgram.getlend: integer;
begin
result:=l_end;
end;

//------------------------------------------------------------------------------
function TProgram.findend: boolean;
var
i: integer;
c: boolean;
str_end: string;
begin
robomain.select_edit;
c:=false;
str_end:='';
for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
  str_end:=trim(programa.tiracom(robomain.Editor.Lines[i]));
  if trim(lowercase(str_end)) = 'end' then
   begin
    c:=true;
    programa.setlend(i);
    programa.setnumends;
   end;
end;

if c = true then
begin
 result:= true;
end else begin
 result:= false;
end;
end;
//------------------------------------------------------------------------------

function TProgram.tiracom(s: string): string;
begin
 if (pos(';' ,s)<> 0) or (pos('//' , s)<> 0) then //detector do que é comentario
 begin
  if (pos(';' , s)<> 0) then result:=trim(copy(s,0,pos(';' , s) - 1 ));
  if (pos('//' , s)<> 0) then result:=trim(copy(s,0,pos('//' , s) - 1 ));
 end else begin
  result:=trim(s); //Frase a ser enviada
 end;
end;


function TProgram.findprog: boolean;
var
i,esp,t,t_nome: integer;
c: boolean;
str,prog1,nome_prog: string;
begin
robomain.select_edit;
c:=false;
str:='';
nome_prog:='';

for i:=0 to robomain.Editor.Lines.Count - 1 do
begin
str:=trim(lowercase(programa.tiracom(robomain.Editor.Lines[i])))+ ' ';
t:=length(str);
esp:=pos(' ',str);
prog1:=trim(copy(str,0,esp));


  if prog1 = 'program' then
   begin

    nome_prog:=trim(copy(str,esp,(t-esp)+1));
    t_nome:=length(trim(nome_prog));
    programa.setnumprogs;
     if (t_nome >= 1) and (t_nome <= 5) then
     begin
      programa.setnomeprog(nome_prog);
      programa.setlprogram(i);
      c:=true;
     end else begin

        if t_nome < 1 then
        begin
         mensagem.seterro('Programa sem nome.');
         mensagem.geterro;
        end else begin
         mensagem.seterro('Número de caracteres do programa maior que 5.');
         mensagem.geterro;
        end;

     end;
   end;
end;


 if c = true then
 begin
  result:= true;
 end else begin
  result:= false;
 end;

end;

//------------------------------------------------------------------------------
procedure TProgram.setnomeprog(p: string);
begin
nomedoprograma:=p;
end;

//------------------------------------------------------------------------------
function TProgram.getnomeprog: string;
begin
result:=nomedoprograma;
end;

//------------------------------------------------------------------------------
procedure TProgram.setlprogram(l: integer);
begin
l_program:=l;
end;

//------------------------------------------------------------------------------
function TProgram.getlprogram: integer;
begin
result:=l_program;
end;

//------------------------------------------------------------------------------
constructor TMensagens.create;
begin
erro:='';
errot2:='';
alerta:='';
linha_msg:=0;
linha_erro:=0;
end;

procedure TMensagens.setcool(s: string);
begin
cool:=s;
end;

procedure TMensagens.getcool;
begin
with robomain.listview1 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=1;
// robomain.ListItem.Caption:='Fim';
 robomain.ListItem.SubItems.Add(cool);
 robomain.listview1.Refresh;
end;
end;

procedure TMensagens.setalerta(s: string);
begin
alerta:=s;
end;

procedure TMensagens.getalerta;
begin
with robomain.listview1 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=2;
 robomain.ListItem.SubItems.Add(alerta);
 robomain.ListItem.Caption:='Alerta';
 robomain.listview1.Refresh;
end;
end;

procedure TMensagens.seterro(s: string);
begin
erro:= s;
end;

procedure TMensagens.geterro;
begin
with Robomain.listview1 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=0;
 robomain.ListItem.Caption:='ERRO';
 robomain.ListItem.SubItems.Add(erro);
 robomain.listview1.Refresh;
end;
end;

procedure TMensagens.seterrot2(s: string;l: integer);
begin
 errot2:=s;
 linha_erro:=l;
end;

procedure TMensagens.geterrot2;
begin
with Robomain.listview1 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=0;
 robomain.ListItem.Caption:=inttostr(linha_erro);
 robomain.ListItem.SubItems.Add(errot2);
 robomain.listview1.Refresh;
end;
end;


//------------------------------------------------------------------------------

procedure TMensagens.setmsg(s: string;l: integer);
begin
 msg:=s;
 linha_msg:=l;
end;

procedure TMensagens.getmsg;
begin
with robomain.listview1 do
 begin
 robomain.ListItem:=Items.Add;
 robomain.listitem.ImageIndex:=2;
 robomain.ListItem.Caption:=inttostr(linha_msg+1);
 robomain.ListItem.SubItems.Add('[Alerta] ' + msg);
 robomain.listview1.Refresh;
end;
end;

procedure TPosicao.setlpositions(l: integer);
begin
l_positions:=l;
end;

procedure TPosicao.setlendpos(l: integer);
begin
l_endpos:=l;
end;
//------------------------------------------------------------------------------

function TPosicao.getlposition: integer;
begin
result:=l_positions;
end;

function TPosicao.getlendpos: integer;
begin
result:=l_endpos;
end;

function TPosicao.findpos: boolean;
var
i: integer;
c: boolean;
sem_coment: string;
begin
robomain.select_edit;
c:=false;
sem_coment:='';

for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
 sem_coment:=programa.tiracom(trim(robomain.Editor.Lines[i]));
  if trim(lowercase(sem_coment)) = 'positions' then
   begin
    c:=true;
    posicao.setlpositions(i);
   end;
end;

if c = true then
begin
 result:= true;
end else begin
 result:= false;
end;
end;
//------------------------------------------------------------------------------

function TPosicao.findendpos: boolean;
var
i: integer;
c: boolean;
sem_coment: string;
begin
robomain.select_edit;
c:=false;
sem_coment:='';
for i:=0 to robomain.Editor.Lines.Count - 1 do
 begin
  sem_coment:=programa.tiracom(trim(robomain.Editor.Lines[i]));
  if trim(lowercase(sem_coment)) = 'endpos' then
   begin
    c:=true;
    posicao.setlendpos(i);
   end;
end;

if c = true then
begin
 result:= true;
end else begin
 result:= false;
end;
end;

//------------------------------------------------------------------------------

function TPosicao.sendpos: boolean;
var
i: integer;
pos_sem_coment,r: string;
pos,endp,c: boolean;
begin

pos_sem_coment:='';
robomain.select_edit;

c:=false;
pos:= posicao.findpos;
endp:=posicao.findendpos;

if (pos = true) and (endp = true)   then
 begin

  if posicao.getlposition < posicao.getlendpos then
   begin
    controle.no_echo;
    r:=controle.esp_prompt;
    //c:=true;

    for i:=(posicao.getlposition+1) to (posicao.getlendpos-1) do
    begin
     pos_sem_coment:=programa.tiracom(trim(robomain.editor.Lines[i]));
     if pos_sem_coment<>'' then
     begin

     robomain.ComPort1.WriteStr(pos_sem_coment + #13);
     r:=controle.esp_prompt;

//------------------------------------------------------------------------------
//       if listaerro.FatalTA(r,pos_sem_coment,i+1) = true then
//       begin
//        c:=false;
//       end else begin
//        c:=true;
//       end;
//------------------------------------------------------------------------------

    end;
    end;
    controle.echo;
    r:=controle.esp_prompt;

   end else begin
    mensagem.seterro('"ENDPOS" está antes do "POSITIONS".');
    mensagem.geterro;
   end;

 end else begin

       if (pos = false) and (endp = false) then
       begin
       c:=true;
       end else begin
        if pos = false then
        begin
         mensagem.seterro('Erro na definição "POSITIONS".');
        end else begin
         mensagem.seterro('Erro na definição "ENDPOS".');
        end;
        mensagem.geterro;
       end;
 end;

 if c = true then
  begin
  result:=true;
  end else begin
  result:=false;
 end;

end;
//------------------------------------------------------------------------------






//------------------------------------------------------------------------------
constructor TControle.create;
begin
sinal:=0;
resp:=0;
mail:=0;
soma:=-1;
name_pc:='';
end;

procedure TControle.setnamepc(n: string);
begin
name_pc:=n;
end;

function Tcontrole.getnamepc: string;
begin
result:=name_pc;
end;

procedure Tcontrole.setpage(p: integer);
begin
page:= p;
end;

function Tcontrole.getpage: integer;
begin
result:=page;
end;

procedure Tcontrole.setsoma;
begin
inc(soma);
end;

procedure Tcontrole.resetsoma;
begin
soma:=-1;
end;

function Tcontrole.getsoma: integer;
begin
result:= soma;
end;


procedure TControle.setMail(m: integer);
begin
mail:=m;
end;

function TControle.getMail: integer;
begin
result:=mail;
end;

procedure TControle.setResp(r: integer);
begin
resp:=r;
end;

function TControle.getResp: integer;
begin
result:=resp;
end;

procedure TControle.setsinal(si: integer);
begin
sinal:=si;
end;

function TControle.getsinal: integer;
begin
result:=sinal;
end;

procedure TControle.no_echo;
begin
robomain.ComPort1.WriteStr('noecho' + #13);
end;

//------------------------------------------------------------------------------
procedure Tcontrole.echo;
begin
robomain.ComPort1.WriteStr('echo'+#13);
end;

//------------------------------------------------------------------------------

function TControle.esp_prompt: string;
var
valor,er: string;
begin
robomain.comport1.ReadStr(valor,1);

while valor<>'>' do    //espera chegar o proximo "?"
 begin
  robomain.comport1.ReadStr(valor,1);
  er:=er+trim(valor); //concatena os caracteres para formar um possivel erro.
 end;                 //while valor<>'?'

result:=er;

end;
//------------------------------------------------------------------------------






//******************************************************************************
procedure TRoboMain.WMGetMinMaxInfo(var MSG: TMessage);
begin
  inherited;
  with PMinMaxInfo(MSG.lparam)^ do begin
  ptMinTRackSize.X := 600;
  ptMinTRackSize.Y := 600;
 // ptMaxTRackSize.X := 350;
 // ptMaxTRackSize.Y := 250;
  end;
end;

//-----------------------------------------------------------------
function TRoboMain.caracter_especial(str_f: string; linha_cont: integer) : integer;
var
tam,i, erro: integer;
begin
tam:=length(str_f);
erro:=0;
for i:=1 to tam do
 begin
  if (int64(str_f[i]) > 191) and (int64(str_f[i]) < 256)// then
      or (int64(str_f[i])=94) or (int64(str_f[i])=126)
      or (int64(str_f[i])=168) or (int64(str_f[i])=180)  then
   begin
     with listview1 do
      begin
       ListItem:=Items.Add;
       listitem.ImageIndex:=2;
       ListItem.Caption:=inttostr(linha_cont+1);
       ListItem.SubItems.Add('(Alerta em: ' + trim(uppercase(str_f)) + ')' + '. Não utilizar caracteres especiais (acentuação, cedilha).');
       listview1.Refresh;
      end;
      erro:=1;
   end;
 end;

 if erro=1 then
 begin
 result:=100;
 end else begin
 result:=0;
 end;

end;


//-----------------------------------------------------------------
function TRoboMain.test_comunica: integer;
var
a,erro: integer;
valor: string;
begin
//Testa se o controlador tem comunicação antes de fazer o dowload
comport2.Connected:=false;
comport1.Connected:=true;
a:=0;
erro:=0;
comport1.WriteStr(#13);
comport1.ReadStr(valor,1);

Statusbar1.Panels[0].Text:='Conexão: Conectado ao controlador';
statusbar1.Refresh;
 while valor <> '>' do
  begin

  comport1.ReadStr(valor,1);

   if a=20000 then
      begin
       valor:='>';
       erro:=1;
       mensagem.seterro('Falha de comunicação com o controlador.');
       mensagem.geterro;
       Statusbar1.Panels[0].Text:='Conexão: Não conectado ao controlador';
       statusbar1.Refresh;
       desabilita_botoes;
       controle.setsinal(1);
      end;
    a:=a+1;

end;

comport1.ClearBuffer(true,true);
comport1.Connected:=false;
comport2.Connected:=true;
comport2.ClearBuffer(true,true);
comterminal1.SetFocus;

if erro=1 then
 begin
 result:=100;
 end else begin
 result:=0;
end;
end;

//--------------------------------------------------------------------------
function TRoboMain.test_download: integer;
var
a,erro: integer;
valor: string;
 begin
//------------------------------------------------------------------
//Testa se o controlador tem comunicação antes de fazer o dowload

a:=0;
erro:=0;
comport1.Writestr('exit' +#13);
comport1.ReadStr(valor,1);
Statusbar1.Panels[0].Text:='Conexão: Conectado ao controlador';
Statusbar1.Refresh;

 while valor <> '>' do
  begin
  comport1.ReadStr(valor,1);
   if a=20000 then
      begin
       valor:='>';
       erro:=1;
       mensagem.seterro('Não foi possível fazer o download, sem comunicação com o controlador.');
       mensagem.geterro;
       Statusbar1.Panels[0].Text:='Conexão: Não conectado ao controlador';
       statusbar1.Refresh;
       desabilita_botoes;
       controle.setsinal(1);
       comport1.Connected:=false;
       comterminal1.Enabled:=false;
       comport2.Connected:=true;
       comterminal1.Enabled:=true;
       comterminal1.ClearScreen;
      end;
    a:=a+1;
end;

if erro=1 then
 begin
 result:=100;
 end else begin
 result:=0;
end;

//---------------------------------------------------------------------
end;

procedure TRoboMain.modo_terminal;
begin
 comport1.WriteStr('echo' + #13);
 esp_prompt;
 comport1.Connected:=false;
 comterminal1.Enabled:=true;
 comport2.Connected:=true;
 comterminal1.SetFocus;
end;

//------------------------------------------------------------
procedure TRoboMain.deselect_edit;
var
names: string;
begin
if controle.getsoma >=0 then
begin
names:=pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Name;
if names='tabs0' then editor0.Text:=editor.Text;
if names='tabs1' then editor1.Text:=editor.Text;
if names='tabs2' then editor2.Text:=editor.Text;
if names='tabs3' then editor3.Text:=editor.Text;
if names='tabs4' then editor4.Text:=editor.Text;
if names='tabs5' then editor5.Text:=editor.Text;
if names='tabs6' then editor6.Text:=editor.Text;
if names='tabs7' then editor7.Text:=editor.Text;
if names='tabs8' then editor8.Text:=editor.Text;
if names='tabs9' then editor9.Text:=editor.Text;
if names='tabs10' then editor10.Text:=editor.Text;
if names='tabs11' then editor11.Text:=editor.Text;
if names='tabs12' then editor12.Text:=editor.Text;
if names='tabs13' then editor13.Text:=editor.Text;
if names='tabs14' then editor14.Text:=editor.Text;
if names='tabs15' then editor15.Text:=editor.Text;
if names='tabs16' then editor16.Text:=editor.Text;
if names='tabs17' then editor17.Text:=editor.Text;
if names='tabs18' then editor18.Text:=editor.Text;
if names='tabs19' then editor19.Text:=editor.Text;
if names='tabs20' then editor20.Text:=editor.Text;
if names='tabs21' then editor21.Text:=editor.Text;
if names='tabs22' then editor22.Text:=editor.Text;
if names='tabs23' then editor23.Text:=editor.Text;
if names='tabs24' then editor24.Text:=editor.Text;
if names='tabs25' then editor25.Text:=editor.Text;
if names='tabs26' then editor26.Text:=editor.Text;
if names='tabs27' then editor27.Text:=editor.Text;
if names='tabs28' then editor28.Text:=editor.Text;
if names='tabs29' then editor29.Text:=editor.Text;
if names='tabs30' then editor30.Text:=editor.Text;
if names='tabs31' then editor31.Text:=editor.Text;
end;
end;

//------------------------------------------------------
procedure TRoboMain.remove_proj;
begin
   if pagecontrol2.PageCount<>0 then
    begin
     pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Destroy;
     controle.setpage(pagecontrol2.pagecount);
    end;
   if pagecontrol2.PageCount=0 then
    begin
     controle.resetsoma;
     speedbutton6.Enabled:=false;
    end;
end;

//-------------------------------------------------------------
procedure TRoboMain.select_edit;
var
names: string;
begin
if controle.getsoma>=0 then
begin
names:=pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Name;
if names='tabs0' then editor.Text:=editor0.Text;
if names='tabs1' then editor.Text:=editor1.Text;
if names='tabs2' then editor.Text:=editor2.Text;
if names='tabs3' then editor.Text:=editor3.Text;
if names='tabs4' then editor.Text:=editor4.Text;
if names='tabs5' then editor.Text:=editor5.Text;
if names='tabs6' then editor.Text:=editor6.Text;
if names='tabs7' then editor.Text:=editor7.Text;
if names='tabs8' then editor.Text:=editor8.Text;
if names='tabs9' then editor.Text:=editor9.Text;
if names='tabs10' then editor.Text:=editor10.Text;
if names='tabs11' then editor.Text:=editor10.Text;
if names='tabs12' then editor.Text:=editor10.Text;
if names='tabs13' then editor.Text:=editor10.Text;
if names='tabs14' then editor.Text:=editor10.Text;
if names='tabs15' then editor.Text:=editor10.Text;
if names='tabs16' then editor.Text:=editor10.Text;
if names='tabs17' then editor.Text:=editor10.Text;
if names='tabs18' then editor.Text:=editor10.Text;
if names='tabs19' then editor.Text:=editor10.Text;
if names='tabs20' then editor.Text:=editor10.Text;
if names='tabs21' then editor.Text:=editor10.Text;
if names='tabs22' then editor.Text:=editor10.Text;
if names='tabs23' then editor.Text:=editor10.Text;
if names='tabs24' then editor.Text:=editor10.Text;
if names='tabs25' then editor.Text:=editor10.Text;
if names='tabs26' then editor.Text:=editor10.Text;
if names='tabs27' then editor.Text:=editor10.Text;
if names='tabs28' then editor.Text:=editor10.Text;
if names='tabs29' then editor.Text:=editor10.Text;
if names='tabs30' then editor.Text:=editor10.Text;
if names='tabs31' then editor.Text:=editor10.Text;
end;
end;

//--------------------------------------------------------

procedure TRoboMain.novo_editor;

begin
controle.setsoma;
//soma:=soma+1; //conta as abas e editores abartos. Máximo 31
controle.setpage(pagecontrol2.PageCount);

if controle.getsinal = 0 then
 speedbutton6.Enabled:=true;

 if controle.getsoma <32 then
  begin

    with TTabSheet.Create(Self) do
    begin
     PageControl := PageControl2;
     Caption := 'Projeto #'+ IntToStr(controle.getsoma);
     name:='tabs'+inttostr(controle.getsoma);
    end;

    with TSynedit.Create(self) do
    begin
     parent:=pagecontrol2.Pages[controle.getpage];
     name:='editor' + inttostr(controle.getsoma);
     highlighter:=syngeneralsyn1;
     gutter.ShowLineNumbers:=true;
     gutter.Font.Name:='courier new';
     gutter.Font.Style:=[fsbold];
     gutter.LeftOffset:=0;
     align:=AlClient;
     WantTabs:=true;
    end;
    
  end else begin
   MessageDlg ('Número máximo de projetos (31), excedidos.',mtinformation, [mbOk], 0);
end;
end;

//-----------------------------------------------------------
procedure TRoboMain.Executar;
var
nome_prog: string;
f_prog: boolean;
begin
select_edit;
f_prog:=programa.findprog;

 if f_prog = true then
 begin
  nome_prog:=programa.getnomeprog;

    if MessageDlg ('Executar o programa: ' + uppercase(nome_prog),mtconfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
     comport2.WriteStr('run ' + nome_prog + #13);
     comterminal1.SetFocus;
    end;

 end else begin
  MessageDlg ('PROGRAM <nome_do_programa> inexistente.',mtinformation, [mbOk], 0);
  modo_terminal;
 end;

end;

//-----------------------------------------------------------------
procedure TRoboMain.habilita_botoes;
begin
   runhomes1.Enabled:=true;
   R1.Enabled:=true;
   Iinitc1.Enabled:=true;
   ControlEnable1.Enabled:=true;
   Controldisable1.Enabled:=true;
   speedbutton1.Enabled:=true;
   speedbutton6.Enabled:=true;
   speedbutton7.Enabled:=true;
   speedbutton17.Enabled:=true;
   speedbutton18.Enabled:=true;
   speedbutton19.Enabled:=true;
   speedbutton20.Enabled:=true;
   speedbutton21.Enabled:=true;
   speedbutton22.Enabled:=true;
   ListaroPrograma1.Enabled:=true;
   RemoveroPrograma1.Enabled:=true;
   download1.Enabled:=true;
   listview1.Items.Clear;
end;

//-----------------------------------------------------------------
procedure TRoboMain.desabilita_botoes;
begin
   speedbutton1.Enabled:=false;
   speedbutton6.Enabled:=false;
   speedbutton7.Enabled:=false;
   speedbutton17.Enabled:=false;
   speedbutton18.Enabled:=false;
   speedbutton19.Enabled:=false;
   speedbutton20.Enabled:=false;
   speedbutton21.Enabled:=false;
   speedbutton22.Enabled:=false;
   RunHomes1.Enabled:=false;
   R1.Enabled:=false;
   Iinitc1.Enabled:=false;
   Download1.Enabled:=false;
   ControlEnable1.Enabled:=false;
   ControlDisable1.Enabled:=false;
   ListaroPrograma1.Enabled:=false;
   RemoveroPrograma1.Enabled:=false;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Config;
begin
   desabilita_botoes;
   comport2.ShowSetupDialog;
   comterminal1.Enabled:=false;
   messagedlg ('Clique em reconectar para habilitar o terminal.',
               mtInformation,[mbOk],0);
end;

//-----------------------------------------------------------------
procedure TRoboMain.reconect;
var
porta: string;
control: integer;
begin

if comport2.Port='COM2' then
 begin
  try
   comport2.open;
   control:=0;
   comport2.Connected:=true;
   comport2.WriteStr(#13);
  except on ecomport do
   control:=100;
  end;

i:=0;

 while porta <> '>' do
  begin
  comport2.ReadStr(porta,1);

   if i=2000 then
    begin
     porta:='>';
     control:=1;
    end;
  i:=i+1;
  end;

if (control=0)  then
 begin
  controle.setsinal(0);
  comterminal1.Enabled:=true;
  comterminal1.SetFocus;
  comport2.WriteStr(#13);
  habilita_botoes;
  comport2.WriteStr('echo');
  comport2.WriteStr(#13);
  comport2.ReadStr(porta,1);
   while porta<>'>' do
    begin
     comport2.ReadStr(porta,1);
    end;
 end;

if (control=100) then
 begin
  comterminal1.Enabled:=false;
  controle.setsinal(1);
  messagedlg('Não foi possível comunicar com o controlador' ,mtinformation,[mbOk],0);
  desabilita_botoes;
 end;

end else

begin
messagedlg('Porta não implemetada' ,mtinformation,[mbOk],0);
end;
end;

//-----------------------------------------------------------------
function TRoboMain.Esp_interroga: string;
var
valor: string;
begin
comport1.ReadStr(valor,1);
while valor<>'?' do comport1.ReadStr(valor,1);
end;

//-----------------------------------------------------------------
function TRoboMain.Esp_prompt: string;
var
valor: string;
begin
   comport1.ReadStr(valor,1);
  while valor<>'>' do comport1.ReadStr(valor,1);
end;

//-----------------------------------------------------------------
procedure TRoboMain.salvar;
var
s:string;
begin
select_edit;
savedialog1.FileName:=pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption;
 if SaveDialog1.Execute then
  begin

   if ExtractFileExt(savedialog1.FileName)='' then
    begin
     editor.Lines.SaveToFile(SaveDialog1.FileName + '.dnl');
     s:=extractfilename(SaveDialog1.filename);
     pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption:=s;
    end else begin
     editor.Lines.SaveToFile(SaveDialog1.FileName);
     s:=extractfilename(SaveDialog1.filename);
     delete(s,length(s)-3,4);
     pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption:=s;

    end;
end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.abrir;
var
s: string;
begin
OpenDialog1.FileName:='';
select_edit;
 if OpenDialog1.Execute then
  begin
   if trim(editor.Lines.Text)='' then
    begin
    editor.Lines.LoadFromFile(OpenDialog1.FileName);
    deselect_edit;
    s:=extractfilename(opendialog1.filename);
    s:=copy(s,1,length(s)-4);
    pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption:=s;
    end else begin
     if messagedlg('Deseja reescrever o conteúdo ?' ,mtConfirmation,[mbYes,mbNo],0) = mryes then
     begin
      editor.Lines.LoadFromFile(OpenDialog1.FileName);
      deselect_edit;
      s:=extractfilename(opendialog1.filename);
      s:=copy(s,1,length(s)-4);
      pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption:=s;
     end;
    end;
 end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.novo;
//var
//opcao: word;
//cu: integer;
begin
//select_edit;
//opcao:=messagedlg ('Essa opção irá fechar todos projetos abertos. ',
//               mtConfirmation,[mbYes,mbNo,mbCancel],0);

//if opcao=mryes then
//  begin
//    for cu:=pagecontrol2.PageCount to pagecontrol2.PageCount-1 do
//      begin
       // pagecontrol2.Pages[cu].Destroy;
//       end;
  // novo_editor;
  //salvar;
  //editor.ClearAll;
  //edit2.Text:='';

//  end;

//if opcao=mrno then
//  begin
//  editor.ClearAll;
//  edit2.Text:='';
//  end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.download_A; //rotina de download para o controlador do TIPO A
var                             //a diferença está basicamente no momento de reescrever programas existentes
er,frase,valor,nome_prog: string;
control,i,erro,linha_program,linha_end: integer;
esp_carac: integer;
f_prog, for_prog, if_prog, f_comm: boolean;
begin
listview1.Items.Clear;
listview1.Refresh;
listview5.items.clear;
listview5.Refresh;
comands.ini;
robomain.Refresh;
comport2.Connected:=false;
comterminal1.Enabled:=false;
comport1.Connected:=true;
control:=0;
linha_program:=0;
linha_end:=0;
erro:=0;
controle.setsinal(0);
er:='';

if test_download=0 then  // Se nenhum erro de comunicação a rotina de download começa
begin
comport1.ClearBuffer(true,true);
comport1.WriteStr('noecho' + #13);
esp_prompt;
comport1.WriteStr(#01);
esp_prompt;

//******************************************************************************
 if messagedlg('Salvar o programa antes do Download ?' ,mtConfirmation,[mbYes,mbNo],0) = mryes then
 begin
  salvar;
 end;
//******************************************************************************

RoboMain.Refresh;
select_edit;                     // Seleciona o editor que esta sendo usado pra faze download
posicao.sendpos;

f_prog:=programa.sendprog;       // Avalia estrutura do PROGRAM --- END

//------------------ Verificação da sintaxe antes do download ------------------
if (f_prog = true) then
begin
 f_comm:=vercommands.FindCommad;    // Procura por comandos inválidos
 for_prog:=estrutura.setcomparafor; // Verifica os FOR.
 if_prog:=estrutura.setcomparaif;   // Verifca os IFs.

  if (for_prog = true) and (if_prog = true) and (f_comm = true) then
  begin
   linha_program:=programa.getlprogram;
   linha_end:=programa.getlend;
   nome_prog:=programa.getnomeprog;
   pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption:=programa.getnomeprog;
  end else begin
   mensagem.seterro('!!! DOWNLOAD NÃO INICIADO !!!');
   mensagem.geterro;
   modo_terminal;
   control:=1;
  end;

end else begin
 mensagem.setalerta('Programa inválido.');
 mensagem.getalerta;
 modo_terminal;
 control:=1;
end;

//------------------------------ Aqui começa o download ------------------------

if control=0 then
 begin
 comport1.ClearBuffer(true,true);
 comport1.WriteStr('edit ' + nome_prog);
 comport1.WriteStr(#13);
 comport1.ReadStr(valor,1);

//------------------------------------------------------------------------------
  while valor<>'>' do
   begin
    comport1.ReadStr(valor,1);
     if valor='?' then
     begin
      valor:='>';
      control:=2;
     end;
   end;
//------------------------------------------------------------------------------
 if control=2 then //lógica pra reescrever ou não
  begin
  if MessageDlg ('Mensagem do sistema' + #13#13 +
                 'Nome do programa já existente, reescrevê-lo ?',
                  mtInformation, [mbYes,mbNo], 0) = mrYes then
   begin
    RoboMain.Refresh;
    comport1.Writestr('exit' +#13);
    esp_prompt;
    comport1.WriteStr('remove ' + nome_prog + #13);
    comport1.ReadStr(valor,1);
    Statusbar1.Panels[1].Text:='Limpando dados do programa antigo: ' + uppercase(nome_prog);
    RoboMain.Refresh;
    Statusbar1.Refresh;
//------------------------------------------------------------------------------
    while valor<>'>' do
     begin
      comport1.ReadStr(valor,1);
      if valor='T' then
       begin
        valor:='>';
        control:=5;
       end;
     end;
//------------------------------------------------------------------------------
    if control=5 then
     begin
      modo_terminal;
     end;
//------------------------------------------------------------------------------
    if control = 2 then
     begin
      comport1.WriteStr('yes' + #13);
      esp_prompt;
      comport1.WriteStr('edit ' + nome_prog + #13);
      esp_prompt;
      control:=0;
     end;
//------------------------------------------------------------------------------
   end else begin
    comport1.Writestr('exit' +#13);
    esp_prompt;
    control:=4;
    modo_terminal;
   end;
 end;
//------------------------------------------------------------------------------
 if control=0 then   //Envio do programa
  begin
   Statusbar1.Panels[1].Text:='Fazendo o download do programa: ' + uppercase(nome_prog);
   statusbar1.Refresh;
   comport1.WriteStr('y' + #13);
   esp_interroga;
   progressbar1.Min:=linha_program;
   progressbar1.max:=linha_end;

//------------------------------------------------------------------------------
   for i:=(linha_program+1) to (linha_end - 1) do //editor.Lines.Count-1 do
    begin
     er:='';
     frase:=programa.tiracom(editor.lines[i]);
     progressbar1.Position:=i+1;
     esp_carac:=caracter_especial(frase,i);
//------------------------------------------------------------------------------
     if (erro = 0) and (trim(frase) <> '') and (esp_carac <> 100) then// and (caracter_especial(frase,i)<>100) then //or (erro = 2) then
     begin
      ComPort1.WriteStr(trim(frase) + #13); //aqui envia a linha
      comport1.ReadStr(valor,1);
//------------------------------------------------------------------------------
       while valor<>'?' do                 //espera chegar o proximo "?"
       begin
        comport1.ReadStr(valor,1);
        er:=er+trim(valor);               //concatena os caracteres para formar um possivel erro.
       end;                               //while valor<>'?'
//------------------------------------------------------------------------------
       if er<>'' then                    //Se a variavel erro tiver alguma coisa
       begin
        if listaerro.FatalTA(er,frase,i) = 1 then erro:=1; //procura o erros
       end;

    end;
//------------------------------------------------------------------------------
end; //Fim do envio dos comandos
//------------------------------------------------------------------------------

comport1.WriteStr('exit' + #13);
comport1.ClearBuffer(true,true);
//------------------------------------------------------------------------------
while valor<>'>' do
 begin
  comport1.ReadStr(valor,1);
  if (valor='*') then
   begin
    mensagem.seterro('(Programa Inválido). Seqüência inválida (IF - ENDIF), (FOR - ENDFOR) ou (GOTO - LABEL)');
    mensagem.geterro;
    valor:='>';
    erro:=1;
   end;
end;
//------------------------------------------------------------------------------
if (erro = 0) then
 begin
 mensagem.setcool('Download realizado com sucesso !!!');
 mensagem.getcool;
 comands.liststorage;
 comands.liststorageg;
end;
//------------------------------------------------------------------------------
if (erro = 1) then
 begin
 mensagem.seterro('!!! DOWNLOAD INCOMPLETO !!!');
 mensagem.geterro;
end;
//------------------------------------------------------------------------------
comport1.WriteStr('echo' + #13);
esp_prompt;
comport1.ClearBuffer(true,true);
comport1.Connected:=false;
comterminal1.Enabled:=false;
comport2.Connected:=true;
comterminal1.Enabled:=true;
comport2.ClearBuffer(true,true);
sleep(800);
comport2.ClearBuffer(true,true);
comterminal1.ClearScreen;
comterminal1.SetFocus;
comport2.WriteStr(#13);
progressbar1.Position:=0;
Statusbar1.Panels[1].Text:=' ';
statusbar1.Refresh;
end;
end;
end;
end;

//------------------------------------------------------------------------------

procedure TRoboMain.download_B;  // Rotina de download para o controlador do TIPO B e AC
var                              // A diferença está basicamente no momento de reescrever programas existentes
er,frase,valor,nome_prog: string;
control,i,erro,erro_re,linha_program,linha_end: integer;
esp_carac: integer;
f_prog, for_prog, if_prog,f_comm: boolean;

begin
listview1.Items.Clear;
listview1.Refresh;
listview5.items.clear;
listview5.Refresh;
comands.ini;
robomain.Refresh;
comport2.Connected:=false;
comterminal1.Enabled:=false;
comport1.Connected:=true;
control:=0;
linha_program:=0;
linha_end:=0;
erro:=0;
controle.setsinal(0);
er:='';
erro_re:=0;

if test_download = 0 then // Se nenhum erro de comunicação a rotina de download começa
 begin
 comport1.ClearBuffer(true,true);
 comport1.WriteStr('noecho' + #13);
 esp_prompt;
 comport1.WriteStr(#01);
 esp_prompt;

   if messagedlg('Salvar o programa antes do Download ?' ,mtConfirmation,[mbYes,mbNo],0) = mryes then
     begin
      salvar;
     end;

RoboMain.Refresh;
select_edit;                       // Seleciona o editor que esta sendo usado pra faze download

posicao.sendpos;
f_prog:=programa.sendprog;         // Avalia estrutura do PROGRAM --- END
f_comm:=vercommands.FindCommad;
for_prog:=estrutura.setcomparafor; // Verifica os laços FOR.
if_prog:=estrutura.setcomparaif;

 if (f_prog = true) and (for_prog = true) and (if_prog = true) and (f_comm = true) then
 begin
  linha_program:=programa.getlprogram;
  linha_end:=programa.getlend;
  nome_prog:=programa.getnomeprog;
  pagecontrol2.Pages[pagecontrol2.ActivePageIndex].Caption:=programa.getnomeprog;
 end else begin
  mensagem.seterro('!!! DOWNLOAD NÃO INICIADO !!!');
  mensagem.geterro;
  modo_terminal;
  control:=1;
 end;

//-------------------- Aqui começa ------------------------
 if control=0 then
    begin
       comport1.ClearBuffer(true,true);
       comport1.WriteStr('edit ' + nome_prog);
       comport1.WriteStr(#13);
       comport1.ReadStr(valor,1);

         while valor<>'>' do
          begin
           comport1.ReadStr(valor,1);
             if valor='?' then
               begin

                 valor:='>';
                 control:=2;
               end;
          end;

     if control=2 then                       //lógica pra reescrever ou não
         begin

        if MessageDlg ('Mensagem do sistema' + #13#13 +
                      'Nome do programa já existente, reescrevê-lo ?',
                       mtInformation, [mbYes,mbNo], 0) = mrYes then
           begin
            RoboMain.Refresh;
            comport1.Writestr('exit' +#13);
            esp_prompt;
            comport1.WriteStr('empty ' + nome_prog + #13);
            Statusbar1.Panels[1].Text:='Limpando dados do programa antigo: ' + uppercase(nome_prog);
            RoboMain.Refresh;
            Statusbar1.Refresh;
            esp_prompt;
            comport1.WriteStr('yes' + #13);
            esp_prompt;
            comport1.WriteStr('edit ' + nome_prog + #13);
            esp_interroga;
            erro_re:=1;
            control:=0;
           end else begin
            RoboMain.Refresh;
            comport1.Writestr('exit' +#13);
            esp_prompt;
            control:=4;
            comport1.WriteStr('echo' + #13);
            esp_prompt;
            comport1.Connected:=false;
            comterminal1.Enabled:=false;
            comport2.Connected:=true;
            comterminal1.Enabled:=true;
            comterminal1.SetFocus;
            end;
         end;
           RoboMain.Refresh;

if control=0 then   //Envio do programa
 begin
  if erro_re=0 then
   begin
    comport1.WriteStr('y' + #13);
    esp_interroga;
   end;

  Statusbar1.Panels[1].Text:='Fazendo o download do programa: ' + uppercase(nome_prog);
  statusbar1.Refresh;
  progressbar1.Min:=linha_program;
  progressbar1.max:=linha_end;


 //********************* AQUI MUDEI *****************************************
   for i:=(linha_program+1) to (linha_end - 1) do //editor.Lines.Count-1 do
    begin
    er:='';
    frase:=programa.tiracom(editor.lines[i]);
    progressbar1.Position:=i;//+1;
    esp_carac:=caracter_especial(frase,i);

    if (erro = 0) and (trim(frase) <> '') and (esp_carac <> 100) then// and (caracter_especial(frase,i)<>100) then //or (erro = 2) then
     begin
      ComPort1.WriteStr(trim(frase) + #13); //aqui envia a linha
      comport1.ReadStr(valor,1);
//------------------------------------------------------------------------------
       while valor<>'?' do //espera chegar o proximo "?"
       begin
        comport1.ReadStr(valor,1);
        er:=er+trim(valor); //concatena os caracteres para formar um possivel erro.
       end; //while valor<>'?'
//------------------------------------------------------------------------------
       if er<>'' then //Se a variavel erro tiver alguma coisa
       begin
        if listaerro.FatalTB(er,frase,i) = 1 then erro:=1; //procura o erros
       end;
//------------------------------------------------------------------------------
      end;

end; //Fim do envio dos comandos


comport1.WriteStr('exit' + #13);
comport1.ClearBuffer(true,true);


while valor<>'>' do
 begin
  comport1.ReadStr(valor,1);
  if (valor='*') then
   begin
    mensagem.seterro('(Programa Inválido). Seqüência inválida (IF - ENDIF), (FOR - ENDFOR) ou (GOTO - LABEL)');
    mensagem.geterro;
    valor:='>';
    erro:=1;
   end;
end;

if (erro = 0) then
 begin
  with listview1 do
   begin
 mensagem.setcool('Download realizado com sucesso !!!');
 mensagem.getcool;
 comands.liststorage;
 comands.liststorageg;
   end;
end;

if erro=1 then
 begin
 mensagem.seterro('!!! DOWNLOAD INCOMPLETO !!!');
 mensagem.geterro;
end;

comport1.WriteStr('echo' + #13);
esp_prompt;
comport1.ClearBuffer(true,true);
comport1.Connected:=false;
comterminal1.Enabled:=false;
comport2.Connected:=true;
comterminal1.Enabled:=true;
comport2.ClearBuffer(true,true);
sleep(800);
comport2.ClearBuffer(true,true);
comterminal1.ClearScreen;
comterminal1.SetFocus;
comport2.WriteStr(#13);
progressbar1.Position:=0;
Statusbar1.Panels[1].Text:=' ';
statusbar1.Refresh;
end;
end;
end;
end;

//------------------------------------------------------------------------------
procedure TRoboMain.imprimir;
var
printfile: textfile;
i1:integer;

begin
  select_edit;

 if printdialog1.Execute then
  begin
  AssignPrn(printfile);
  rewrite(printfile);
  writeln(printfile,#13);                                //1 linha em branco
  writeln(printfile,#13);                                //2 linhas em branco
  writeln(printfile,#13);                                //3 linhas em branco
  writeln(printfile,#13);                                //4 linhas em branco

  for i1:= 0 to (editor.Lines.count-1) do //synedit1.lines.count-1) do
    begin
     writeln(printfile,'     ' + editor.lines[i1]);
    end;
     writeln(printfile,#13);
     system.CloseFile(printfile);
    end;
end;
//-----------------------------------------------------------------

procedure TRoboMain.FormCreate(Sender: TObject);
var
porta: string;
i,control: integer;
begin
 ListaErro:=TListaErros.create;
 VerCommands:= TVerCommands.Create;
 mensagem:=TMensagens.create;
 controle:=Tcontrole.create;
 programa:=TProgram.create;
 posicao:=Tposicao.Create;
 comands:= TComandos.Create;
 UserStat:= TUsuario.create;

 estrutura:= TCompEstrut.Create;
 NFor:= TFindFor.create;
 NEndFor:= TFindEndFor.create;

 NIf:= TFindIf.create;
 NEndIf:=TFindEndif.create;

// speedbutton10.Visible:=false;
 editor:=tsynedit.Create(self);
 ini:=tinifile.create('c:\Arquivos de Programas\RoboSoft\robosoft.ini');
 if ini.readstring('Controlador','Tipo A','')='yes' then panel12.Caption:='                  Terminal do Controlador TIPO A';
 if ini.readstring('Controlador','Tipo B','')='yes' then panel12.Caption:='                  Terminal do Controlador TIPO B';
 if ini.readstring('Controlador','Tipo AC','')='yes' then panel12.Caption:='                  Terminal do Controlador TIPO AC';
 StatusBar1.Panels[2].text:='Mensagens: OFF';
 statusbar1.Refresh;
 i:=0;
 control:=0;
 controle.setResp(0);
 controle.setsinal(0);
 controle.setMail(0);
// name_pc:='';
 controle.setnamepc('');
 controle.resetsoma;
 novo_editor;
 richedit1.Lines.Delete(0);
 richedit1.Lines.Append('>');
 UserStat.setusuario;
 UserStat.setcomputador;
// UserStat.SendDado_open;
// Userstat.setdadouser;
 comdatapacket1.StopString:=#13;
 comdatapacket2.StartString:='[';
 comdatapacket2.StopString:=']';

try //testa se a porta não ta ocupada
 comport2.Open;
// comport2.WriteStr(#13);
except
   on EComPort do
   begin
//    showmessage('io');
    comport2.Close;
    control:=100;
   end;
end;
//control:=100;
if control<>100 then
 begin

  comport2.Writestr('exit' +#13);
  comterminal1.ClearScreen;
   while porta <> '>' do
   begin
   comport2.ReadStr(porta,1);
    if i=2000 then
      begin
       comport2.Connected:=false;
       comport2.Port:='COM2';
       comport1.Port:='COM2';
       comport2.Connected:=true;
       comport2.WriteStr(#13);
      end else
        if i=4000 then
        begin
          porta:='>';
          control:=1;
        end;
      i:=i+1;
    end;

 if (porta='>') and (control=0)  then
  begin
   controle.setsinal(0);
   comport2.WriteStr(#13);
   habilita_botoes;
   comport2.WriteStr('echo');
   comport2.WriteStr(#13);
   comport2.ReadStr(porta,1);

       while porta<>'>' do
       begin
        comport2.ReadStr(porta,1);
       end;
    sleep(1000);
    Statusbar1.Panels[0].Text:='Conexão: Conectado ao controlador';
    comport2.ClearBuffer(true,true);
    comport2.Writestr(#13);
    comterminal1.ComPort:=comport2;
   end else begin
    mensagem.seterro('Sem comunicação com o controlador.');
    mensagem.geterro;
    Statusbar1.Panels[0].Text:='Conexão: Não conectado ao controlador';
    controle.setsinal(1);
    desabilita_botoes;
   end;

 end else
 begin
  comport2.Close;
  mensagem.seterro('Sem comunicação com o controlador.');
  mensagem.geterro;
  Statusbar1.Panels[0].Text:='Conexão: Não conectado ao controlador';
  controle.setsinal(1);
  desabilita_botoes;
end;

end;

//-----------------------------------------------------------------
procedure TRoboMain.Open1Click(Sender: TObject);
begin
abrir;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SaveAs1Click(Sender: TObject);
begin
salvar;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Exit1Click(Sender: TObject);
begin
comport1.Connected:=false;
comport1.Close;
comport2.Connected:=false;
comport2.Close;
mdmailslot1.Close;
close;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Print1Click(Sender: TObject);
begin
imprimir;
end;

//-----------------------------------------------------------------
procedure TRoboMain.About1Click(Sender: TObject);
begin
MessageDlg ('ROBOSOFT' + #13 +
           'Desenvolvido por Carlos Augusto Wink' +#13 +
           'Versão: Em constante desenvolvimento',
            mtInformation, [mbOk], 0);
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton1.Hint:='Lista de posições';
speedbutton1.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton2.Hint:='Tree View';
speedbutton2.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton3.Hint:='Abrir';
speedbutton3.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton1Click(Sender: TObject);
begin
if test_comunica=0 then
 begin
form3.Caption:='Lista de posições';
form3.statusbar1.Panels[1].Text:='';
form3.Label2.Caption:='Posição selecionada';
form3.Label4.Caption:='';
form3.synedit1.ClearAll;
form3.show;
 end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton2Click(Sender: TObject);
begin
select_edit;
MessageDlg ('Função não implementada', mtInformation, [mbOk], 0);
//finddialog1.Position:=point(editor.left+editor.Width,editor.top);
//finddialog1.Execute;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton3Click(Sender: TObject);
begin
abrir;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Download1Click(Sender: TObject);
begin
listview1.Items.Clear;
 ini:=TIniFile.create(form2.Edit1.Text);
 if (ini.ReadString('Controlador','Tipo A','') = 'yes') or
    (ini.ReadString('Controlador','Tipo B','') = 'yes') or
    (ini.ReadString('Controlador','Tipo AC','') = 'yes')  then
     begin
      if ini.ReadString('Controlador','Tipo A','') = 'yes' then download_A;
      if ini.ReadString('Controlador','Tipo B','') = 'yes' then download_B;
      if ini.ReadString('Controlador','Tipo AC','') = 'yes' then download_B;
     end else
     begin
     MessageDlg ('Falta arquivo de configuração ROBOSOFT.INI',
                  mtInformation, [mbOk], 0);
     end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Configuraes1Click(Sender: TObject);
begin
config;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Reconectar1Click(Sender: TObject);
begin
reconect;
end;

//-----------------------------------------------------------------
procedure TRoboMain.RunHomes1Click(Sender: TObject);
begin
if test_comunica=0 then comport2.WriteStr('run homes' + #13);
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.R1Click(Sender: TObject);
begin
if test_comunica=0 then comport2.WriteStr('run shutd' + #13);
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ControlEnable1Click(Sender: TObject);
begin
if test_comunica=0 then comport2.WriteStr('con' + #13);
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ControlDisable1Click(Sender: TObject);
begin
if test_comunica=0 then comport2.WriteStr('coff' + #13);
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton5Click(Sender: TObject);
begin
imprimir;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton6.Hint:='Download do programa';
speedbutton6.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton7Click(Sender: TObject);
begin
if test_comunica=0 then
 begin
form3.Edit1.Visible:=true;
form3.Label2.Visible:=true;
form3.synedit1.Visible:=true;
form3.Panel3.Visible:=true;
form3.Panel5.Visible:=true;
form3.Splitter1.Enabled:=true;
form3.Width:=809;
form3.Caption:='Remover o programa';
form3.Edit1.Text:='';
form3.Label2.caption:='Programa selecionado';
form3.statusbar1.Panels[1].Text:='';
form3.Label4.Caption:='';
form3.synedit1.ClearAll;
form3.show;
  end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton7.Hint:='Remover o Programa';
speedbutton7.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Copiar2Click(Sender: TObject);
begin
select_edit;
editor.CopyToClipboard;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Copiar1Click(Sender: TObject);
begin
select_edit;
editor.PasteFromClipboard;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Recortar1Click(Sender: TObject);
begin
select_edit;
editor.CutToClipboard;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Download2Click(Sender: TObject);
begin

end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton8Click(Sender: TObject);
begin
novo_editor;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Novo1Click(Sender: TObject);
begin
novo_editor;
end;

//-----------------------------------------------------------------
procedure TRoboMain.RunHomes2Click(Sender: TObject);
begin
comport2.Connected:=false;
comport1.Connected:=true;
comport1.WriteStr('run homes' + #13);
comport1.Connected:=false;
comport2.Connected:=true;
comterminal1.SetFocus;;
end;

//-----------------------------------------------------------------
procedure TRoboMain.RunShutd1Click(Sender: TObject);
begin
comport2.Connected:=false;
comport1.Connected:=true;
comport1.WriteStr('run shutd' + #13);
comport1.Connected:=false;
comport2.Connected:=true;
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.RunINITC1Click(Sender: TObject);
begin
comport2.Connected:=false;
comport1.Connected:=true;
comport1.WriteStr('run initc' + #13);
comport1.Connected:=false;
comport2.Connected:=true;
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Reconectar2Click(Sender: TObject);
begin
reconect;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton9Click(Sender: TObject);
begin
remove_proj;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Removerprograma1Click(Sender: TObject);
begin
form3.Caption:='Remover o programa';
form3.show;
end;

//-----------------------------------------------------------------
procedure TRoboMain.Configuraes2Click(Sender: TObject);
begin
config;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ComDataPacket1Packet(Sender: TObject; const Str: String);
begin
if (form5.RadioButton1.Checked=true) then
 begin
   form5.RichEdit1.lines.Add(trim(str));
 end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ComTerminal1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

//-----------------------------------------------------------------
procedure TRoboMain.ComTerminal1KeyPress(Sender: TObject; var Key: Char);
begin


end;

//-----------------------------------------------------------------
procedure TRoboMain.Iinitc1Click(Sender: TObject);
begin
if test_comunica=0 then comport2.WriteStr('run initc' + #13);
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.FormActivate(Sender: TObject);
begin
try //testa se a porta não ta ocupada
 comport2.Open;
except
   on EComPort do
   begin
    comport2.Close;
    mensagem.seterro('Sem comunicação com o contrador.');
    mensagem.geterro;
    desabilita_botoes;
   end;
end;

robomain.Refresh;
comterminal1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.FormDeactivate(Sender: TObject);
begin
form3.ComPort1.Connected:=false;
comport1.Connected:=false;
comport2.Connected:=false;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton10Click(Sender: TObject);
begin
Form5.show;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ToolButton9Click(Sender: TObject);
begin
form3.Caption:='Lista de posições';
form3.synedit1.Visible:=false;
form3.Width:=438;
form3.Edit1.Visible:=false;
form3.Label2.Visible:=false;
form3.Edit1.Text:='';
form3.statusbar1.Panels[1].Text:='';
form3.Label2.Caption:='Posição selecionada';
form3.Label4.Caption:='';
form3.synedit1.ClearAll;
form3.show;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ExecutaroPrograma1Click(Sender: TObject);
begin
executar;
end;

//-----------------------------------------------------------------
procedure TRoboMain.ListaroPrograma1Click(Sender: TObject);
begin
if test_comunica=0 then
 begin
 form3.Edit1.Visible:=true;
 form3.Label2.Visible:=true;
 form3.synedit1.Visible:=true;
 form3.Panel3.Visible:=true;
 form3.Panel5.Visible:=true;
 form3.Splitter1.Enabled:=true;
 form3.Width:=809;
 form3.Caption:='Listar o programa';
 form3.Edit1.Text:='';
 form3.Label2.caption:='Programa selecionado';
 form3.statusbar1.Panels[1].Text:='';
 form3.Label4.Caption:='';
 form3.synedit1.ClearAll;
 form3.show;
 end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.RemoveroPrograma1Click(Sender: TObject);
begin
if test_comunica=0 then
 begin
form3.Edit1.Visible:=true;
form3.Label2.Visible:=true;
form3.synedit1.Visible:=true;
form3.Panel3.Visible:=true;
form3.Panel5.Visible:=true;
form3.Splitter1.Enabled:=true;
form3.Width:=809;
form3.Caption:='Remover o programa';
form3.Label2.caption:='Programa selecionado';
form3.Edit1.Text:='';
form3.statusbar1.Panels[1].Text:='';
form3.Label4.Caption:='';
form3.synedit1.ClearAll;
form3.show;
end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton4Click(Sender: TObject);
begin
salvar;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton6Click(Sender: TObject);
begin
 listview1.Items.Clear;
 ini:=TIniFile.create(form2.Edit1.Text);
 if (ini.ReadString('Controlador','Tipo A','') = 'yes') or
    (ini.ReadString('Controlador','Tipo B','') = 'yes') or
    (ini.ReadString('Controlador','Tipo AC','') = 'yes')  then
     begin
      if ini.ReadString('Controlador','Tipo A','') = 'yes' then download_A;
      if ini.ReadString('Controlador','Tipo B','') = 'yes' then download_B;
      if ini.ReadString('Controlador','Tipo AC','') = 'yes' then download_B;
     end else
     begin
     MessageDlg ('Falta arquivo de configuração ROBOSOFT.INI',
                  mtInformation, [mbOk], 0);
     end;
end;

//-----------------------------------------------------------------
procedure TRoboMain.BitBtn1Click(Sender: TObject);
begin
controle.setMail(2);
richedit1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton5.Hint:='Imprimir';
speedbutton5.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton9MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton9.Hint:='Remove projeto';
speedbutton9.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton8MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton8.Hint:='Adicionar "Projeto #' + IntToStr(controle.getsoma+1) + '"';
speedbutton8.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
speedbutton4.Hint:='Salvar';
speedbutton4.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.BitBtn2Click(Sender: TObject);
begin
controle.setMail(0);
richedit1.SetFocus;
end;

//-----------------------------------------------------------------
procedure TRoboMain.BitBtn3Click(Sender: TObject);
begin
listview4.Items.Clear;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton11Click(Sender: TObject);
begin
Acess_Comados.Show;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton12Click(Sender: TObject);
begin
L_comandos.Show;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton10MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton10.Hint:='Copiar Terminal';
speedbutton10.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton11.Hint:='Inserir comandos';
speedbutton11.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton12MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton12.Hint:='Lista de comandos com exemplos';
speedbutton12.ShowHint:=true;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton13Click(Sender: TObject);
begin
config;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton14Click(Sender: TObject);
begin
reconect;
end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton13MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;
//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin


end;

//-----------------------------------------------------------------
procedure TRoboMain.BitBtn4Click(Sender: TObject);
begin
form7.Show;
end;

//-----------------------------------------------------------------
procedure TRoboMain.BitBtn5Click(Sender: TObject);
begin

end;

//-----------------------------------------------------------------
procedure TRoboMain.SpeedButton16Click(Sender: TObject);
begin
MessageDlg ('ROBOSOFT' + #13 +
            'Desenvolvido por Carlos Augusto Wink' +#13 +
            'Última atualização: v2.2',
              mtInformation, [mbOk], 0);
end;

//------------------------------------------------------------------
procedure TRoboMain.ComDataPacket2Packet(Sender: TObject; const Str: String);
var
listitem: TListitem;
nome_comp:string;

begin
  if controle.getResp = 1 then
  begin
   SendToMailSlot(controle.getnamepc,'Demo','>');
   controle.setResp(0);
  end;

 if trim(lowercase(str))='mailon' then
 begin
  listview2.Items.Clear;
  listview3.Items.Clear;
  controle.setMail(1);
  StatusBar1.Panels[2].text:='Mensagens: ON ';
  statusbar1.Refresh;
 end;

 if trim(lowercase(str))='mailoff' then
 begin
  controle.setMail(0);
  StatusBar1.Panels[2].text:='Mensagens: OFF';
  statusbar1.Refresh;
 end;

 if controle.getMail = 1 then
  begin
    if pos('@',str)<>0 then
      begin
        with listview2 do
         begin
         ListItem:=Items.Add;
         listitem.ImageIndex:=3;
         nome_comp:='cim_pc' + trim(copy(str, pos('@',str)+1, (Pos('(',str)-1) - pos('@',str))); //nome do micro que vai receber
         SendToMailSlot(nome_comp,'Demo','@'+ '['  + GetComputerNetName + '] - ' + '(' + copy(str, pos('(',str)+1 , pos(')',str)-pos('(',str)-1) +')' );
         ListItem.Caption:=('[' + uppercase(nome_comp) + ' (' + TimeToStr(Now) + ')] - ' + uppercase(copy(str, pos('(',str)+1 , pos(')',str)-pos('(',str)-1)));
         end;
      end;

    if pos('#',str)<> 0 then
       begin
        with listview2 do
        begin
        ListItem:=Items.Add;
        listitem.ImageIndex:=5;
        nome_comp:='cim_pc' + copy(str,2,1);
        SendToMailSlot(nome_comp,'Demo','#' + '[' + GetComputerNetName + '] - ' + '(' + copy(str, pos('(',str)+1 , pos(')',str)-pos('(',str)-1) +')' );
        listitem.Caption:= '[' + uppercase(nome_comp) + ' (' + TimeToStr(Now) + ')] - Comando direto: ' +  uppercase(copy(str, pos('(',str)+1 , pos(')',str)-pos('(',str)-1));
        end;
       end;
end;
end;

//-------------------------------------------------------------------------
procedure TRoboMain.mdMailSlot1MessageAvail(Sender: TObject; Msg: String);
var
listitem: TListitem;

begin

with form7.ListView4 do
    begin
     ListItem:=Items.Add;
     Listitem.ImageIndex:=0;
     ListItem.Caption:=inttostr(controle.getMail);
     ListItem.SubItems.Add(timetostr(now)+ ' - ' + msg);
     listview1.Refresh;
    end;
//------------------------------------------------------------------------------
 if (pos('@',msg)<>0) and (controle.getMail = 1) then
  begin
   with listview3 do
    begin
    ListItem:=Items.Add;
    Listitem.ImageIndex:=4;
    ListItem.Caption:='[' + uppercase(copy(msg, pos('[',msg)+1 , pos(']',msg) - pos('[',msg) -1 )) + ' (' + TimeToStr(Now) + ')]' + ' - ' + uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1));                            //msg ;
    comport2.WriteStr(uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1) + #13));
    end;
  end;
//------------------------------------------------------------------------------
 if (pos('#',msg)<>0) and (controle.getMail = 1) then
  begin
   with listview3 do
    begin
    ListItem:=Items.Add;
    Listitem.ImageIndex:=5;
    ListItem.Caption:='[' + uppercase(copy(msg, pos('[',msg)+1 , pos(']',msg) - pos('[',msg) -1)) + ' (' + TimeToStr(Now) + ')]' + ' - Terminal remoto';
    end;
  end;
//------------------------------------------------------------------------------
 if (pos('%',msg)<>0) and (controle.getMail = 2)  then
  begin
   if (pos('PRINT',uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1))) <> 0 ) or
      (pos('MOVE',uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1))) <> 0 ) or
      (pos('OPEN',uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1))) <> 0 ) or
      (pos('CLOSE',uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1))) <> 0 ) or
      (pos('SET',uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1))) <> 0 )
    then begin
      comdatapacket2.StartString:='';
      comdatapacket2.StopString:='';
      comport2.WriteStr(uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1)));
      comport2.WriteStr(#13);

      end else
      begin
      comdatapacket2.StartString:='';
      comdatapacket2.StopString:=#13;
      comport2.WriteStr(uppercase(copy(msg, pos('(',msg)+1 , pos(')',msg)-pos('(',msg)-1)) + #13);

     end;
     controle.setnamepc(uppercase(copy(msg, pos('[',msg)+1 , pos(']',msg)-pos('[',msg)-1)));
     controle.setResp(1);
  end;
//------------------------------------------------------------------------------
 if (pos('>',msg)<>0) and (controle.getMail = 2) then
  begin
   richedit2.Lines[richedit2.caretpos.y-1]:=richedit2.Lines[richedit2.caretpos.y-1] + ' ----> Enviado e recebido: Ok!!!';
   richedit1.Lines.Append('>');
   richedit1.selstart:=(length(richedit1.text)-1);
  end;

end;

//--------------------------------------------------------------------------
procedure TRoboMain.BitBtn7Click(Sender: TObject);
begin
 controle.setMail(1);
 StatusBar1.Panels[2].text:='Mensagem: ON';
 statusbar1.Refresh;
 comterminal1.SetFocus;
end;

//--------------------------------------------------------------------------
procedure TRoboMain.BitBtn8Click(Sender: TObject);
begin
 controle.setMail(0);
 StatusBar1.Panels[2].text:='Mensagem: OFF';
 statusbar1.Refresh;
 comterminal1.SetFocus;
end;

//----------------------------------------------------------------------
procedure TRoboMain.BitBtn6Click(Sender: TObject);
begin

end;
//---------------------------------------------------------------------------
procedure TRoboMain.BitBtn9Click(Sender: TObject);
begin
listview2.Items.Clear;
comterminal1.SetFocus;
end;
//---------------------------------------------------------------------------
procedure TRoboMain.BitBtn10Click(Sender: TObject);
begin
listview3.Items.Clear;
comterminal1.SetFocus;
end;
//-------------------------------------------------------------
function TRoboMain.GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;
//--------------------------------------------------------------
procedure TRoboMain.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin

 if key=#13 then
 begin
    if (combobox2.itemIndex<>-1) then
     begin
     if pos('>',richedit1.Lines[richedit1.CaretPos.y])=0 then
      begin
      SendToMailSlot(combobox2.items[combobox2.itemindex],'Demo','%'+ '['  + GetComputerNetName + '] - ' + '(' + #13 + ')' );
      end else begin
      SendToMailSlot(combobox2.items[combobox2.itemindex],'Demo','%'+ '['  + GetComputerNetName + '] - ' + '(' +  copy(richedit1.Lines[richedit1.CaretPos.y],2,40) +')' );
      end;
     richedit2.Lines.append('%'+ '['  + GetComputerNetName + ' para '  + combobox2.items[combobox2.itemindex]+  '] - ' + '(' +  copy(richedit1.Lines[richedit1.CaretPos.y],2,40) +')' );
     end
     else begin
      Messagedlg('Selecione uma das estações',mtInformation,[mbOk],0);
     end;
 end;

if key=#08 then
   begin
      if richedit1.CaretPos.x=0 then
       begin
       richedit1.Lines[richedit1.CaretPos.y]:='>';
       end;
   end;
end;

procedure TRoboMain.RichEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
richedit1.selstart:=(length(richedit1.text)-1);
end;

procedure TRoboMain.RichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (key=37) or (key=38) or (key=39) or (key=40) then
 begin
   richedit1.selstart:=(length(richedit1.text)-1);
 end;

end;

procedure TRoboMain.ListBox1Click(Sender: TObject);
begin
 richedit1.SetFocus;
 richedit1.selstart:=(length(richedit1.text)-1);
end;

procedure TRoboMain.TabSheet1Show(Sender: TObject);
begin
 comdatapacket2.StartString:='[';
 comdatapacket2.StopString:=']';
end;

procedure TRoboMain.TabSheet2Show(Sender: TObject);
begin
 comdatapacket2.StartString:='[';
 comdatapacket2.StopString:=']';
end;

procedure TRoboMain.TabSheet3Show(Sender: TObject);
begin
controle.setMail(2);
end;

procedure TRoboMain.SpeedButton17Click(Sender: TObject);
begin

 if test_comunica=0 then
  begin
    comport2.WriteStr('run homes' + #13);
  end;
comterminal1.SetFocus;
end;

procedure TRoboMain.SpeedButton18Click(Sender: TObject);
begin

if test_comunica=0 then
 begin
 comport2.WriteStr('run shutd' + #13);
 end;
comterminal1.SetFocus;
end;

procedure TRoboMain.SpeedButton19Click(Sender: TObject);
begin

if test_comunica=0 then
 begin
 comport2.WriteStr('run initc' + #13);
 end;
comterminal1.SetFocus;
end;

procedure TRoboMain.SpeedButton20Click(Sender: TObject);
begin
if test_comunica=0 then executar;
end;

procedure TRoboMain.SpeedButton21Click(Sender: TObject);
begin

if test_comunica=0 then comport2.WriteStr(#01);
comterminal1.SetFocus;
end;

procedure TRoboMain.ComboBox2Change(Sender: TObject);
begin
richedit1.selstart:=(length(richedit1.text)-1);
richedit1.SetFocus;

end;

procedure TRoboMain.ToolButton6Click(Sender: TObject);
begin
 form3.Edit1.Visible:=true;
 form3.Label2.Visible:=true;
 form3.synedit1.Visible:=true;
 form3.Width:=766;
 form3.Caption:='Listar o programa';
 form3.Label2.caption:='Programa selecionado';
 form3.Edit1.Text:='';
 form3.statusbar1.Panels[1].Text:='';
 form3.Label4.Caption:='';
 form3.synedit1.ClearAll;
 form3.show;
end;

procedure TRoboMain.ToolButton7Click(Sender: TObject);
begin
executar;
end;

procedure TRoboMain.ToolButton8Click(Sender: TObject);
begin
form3.Edit1.Visible:=true;
form3.Label2.Visible:=true;
form3.synedit1.Visible:=true;
form3.Width:=766;
form3.Caption:='Remover o programa';
form3.Label2.caption:='Programa selecionado';
form3.Edit1.Text:='';
form3.statusbar1.Panels[1].Text:='';
form3.Label4.Caption:='';
form3.synedit1.ClearAll;
form3.show;
end;

procedure TRoboMain.SpeedButton22Click(Sender: TObject);
begin
if test_comunica=0 then
 begin
  form3.Edit1.Visible:=true;
  form3.Label2.Visible:=true;
  form3.synedit1.Visible:=true;
  form3.Panel3.Visible:=true;
  form3.Panel5.Visible:=true;
  form3.Splitter1.Enabled:=true;
  form3.Width:=809;
  form3.Caption:='Listar o programa';
  form3.Label2.caption:='Programa selecionado';
  form3.Edit1.Text:='';
  form3.statusbar1.Panels[1].Text:='';
  form3.Label4.Caption:='';
  form3.synedit1.ClearAll;
  form3.show;
 end;
end;

procedure TRoboMain.SpeedButton17MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton17.Hint:='RUN HOMES';
speedbutton17.ShowHint:=true;
end;

procedure TRoboMain.SpeedButton18MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton18.Hint:='RUN SHUTD';
speedbutton18.ShowHint:=true;
end;

procedure TRoboMain.SpeedButton19MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton19.Hint:='RUN INITC';
speedbutton19.ShowHint:=true;
end;

procedure TRoboMain.SpeedButton20MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton20.Hint:='Executar';
speedbutton20.ShowHint:=true;
end;

procedure TRoboMain.SpeedButton21MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton21.Hint:='Parar programas em execução';
speedbutton21.ShowHint:=true;
end;

procedure TRoboMain.SpeedButton22MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
speedbutton22.Hint:='Upload do programa';
speedbutton22.ShowHint:=true;
end;

procedure TRoboMain.Controlador1Click(Sender: TObject);
begin
form2.Show;
end;

procedure TRoboMain.FindDialog1Find(Sender: TObject);
begin
select_edit;
MessageDlg ('Função não implementada', mtInformation, [mbOk], 0);
end;

procedure TRoboMain.ComTerminal1StrRecieved(Sender: TObject; var Str: String);
begin
if controle.getsinal = 1 then
 begin
   comterminal1.Enabled:=true;
   comterminal1.SetFocus;
   habilita_botoes;
   Statusbar1.Panels[0].Text:='Conexão: Conectado ao controlador';
   statusbar1.Refresh;
   controle.setsinal(0);
 end;
end;

procedure TRoboMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ClientSocket1.Close;
comport2.Close;
mdmailslot1.Close;
end;

procedure TRoboMain.Help2Click(Sender: TObject);
begin
Application.HelpFile:= 'MANUAL ACL.HLP';
Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TRoboMain.UserdadosClick(Sender: TObject);
begin
user_control.Show;
end;

procedure TRoboMain.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
if errorcode <> 0 then
begin
 if errorevent = eeConnect then
  begin
  statusbar1.Panels.Items[3].Text:='Sem servidor';
  timer1.Enabled:=true;
  end;
 if errorevent = eeGeneral then statusbar1.Panels.Items[3].Text:='Erro geral';
 if errorevent = eeSend	 then statusbar1.Panels.Items[3].Text:='Erro de envio de mensagem';
 if errorevent = eeReceive then statusbar1.Panels.Items[3].Text:='Erro de leitura de mensagem';
 if errorevent = eeDisconnect then statusbar1.Panels.Items[3].Text:='Erro ao tentar disconectar';
 if errorevent = eeAccept then statusbar1.Panels.Items[3].Text:='Erro ao tentar ser aceito';
 errorcode:=0;
end;
end;

procedure TRoboMain.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
statusbar1.Panels.Items[3].Text:='Servidor: Ok';
ClientSocket1.Socket.SendText('usuario_open ' + UserStat.getusuario + ' em ' + UserStat.getcomputador);
timer1.Enabled:=false;
end;

procedure TRoboMain.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
statusbar1.Panels.Items[3].Text:='Servidor: erro';
ClientSocket1.Socket.SendText('usuario_close ' + userstat.getusuario + ' em ' + userstat.getcomputador);
timer1.Enabled:=true;
end;

procedure TRoboMain.Timer1Timer(Sender: TObject);
begin
clientsocket1.Open;
end;

end.
