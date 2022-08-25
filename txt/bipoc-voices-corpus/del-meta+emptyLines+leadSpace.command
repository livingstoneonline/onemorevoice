# removes meta text, empty lines, and leading white spaces in each line
# https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/
# https://stackoverflow.com/questions/1593106/use-sed-to-delete-all-leading-following-blank-spaces-in-a-text-file


cd /Users/awisnicki2/GitHub/onemorevoice/txt/bipoc-voices-corpus/liv_025000-series-TXT

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