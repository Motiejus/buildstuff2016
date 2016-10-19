all: slides.html

slides.html: slides.txt
	asciidoc --backend slidy -o $@ $^

.PHONY: all
