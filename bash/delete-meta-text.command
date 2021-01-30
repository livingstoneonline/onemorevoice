cd /Users/awisnicki2/GitHub/onemorevoice/html/transcriptions


for thefile in *.html ; do
   grep -v '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' $thefile > $thefile.$$.tmp
   mv $thefile.$$.tmp $thefile
done