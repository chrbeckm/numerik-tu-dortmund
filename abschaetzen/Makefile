all: plot.pdf \
	loglog.pdf \
	beide.pdf

plot.pdf: abschaetzen.m
	octave abschaetzen.m
loglog.pdf: plot.pdf
beide.pdf: plot.pdf

clean:
	rm plot.pdf
	rm loglog.pdf
	rm beide.pdf
