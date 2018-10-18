unit remove_form_4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CPort, CPortCtl, ImgList, ComCtrls, ExtCtrls,
  SynEditHighlighter, SynHighlighterGeneral, SynEdit;

type
  TForm3 = class(TForm)
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    ImageList1: TImageList;
    ComPort2: TComPort;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Panel5: TPanel;
    Label4: TLabel;
    Splitter1: TSplitter;
    SynEdit1: TSynEdit;
    SynGeneralSyn1: TSynGeneralSyn;
    GroupBox4: TGroupBox;
    Button1: TButton;
    Button4: TButton;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: String);
    procedure ListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i,cont,i2,u,i3,cont2,sel,prog_pos,pode: integer;
  listitem: TListItem;

implementation
 uses form2_report, ats_acl_full;
{$R *.DFM}

procedure TForm3.FormCreate(Sender: TObject);
begin
 //texto:=TStringList.Create;
 i:=0;
 i2:=1;
 cont:=1;
 u:=0;
 i3:=1;
 cont2:=1;
 sel:=0;
 prog_pos:=0;
 pode:=0;

end;

procedure TForm3.FormActivate(Sender: TObject);

begin
  listview1.Items.Clear;
  comdatapacket1.StopString:=#13;
  i:=0;
  i2:=1;
  cont:=1;
  u:=0;
  i3:=1;
  cont2:=1;
  prog_pos:=0;
  comport1.Connected:=true;

if form3.Caption<>'Lista de posições' then
 begin
  prog_pos:=1;
  comport1.WriteStr('dir' + #13);

 end
 else begin
  prog_pos:=2;
  comport1.WriteStr('listp ' + #13);
 end;

end;

procedure TForm3.FormDeactivate(Sender: TObject);
begin
i:=0;
i2:=1;
cont:=1;
u:=0;
i3:=1;
cont2:=1;
prog_pos:=0;
comport1.Connected:=false;
RoboMain.comport2.Open;

statusbar1.Panels[0].Text:='';
statusbar1.Panels[1].Text:='';

end;

procedure TForm3.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
listview1.Hint:='Selecione o programa';
listview1.ShowHint:=true;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
listview1.Items.Clear;
  i:=0;
  i2:=1;
  cont:=1;
  u:=0;
  i3:=1;
  cont2:=1;
  prog_pos:=0;

if form3.Caption<>'Lista de posições' then
 begin
  prog_pos:=1;

  comport1.WriteStr('dir' + #13);
 end
 else begin
  prog_pos:=2;
  comport1.WriteStr('listp ' + #13);
 end;
end;

procedure TForm3.Button3Click(Sender: TObject);

begin
u:=0;
form3.Close;
end;

procedure TForm3.ComDataPacket1Packet(Sender: TObject; const Str: String);
begin
 synedit1.Cursor:=crHourGlass;
 if (i>1) and (pos('>',str)=0) and (trim(str)<>'') and (pos('deleted',str)=0)
         and (pos('Done',str)=0) and (u=0) and (pos('empty',str)=0)
    then
     begin

      if prog_pos=1 then //Coloca os programas
       begin
     with listview1 do
     begin
        ListItem:=Items.Add;
        ListItem.Caption:=trim(copy(str,1,6));
        ListItem.SubItems.Add(trim(uppercase(copy(str,13,10))));
        listview1.Refresh;
     end;
      statusbar1.Panels[0].Text:='Número de programas:  ' + inttostr(i2);
      statusbar1.refresh;
       end;

       if (prog_pos=2) and (i>4) then  //Coloca  as posições
       begin
    with listview1 do
     begin
        ListItem:=Items.Add;
        ListItem.Caption:=trim(copy(str,1,12));
        ListItem.SubItems.Add(trim(uppercase(copy(str,20,7))));
        listview1.Refresh;
     end;
       end;
        i2:=i2+1;

    end;

    if i2=(cont*18) then
       begin
        comport1.writestr(#13);
        cont:=cont+1;
       end;


  if (u=1) and (i>1) and (pos('<Enter>',str)=0) and (trim(str)<>'') then
    begin
      synedit1.Lines.Add(trim(copy(str,pos(':' ,str) + 1,80)));
      i3:=i3+1;
        if i3=(cont2*18) then
          begin
          sleep(1200);
          comport1.writestr(#13);
          cont2:=cont2+1;
        end;
        statusbar1.Panels[1].Text:='Fazendo Upload, número de linhas: ' + inttostr(i3-4);
        statusbar1.refresh;
    end;

 if pos('(END)',str)<>0 then
  begin

  statusbar1.Panels[1].Text:='Upload do programa concluído.';
  statusbar1.refresh;
  end;

    i:=i+1;
    synedit1.Cursor:=crIBeam;


end;

procedure TForm3.ListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
listview1.Hint:='Selecione um item';
listview1.ShowHint:=true;
end;

procedure TForm3.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
//button1.Enabled:=true;
if selected = true then
begin
sel:=1;
if form3.Caption<>'Lista de posições' then edit1.Text:=listview1.Selected.caption;
end
else
sel:=0;
end;

procedure TForm3.ListView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
valor: string;
del:integer;
begin

if (key=46) and (sel=1) then
  begin
comport1.Connected:=false;
comport2.Connected:=true;
 if form3.Caption='Remover o programa' then
  begin
   del:=0;
   if MessageDlg ('Deseja remover o programa ' + trim(listview1.Selected.caption),
     mtconfirmation, [mbYes,mbNo], 0) = mrYes then
     begin
       comport2.WriteStr('remove ' + trim(listview1.Selected.caption) + #13);
       comport2.ReadStr(valor,1);
       statusbar1.Panels[0].Text:='Removendo ' + trim(listview1.Selected.caption);
       statusbar1.Refresh;
       listview1.Cursor:=crHourGlass;
        while valor<>'>' do
        begin
        comport2.ReadStr(valor,1);

          if valor=':' then
           begin
            del:=1;
           end;


        end;

       if del=1 then
         begin
     MessageDlg ('Programa sendo utilizada como subrotina.' + #13 +'Não pode ser apagado.',
     mtinformation, [mbOk], 0);
         end
         else begin
          pode:=1;
          comport1.ClearBuffer(true,true);
          comport2.WriteStr('yes' + #13);

          while valor<>'t' do
          begin
             comport2.ReadStr(valor,1);
          end;
          listview1.Items.Delete(listview1.selected.index);
          pode:=0;
         end;
        statusbar1.Panels[0].Text:='Programa removido.';
        statusbar1.refresh;
       listview1.Cursor:=crHandPoint;
    end;
   end;

   if form3.Caption='Lista de posições' then
    begin
   del:=0;
   if MessageDlg ('Deseja remover a posição ' + trim(listview1.Selected.caption),
     mtconfirmation, [mbYes,mbNo], 0) = mrYes then
     begin
       comport2.WriteStr('delp ' + trim(copy(listview1.Selected.caption,1,5)) + #13);
       comport2.ReadStr(valor,1);
       while valor<>'>' do
       begin
        comport2.ReadStr(valor,1);
          if valor=':' then
           begin
            del:=1;
           end;
          end;

       if del=1 then
         begin
     MessageDlg ('Posição sendo utilizada por um programa.'
                  + #13 +'Não pode ser apagada.',
     mtinformation, [mbOk], 0);
         end
         else begin
          comport2.WriteStr('yes' + #13);
          listview1.Items.Delete(listview1.selected.index);
         end;
    end;
   end;

   comport2.Connected:=false;
   comport1.Connected:=true;
  end;

end;

procedure TForm3.ListView1DblClick(Sender: TObject);
begin
comport1.Connected:=false;
comport2.Connected:=true;
label4.Caption:='';
  if (sel = 1) and (form3.Caption<>'Lista de posições') then
   begin
   if MessageDlg ('Deseja listar o programa ' + trim(listview1.Selected.caption),
     mtconfirmation, [mbYes,mbNo], 0) = mrYes then
     begin
       synedit1.ClearAll;
       u:=1;
       i:=0;
       i3:=1;
       cont2:=1;
       comport2.WriteStr('list ' + trim(listview1.Selected.caption) + #13);
      end;
   end;
comport2.Connected:=false;
comport1.Connected:=true;

end;

procedure TForm3.Button1Click(Sender: TObject);
begin
synedit1.CopyToClipboard;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
synedit1.SelectAll;
end;

end.
