compile: $(wildcard logos/*.svg)
	@mkdir -p out
	@for image in $(shell ls logos | cut -d. -f1) ; do \
	  printf "Generating images for $$image..." ; \
	  mkdir -p out/$$image ; \
	  inkscape logos/$$image.svg --export-png=out/$$image/2400x2400@300dpi.png --export-dpi='300,300' --export-width=2400 --export-height=2400 --export-background-opacity=0 > /dev/null ; \
	  printf "." ; \
	  inkscape logos/$$image.svg --export-png=out/$$image/1000x1000.png --export-dpi='96,96' --export-width=1000 --export-height=1000 --export-background-opacity=0 > /dev/null ; \
	  printf "." ; \
	  convert out/$$image/2400x2400@300dpi.png -resize 128x128 out/$$image/128x128.png > /dev/null ; \
	  printf "." ; \
	  convert out/$$image/2400x2400@300dpi.png -resize 48x48 out/$$image/48x48.png > /dev/null ; \
	  printf "." ; \
	  convert out/$$image/2400x2400@300dpi.png -resize 16x16 out/$$image/16x16.png > /dev/null ; \
	  printf "." ; \
	  convert out/$$image/2400x2400@300dpi.png -background none -gravity center -resize 620x620 -extent 1280x640 out/$$image/ghpanel.png > /dev/null ; \
	  printf "." ; \
	  convert out/$$image/ghpanel.png github.png -background white -layers flatten out/$$image/ghpanel.png > /dev/null ; \
	  printf "." ; \
	  printf "done\n" ; \
	done

.PHONY: compile
