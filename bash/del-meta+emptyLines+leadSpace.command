# removes meta text, empty lines, and leading white spaces in each line
# https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/
# https://www.cyberciti.biz/tips/delete-leading-spaces-from-front-of-each-word.html


cd /Users/awisnicki2/GitHub/onemorevoice/html/transcriptions

for thefile in *.html ; do
	grep -v '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' $thefile > $thefile.$$.tmp
	mv $thefile.$$.tmp $thefile
done

for thefile in *.html ; do
	sed '/^[[:space:]]*$/d' $thefile > $thefile.$$.tmp
	mv $thefile.$$.tmp $thefile
done

for thefile in *.html ; do
	awk '{$1=$1}1' $thefile > $thefile.$$.tmp
	mv $thefile.$$.tmp $thefile
done