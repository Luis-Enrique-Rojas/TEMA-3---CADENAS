unit uejercicio3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type

  { TEjercicio3 }

  TEjercicio3 = Class
    private
      cad:string;
    public
      constructor crear();
      procedure setCad(cade:string);
      function getCad():string;
      function contarEspacios():integer;
      procedure posicionAscii(car:char);
      function cadOrdenada():boolean;
      function carI_M(pos:integer):boolean;
      function contarIes():integer;  //CTRL+SHIFT+C

  end;

implementation

{ TEjercicio3 }

constructor TEjercicio3.crear();
begin
  cad:='';
end;

procedure TEjercicio3.setCad(cade: string);
begin
  cad:=cade;
end;

function TEjercicio3.getCad(): string;
begin
   result:=cad;
end;

function TEjercicio3.contarEspacios(): integer;
var
  cce,pos,dim:integer;
begin
   cce:=0;
   pos:=0;
   dim:=length(cad);    //dim=23
   while(pos <= dim) do
   begin
     if(cad[pos]=' ')then
     cce:=cce+1;
     pos:=pos+1;
   end;
   result:=cce;
end;

procedure TEjercicio3.posicionAscii(car: char);
begin
    if(integer(car)>=97)AND(integer(car)<=122)then
    begin
      if(car<'g')then
      writeln(car+' esta ANTES de <g>')
      else
        writeln(car+' esta DESPUSE de <g>');
      end;
    if(integer(car)>=65)AND(integer(car)<=90)then
    begin
      if(car<'G')then
      writeln(car+' esta ANTES de <g>')
      else
        writeln(car+' esta DESPUES de <g>');
      end;
end;

function TEjercicio3.cadOrdenada(): boolean;
var
  pos,dim:integer;
  sw:boolean;
begin
   pos :=1;
   sw :=true;
   dim := length(cad);
   while(pos<=dim-1)AND(sw)do
   begin
     if(cad[pos]>cad[pos+1])then
     sw := false;
     pos :=pos+1;
   end;
    result:=sw;
end;

function TEjercicio3.carI_M(pos:integer): boolean;
var
  sw:boolean;
  dim:integer;
begin
   sw :=false;
   dim := length(cad);
   if(pos>=1)AND(pos<=dim)then
   begin
        if(cad[pos]>='I')AND(cad[pos]<='M')then
        begin
        sw:=true;
        end;
  result := sw;
end;
end;

function TEjercicio3.contarIes(): integer;
var
  cce,pos,dim:integer;
begin
    cce:=0;
   pos:=0;
   dim:=length(cad);    //dim=23
   while(pos <= dim) do
   begin
     if(cad[pos]='i')OR(cad[pos]='I')then
     cce:=cce+1;
     pos:=pos+1;
   end;
   result:=cce;
end;

end.

