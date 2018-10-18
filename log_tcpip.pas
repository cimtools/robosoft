unit log_tcpip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, StdCtrls, ExtCtrls;

type
  TForm7 = class(TForm)
    ListView4: TListView;
    ImageList3: TImageList;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  

implementation

{$R *.DFM}

procedure TForm7.Button1Click(Sender: TObject);
begin
form7.Hide;
end;

end.
