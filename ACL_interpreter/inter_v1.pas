unit inter_v1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    RichEdit3: TRichEdit;
    GroupBox2: TGroupBox;
    RichEdit2: TRichEdit;
    GroupBox3: TGroupBox;
    RichEdit1: TRichEdit;
    Button2: TButton;
    Button3: TButton;
    GroupBox4: TGroupBox;
    RichEdit4: TRichEdit;
    GroupBox5: TGroupBox;
    RichEdit5: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure sub_print(s1: string; ini: integer; tipo: integer);
    procedure sub_define(s1: string);
    procedure FormCreate(Sender: TObject);
    procedure sub_set(s1: string);
    procedure sub_get(s1: string);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  //  procedure find_var(s1: string; tam: integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i_var: array[1..10] of integer;
  l_var: array[1..10] of string;
  cont: integer;
  erro_total: integer;
  stringanzao: string;

implementation

{$R *.DFM}

//*******************************************************************
{procedure TForm1.find_var(s1: string; tam: integer);

begin

//********** VERIFICADOR DE VARIAVEL - FAZER UMA FUNCAO PQ EH PADRAO ********
//    cont:=1;  //volta pro inicio do vetor de variaveis
//    i2:=1;
    while (i2<=cont) and (detec=0) do
      begin
        if (l_var[i2] = stream) then
          begin
              detec:=1;
              achei_var:=i2;
          end else begin
             if i2=cont then
              begin
              detec:=1;
              erro_var:=1;
              richedit5.Lines.Add('Variavel não declarada: ' + var1);
              end;
          end;
         i2:=i2+1;
      end; //  while (i2<=cont) and (detec=0) do
//*************************************************************************
end;   }
//*******************************************************************

procedure TForm1.sub_get(s1: string);
var
stream,var1 : string;
t_stream,i2,detec,achei_var,erro_var: integer;
begin

//********** VERIFICADOR DE VARIAVEL - FAZER UMA FUNCAO PQ EH PADRAO ********
//  cont:=1;  //volta pro inicio do vetor de variaveis
i2:=1;
erro_var:=0;
achei_var:=0;
detec:=0;
stream:=s1;

    while (i2<=cont) and (detec=0) do
      begin
        if (l_var[i2] = stream) then
          begin
              detec:=1;
              achei_var:=i2;
          end else begin
             if i2=cont then
              begin
              detec:=1;
              erro_var:=1;
              richedit5.Lines.Add('Variavel não declarada: ' + stream);
              end;
          end;
         i2:=i2+1;
      end; //  while (i2<=cont) and (detec=0) do
//*****************************************************************************


if erro_var = 0 then
begin

var1:=inputBox('Comando GET', 'Pressione uma tecla:', '');

case var1[1] of
 '0': i_var[achei_var]:= 48;
 '1': i_var[achei_var]:= 49;
 '2': i_var[achei_var]:= 50;
 '3': i_var[achei_var]:= 51;
 '4': i_var[achei_var]:= 52;
 '5': i_var[achei_var]:= 53;
 '6': i_var[achei_var]:= 54;
 '7': i_var[achei_var]:= 55;
 '8': i_var[achei_var]:= 56;
 '9': i_var[achei_var]:= 57;
   
 'a': i_var[achei_var]:= 97;
 'b': i_var[achei_var]:= 98;
 'c': i_var[achei_var]:= 99;
 'd': i_var[achei_var]:= 100;
 'e': i_var[achei_var]:= 101;
 'f': i_var[achei_var]:= 102;
 'g': i_var[achei_var]:= 103;
 'h': i_var[achei_var]:= 104;
 'i': i_var[achei_var]:= 105;
 'j': i_var[achei_var]:= 106;
 'k': i_var[achei_var]:= 107;
 'l': i_var[achei_var]:= 108;
 'm': i_var[achei_var]:= 109;
 'n': i_var[achei_var]:= 110;
 'o': i_var[achei_var]:= 111;
 'p': i_var[achei_var]:= 112;
 'q': i_var[achei_var]:= 113;
 'r': i_var[achei_var]:= 114;
 's': i_var[achei_var]:= 115;
 't': i_var[achei_var]:= 116;
 'u': i_var[achei_var]:= 117;
 'v': i_var[achei_var]:= 118;
 'w': i_var[achei_var]:= 119;
 'x': i_var[achei_var]:= 120;
 'y': i_var[achei_var]:= 121;
 'z': i_var[achei_var]:= 122;

 'A': i_var[achei_var]:= 65;
 'B': i_var[achei_var]:= 66;
 'C': i_var[achei_var]:= 67;
 'D': i_var[achei_var]:= 68;
 'E': i_var[achei_var]:= 69;
 'F': i_var[achei_var]:= 70;
 'G': i_var[achei_var]:= 71;
 'H': i_var[achei_var]:= 72;
 'I': i_var[achei_var]:= 73;
 'J': i_var[achei_var]:= 74;
 'K': i_var[achei_var]:= 75;
 'L': i_var[achei_var]:= 76;
 'M': i_var[achei_var]:= 77;
 'N': i_var[achei_var]:= 78;
 'O': i_var[achei_var]:= 79;
 'P': i_var[achei_var]:= 80;
 'Q': i_var[achei_var]:= 81;
 'R': i_var[achei_var]:= 82;
 'S': i_var[achei_var]:= 83;
 'T': i_var[achei_var]:= 84;
 'U': i_var[achei_var]:= 85;
 'V': i_var[achei_var]:= 86;
 'W': i_var[achei_var]:= 87;
 'X': i_var[achei_var]:= 88;
 'Y': i_var[achei_var]:= 89;
 'Z': i_var[achei_var]:= 90;

 else
  showmessage('Valor inexistente');
 end;
end;
end;



//********************************************************************
procedure TForm1.sub_set(s1: string);
var
t_stream,t_param,i,i2,detec,erro_var,pos_igual,t_detec,pos_esp,achei_par,achei_var: integer;
pos_oper, pos,p_var,aux,achei_oper: integer;
stream,var1,par1,par2,param,oper,s: string;
vars: array [1..5] of string;
begin

stream:= trim(s1);
t_stream:= length(stream);

s:='';
for i:=1 to t_stream do   //tira espaços em excesso
 begin
   if stream[i]<> ' ' then
    begin
     s:=s+stream[i]
    end;

end;
stream:=s;
stream:= stream + ' ';
t_stream:= length(stream);

oper:='';

vars[1]:='0';
vars[2]:='0';

param:='';
t_param:=0;

achei_par:=0;
achei_var:=0;
achei_oper:=0;

detec:=0;
t_detec:=0;

erro_var:=0;
pos_igual:=0;
pos_oper:=0;
pos_esp:=0;
pos:=0;

p_var:=0;

i2:=1;
i:=1;

 while (i<=t_stream) and (pos_igual=0) do
  begin
  if (stream[i] = '=') then
   begin
    pos_igual:=i;
    var1:=trim(copy(stream,1,i-1));

//********** VERIFICADOR DE VARIAVEL - FAZER UMA FUNCAO PQ EH PADRAO ********
//    cont:=1;  //volta pro inicio do vetor de variaveis
//    i2:=1;
    while (i2<=cont) and (detec=0) do
      begin
        if (l_var[i2] = var1) then
          begin
              detec:=1;
              achei_var:=i2;
          end else begin
             if i2=cont then
              begin
              detec:=1;
              erro_var:=1;
              richedit5.Lines.Add('Variavel não declarada: ' + var1);
              end;
          end;
         i2:=i2+1;
      end; //  while (i2<=cont) and (detec=0) do
//*************************************************************************

    end else begin
      if (i=t_stream) and (pos_igual=0) then
      richedit5.Lines.Add('Erro');
    end; // if stream[i] = '=' then
  i:=i+1;
end; //while (i<=t_stream) and (pos_igual=0) do

if pos_igual<>0 then
 begin
param:=trim(copy(stream,pos_igual+1,t_stream-pos_igual)) + ' ';
t_param:=length(param);

i:=1;

for aux:=1 to t_param do
 begin
 detec:=0;
 t_detec:=0;
 pos_esp:=0;

 if aux=i then
  begin
   while (i<=t_param) and (pos_esp=0) do
    begin
       case param[i] of
        '0'..'9': t_detec:=t_detec+0;
        '+','-','*','/',' ': pos_esp:=i;//pos_oper:=i;
        'a'..'z','A'..'Z',',': t_detec:=t_detec+1;
       end;
     i:=i+1;
   end; // while (i<=t_param) and (detec=0) do

  if (trim(copy(param,pos_esp,1)) <> '') and (achei_oper=0) then
   begin
     achei_oper:=1;
     oper:=copy(param,pos_esp,1);
   end;

if (oper <> param[aux]) then
begin

   if (t_detec=0) then //se detec_t = 0 é numero, senao e variavel
    begin
     p_var:=p_var+1;
     par1:=trim(copy(param,aux,pos_esp-1));

     vars[p_var]:=par1;


    end else begin
     p_var:=p_var+1;
     detec:=0;
     par2:=trim(copy(param,aux,pos_esp-1));

     
//********** VERIFICADOR DE VARIAVEL - FAZER UMA FUNCAO PQ EH PADRAO ********
//     cont:=1;  //volta pro inicio do vetor de variaveis
     i2:=1;
     while (i2<=cont) and (detec=0) do
      begin
        if (l_var[i2] = par2) then
          begin
              detec:=1;
              achei_par:=i2;
          end else begin
             if i2=cont then
              begin
              detec:=1;
              erro_var:=1;
              richedit5.Lines.Add('Variavel não declarada: ' + par2);
              end;
          end;
         i2:=i2+1;
      end; //  while (i2<=cont) and (detec=0) do
//*************************************************************************

      if erro_var = 0 then
       begin
          vars[p_var]:=inttostr(i_var[achei_par]);
       end;
    end;
end; //if pos_igual<>0 then }
end; //if aux=i then
end; //for aux:=1 to t_param do

if trim(oper) <> '' then
begin
     case oper[1] of
     '+': i_var[achei_var]:= strtoint(vars[1]) + strtoint(vars[2]);
     '-': i_var[achei_var]:= strtoint(vars[1]) - strtoint(vars[2]);
     '*': i_var[achei_var]:= strtoint(vars[1]) * strtoint(vars[2]);
     '/': i_var[achei_var]:= strtoint(vars[1]) div strtoint(vars[2]);
     end;
end else begin
i_var[achei_var]:= strtoint(vars[1]) ;
end;
end;
end;


//**********************************************************************
procedure TForm1.sub_define(s1: string);
var
stream: string;
i,vari,ini: integer;
begin
vari:=1;

stream:= trim(s1) + ' ';
ini:=length(stream);

for i:=1 to ini do
 begin

  if stream[i] = ' ' then
   begin
    l_var[cont]:=trim(copy(stream,vari,i-vari));
     if trim(l_var[cont]) <> '' then
      begin
       cont:=cont+1;
       vari:=i;
      end; 
   end;
end;

end;


//******************************************************************************
procedure TForm1.sub_print(s1: string; ini: integer; tipo: integer);
var
stream, aux_s1,v_var,aux_var,stringao: string;
val,erro,erro_var,i,i2,i3,i5,aspa1,aspa2,t_stream,achei,dentro,t_var,detec: integer;
begin
aspa1:=0;
aspa2:=0;
i2:=1;
dentro:=0;
erro:=0;
achei:=0;
i5:=0;
detec:=0;
stream:=s1;
t_stream:=ini;
stringao:='';


for i3:= 1 to t_stream do
 begin

                 if i5=i3 then
                  begin
                  dentro:=0; //controla se se ta dentro de uma string

                  end;
                 if (stream[i3] = '"') and ((i5-1) <> i3) then
                  begin

                  //*******************************
                   if aspa1 = 0 then
                    begin
                    dentro:=1;
                    aspa1:=i3;
                    i5:=i3+1;

                     while (i5<=t_stream) and (achei=0) do
                      begin

                       if stream[i5] = '"' then
                        begin

                         aspa2:=i5;
                         achei:=1;
                 
                        end else begin
                         erro:=1;
                        end;
                        i5:=i5+1;
                      end;

                    end;
                   //*********************************

                   if (aspa1 <> 0) and (aspa2<>0) then //and (i3 <> t_stream) then
                    begin
                      aux_s1 := copy (stream,aspa1+1,(aspa2-aspa1-1));// aux_s1 + copy (stream,aspa1+1,(aspa2-aspa1-1));
                      stringao:= stringao + copy (stream,aspa1+1,(aspa2-aspa1-1));
                      aspa1:=0;
                      aspa2:=0;
                      erro:=0;
                      achei:=0;

                     end else begin
                       erro:=1;
                     end;
                    //********************************

                   end else begin

                   if dentro = 0 then   //se tiver fora da string, é variavel
                     begin

                       aux_var := aux_var + stream[i3];
                       if (i3=t_stream) or (stream[i3]=' ') then
                        begin
                           detec:=0;
                           aux_var:=trim(aux_var);
                            //*********************************
                            while (i2<=cont) and (detec=0) and (aux_var<>'') do
                             begin

                              if (l_var[i2] = aux_var) then
                               begin
                               detec:=1;
                               //IMPORTANTE: AQUI OCORRE A MANIPULAÇAO DOS VALORES CONTIDOS NAS VARIAVEIS

                             //****************************************************************
                                if (tipo<>3) then //se for um PRINT ou READ
                                 begin
                                 stringao:=stringao + inttostr(i_var[i2]);  //aciona valor das variaveis no buffer
                                 aux_var:='';
                                 //end;
                                 end else begin //é um comando READ

                                 i_var[i2]:= StrToint(InputBox(aux_s1, 'Valor Inteiro', ''));
                                 stringao:=stringao + ' ? ' + inttostr(i_var[i2]);
                                 stringanzao:=stringanzao + #13 + stringao;

                                 end;

                               end else begin

              if i2 = cont then
               begin
                detec:=1;
                erro_var:=1;
                erro_total:=1;
                richedit5.Lines.Add('Variavel não declarada: ' + aux_var);
               end;
                               end;
                               i2:=i2+1;
                             end;
                          end;
                       end;
                   end;  //if (stream[i3] = '"') and ((i5-1)<>i3)
                  end; //for i3:= 1 to t_stream

                  if (erro <> 0) and (erro_var<>0) then
                    begin
                    richedit5.Lines.Add('Erro sintaxe ');//+ 'erro= ' + inttostr(erro) + 'erro_var= ' + inttostr(erro_var));
                    erro_total:=1;
                    end else begin
                     
                    if tipo=1 then
                     begin
                     stringanzao:=stringanzao + stringao;
                     richedit3.Text:=stringanzao;
                     end;
                    if tipo=2 then
                     begin
                     stringanzao:=stringanzao + #13 + stringao;
                     richedit3.Text:=stringanzao;
                     end;
                    if tipo=3 then
                     begin
                      richedit3.Text:=stringanzao;
                     end;
                  end;

end;
//***************************************************************************

procedure TForm1.Button1Click(Sender: TObject);
var
palavra,str,tenta,stream: string;
comandos: array[1..10] of string;
acho_comand, acho_esp: boolean;
tam,i,i2,i3,i4,i5,t_stream,aux,erro_var: integer;
begin
richedit2.Clear;
richedit3.Clear;
richedit4.Clear;
richedit5.Clear;
for i:=1 to 10 do i_var[i]:=0;
cont:=1;
erro_total:=0;
erro_var:=0;
stringanzao:='';
comandos[1]:='print';
comandos[2]:='println';
comandos[3]:='define';
comandos[4]:='set';
comandos[5]:='read';
comandos[6]:='get';

for aux:=0 to (richedit1.lines.count -1) do
begin
palavra:=trim(richedit1.lines[aux]) + ' ';
tam:=length(palavra);
i5:=0;
i4:=1;

acho_comand:=false;
acho_esp:=false;

if palavra<>' ' then
begin
for i2:=1 to tam do
 begin
       if (palavra[i2] = ' ') then
       begin
       acho_esp:=true;
       str:=trim(copy(palavra,1,i2));

       while (i4<7) and (acho_comand=false) do
        begin

          if (trim(comandos[i4]) = trim(str)) then //Caso acho um comando valido na linha
           begin
           richedit2.lines.add(' : Comando ' + comandos[i4] + ' reconhecido.');
           acho_comand:=true;
           //Apartir daqui colocar a chamada do comando desejado

  //**************************************************************************************
               if (lowercase(trim(str)) = 'print') and (erro_total = 0)  then
                begin
                 stream:=trim(copy(palavra,i2,(tam-i2)));
                 t_stream:=length(trim(stream));
                 sub_print(stream,t_stream,1);
                end;
   //*******************************************************************************
               if (lowercase(trim(str)) = 'define') and (erro_total = 0) then
                begin
                stream:=trim(copy(palavra,i2,(tam-i2)));
                sub_define(stream);
                end;
    //*******************************************************************************
               if (lowercase(trim(str)) = 'println') and (erro_total = 0)  then
                begin
                 stream:=trim(copy(palavra,i2,(tam-i2)));
                 t_stream:=length(trim(stream));
                 sub_print(stream,t_stream,2);
                end;
     //********************************************************************************
               if (lowercase(trim(str)) = 'set') and (erro_total = 0) then
                begin
                stream:=trim(copy(palavra,i2,(tam-i2)));
                t_stream:=length(trim(stream));
                sub_set(stream);
                end;
     //*******************************************************************************
               if (lowercase(trim(str)) = 'read') and (erro_total = 0)  then
                begin
                 stream:=trim(copy(palavra,i2,(tam-i2)));
                 t_stream:=length(trim(stream));
                 sub_print(stream,t_stream,3);
                end;
      //******************************************************************************

      //*******************************************************************************
               if (lowercase(trim(str)) = 'get') and (erro_total = 0)  then
                begin
                 stream:=trim(copy(palavra,i2,(tam-i2)));
                 t_stream:=length(trim(stream));
                 sub_get(stream);
                end;
      //******************************************************************************

         end else begin //Se não tem nenhum comando na primeira coluna de palavras
          if (i4+1=7) then  richedit5.Lines.Add('Linha ' + inttostr(aux+1) + ': erro sintaxe. ');
         end;
          i4:=i4+1; //Indica qual o comando da vez a ser comaparado

      end; //fim do while dos comandos
    end;

end; //fim do laço dos caracteres

end; // fim do laço for principal
end;

end; //fim de procedure


procedure TForm1.FormCreate(Sender: TObject);
var
i: integer;
begin
cont:=1;
erro_total:=0;
stringanzao:='';
for i:=1 to 10 do i_var[i]:=0;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
i,aux,cont_for,cont_end: integer;
i_for: array[1..20] of integer;
i_end: array[1..20] of integer;
str,s: string;
begin

cont_for:=0;
cont_end:=0;

 for i:=0 to (richedit1.Lines.Count-1) do
 begin
  if trim(richedit1.Lines[i])='for' then
  begin
   cont_for:=cont_for+1;
   i_for[cont_for]:=i;
   aux:=cont_for;
   cont_end:=cont_for;
  end;

  if trim(richedit1.lines[i])='end' then
  begin

   i_end[cont_end]:=i_for[cont_end];
   cont_end:=cont_end-1;
  end
 end;

for i:=1 to aux do
begin
 richedit3.Lines.Add('FOR na linha: ' + inttostr(i_for[i]));
end;

for i:=aux downto 1 do
 begin
  richedit3.Lines.Add('END para FOR na linha: ' + inttostr(i_end[i]));
 end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
i: integer;
begin
richedit4.Clear;
for i:=1 to cont-1 do
 richedit4.Lines.Add(l_var[i] + '= ' + inttostr(i_var[i]));

end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
showmessage('oi');
end;

end.
