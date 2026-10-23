unit fvector;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids, uvector;

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
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ELE: TEdit;
    POS: TEdit;
    Label1: TLabel;
    SG: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    V:Vector;
    procedure updateSG(); //CTRL+SHIFT+C
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin                                 //BOTON SETDIM
  V.setDim(StrToInt(POS.Text));
  updateSG();
  POS.Text:='';
end;

procedure TForm1.updateSG;
var
  des:integer;
begin
   SG.ColCount:=V.getDim();
   for des:=1 to V.getDim() do
   SG.cells[des-1,0]:=IntToStr(V.getElem(des));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin                                 //BOTON CREAR
  V:=Vector.crear();
  updateSG();
  showMessage('Vector Inicializado . . . ');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  V.ordBurb();
  updateSG();
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  V.cargar();
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  V.insElem(StrToInt(POS.Text),StrToInt(Ele.Text));
  updateSG();
  POS.Text:='';
  Ele.Text:='';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  V.invertir();
  updateSG();
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  V.elimRep();
  updateSG();
end;

procedure TForm1.Button15Click(Sender: TObject);
var 				//Boton BUSQBIN
	posE:integer;
begin
	posE:= V.busqBin(StrToInt(Ele.Text));
	POS.Text:=IntToStr(posE);
	ELE.Text:='';
	SG.row:=0;
	SG.Col:=posE-1;
	SG.SetFocus;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  V.ordFrec();
  updateSG();
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  V.ordQuickSort();
  updateSG();
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  V.ordShellSort();
  updateSG();
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  V.ord_inter();
  updateSG();
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
   updateSG();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin                                 //BOTON GETDIM
  POS.Text:=IntToStr(V.getDim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin                                 //Boton SETELEM
  V.setElem(StrToInt(POS.Text),StrToInT(ELE.Text));
  updateSG();
  POS.Text:='';
  ELE.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin                                 //Boton GETELEM
  ELE.Text:=IntToStr(V.getElem(StrToInt(POS.Text)));
  POS.Text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin                                 //Boton ADDELEM
V.addElem(StrToInt(ELE.Text));
updateSG();
ELE.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin                                 //Boton INSELEM
  V.insElem(StrToInt(POS.Text),StrToInt(Ele.Text));
  updateSG();
  POS.Text:='';
  Ele.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin                                 //Boton REMOVERELEM
  V.remElem(StrToInt(POS.Text));
  updateSG();
  POS.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Close;
end;

end.

