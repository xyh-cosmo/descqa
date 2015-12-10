#!/bin/bash

## input the path to the plots' folder eg:
## > convert2png ~shansen/myplots/

for i in $( ls $1/*.eps )
do
    fbase=$(basename $i .eps)
    if [ -f $1/$fbase.png ] 
    then
        rm $1/$fbase.png
    fi
    gs -sDEVICE=ppmraw -r300 -sOutputFile=- -sNOPAUSE -q $1/$fbase.eps -c showpage -c quit | pnmtopng > $1/$fbase.png
    
done

for i in $( ls $1/*.ps )
do
    fbase=$(basename $i .ps)
    if [ -f $1/$fbase.png ] 
    then
	rm $1/$fbase.png
    fi
    gs -sDEVICE=ppmraw -r300 -sOutputFile=- -sNOPAUSE -q $1/$fbase.ps -c showpage -c quit | pnmtopng > $1/$fbase.png
done

