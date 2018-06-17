all: 51.txt \
	51-1.txt

51.txt: LR_Test.m thomas_decompose.m forward_solve.m backward_solve.m
	octave LR_Test.m

51-1.txt: aufgabed.m
	octave aufgabed.m

clean:
	rm 51.txt
	rm 51-1.txt
