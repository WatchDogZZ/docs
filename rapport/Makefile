SRC = main

DEBUG_MODE ?= N
LATEX = pdflatex --shell-escape
EDITOR = subl

ifeq ($(DEBUG_MODE), Y)
#LATEX += -interaction=nonstopmode
else
LATEX += -interaction=batchmode
endif

BIBTEX = biber -u -U -q

ECHO = /bin/echo -e

.PHONY:all $(REP)

all: complet

$(REP):
	@$(MAKE) -C $@ $(MAKECMDGOALS)

clean: $(REP)
	@$(ECHO) "suppression des fichiers de compilation"
	@# fichiers de compilation latex
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.loa *.lol *.out *.idx
	@# fichiers de bibtex
	@rm -f *.bbl *.blg

T_START=$(shell date -d now +%s)

complet:
	@$(ECHO) "\033[31mCompilation complète\033[0m"
	@$(ECHO) "\033[1m $$(date +%H:%M:%S) \033[0m"
	@$(ECHO) "\033[32m\t Compilation n°1\033[0m"
	@${LATEX} ${SRC}
	@$(ECHO) "\033[1m $$(date +%H:%M:%S) \033[0m"
	@$(ECHO) "\033[36m\t Bibliographie\033[0m"; ${BIBTEX} ${SRC}
	@$(ECHO) "\033[32m\t Compilation n°2\033[0m"
	@${LATEX} ${SRC}
	@$(ECHO) "\033[1m $$(date +%H:%M:%S) \033[0m"
	@$(ECHO) "\033[32m\t Compilation n°3\033[0m"
	@${LATEX} ${SRC}
	@$(ECHO) "\033[1m $$(date +%H:%M:%S) \033[0m"
	@$(ECHO) "\033[33mTemps de compilation : $$(( $$(date -d now +%s) - $(T_START) )) s\033[0m"

initial: propre
	@$(ECHO) „suppression des fichiers cibles“
	@rm -f ${SRC}.ps ${SRC}.pdf

bib:
	${BIBTEX} ${SRC}

one :
	@$(ECHO) "\033[31mCompilation juste une fois\033[0m"
	@$(ECHO) "\033[1m $$(date +%H:%M:%S) \033[0m"
	@${LATEX} ${SRC}
	@$(ECHO) "\033[1m $$(date +%H:%M:%S) \033[0m"
	@$(ECHO) "\033[33mTemps de compilation : $$(( $$(date -d now +%s) - $(T_START) )) s\033[0m"
	
open:
	@$(EDITOR) $(SRC).tex part/*.tex &

