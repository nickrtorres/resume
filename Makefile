.POSIX:
.SUFFIXES:

.SUFFIXES: .pdf .tex
.tex.pdf:
	pdflatex -halt-on-error $<

RESUME = Nick-Torres-Resume

$(RESUME): $(RESUME).pdf

$(RESUME).pdf: $(RESUME).tex

clean:
	rm -f $(RESUME).pdf $(RESUME).aux $(RESUME).log
