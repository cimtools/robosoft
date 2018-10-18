unit Comandos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

//------------------------------------------------------------------------------
type TControlEdit = class
 private
  linha: integer;

 public
  procedure setElinha(l: integer);
  function getElinha: integer;
 end;
//------------------------------------------------------------------------------

type
  TAcess_Comados = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Acess_Comados: TAcess_Comados;
  Ceditor: TControlEdit;

implementation

uses ats_acl_full;

{$R *.DFM}
//------------------------------------------------------------------------------
procedure TControlEdit.setElinha(l: integer);
begin
linha:=l;
end;

function TControlEdit.getElinha: integer;
var
names: string;
begin
if controle.getsoma >=0 then
begin
names:=robomain.pagecontrol2.Pages[robomain.pagecontrol2.ActivePageIndex].Name;
if names='tabs0' then result:=robomain.Editor0.CaretY;
if names='tabs1' then result:=robomain.Editor1.CaretY;
if names='tabs2' then result:=robomain.Editor2.CaretY;
if names='tabs3' then result:=robomain.Editor3.CaretY;
if names='tabs4' then result:=robomain.Editor4.CaretY;
if names='tabs5' then result:=robomain.Editor5.CaretY;
if names='tabs6' then result:=robomain.Editor6.CaretY;
if names='tabs7' then result:=robomain.Editor7.CaretY;
if names='tabs8' then result:=robomain.Editor8.CaretY;
if names='tabs9' then result:=robomain.Editor9.CaretY;
if names='tabs10' then result:=robomain.Editor10.CaretY;
if names='tabs11' then result:=robomain.Editor11.CaretY;
if names='tabs12' then result:=robomain.Editor12.CaretY;
if names='tabs13' then result:=robomain.Editor13.CaretY;
if names='tabs14' then result:=robomain.Editor14.CaretY;
if names='tabs15' then result:=robomain.Editor15.CaretY;
if names='tabs16' then result:=robomain.Editor16.CaretY;
if names='tabs17' then result:=robomain.Editor17.CaretY;
if names='tabs18' then result:=robomain.Editor18.CaretY;
if names='tabs19' then result:=robomain.Editor19.CaretY;
if names='tabs20' then result:=robomain.Editor20.CaretY;
if names='tabs21' then result:=robomain.Editor21.CaretY;
if names='tabs22' then result:=robomain.Editor22.CaretY;
if names='tabs23' then result:=robomain.Editor23.CaretY;
if names='tabs24' then result:=robomain.Editor24.CaretY;
if names='tabs25' then result:=robomain.Editor25.CaretY;
if names='tabs26' then result:=robomain.Editor26.CaretY;
if names='tabs27' then result:=robomain.Editor27.CaretY;
if names='tabs28' then result:=robomain.Editor28.CaretY;
if names='tabs29' then result:=robomain.Editor29.CaretY;
if names='tabs30' then result:=robomain.Editor30.CaretY;
if names='tabs31' then result:=robomain.Editor31.CaretY;
end;
end;

//------------------------------------------------------------------------------
procedure TAcess_Comados.FormCreate(Sender: TObject);
var
i: integer;
begin
 for i:=0 to robomain.SynGeneralSyn1.KeyWords.Count - 1 do
 begin
  listbox1.Items.Add(robomain.SynGeneralSyn1.KeyWords.Strings[i]);
 end;
end;

procedure TAcess_Comados.ListBox1DblClick(Sender: TObject);
begin
robomain.Editor.lines[ceditor.getElinha-1]:=listbox1.Items.Strings[listbox1.ItemIndex];
robomain.deselect_edit;
end;

procedure TAcess_Comados.FormActivate(Sender: TObject);
begin

robomain.select_edit;
end;

procedure TAcess_Comados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
robomain.refresh;
end;

end.
