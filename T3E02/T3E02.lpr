program T3E02;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, uconjunto
  { you can add units after this };
var
  A,B:TConjunto;
begin
  A:=TConjunto.crear(); //inicializar //A={}
  A.agregar('a');       //A={'a'}
  A.agregar('b');       //A={'a','b'}
  A.agregar('c');       //A={'a','b','c'}
  A.agregar('a');       //A={'a','b','c'}
  write('Conjunto A = ');
  A.mostrar();
  writeln();

  B:=TConjunto.crear(); //inicializar //B={}
  B.agregar('c');       //B={'c'}
  B.agregar('d');       //B={'c','d'}
  B.agregar('e');       //B={'c','d','e'}
  B.agregar('x');       //B={'c','d','e'}
  write('Conjunto B = ');
  B.mostrar();
  readln;
end.

