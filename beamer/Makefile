CC=pdflatex
OPT=-halt-on-error
EDITOR=gedit

OUT=slide

$(OUT).pdf : $(OUT).tex
	$(CC) $(OPT) slide.tex
	$(CC) $(OPT) slide.tex

pdf : slide.tex
	$(CC) $(OPT) $(OUT).tex

edit : $(OUT).tex
	$(EDITOR) $(OUT).tex &

view : $(OUT).pdf
	evince $(OUT).pdf &

clean : *.aux
	rm -f *.aux;rm -f *.log;rm -f *.nav;rm -f *.out;rm -f *.snm;rm -f *.toc;rm -f *.*~ *.pdf

all : 
	$(CC) $(OPT) slide.tex
	$(CC) $(OPT) slide.tex	
	$(CC) $(OPT) slide.tex	
	
