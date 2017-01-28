#! /bin/bash

function table() {
	echo "\\rowcolors{1}{tablegray}{}
			\\begin{tabular}{ c c c c c }"
	while IFS=';' read id col1 col2 col3; do
			echo "\small\textsf{" $id "} & \small\textsf{" $col1 "} & \small\textsf{" $col2 "} & \small\textsf{" $col3 "} \\\\"
	done < $1
	echo "\\end{tabular}"
}

function csv() {
	echo "\\begin{tabular}{l}"
	while IFS=';' read line; do
			echo "\texttt{" $line "} \\\\"
	done < $1
	echo "\end{tabular}"
}

case "$1" in
	"table" ) table $2;;
	"csv" ) csv $2;;
esac

