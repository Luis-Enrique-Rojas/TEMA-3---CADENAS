unit uvector;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
const
  MAX_ELE=100;
type
 { Vector }
  Vector=Class
    private
      elem:array[1..MAX_ELE]of integer;
      dim:integer;
    public
      constructor crear();
      procedure setElem(pos,ele:integer);
      function getElem(pos:integer):integer;
      procedure setDim(dime:integer);
      function getDim():integer;
      procedure addElem(ele:integer);
      procedure insElem(pos,ele:integer);
      procedure remElem(pos:integer);    //CTRL+SHIFT+C
      procedure cargar();
      procedure invertir();
      procedure elimRep();
      procedure ordFrec();
      function busqBin (ele:integer):integer;
      procedure ord_inter();
      procedure ordBurb();
      procedure ordQuickSort();
      procedure ordShellSort();
  end;

implementation

{ Vector }

constructor Vector.crear;
var
  pos:integer;
begin
  dim:=0;
  for pos:=1 to MAX_ELE do
      elem[pos]:=0;
end;
procedure Vector.setElem(pos, ele: integer);
begin
  if(pos>=1)AND(pos<=dim)then
      elem[pos]:=ele
  else
      ShowMessage('Posicion Fuera de Rango . . .');
end;
function Vector.getElem(pos: integer): integer;
begin
  if(pos>=1)AND(pos<=dim)then
      result:=elem[pos]
  else
      result:=-999;
end;
procedure Vector.setDim(dime: integer);
begin
  if(dime>=0)AND(dime<=MAX_ELE)then
      dim:=dime
  else
      ShowMessage('Dimension Fuera de Rango . . .');
end;
function Vector.getDim: integer;
begin
  result:=dim;
end;

procedure Vector.addElem(ele: integer);
begin
  if(dim<MAX_ELE)then
  begin
      dim:=dim+1;
      elem[dim]:=ele;
  end
  else
      ShowMessage('Almacenamiento lleno . . .');
end;
procedure Vector.insElem(pos, ele: integer);
var
  i:integer;
begin
  if(dim<MAX_ELE)then
  begin
      if(pos>=1)AND(pos<=dim)then
        begin
          for i:=dim downto pos do
              elem[i+1]:=elem[i];
          elem[pos]:=ele;
          dim:=dim+1;
        end
      else
          ShowMessage('Posicion Fuera de Rango . . .');
  end
  else
      ShowMessage('Almacenamiento lleno . . .');
end;
procedure Vector.remElem(pos: integer);
var
  i:integer;
begin
  if(dim<>0)then
  begin
      if(pos>=1)AND(pos<=dim) then
        begin
          for i:=pos to dim-1 do
              elem[i]:=elem[i+1];
          dim:=dim-1;
        end
      else
          ShowMessage('Posicion Fuera de Rango . . .');
  end
  else
      ShowMessage('Almacenamiento Vacio . . .');
end;

procedure Vector.cargar;
var
  pos,dime,ele:integer;
begin
  dime:=StrToInt(InputBox('Cargar Vector','Cuantos elementos:',''));
  setDim(dime);
  for pos:=1 to getDim() do
  begin
    ele:=StrToInt(InputBox('Cargar Vector','Elemento ['+IntToStr(pos)+'] =',''));
    setElem(pos,ele);
  end;
end;

procedure Vector.invertir;
var
  i,j,aux:integer;
begin
  i:=1;
  j:=dim;
  while i<j do
  begin
    aux:=elem[i];
    elem[i]:=elem[j];
    elem[j]:=aux;
    i:=i+1;
    j:=j-1;
  end;
end;

procedure Vector.elimRep;
var
  i,j,k:integer;
begin
  i:=1;
  while i<=dim do
  begin
    j:=i+1;
    while j<=dim do
    begin
      if elem[i]=elem[j] then
      begin
        for k:=j to dim-1 do
          elem[k]:=elem[k+1];
        dim:=dim-1;
      end
      else
        j:=j+1;
    end;
    i:=i+1;
  end;
end;

procedure Vector.ordFrec;
var
  valores,frecuencias:array[1..MAX_ELE] of integer;
  cantidad,i,j,aux:integer;
begin
   cantidad:=0;
  i:=1;
  while i<=dim do
  begin
    j:=1;
    while (j<=cantidad) and (valores[j]<>elem[i]) do
      j:=j+1;
    if j>cantidad then
    begin
      cantidad:=cantidad+1;
      valores[cantidad]:=elem[i];
      frecuencias[cantidad]:=1;
    end
    else
      frecuencias[j]:=frecuencias[j]+1;
    i:=i+1;
  end;
  i:=1;
  while i<=cantidad-1 do
  begin
    j:=1;
    while j<=cantidad-i do
    begin
      if frecuencias[j]<frecuencias[j+1] then
      begin
        aux:=frecuencias[j];
        frecuencias[j]:=frecuencias[j+1];
        frecuencias[j+1]:=aux;
        aux:=valores[j];
        valores[j]:=valores[j+1];
        valores[j+1]:=aux;
      end;
      j:=j+1;
    end;
    i:=i+1;
  end;
  dim:=cantidad;
  for i:=1 to dim do
    elem[i]:=valores[i];
end;

function Vector.busqBin(ele:integer):integer;
var
   ini,fin,medio:integer;
   sw:boolean;
begin
     ini:=1;
     fin:=dim;
     sw:=false;
     while (ini<=fin) and (not sw) do
	begin
	medio:=(fin+ini) div 2;
	if(elem[medio]=ele)then
	sw:=true
	else
	if(elem[medio]>ele) then
	fin:=medio-1
	else
	ini:=medio+1;
	end;
        if (sw) then
        result:=medio
        else
        result:=-1;
end;

procedure Vector.ord_inter();
var
	p,d,aux:integer;
begin
for p:=1 to dim-1 do
	begin
	for d:=p+1 to dim do
	begin
	if(elem[d]<elem[p]) then
	begin
		aux:=elem[d];
		elem[d]:=elem[p];
		elem[p]:=aux;
		end;
	end;
	end;
end;

procedure Vector.ordBurb;
var
  p, d, aux: integer;
begin
  p:= dim;
  while p >= 2 do
  begin
    d := 1;
    while d <= p - 1 do
    begin
      if elem[d] > elem[d + 1] then
      begin
        aux := elem[d];
        elem[d] := elem[d + 1];
        elem[d + 1] := aux;
      end;
      d := d + 1;
    end;
    p := p - 1;
  end;
end;

procedure Vector.ordQuickSort;
var
  i,j,pivote,aux:integer;
  procedure quick(izq,der:integer);
  begin
    i:=izq;
    j:=der;
    pivote:=elem[(izq+der) div 2];
    while i<=j do
    begin
      while elem[i]<pivote do
        i:=i+1;

      while elem[j]>pivote do
        j:=j-1;
      if i<=j then
      begin
        aux:=elem[i];
        elem[i]:=elem[j];
        elem[j]:=aux;
        i:=i+1;
        j:=j-1;
      end;
    end;
    if izq<j then
      quick(izq,j);
    if i<der then
      quick(i,der);
  end;
begin
  if dim>1 then
    quick(1,dim);
end;

procedure Vector.ordShellSort;
var
  salto,i,j,aux:integer;
begin
  salto:=dim div 2;
  while salto>0 do
  begin
    i:=salto+1;
    while i<=dim do
    begin
      aux:=elem[i];
      j:=i;
      while (j>salto) and (elem[j-salto]>aux) do
      begin
        elem[j]:=elem[j-salto];
        j:=j-salto;
      end;
      elem[j]:=aux;
      i:=i+1;
    end;
    salto:=salto div 2;
  end;
end;

end.

