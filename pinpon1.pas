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

llave128[1] := 1;
llave128[2] := 128;
llave128[3] := 65;
llave128[4] := 64;
llave128[5] := 33;
llave128[6] := 96;
llave128[7] := 97;
llave128[8] := 32;
llave128[9] := 17;
llave128[10] := 112;
llave128[11] := 81;
llave128[12] := 48;
llave128[13] := 49;
llave128[14] := 80;
llave128[15] := 113;
llave128[16] := 16;
llave128[17] := 9;
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
llave128[32] := 8;
llave128[33] := 6;
llave128[34] := 123;
llave128[35] := 70;
llave128[36] := 59;
llave128[37] := 38;
llave128[38] := 91;
llave128[39] := 102;
llave128[40] := 27;
llave128[41] := 22;
llave128[42] := 107;
llave128[43] := 86;
llave128[44] := 43;
llave128[45] := 54;
llave128[46] := 75;
llave128[47] := 118;
llave128[48] := 11;
llave128[49] := 14;
llave128[50] := 115;
llave128[51] := 78;
llave128[52] := 51;
llave128[53] := 46;
llave128[54] := 83;
llave128[55] := 110;
llave128[56] := 19;
llave128[57] := 30;
llave128[58] := 99;
llave128[59] := 94;
llave128[60] := 35;
llave128[61] := 62;
llave128[62] := 67;
llave128[63] := 126;
llave128[64] := 3;
llave128[65] := 4;
llave128[66] := 125;
llave128[67] := 68;
llave128[68] := 61;
llave128[69] := 36;
llave128[70] := 93;
llave128[71] := 100;
llave128[72] := 29;
llave128[73] := 20;
llave128[74] := 109;
llave128[75] := 84;
llave128[76] := 45;
llave128[77] := 52;
llave128[78] := 77;
llave128[79] := 116;
llave128[80] := 13;
llave128[81] := 12;
llave128[82] := 117;
llave128[83] := 76;
llave128[84] := 53;
llave128[85] := 44;
llave128[86] := 85;
llave128[87] := 108;
llave128[88] := 21;
llave128[89] := 28;
llave128[90] := 101;
llave128[91] := 92;
llave128[92] := 37;
llave128[93] := 60;
llave128[94] := 69;
llave128[95] := 124;
llave128[96] := 5;
llave128[97] := 7;
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
llave128[128] := 2;


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

BEGIN
	inicialar_llave();
	imprimir_llaveN(30);
END.

