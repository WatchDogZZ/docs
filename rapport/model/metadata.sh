#! /bin/bash

resume_file=$1

# récupération des mots clés à partir du fichier contenant le résumé
keywords=$(sed -n "/^%%$/,/[%\n]/{//d;p}" $resume_file | head -n 1)

echo "
\\makeatletter
\\hypersetup
{
	bookmarks   = true,
	pdfauthor   = {\@author},
	pdfsubject  = {\subject},
	pdftitle    = {\@title},
	pdfkeywords = {$keywords},
	pdfcreator  = {SkeLaTeX}
}
\\makeatother"
