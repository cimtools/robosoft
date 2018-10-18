unit Log_Term;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RichEdit1: TRichEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.DFM}

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
radiobutton2.Checked:=true;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
richedit1.Clear;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
richedit1.CopyToClipboard;
end;

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
richedit1.Lines.add('Inicio do Log: ' + DateTimeToStr(Now));
end;

procedure TForm5.RadioButton2Click(Sender: TObject);
begin
richedit1.lines.Add('Fim do Log: ' + DateTimeToStr(Now));
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
form5.Close;
end;

end.
