all: PA2-1-N7.pdf \
	PA2-1-N7.fig \
	PA2-1-N12.pdf \
	PA2-1-N12.fig \
	PA2-1-N17.pdf \
	PA2-1-N17.fig

PA2-1-N7.pdf: myNewtonInterpolTest.m myNewtonInterpol.m
	octave myNewtonInterpolTest.m

PA2-1-N7.fig: PA2-1-N7.pdf

PA2-1-N12.pdf: PA2-1-N7.pdf

PA2-1-N12.fig: PA2-1-N7.pdf

PA2-1-N17.pdf: PA2-1-N7.pdf

PA2-1-N17.fig: PA2-1-N7.pdf

clean:
	rm PA2-1-N7.pdf
	rm PA2-1-N7.fig
	rm PA2-1-N12.pdf
	rm PA2-1-N12.fig
	rm PA2-1-N17.pdf
	rm PA2-1-N17.fig
