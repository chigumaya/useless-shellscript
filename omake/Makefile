SVGCONV= $(shell command -v rsvg-convert || echo "docker run --rm -i -v .:/work useless:latest rsvg-convert")
CONVERT=  $(shell command -v convert || echo "docker run --rm -i -v .:/work useless:latest convert")

all:	sierpinski.png sierpinski-lsystem.png sierpinski-arrowhead.png \
	sierpinski-ifs.gif penrosetile.png hilbert.png \
	mandelbrot.png hexaflake.png barnsleyfern.png

sierpinski.png: sierpinski-nosym.sh
	cp $< tmp.$< && bash tmp.$< && rm tmp.$<
sierpinski-ifs.gif: sierpinski-ifs.sh
	bash $<
mandelbrot.pgm: mandelbrot.dc
	dc $< > $@
hexaflake.svg: hexaflake.m4
	m4 $< > $@
barnsleyfern.ppm: barnsleyfern.awk
	awk -f $< > $@

.PHONY: all clean
clean:
	rm *.svg *.pgm *.ppm *.png *.gif

.PRECIOUS: %.svg
.SUFFIXES: .png .svg .pgm .ppm
.sh.svg:
	bash $< > $@
.svg.png:
	$(SVGCONV) -o $@ $<
.pgm.png:
	$(CONVERT) $< $@
.ppm.png:
	$(CONVERT) $< $@
