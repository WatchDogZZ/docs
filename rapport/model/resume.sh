#! /bin/bash

resume_file=$1

function resume_key() {
	LANG=$1
	case $LANG in
		"FR" ) SECTION="Résumé";   KEYS="Mots clés ";;
		"EN" ) SECTION="Abstract"; KEYS="Keywords"  ;;
		*    ) SECTION="Resume";   KEYS="Keys"      ;;
	esac

	echo "\\subsection*{${SECTION}}";
		cat $resume_file | sed -n "/^%${LANG}$/,/^%%$/{//d;p}"
		echo "\\vspace{0.75em}"
	echo -n "\\textbf{${KEYS}:} "
	# prendre entre ^%%$ et une ligne commençant par % ou la fin du fichier à partir de l'endroit où il y a le marqueur de langue
		line_lang=`awk "/^%${LANG}$/ {print NR; exit 0; }" $resume_file`
		tail -n+$line_lang $resume_file | sed -n "/^%%$/,/[%\n]/{//d;p}" | head -n 1
}

	resume_key "FR"

echo -e "\n\\\vfill\n"

	echo "\\begin{otherlanguage}{english}"
	resume_key "EN"
	echo "\\end{otherlanguage}"

echo "\\vfill"
