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

var
llave128:  array [1..128] of integer;

{carga en la llave las posiciones en las que se ubicarán los jugadores}
procedure inicialar_llave();
var
i : byte;
begin
for i := 1 to 128 do
	llave128[i] := 0;

// 1 2
llave128[  1] := 1;
llave128[128] := 2;

// 3 4
llave128[ 65] := 3;
llave128[ 64] := 4;

// 5 6 7 8 
// 32 33 96 97
llave128[ 96] := 5;
llave128[ 33] := 6;
llave128[ 97] := 7;
llave128[ 32] := 8;

// 9 10 11 12 13 14 15 16
//16 17 48 49 80 81 112 113 
llave128[ 80] := 9;
llave128[ 49] := 10;
llave128[ 81] := 11;
llave128[ 48] := 12;
llave128[112] := 13;
llave128[ 17] := 14;
llave128[113] := 15;
llave128[ 16] := 16;

// 17 al 32
//24 25 56 57 88 89 120 121 
// 8  9 40 41 72 73 104 105 
llave128[121] := 17;
llave128[105] := 18;
llave128[120] := 19;
llave128[104] := 20;
llave128[ 89] := 21;
llave128[ 73] := 22;
llave128[ 88] := 23;
llave128[ 72] := 24;
llave128[ 57] := 25;
llave128[ 41] := 26;
llave128[ 56] := 27;
llave128[ 40] := 28;
llave128[ 25] := 29;
llave128[  9] := 30;
llave128[ 24] := 31;
llave128[  8] := 32;

// 33 al 64
//12 13 28 29 44 45 60 61 76 77 92 93 108 109 124 125
// 5  4 21 20 37 36 53 52 69 68 85 84 101 100 117 116
llave128[125] := 33;
llave128[116] := 34;
llave128[124] := 35;
llave128[117] := 36;
llave128[109] := 37;
llave128[100] := 38;
llave128[108] := 39;
llave128[101] := 40;
llave128[ 93] := 41;
llave128[ 84] := 42;
llave128[ 92] := 43;
llave128[ 85] := 44;
llave128[ 77] := 45;
llave128[ 68] := 46;
llave128[ 76] := 47;
llave128[ 69] := 48;

llave128[ 61] := 49;
llave128[ 52] := 50;
llave128[ 60] := 51;
llave128[ 53] := 52;
llave128[ 45] := 53;
llave128[ 36] := 54;
llave128[ 44] := 55;
llave128[ 37] := 56;
llave128[ 29] := 57;
llave128[ 20] := 58;
llave128[ 28] := 59;
llave128[ 21] := 60;
llave128[ 13] := 61;
llave128[  4] := 62;
llave128[ 12] := 63;
llave128[  5] := 64;

// 65 al 128
//12 13 28 29 44 45 60 61 76 77 92 93 108 109 124 125
// 5  4 21 20 37 36 53 52 69 68 85 84 101 100 117 116

end;

{imprime en la consola la llave generada
 es un procedimiento que se usará para debug}
procedure imprimir_llave();
var
i : byte;
begin
for i := 1 to 8 do
begin
	write(i:3,      ': ', llave128[i]:3, #9);
	write(i+8:3,    ': ', llave128[i+8]:3, #9);
	write(i+16:3,   ': ', llave128[i+16]:3, #9);
	write(i+24:3,   ': ', llave128[i+24]:3, #9);
	write(i+32:3,   ': ', llave128[i+32]:3, #9);
	write(i+40:3,   ': ', llave128[i+40]:3, #9);
	write(i+58:3,   ': ', llave128[i+58]:3, #9);
	write(i+56:3,   ': ', llave128[i+56]:3, #9);
	write(i+64:3,   ': ', llave128[i+64]:3, #9);
	write(i+72:3,   ': ', llave128[i+72]:3, #9);
	write(i+80:3,   ': ', llave128[i+80]:3, #9);
	write(i+88:3,   ': ', llave128[i+88]:3, #9);
	write(i+96:3,   ': ', llave128[i+96]:3, #9);
	write(i+104:3,  ': ', llave128[i+104]:3, #9);
	write(i+112:3,  ': ', llave128[i+112]:3, #9);
	writeln(i+120:3,': ', llave128[i+120]:3, #9);

end;
end;


BEGIN
	inicialar_llave();
	imprimir_llave();
	writeln('hola mundo');
	
END.

