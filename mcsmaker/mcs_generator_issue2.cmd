@set PATH=C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64;%PATH%

@rem promgen -w -p mcs -c FF -o zxnext -s 16384 -u 00000 next_ab_issue2_top.bit -u 80000 zxnext_top_issue2.bit -spi 
promgen -w -p mcs -c FF -o zxnext -s 16384 -data_file up 0000 ab.bin -u 00002 next_ab_issue2_top.bit -u 80000 zxnext_top_issue2.bit -spi

pause
