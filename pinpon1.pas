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

uses math, crt,sysutils;
{hacer una funcion para reemplazar a min y evitar la llamada a math}

type 
t_zona = record
zona : byte;
posicion : byte;
end;

t_jugador = record
zona : byte;
posicion : byte;
ranking : integer;
club : string;
nombre : string;
//resultado : array[1..5] of integer;
end;

var
llave128:      array [1..128] of integer;
llavew:        array [1..128] of integer;

jugadores128:  array [1..128] of t_zona;
torneo:        array [1..128] of t_jugador;
tam_torneo : integer;

{carga en la llave las posiciones en las que se ubicarán los jugadores}
procedure inicialar_llave();
var
i : byte;
begin
for i := 1 to 128 do
	llave128[i] := 0;

llave128[ 1] :=  1;
llave128[ 2] := 128;
llave128[ 3] := 65;
llave128[ 4] := 64;
llave128[ 5] := 33;
llave128[ 6] := 96;
llave128[ 7] := 97;
llave128[ 8] := 32;
llave128[ 9] := 17;
llave128[10] := 112;
llave128[11] := 81;
llave128[12] := 48;
llave128[13] := 49;
llave128[14] := 80;
llave128[15] := 113;
llave128[16] := 16;
llave128[17] :=  9;
llave128[18] := 120;
llave128[19] := 73;
llave128[20] := 56;
llave128[21] := 41;
llave128[22] := 88;
llave128[23] := 105;
llave128[24] := 24;
llave128[25] := 25;
llave128[26] := 104;
llave128[27] := 89;
llave128[28] := 40;
llave128[29] := 57;
llave128[30] := 72;
llave128[31] := 121;
llave128[32] :=  8;
llave128[33] :=  5;
llave128[34] := 117;
llave128[35] := 76;
llave128[36] := 53;
llave128[37] := 44;
llave128[38] := 85;
llave128[39] := 108;
llave128[40] := 21;
llave128[41] := 28;
llave128[42] := 101;
llave128[43] := 92;
llave128[44] := 37;
llave128[45] := 60;
llave128[46] := 69;
llave128[47] := 124;
llave128[48] := 12;
llave128[49] := 13;
llave128[50] := 116;
llave128[51] := 77;
llave128[52] := 52;
llave128[53] := 45;
llave128[54] := 84;
llave128[55] := 109;
llave128[56] := 20;
llave128[57] := 29;
llave128[58] := 100;
llave128[59] := 93;
llave128[60] := 36;
llave128[61] := 61;
llave128[62] := 68;
llave128[63] := 125;
llave128[64] :=  3;
llave128[65] :=  4;
llave128[66] := 126;
llave128[67] := 67;
llave128[68] := 62;
llave128[69] := 35;
llave128[70] := 94;
llave128[71] := 99;
llave128[72] := 30;
llave128[73] := 19;
llave128[74] := 110;
llave128[75] := 83;
llave128[76] := 46;
llave128[77] := 51;
llave128[78] := 78;
llave128[79] := 115;
llave128[80] := 14;
llave128[81] := 11;
llave128[82] := 123;
llave128[83] := 70;
llave128[84] := 59;
llave128[85] := 38;
llave128[86] := 91;
llave128[87] := 102;
llave128[88] := 27;
llave128[89] := 22;
llave128[90] := 107;
llave128[91] := 86;
llave128[92] := 43;
llave128[93] := 54;
llave128[94] := 75;
llave128[95] := 118;
llave128[96] :=  6;
llave128[97] :=  7;
llave128[98] := 122;
llave128[99] := 71;
llave128[100] := 58;
llave128[101] := 39;
llave128[102] := 90;
llave128[103] := 103;
llave128[104] := 26;
llave128[105] := 23;
llave128[106] := 106;
llave128[107] := 87;
llave128[108] := 42;
llave128[109] := 55;
llave128[110] := 74;
llave128[111] := 119;
llave128[112] := 10;
llave128[113] := 15;
llave128[114] := 114;
llave128[115] := 79;
llave128[116] := 50;
llave128[117] := 47;
llave128[118] := 82;
llave128[119] := 111;
llave128[120] := 18;
llave128[121] := 31;
llave128[122] := 98;
llave128[123] := 95;
llave128[124] := 34;
llave128[125] := 63;
llave128[126] := 66;
llave128[127] := 127;
llave128[128] :=  2;


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

{busca en la llave de torneo una zona y una posicion devuelve verdadero o falso}
function buscar_en_torneo(desde, hasta, z, p : integer) : boolean;
var
i : integer;
r : boolean;
begin
r := false;
for i := desde to hasta do
	if (torneo[i].zona = z) and (torneo[i].posicion = p) then
		r := true;

buscar_en_torneo := r;
end;

{busca en la llave de torneo una zona y una posicion, devuelve la posicion}
function buscar_pos_torneo(z, p: integer) : integer;
var
i,r : integer;
begin
r := 0; //ojo con este valor, si devuelve  0 el programa crashea
for i := 1 to tam_torneo do
	if (torneo[i].zona = z) and (torneo[i].posicion = p) then
		r := i;

buscar_pos_torneo := r;
end;

{busca si el primero y el segundo de la misma zona están en la misma mitad}
function validar_1y2(zona:integer) : boolean;
var
i : integer;
primero, segundo : boolean;
begin
primero := false;
segundo := false;

for i := 1 to tam_torneo div 2 do
begin
	if (torneo[i].zona = zona) and (torneo[i].posicion = 1) then
		primero := true;
	if (torneo[i].zona = zona) and (torneo[i].posicion = 2) then
		segundo := true;
end;


validar_1y2 := (primero xor segundo);
end;

{pone un jugador en la llave del torneo}
procedure poner_en_torneo(posicion, jugador : integer);
begin
	torneo[posicion].zona     := jugadores128[jugador].zona;
	torneo[posicion].posicion := jugadores128[jugador].posicion;
	//torneo[posicion].nombre   := jugadores128[jugador].nombre;
	torneo[posicion].nombre   := '( Z' +
								IntToStr(jugadores128[jugador].zona) +
								', P' +
								IntToStr(jugadores128[jugador].posicion) +
								')';						
end;

{saca un jugador de la llave del torneo}
procedure sacar_de_torneo(posicion : integer);
begin
	torneo[posicion].zona     := 0;
	torneo[posicion].posicion := 0;
	torneo[posicion].nombre   := '';						
end;

{imprime la llave del torneo, hay que especificar la cantidad de jugadores}
procedure imprimir_torneo(n: integer);
var
i,j,r : integer;
color : string;
begin
if n>8 then
	j := 16
else
	j := 8;
if n>16 then
	j := 32;
if n>32 then
	j := 64;
if n>64 then
	j := 128;
	
writeln('<html>');
writeln('<head>');
writeln('<title>llave torneo tmt2</title>');
writeln('</head>');

writeln('<body>');

writeln('n: ',n,'<br/>');
writeln('j: ',j,'<br/>');
writeln('<table border="1">');
r:=0;
i:= 1;
while i <= j  do
	begin
		color := '#FFFFFF';
		if (torneo[i].posicion = 1) or (torneo[i+1].posicion = 1) then
			color := '#FFFF00'
		else
			if (torneo[i].posicion = 2) or (torneo[i+1].posicion = 2) then
				color := '#008000';

		
		writeln('<tr><td>',r+1,'</td> ');
		if (torneo[i].zona <> 0) and (torneo[i+1].zona = 0) then
			begin
			writeln('<td bgcolor="'+color+'">',torneo[i].nombre,'<br/>BY</td>');
			end;
		if (torneo[i].zona <> 0) and (torneo[i+1].zona <> 0) then
			begin
			writeln('<td bgcolor="'+color+'">',torneo[i].nombre,'<br/>', torneo[i+1].nombre, '</td>');
			end;
		if (torneo[i].zona = 0) and (torneo[i+1].zona <> 0) then
			begin
			writeln('<td bgcolor="'+color+'">BY<br/>', torneo[i+1].nombre, '</td>');
			end;
		if (torneo[i].zona = 0) and (torneo[i+1].zona = 0) then
			begin
			writeln('<td>','BY<br/>','BY</td>');
			end;
		if r mod 2 = 0 then
			writeln('<td rowspan="2">',r,'</td>');
		if r mod 4 = 0 then
			writeln('<td rowspan="4">',r,'</td>');
		if r mod 8 = 0 then
			writeln('<td rowspan="8">',r,'</td>');
		if (j>= 16) and (r mod 16 = 0) then
			writeln('<td rowspan="16">',r,'</td>');
		if (j>= 32) and (r mod 32 = 0) then
			write('<td rowspan="32">',r,'</td>');
		if (j>= 64) and (r mod 64 = 0) then
			writeln('<td rowspan="64">',r,'</td>');

		writeln('</tr>');
		r := r + 1;
		i := i + 2;
	end;
writeln('</table>');

writeln(DateTimeToStr(now), '<br/>');
{
for i:=1 to j do
	writeln(i, ': ', torneo[i].zona, ' ', torneo[i].posicion, '<br/>');
}
writeln('</body>');
writeln('</html>');
end;


{imprime la llave en html, hay que especificar la cantidad de jugadores}
procedure imprimir_llaveN(n: integer);
var
i,j,r : integer;
begin
if n>8 then
	j := 16
else
	j := 8;
if n>16 then
	j := 32;
if n>32 then
	j := 64;
if n>64 then
	j := 128;
	
writeln('<html>');
writeln('<head>');
writeln('<title>llave 128 tmt2</title>');
writeln('</head>');

writeln('<body>');

writeln('n: ',n,'<br/>');
writeln('j: ',j,'<br/>');
writeln('<table border="1">');
r:=0;
i:= 1;
while i <= 128  do
	begin

	if (llave128[i] <= j) or (llave128[i+1] <= j) then
		begin
		writeln('<tr><td>',r+1,'</td> ');
		if (llave128[i] <= n) and (llave128[i+1] > n) then
			begin
			writeln('<td>',llave128[i],'<br/>BY</td>');
			end;
		if (llave128[i] <= n) and (llave128[i+1] <= n) then
			begin
			writeln('<td>',llave128[i],'<br/>',llave128[i+1],'</td>');
			end;
		if (llave128[i] > n) and (llave128[i+1] <= n) then
			begin
			writeln('<td>BY<br/>',llave128[i+1],'</td>');
			end;
		if (llave128[i] > n) and (llave128[i+1] > n) then
			begin
			writeln('<td>','BY<br/>','BY</td>');
			end;
		if r mod 2 = 0 then
			writeln('<td rowspan="2">',r,'</td>');
		if r mod 4 = 0 then
			writeln('<td rowspan="4">',r,'</td>');
		if r mod 8 = 0 then
			writeln('<td rowspan="8">',r,'</td>');
		if (j>= 16) and (r mod 16 = 0) then
			writeln('<td rowspan="16">',r,'</td>');
		if (j>= 32) and (r mod 32 = 0) then
			write('<td rowspan="32">',r,'</td>');
		if (j>= 64) and (r mod 64 = 0) then
			writeln('<td rowspan="64">',r,'</td>');

		writeln('</tr>');
		r := r + 1;
		end;
		i := i + 2;
	end;
writeln('</table>');

writeln('</body>');
writeln('</html>');
end;

{crea la serpiente de jugadores DEBUG}
procedure inicialar_jugadores(jugadores : integer);
var
i,j,k, zonas : byte;

begin
j := 1;


zonas := jugadores div 3;
for i:=1 to 3 do
	begin
	for k:=1 to zonas do
		begin
		jugadores128[j].zona := k;
		jugadores128[j].posicion:= i;
//		writeln(j:3, ':  ', jugadores128[j].posicion, ' de la zona ', jugadores128[j].zona);
		j := j + 1;
		end;
	end;
end;

procedure poner_12();
begin
	poner_en_torneo(1,1);
	poner_en_torneo(tam_torneo,2);
end;

procedure poner_34();
var
x,y : integer;
begin
	if random(2) = 0 then
		begin
		x := 3;
		y := 4;
		end
	else
		begin
		x := 4;
		y := 3;
		end;	
	poner_en_torneo(tam_torneo div 2,x);
	poner_en_torneo((tam_torneo div 2)+1,y);
end;

procedure poner_58(canti : integer);
var
minimo : integer;
i,j,k,p : integer;
j4, rival : array[1..4] of integer;
tmp : array[1..4] of integer;
repetir : boolean;
begin
minimo := min(canti, 8);

j:=1;
i:=1;
while i < 128 do
	begin
	if (llave128[i] > 4) and (llave128[i] <= minimo) then
		begin
		j4[j]    := i;
		rival[j] := i+1;
		j := j + 1;
		end;
	if (llave128[i+1] > 4) and (llave128[i+1] <= minimo) then
		begin
		j4[j]    := i+1;
		rival[j] := i;
		j := j + 1;
		end;
	i := i + 2;
	end;

//for i:= 1 to j do
//	writeln(j4[i], ' vs ', rival[i]);
	
if canti > 8 then
	k := 4
else
	k := canti - 4;

repetir := true;
while repetir do
begin
	for i := 1 to 4 do
		tmp[i] := 1;

	i:=k;
	while i>0 do
	begin
		repeat
			p := random(k)+1;
		until tmp[p]=1; 
		tmp[p] := 0; 
		poner_en_torneo(j4[p], 4+i); //posicion jugador
		i := i-1;
	end;

	repetir := false;
//	writeln('validando...<br/>');
	for i:= 1 to k do
	begin
		if torneo[j4[i]].posicion = 2 then
			if not validar_1y2(torneo[j4[i]].zona) then
				repetir := true;
			
		if torneo[j4[i]].zona = torneo[rival[i]].zona then
		begin
			repetir := true;
//			writeln(i:2, ': ', torneo[dieciseis[i]].zona, torneo[diecises[i]].posicion, ' vs ', torneo[rival[i]].zona, torneo[rival[i]].posicion, '<br/>');
		end;
	end;

end;

end;

procedure poner_916(canti : integer);
var
minimo : integer;
p, i, j, k : integer;
j8, rival, tmp : array[1..8] of integer;
repetir : boolean;
begin
minimo := min(canti, 16);

j:=1;
i:=1;
while i < 128 do
	begin
	if (llave128[i] > 8) and (llave128[i] <= minimo) then
		begin
		j8[j]    := i;
		rival[j] := i+1;
		j := j + 1;
		end;
	if (llave128[i+1] > 8) and (llave128[i+1] <= minimo) then
		begin
		j8[j]    := i+1;
		rival[j] := i;
		j := j + 1;
		end;
	i := i + 2;
	end;

//for i:= 1 to j do
//	writeln(j8[i], ' vs ', rival[i]);
	
if canti > 16 then
	k := 8
else
	k := canti - 8;

repetir := true;
while repetir do
begin
	for i := 1 to 8 do
		tmp[i] := 1;

	i:=k;
	while i>0 do
	begin
		repeat
			p := random(k)+1;
		until tmp[p]=1; 
		tmp[p] := 0; 
		poner_en_torneo(j8[p], 8+i); //posicion jugador
		i := i-1;
	end;

	repetir := false;
//	writeln('validando...<br/>');
	for i:= 1 to k do
	begin
		if torneo[j8[i]].posicion = 2 then
			if not validar_1y2(torneo[j8[i]].zona) then
				repetir := true;
			
		if torneo[j8[i]].zona = torneo[rival[i]].zona then
		begin
			repetir := true;
//			writeln(i:2, ': ', torneo[j8[i]].zona, torneo[j8[i]].posicion, ' vs ', torneo[rival[i]].zona, torneo[rival[i]].posicion, '<br/>');
		end;
	end;

end;
end;

procedure poner_1732(canti : integer);
var
minimo : integer;
p, i, j, k : integer;
j16, rival, tmp : array[1..16] of integer;
repetir : boolean;
begin
minimo := min(canti, 32);

j:=1;
i:=1;
while i < 128 do
	begin
	if (llave128[i] > 16) and (llave128[i] <= minimo) then
		begin
		j16[j]    := i;
		rival[j] := i+1;
		j := j + 1;
		end;
	if (llave128[i+1] > 16) and (llave128[i+1] <= minimo) then
		begin
		j16[j]    := i+1;
		rival[j] := i;
		j := j + 1;
		end;
	i := i + 2;
	end;

//for i:= 1 to j do
//	writeln(j16[i], ' vs ', rival[i]);
	
if canti > 32 then
	k := 16
else
	k := canti - 16;

repetir := true;
while repetir do
begin
	for i := 1 to 16 do
		tmp[i] := 1;

	i:=k;
	while i>0 do
	begin
		repeat
			p := random(k)+1;
		until tmp[p]=1; 
		tmp[p] := 0; 
		poner_en_torneo(j16[p], 16+i); //posicion jugador
		i := i-1;
	end;

	repetir := false;
//	writeln('validando...<br/>');
	for i:= 1 to k do
	begin
		if torneo[j16[i]].posicion = 2 then
			if not validar_1y2(torneo[j16[i]].zona) then
				repetir := true;
			
		if torneo[j16[i]].zona = torneo[rival[i]].zona then
		begin
			repetir := true;
//			writeln(i:2, ': ', torneo[j16[i]].zona, torneo[j16[i]].posicion, ' vs ', torneo[rival[i]].zona, torneo[rival[i]].posicion, '<br/>');
		end;
	end;

end;


end;

procedure poner_3364(canti : integer);
var
minimo : integer;
p, i, j, k : integer;
j32, rival, tmp : array[1..32] of integer;
begin
minimo := min(canti, 64);

j:=1;
i:=1;
while i < 128 do
	begin
	if (llave128[i] > 32) and (llave128[i] <= minimo) then
		begin
		j32[j]   := i;
		rival[j] := i+1;
		j := j + 1;
		end;
	if (llave128[i+1] > 32) and (llave128[i+1] <= minimo) then
		begin
		j32[j]   := i+1;
		rival[j] := i;
		j := j + 1;
		end;
	i := i + 2;
	end;

//for i:= 1 to j do
//	writeln(j32[i], ' vs ', rival[i]);
	
if canti > 64 then
	k := 32
else
	k := canti - 32;

	for i := 1 to 32 do
		tmp[i] := 1;

i:=k;
while i>0 do
begin
	repeat
		p := random(k)+1;
	until tmp[p]=1; 
	tmp[p] := 0; 
	poner_en_torneo(j32[p], 32+i); //posicion, jugador
	if torneo[j32[p]].posicion = 2 then
		if not validar_1y2(torneo[j32[p]].zona) then
		begin
			sacar_de_torneo(j32[p]);
			tmp[p] := 1;
			i := i + 1;
		end
	else
		if torneo[j32[p]].zona = torneo[rival[p]].zona then
		begin
			sacar_de_torneo(j32[p]);
			tmp[p] := 1;
			i := i + 1;
		end;

	i := i-1;
end;


end;

procedure poner_65128(canti : integer);
var
minimo : integer;
p : integer;
i, j, k : integer;
j64, rival, tmp : array[1..64] of integer;
begin
for i := 1 to 64 do
	tmp[i] := 1;

minimo := min(canti, 128);
j:=1;
i:=1;
while i <= 128 do
	begin
	if (llave128[i] > 64) and (llave128[i] <= minimo) then
		begin
		j64[j]   := i;
		rival[j] := i+1;
		j := j + 1;
		end;
	if (llave128[i+1] > 64) and (llave128[i+1] <= minimo) then
		begin
		j64[j]   := i+1;
		rival[j] := i;
		j := j + 1;
		end;
	i := i + 2;
	end;

//for i:= 1 to j do
//	writeln(j32[i], ' vs ', rival[i]);
	
k := minimo - 64;

for i := 1 to 64 do
	tmp[i] := 1;

i:=k;
while i>0 do
begin
	repeat
		p := random(k)+1;
	until tmp[p]=1; 
	tmp[p] := 0; 
	poner_en_torneo(j64[p], 64+i); //posicion jugador
	if torneo[j64[p]].posicion = 2 then
		if not validar_1y2(torneo[j64[p]].zona) then
		begin
			sacar_de_torneo(j64[p]);
			tmp[p] := 1;
			i := i + 1;
		end
	else
		if torneo[j64[p]].zona = torneo[rival[p]].zona then
		begin
			sacar_de_torneo(j64[p]);
			tmp[p] := 1;
			i := i + 1;
		end;

	i := i-1;
end;
	
end;

procedure inicialar_torneo(jugadores : integer);
var
i,j : integer;
begin
	if jugadores > 8 then
		tam_torneo := 16
	else
		tam_torneo := 8;

	if jugadores > 16 then
		tam_torneo := 32;

	if jugadores > 32 then
		tam_torneo := 64;

	if jugadores > 64 then
		tam_torneo := 128;
	
	j:=1;
	for i:=1 to tam_torneo do
		begin
		torneo[i].zona := 0;
		torneo[i].posicion := 0;
		
		if llave128[i] <= tam_torneo then
			begin
			llavew[j] := llave128[i];
			j := j + 1;
			end;
		 
		end;
end;

procedure armar_torneo(cantidad : integer);
begin
	poner_12();
	poner_34();
	poner_58(cantidad);
	if cantidad > 8 then
	begin
		poner_916(cantidad);
		if cantidad > 16 then
		begin
			poner_1732(cantidad);
			if cantidad > 32 then
			begin
				poner_3364(cantidad);
				if cantidad > 64 then
					poner_65128(cantidad);
			end;
		end;
	end;
		
end;

BEGIN
	randomize;
	inicialar_llave;
	inicialar_jugadores(126);
	inicialar_torneo(126);
	armar_torneo(126);
	imprimir_torneo(126);
	

{	
	if paramcount = 0 then
		imprimir_llaveN(6)
	else
		imprimir_llaveN(StrToInt(paramstr(1)));
}
END.
