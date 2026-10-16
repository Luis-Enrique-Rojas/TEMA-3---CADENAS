unit ucadena;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, uconjunto, Dialogs;

const
  MAX_ELEM=5000;
type

  { TCadena }

  TCadena=Class
    private
      elem:array[1..MAX_ELEM]of char;
      dim:integer;
      May,Min,Dig,Sep:TConjunto;
    public
      constructor crear();
      procedure setDim(dime:integer);
      function getDim():integer;
      procedure setChar(pos:integer;ele:char);
      function getChar(pos:integer):char;
      procedure addChar(ele:char);
      procedure insChar(pos:integer;ele:char);
      procedure elimChar(pos:integer);
      function cantPal():integer;
      procedure leerPal(var pos:integer; var pal:string);
      function busqPal(palB:String):integer;
      procedure addPal(pal:String);
      procedure insPal(pos:integer;pal:String);
      procedure elimPal(pal:String);       //CTRL+SHIFT+C
      procedure camPal(palO, palR:string);
  end;

implementation

{ TCadena }

constructor TCadena.crear();
var
  pos:integer;
begin
    dim:=0;
    for pos:=1 to MAX_ELEM do
	elem[pos]:=char(0);  //NULL

    May:=TConjunto.crear();  //inicializar May  65  66  67 . . . 90
    for pos:=0 to 25 do      //            May={'A','B','C'.....'Z')
        May.agregar(char(65+pos));

    Min:=TConjunto.crear(); //inicializar Min  97  98  99 . . . 122
    for pos:=0 to 25 do     //            Min={'a','b','c' ..... 'z'}
        Min.agregar(char(97+pos));

    Dig:=TConjunto.crear(); //inicializar Dig 48  49  50 . . . 57
    for pos:=0 to 25 do     //            Dig={'0','1','2' ..... '9'}
        Dig.agregar(char(48+pos));
    //Sep={'-','_',',',':',';','#',...,''} //cargar searadores
    Sep:=TConjunto.crear(); //inicializar Sep
    Sep.agregar('-');
    Sep.agregar('_');
    Sep.agregar(',');
    Sep.agregar('.');
    Sep.agregar(':');
    Sep.agregar(';');
    Sep.agregar('#');
    Sep.agregar(' ');
end;

procedure TCadena.setDim(dime: integer);
begin
   if(dime>=0)AND(dime<=MAX_ELEM) then
   dim:=dime
   else
     showMessage('Dimension fuera de rango . . .');
end;

function TCadena.getDim(): integer;
begin
  result:=dim;
end;

procedure TCadena.setChar(pos: integer; ele: char);
begin
   if(pos>=1)AND(pos<=dim) then
   elem[pos]:=ele
   else
     showMessage('Posicion fuera de rango . . .');
end;

function TCadena.getChar(pos: integer): char;
begin
   if(pos>=1)AND(pos<=dim) then
   result:=elem[pos]
   else
     result:=char(0); //NULL
end;

procedure TCadena.addChar(ele: char);
begin
   if(dim<MAX_ELEM) then
   begin
     dim:=dim+1;
     elem[dim]:=ele;
   end;
end;

procedure TCadena.insChar(pos: integer; ele: char);
var
  des:integer;
begin
   if(pos>=1)AND(pos<=dim) then
   begin
     for des:=dim downto pos do
         elem[des+1]:=elem[des];
     elem[pos]:=ele;
     dim:=dim+1;
   end
   else
     showMessage('Posicion fuera de rango . . .');
end;

procedure TCadena.elimChar(pos: integer);
var
  des:integer;
begin
   if(pos>=1)AND(pos<=dim) then
   begin
     for des:=pos to dim-1 do
         elem[des]:=elem[des+1];
     dim:=dim-1;
   end
   else
     showMessage('Posicion fuera de rango . . .');
end;

function TCadena.cantPal(): integer;
var
  cp,pos:integer;
  pal:string;
begin
   cp:=0;
   pos:=1;
   while(pos<=dim) do
   begin
	leerPal(pos,pal);
	if(pal<>'')then
	cp:=cp+1;
   end;
  result:=cp;
end;

procedure TCadena.leerPal(var pos: integer; var pal: string);
begin
   pal:='';
	while(pos<=dim)AND(NOT Sep.pertenece(elem[pos])) do
        begin
		pal:=pal+elem[pos];
		pos:=pos+1;
        end;
	while(pos<=dim)AND(Sep.pertenece(elem[pos])) do
        begin
		pos:=pos+1;
        end;
end;

function TCadena.busqPal(palB: String): integer;
var
  pos,posant:integer;
  sw:boolean;
  pal:string;
begin
   sw:=false;
   pos:=1;
   	while (pos<=dim)AND(NOT sw) do
        begin
   		posant:=pos;
   		leerPal(pos,pal);
   		if(pal=palB) then	//'Hola'='Hola'=>TRUE
                begin
   			sw:=true	//'Hola'='Hola'=>FALSE
                end;
        end;
   	if(sw) then
   	result:=posant
   	else
   	result:=-1;
end;

procedure TCadena.addPal(pal: String);
var
  n,des:integer;
begin
   n:=length(pal);
   	if(dim+n+1<MAX_ELEM) then// hay espacio para la palabra
        begin
   		addChar(')');
                for des:=1 to n do
                    addChar(pal[des]);
        end
        else
            showMessage('Almacenamiento lleno . . .');
end;

procedure TCadena.insPal(pos: integer; pal: String);
var
  n,des:integer;
begin
   n:=length(pal);
   	if(dim+n+2<MAX_ELEM)then // hay espacio para almacenar
        begin
   		insChar(pos,' ');
   		for des:=1 to n do //pal:='Juan'
   			insChar(pos+des,pal[des]);
   		insChar(pos+n+1, ' ');
                end
                else
   	showMessage('No hay espacio de almacenamiento');
end;

procedure TCadena.elimPal(pal: String);
var
  pos,des,n:integer;
begin
    pos:=busqPal(pal);
    	if(pos<>-1)then
        begin
    	  n:=length(pal);
    	  elimChar(pos-1); // espacio ANTES
          for des:=1 to n do//pal='Juan'
    		elimChar(pos-1);
    	  elimChar(pos-1);  // espacio DESPUES
        end
    	else
    		showMessage('La Palabra No Existe . . .');
end;

procedure TCadena.camPal(palO, palR: string);
var
  pos:integer;
begin
    pos:=busqPal(palO);
    	if(pos<>-1) then// si la encontramos
        begin
    		elimPal(palO);
    		insPal(pos-1,PalR);
        end
        else
    	showMessage('La palabra No existe . . .');
end;

end.

