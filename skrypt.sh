#!/bin/bash


function logs
{
    echo $@
    # wywołanie: skrypt.sh --logs
    if [ $# -lt 2 ]; then
	for i in $(seq 1 100); do
	    nazwa_pliku="log$i.txt"
	    touch $nazwa_pliku
	    echo $nazwa_pliku > $nazwa_pliku
	    echo $0 >> $nazwa_pliku
	    echo $(date) >> $nazwa_pliku
	done
    fi
}


function menu
{
    #echo $1
    case $1 in
	--date) date ;;
	--logs | -l) logs $@ ;;
	*) help
    esac
}


function main
{
    menu $@
}

main $@
