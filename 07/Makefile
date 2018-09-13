all: PA8-1.fig \
	PA8-1.pdf

PA8-1.fig: myNewton.m myNewtonTest.m
	octave myNewtonTest.m

PA8-1.pdf: PA8-1.fig

clean:
	rm PA8-1.fig
	rm PA8-1.pdf

.PHONY: all clean
