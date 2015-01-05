{
   pinpon1.pas
   
   Copyright 2015 Rafael Bidegain <r.bidegain@gmail.com>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program pinpon1;

uses crt;

llave128:  array [1..128] of integer;

{carga en la llave las posiciones en las que se ubicarán los jugadores}
procedure inicialar_llave();
var
i : byte;
begin
for i := 1 to 128 do
	llave128[i] := 0;

llave[1] := 1;
llave[128] = 2;


end;

{imprime en la consola la llave generada
 es un procedimiento que se usará para debug}
procedure imprimir_llave();
begin
end;


BEGIN
	inicialar_llave();
	imprimir_llave();
	writeln('hola mundo');
	
END.

