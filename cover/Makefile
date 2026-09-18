# geometry: 2164 = 41+2039+84
WIDTH=2039
HEIGHT=2894
OFFSET=41
OFFSET2=2160
WIDTHP=2097
HEIGHTP=2976
OFFSETP=2135

SVGCONV= $(shell command -v rsvg-convert || echo "docker run --rm -i -v .:/work useless:latest rsvg-convert")
CONVERT=  $(shell command -v convert || echo "docker run --rm -i -v .:/work useless:latest convert")

all: cover.png cover1.png cover4.png print1.png trial1.png
adjust: adjust.png

cover.svg: cover.sh
	bash $< > tmp.$@
	mv tmp.$@ $@
cover1.png: cover.png
	$(CONVERT) $< -crop $(WIDTH)x$(HEIGHT)+$(OFFSET2)+$(OFFSET) $@
cover4.png: cover.png
	$(CONVERT) $< -crop $(WIDTH)x$(HEIGHT)+$(OFFSET)+$(OFFSET) $@
print1.png: print.png
	$(CONVERT) $< -colorspace gray -modulate 150% -crop $(WIDTHP)x$(HEIGHTP)+$(OFFSETP)+0 $@
trial1.png: trial.png
	$(CONVERT) $< -crop $(WIDTH)x$(HEIGHT)+$(OFFSET2)+$(OFFSET) $@

trial.svg: trial.sh cover.sh
	bash trial.sh > tmp.$@
	mv tmp.$@ $@
print.svg: print.sh cover.svg
	bash print.sh > tmp.$@
	mv tmp.$@ $@

adjust.svg: adjust.sh cover.sh
	bash adjust.sh > tmp.$@
	mv tmp.$@ $@

.PHONY: all clean adjust
clean:
	rm *.svg *.png

.SUFFIXES: .svg .png
.svg.png:
	$(SVGCONV) -o $@ $<
