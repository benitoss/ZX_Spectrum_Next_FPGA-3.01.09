#!/bin/bash
if test "${1}" = ""
then
	echo "Usage: maketbu hmmll"
else
	cp ../synth-zxnext-issue2/work/zxnext_top_issue2.bit .
	wine ../utils/Bit2Bin.exe zxnext_top_issue2.bit zxnext.bin
	./tbumaker 10 ${1}
fi
