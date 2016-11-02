.PHONY: all clean distclean

PROJECT = containers_buildstuff2016
MEDIA_DEPS_GEN = media/svg_uberlogo.pdf

all: $(PROJECT).pdf

$(PROJECT).pdf: $(PROJECT).tex $(MEDIA_DEPS_GEN)
	rubber --force --pdf $(PROJECT)

clean:
	rm -f $(addprefix $(PROJECT).,aux log nav out snm toc bbl blg run.xml bcf vrb) \
		$(MEDIA_DEPS_GEN)

distclean: clean
	rm -f $(PROJECT).pdf

media/svg_%.pdf: media/%.svg
	inkscape $(PWD)/$< --export-pdf=$(PWD)/$@
