#!/bin/sh

DIR=$1

if [ -z "${DIR}" -o ! -d "${DIR}" ]; then
	echo "Usage: $0 DIR"
	exit 1
fi

for dir in $(find ${DIR} -type d); do
	(
		echo "<html>"
		echo "<head>"
		echo "<title>${dir}</title>"
		echo "</head>"
		echo "<body>"
		echo "<h1>${dir}</h1>"
		echo "<ul>"
		echo "<li><a href=\"..\">../</a></li>"
		for file in $(ls "${dir}"); do
			if [ "${file}" = "index.html" ]; then
				continue
			fi
			if [ -d "${dir}/${file}" ]; then
				file="${file}/"
			fi
			echo "<li><a href=\"${file}\">${file}</a></li>"
		done
		echo "</ul>"
		echo "</body>"
		echo "</html>"
	) > "${dir}/index.html"
done
