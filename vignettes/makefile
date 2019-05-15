.SUFFIXES: .tex .pdf .Rnw

MAIN = mene
RNWINCLUDES = EDA Modelling SAE SAE_forecasts
TEX = $(RNWINCLUDES:=.tex)
RNWFILES = $(RNWINCLUDES:=.Rnw)

all: $(MAIN).pdf

$(MAIN).pdf: $(TEX) $(MAIN).tex

# $(TEX): $(RNWFILES)

.tex.pdf:
	pdflatex $<
	bibtex $*
	pdflatex $<
	pdflatex $<


.Rnw.tex:
	R CMD Sweave $<

clean:
	rm -fv *.aux *.dvi *.log *.toc *.bak *~ *.blg *.bbl *.lot *.lof *.qsl *.sol *.cut
	rm -fv *.vrb *.out *.nav *.snm \#*\# Rplots.pdf

