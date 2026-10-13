SVGCONV= $(shell command -v rsvg-convert || echo "docker run --rm -i -v .:/work useless:latest rsvg-convert")
CONVERT=  $(shell command -v convert || echo "docker run --rm -i -v .:/work useless:latest convert")

all:	ml.png A.png hermann-pbm.png hermann-svg.png \
	fib-spiral.png fib-fractal.png fib-fractal-l.png \
	mandelbrot-zsh.png mandelbrot.png mandelbrot2.png \
	koch.png koch-snowflake.png dragon.png gosper.png \
	fractalplant.png fractalplant2.png pig-lifegame.gif sierpinski.png

ml.png:			ml.SVG
	$(SVGCONV) -o $@ $<
A.pbm:
	$(CONVERT) -size 32x32 xc: -gravity center -pointsize 40 -draw 'text 0,0 "A"' -compress none $@
hermann-pbm.pbm:	hermann-pbm.sh
	bash $< > $@
mandelbrot-zsh.pgm:	mandelbrot.zsh
	zsh $< > $@ ||:
mandelbrot.pgm:		mandelbrot.sh
	bash $< > $@
mandelbrot2.pgm:	mandelbrot.sh
	bash $< -0.688 -0.305 60 255 > $@
dragon.svg:		dragon.sh lsystem.function
gosper.svg:		gosper.sh lsystem.function
fractalplant.svg:	fractalplant.sh lsystem.function
fractalplant2.svg:	fractalplant2.sh lsystem.function
pig-lifegame.gif:	pig.jpg
	cat $< | $(CONVERT) -delay 50 -loop 0 - \( +clone -monochrome \) $$(yes '( +clone -fx nn=p[-1,-1]+p[-1,0]+p[-1,1]+p[0,-1]+p[0,1]+p[1,-1]+p[1,0]+p[1,1];nn*(1-p)!=6&&nn!=5 )'| head -100) $@
sierpinski.png:		sierpinski.sh
	cp $< tmp.$< && bash tmp.$< && rm tmp.$<

.PHONY: all clean
clean:
	rm *.svg *.pbm *.pgm *.png pig-lifegame.gif

.PRECIOUS: %.svg %.pbm %.pgm
.SUFFIXES: .png .svg .pbm .pgm
.sh.svg:
	bash $< > $@
.svg.png:
	$(SVGCONV) -o $@ $<
.pbm.png:
	$(CONVERT) $< $@
.pgm.png:
	$(CONVERT) $< $@
