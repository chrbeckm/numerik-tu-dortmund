all: myQuadraturSum1DPlot.fig \
	myQuadraturSum1DPlot.pdf

myQuadraturSum1DPlot.fig: myQuadraturSum1DTest.m myQuadraturSum1D.m
	octave myQuadraturSum1DTest.m

myQuadraturSum1DPlot.pdf: myQuadraturSum1DPlot.fig

clean:
	rm myQuadraturSum1DPlot.fig
	rm myQuadraturSum1DPlot.pdf
