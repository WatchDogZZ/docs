#! /bin/bash

echo "\begin{description}"
for i in `ls glossaire/`; do
	echo "\item[`head -n 1 glossaire/$i` :] `sed '1d' glossaire/$i`"
	echo "\vspace{1mm}"
done
echo "\end{description}"
