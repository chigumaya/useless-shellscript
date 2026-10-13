# ページ幅、高
WIDTH=2039
HEIGHT=2894
# 塗り足し幅
OFFSET=42
# 塗り足し+ページ幅+背幅(107)
OFFSET2=2188

SVGCONV= $(shell command -v rsvg-convert || echo "docker run --rm -i -v .:/work useless:latest rsvg-convert")
CONVERT=  $(shell command -v convert || echo "docker run --rm -i -v .:/work useless:latest convert")

all: cover.png cover1.png cover4.png trial1.png
adjust: adjust.png

cover.svg: cover.sh
	bash $< > tmp.$@
	mv tmp.$@ $@
cover1.png: cover.png
	$(CONVERT) $< -crop $(WIDTH)x$(HEIGHT)+$(OFFSET2)+$(OFFSET) $@
cover4.png: cover.png
	$(CONVERT) $< -crop $(WIDTH)x$(HEIGHT)+$(OFFSET)+$(OFFSET) $@
trial1.png: trial.png
	$(CONVERT) $< -crop $(WIDTH)x$(HEIGHT)+$(OFFSET2)+$(OFFSET) $@

trial.svg: trial.sh cover.sh
	bash trial.sh > tmp.$@
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
