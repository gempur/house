#!/bin/bash
# ---------------------------------------------------------------------------------------------------|
#  School / Organization   : bradyhouse.io___________________________________________________________|
#  Specification           : N/A_____________________________________________________________________|
#  Specification Path      : N/A_____________________________________________________________________|
#  Author                  : brady house_____________________________________________________________|
#  Create date             : 03/19/2015______________________________________________________________|
#  Description             : UTILITY USED TO LIST THE FIDDLES DEFINED FOR A SPECIFIC TYPE____________|
#  Command line Arguments  : $1 = FIDDLE TYPE________________________________________________________|
# ---------------------------------------------------------------------------------------------------|
#  Revision History::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::|
# ---------------------------------------------------------------------------------------------------|
# 07/12/2015 - Baseline Ver ~ See CHANGELOG @ 201507110420
# ---------------------------------------------------------------------------------------------------|
thisFile=$(echo "$0" | sed 's/\.\///g')
echo "${thisFile}" | awk '{print toupper($0)}'
clear
#try
(
	if [ "$#" -gt 1 ]; then  exit 86; fi
    case $1 in
        'extjs5' | 'extjs6' | 'jquery' | 'three' | 'php'| 'dojo' | 'chrome' | 'node' | 'tween' | 'bash' | 'svg')
            ls -1 ../fiddles/$1 | grep 'fiddle'
            ;;
        *)  exit 86
            ;;
    esac
)
#catch
_rc=$?
case ${_rc} in
    0)  echo ""
        ;;
    86) echo ""
        echo "Nope ~ Incorrect number of arguments"
        echo ""
        echo "Usage:"
        echo ""
        echo "$0 \"[t]\" \"[n]\""
        echo ""
        echo "[t] - type. Valid types include: "
        echo ""
        echo -e "\t\"bash\"\t\tBash Fiddle"
        echo -e "\t\"dojo\"\t\tDojo Fiddle"
        echo -e "\t\"extjs5\"\t\tExt JS 5 Fiddle"
        echo -e "\t\"extjs6\"\t\tExt JS 6 Fiddle"
        echo -e "\t\"php\"\t\tPHP Fiddle"
        echo -e "\t\"jquery\"\tjQuery / Bootstrap Fiddle"
        echo -e "\t\"three\"\t\three.js / WebGl Fiddle"
        echo -e "\t\"chrome\"\tChrome Extension Fiddle"
        echo -e "\t\"node\"\t\tNode Fiddle"
        echo -e "\t\"tween\"\t\ttween.js Fiddle"
        echo -e "\t\"svg\"\t\tScalar Vector Graphic Fiddle"
        echo ""
        echo "[n] - fiddle Name.  For example: \"fiddleParabolaSurface\""
        echo ""
        echo ""
        ;;
    *)  echo "fubar! Something went wrong."
        ;;
esac
#finally
exit ${_rc}
