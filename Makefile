compile: $(wildcard logos/*.svg)
	mkdir -p out
	for image in $(shell ls logos | cut -d. -f1) ; do \
	  mkdir -p out/$$image ; \
	  inkscape logos/$$image.svg --export-png=out/$$image/2400x2400@300dpi.png --export-dpi='300,300' --export-width=2400 --export-height=2400 --export-background-opacity=0 ; \
	  inkscape logos/$$image.svg --export-png=out/$$image/1000x1000.png --export-dpi='96,96' --export-width=1000 --export-height=1000 --export-background-opacity=0 ; \
	  convert out/$$image/2400x2400@300dpi.png -resize 128x128 out/$$image/128x128.png ; \
	  convert out/$$image/2400x2400@300dpi.png -resize 48x48 out/$$image/48x48.png ; \
	  convert out/$$image/2400x2400@300dpi.png -resize 16x16 out/$$image/16x16.png ; \
	done

.PHONY: compile
