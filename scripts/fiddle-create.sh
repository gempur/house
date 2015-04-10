#!/bin/bash
# ---------------------------------------------------------------------------------------------------|
#  School / Organization   : bradyhouse.io___________________________________________________________|
#  Specification           : N/A_____________________________________________________________________|
#  Specification Path      : N/A_____________________________________________________________________|
#  Author                  : brady house_____________________________________________________________|
#  Create date             : 03/19/2015______________________________________________________________|
#  Description             : UTILITY USED TO ADD A NEW FIDDLE TO THE ../FIDDLES DIRECTORY____________|
#  Command line Arguments  : $1 = FIDDLE TYPE, $2 = FIDDLE NAME______________________________________|
# ---------------------------------------------------------------------------------------------------|
#  Revision History::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::|
# ---------------------------------------------------------------------------------------------------|
# Baseline Ver.
# ---------------------------------------------------------------------------------------------------|
clear
thisFile=$(echo "$0" | sed 's/\.\///g')
echo "${thisFile}" | awk '{print toupper($0)}'
#try
(
	if [ "$#" -ne 2 ]; then  exit 86; fi
    case $1 in
        'extjs')
            ./fiddle-extjs.sh $2 || exit 87
            ./fiddle-index.sh "extjs" || exit 87
            ;;
        'jquery')
            ./fiddle-jquery.sh $2 || exit 88
            ./fiddle-index.sh "jquery" || exit 88
            ;;
        'three')
            ./fiddle-three.sh $2 || exit 89
            ./fiddle-index.sh "three" || exit 89
            ;;
        'php')
            ./fiddle-php.sh $2 || exit 90
            ./fiddle-index.sh "php" || exit 90
            ;;
        'dojo')
            ./fiddle-dojo.sh $2 || exit 91
            ./fiddle-index.sh "dojo" || exit 91
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
        echo -e "\t\"dojo\"\t\tDojo Fiddle"
        echo -e "\t\"extjs\"\t\tExt JS Fiddle"
        echo -e "\t\"php\"\t\tPHP Fiddle"
        echo -e "\t\"jquery\"\tjQuery / Bootstrap Fiddle"
        echo -e "\t\"three\"\t\tThree.js / WebGl Fiddle"
        echo ""
        echo "[n] - fiddle Name.  For example: \"fiddleParabolaSurface\""
        echo ""
        echo ""
        ;;
    87) echo "fubar! extjs fiddle creation failed."
        ;;
    88) echo "fubar! jquery fiddle creation failed."
        ;;
    89) echo "fubar! three fiddle creation failed."
        ;;
    90) echo "fubar! php fiddle creation failed."
        ;;
    91) echo "fubar! dojo fiddle creation failed."
        ;;
    *)  echo "fubar! Something went wrong."
        ;;
esac
#finally
exit ${_rc}
