/*
TBBlue / ZX Spectrum Next project

Copyright (c) 2015 Fabio Belavenuto & Victor Trucco

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* Defines */
typedef struct {
	int		num;
	int		maker;		// 0 = Altera, 1 = Xilinx
	int		blocks;		// filesize = blocks * 1024
	char	*filename;
	char	*hwidtxt;
} t_hardwares;

const t_hardwares hwids[] = {
	{1, 0, 512,  "de1.rpd",			"DE-1"},
	{2, 0, 2048, "de2.rpd",			"DE-2"},
//	{3, 0, 512,  "x.rpd",			"(empty)"},
//	{4, 0, 512,  "x.rpd",			"(empty)"},
	{5, 0, 512,  "fblabs.rpd",		"FBLabs"},
	{6, 0, 512,  "vtrucco.rpd",		"Vtrucco"},
	{7, 0, 512,  "wxeda.rpd",		"WXEDA"},
//	{8, 0, 0,    "emulator.rpd",	"Emulators"},
	{9, 1, 0,    "zxuno.bin",		"ZX-Uno"},
	{10,1, 0,    "zxnext.bin",		"ZX Spectrum Next"},
	{11,0, 2048, "multicore.rpd",	"Multicore"},
};

/* Variables */
int				hwid, version, vt, vhigh, vmid, vlow;
unsigned char	cs;
char			*filename, hwidtxt[21];


// Funções

// =============================================================================
int main(int argc, char *argv[]) {
	FILE			*fileIn = NULL, *fileOut = NULL;
	unsigned char	c, cr, cab[512], *buffer = NULL;
	int				maker, blocks, size, nsize, i, j;

	if (argc < 3) {
		fprintf(stderr, "Use: TBUmaker <hwid> <version>\n");
		fprintf(stderr, "Ex: TBUmaker 10 20103\n");
		fprintf(stderr, "\t[Next (iss2) version 2.01.03]\n");
		return 1;
	}
	hwid = atoi(argv[1]);
	version = atoi(argv[2]);

	j = 0;
	for (i = 0; i < (sizeof(hwids) / sizeof(t_hardwares)); i++) {
		if (hwids[i].num == hwid) {
			j = 1;
			maker    = hwids[i].maker;
			blocks   = hwids[i].blocks;
			filename = hwids[i].filename;
			strcpy(hwidtxt, hwids[i].hwidtxt);
			break;
		} 
	}
	if (j == 0) {
		fprintf(stderr, "Hardware ID invalid!\n");
		return 2;
	}

	vhigh = version / 10000;
	vmid = (version / 100) % 100;
	vlow = (version % 100);
	vt = (vhigh << 4) | vmid;
	printf("HW ID %d (%s), version %d.%02d.%02d, file %s\n", hwid, hwidtxt, vhigh, vmid, vlow, filename);

	if (!(fileIn = fopen(filename, "rb"))) {
		fprintf(stderr, "Error opening '%s'!\n", filename);
		return 3;
	}
	fseek(fileIn, 0, SEEK_END);
	size = ftell(fileIn);
	fseek(fileIn, 0, SEEK_SET);
	if (maker == 0 && size != (blocks * 1024)) {
		fprintf(stderr, "File size must be %u!\n", blocks * 1024);
		fclose(fileIn);
		return 4;
	}
	buffer = (unsigned char *)malloc(size+1);
	if (!buffer) {
		fprintf(stderr, "Memory allocation error!\n");
		fclose(fileIn);
		return 5;
	}
	if (size != fread(buffer, 1, size, fileIn)) {
		fclose(fileIn);
		free(buffer);
		fprintf(stderr, "Error reading '%s'!\n", filename);
		return 6;
	}
	fclose(fileIn);
	if (maker == 0) {
		// For Altera
		for (i = (blocks * 1024)-1; i >= 0; i--) {
			if (buffer[i] != 0xFF) {
				break;
			}
		}
		nsize = ((int)(i + 511) / 512) * 512;
		printf("Cut to size: %d\n", nsize);
		// reverter bits
		cs = 0;
		for (i = 0; i < nsize; i++) {
			c = buffer[i];
			cr = 0;
			for (j = 0; j < 8; j++) {
				if (c & (1 << j)) {
					cr |= (1 << (7-j));
				}
			}
			buffer[i] = cr;
			cs ^= cr;
		}
	} else {
		// For Xilinx
		nsize = size;
		// Checksum calc
		cs = 0;
		for (i = 0; i < nsize; i++) {
			c = buffer[i];
			cs ^= c;
		}
	}

	if (!(fileOut = fopen("TBBLUE.TBU", "wb"))) {
		fprintf(stderr, "Error creating TBBLUE.TBU!\n");
		return 7;
	}

	memset(cab, 0, 512);
	hwidtxt[20] = 0;
	sprintf((char *)cab, "TBUFILE    %c%c%c%s", hwid, vt, cs, hwidtxt);
	memmove(cab+7, &nsize, 4);
	cab[500] = vlow;
	fwrite(cab, 1, 512, fileOut);
	if (nsize != fwrite(buffer, 1, nsize, fileOut)) {
		fclose(fileOut);
		fprintf(stderr, "Error writing TBBLUE.TBU!\n");
		return 8;
	}
	free(buffer);
	fclose(fileOut);

	printf("TBBLUE.TBU created.\n");

	return 0;
}
