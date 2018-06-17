all: PA7-1.pdf \
	PA7-1.fig \
	../07/plotdaten.mat

PA7-1.pdf: myBisecTest.m mybisect.m
	octave myBisecTest.m

PA7-1.fig: PA7-1.pdf
../07/plotdaten.mat: PA7-1.pdf

clean:
	rm PA7-1.pdf
	rm PA7-1.fig
	rm ../07/plotdaten.mat
