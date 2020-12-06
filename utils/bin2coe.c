/*
 *
 */

#include <stdio.h>
#include <stdlib.h>


int main (int argc,char *argv[]) {
	FILE *binfile, *coefile;
	unsigned char byte;
	unsigned long filesize, i;
	
	fprintf(stderr, "bin2coe (c) 2016 SpecNext - Convert .bin file to .coe file.\n");

	if (argc != 3) {
		fprintf(stderr, "Usage: bin2coe <file.bin> <file.coe>\n");
		return -1;
	}

	// file opening
	if (!(binfile = fopen(argv[1], "rb"))) {
		fprintf(stderr, "Error opening %s file.\n", argv[1]);
		return -2;
	}
	if (!(coefile = fopen(argv[2], "wt"))) {
		fprintf(stderr, "Error creating %s file.\n", argv[2]);
		return -3;
	}
	fseek(binfile, 0, SEEK_END);
	filesize = ftell(binfile);
	fseek(binfile, 0, SEEK_SET);

	fprintf(coefile, "memory_initialization_radix=16;\n");
	fprintf(coefile, "memory_initialization_vector=\n");

	for (i = 0; i < filesize; i++) {
		fread(&byte, sizeof(unsigned char), 1, binfile);
		fprintf(coefile, "%.2X", byte);
		if (i == (filesize - 1)) {
			fprintf(coefile, ";\n");
		} else if ((i % 16) == 15) {
			fprintf(coefile, "\n");
		} else {
			fprintf(coefile, ", ");
		}
	}

	fclose(binfile);
	fclose(coefile);
	return 0;
}
