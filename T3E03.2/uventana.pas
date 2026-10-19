unit uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ucadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    POS: TEdit;
    ELE: TEdit;
    Label1: TLabel;
    SG: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
     Cad:TCadena;
     procedure updateSG(); //CTRL+SHIFT+C
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin                        //CREAR
  Cad:=TCadena.crear();
  updateSG();
  showMessage('Cadenas de Caracteres Inicializada . . .');
end;
                             //BUSQPAL
procedure TForm1.Button10Click(Sender: TObject);
begin
  POS.Text:=IntToStr(Cad.busqPal(ELE.Text));
  ELE.Text:='';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin                       //ADDPAL
  Cad.addPal(ELE.Text);
  updateSG();
  ELE.Text:='';
end;

procedure TForm1.Button12Click(Sender: TObject);
begin                        //INSPAL
  Cad.insPal(StrToInt(POS.Text),ELE.Text);
  updateSG();
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin                        //ELIMPAL
  Cad.elimPal(ELE.Text);
  updateSG();
  ELE.Text:='';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin                        //CAMBPAL
  Cad.camPal(POS.Text,ELE.Text);
  updateSG();
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin                        //SETDIM
  Cad.setDim(StrToInt(POS.Text));
  updateSG();
  POS.TEXT:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                       //GETDIM
  POS.Text:=IntToStr(Cad.getDim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin                       //SETCHAR
  Cad.setChar(StrToInt(POS.Text),ELE.Text[1]);
  updateSG();
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin                       //GETCHAR
  ELE.Text:=Cad.getChar(StrToInt(POS.Text));
  POS.Text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin                       //ADDCHAR
  Cad.addChar(ELE.Text[1]);
  updateSG();
  ELE.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin                       //INSCHAR
  Cad.insChar(StrToInt(POS.Text),ELE.Text[1]);
    updateSG();
    POS.Text:='';
    ELE.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin                      //ELIMCHAR
  Cad.elimChar(StrToInt(POS.Text));
  updateSG();
  POS.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin                      //CANTPAL
  POS.Text:=IntToStr(Cad.cantPal());
end;

procedure TForm1.updateSG();
var
  des:integer;
begin
  SG.ColCount:=Cad.getDim();
  for des:=1 to Cad.getDim() do
      SG.Cells[des-1,0]:= Cad.getChar(des);
end;

end.

