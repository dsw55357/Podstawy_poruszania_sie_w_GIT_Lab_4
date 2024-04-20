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
	# wywołanie: skrypt.sh --logs 30
    elif [ $# -lt 3 ]; then
	for i in $(seq 1 $2); do
	    nazwa_pliku="log$i.txt"
	    touch $nazwa_pliku
	    echo $nazwa_pliku > $nazwa_pliku
	    echo $0 >> $nazwa_pliku
	    echo $(date) >> $nazwa_pliku
	done
    fi
}

function help
{
  echo "Skrypt: $0"
  echo "Opcje:"
  echo "  --date    Wyświetla dzisiejszą datę."
  echo "  --logs    Skrypt utworzy automatycznie 100 plików logx.txt (x – numer pliku od 1 – 100)"
  echo "               ale 'skrypt.sh -l 30' utworzenie automatycznie 30 plików"
  echo "               w każdym pliku wpisze jego nazwę, nazwę skryptu, który go utworzył i datę."
  echo "  --help    Wyświetla wszystkie dostępne opcje"
  # Dodaj tutaj opcje i ich opisy
  echo "Przykład użycia:"
  echo "  ./skrypt.sh --opcja1 argument1"
}


function menu
{
    #echo $1
    case $1 in
	--date) date ;;
	--logs) logs $@ ;;
	--help | -h) help $@ ;;
	*) help
    esac
}


function main
{
    menu $@
}

main $@
