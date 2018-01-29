#!/bin/sh

for pofile in *; do
	char=$(awk -F'=' '/charset/ {sub(/\\.*/,"",$2); print $2}' ${pofile})
	if [ "${char}" != "UTF-8" ]; then
		sed -i "s/${char}/UTF-8/" ${pofile}
		iconv -f ${char} -t UTF-8 ${pofile} > ${pofile}.utf
		mv -f ${pofile}.utf ${pofile}
	fi
done
