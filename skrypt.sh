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

function clone
{
    # klonuje całe repozytorium do katalogu w którym został uruchomiony
    git clone https://github.com/dsw55357/Podstawy_poruszania_sie_w_GIT_Lab_4.git
    
}

function init
{
    clone
    echo $PWD
    export PATH="$PATH:$PWD"
    echo $PATH

}

function error
{
    echo $@
    # wywołanie: skrypt.sh -e
    if [ $# -lt 2 ]; then
	for i in $(seq 1 100); do
	    if [ -d "error$i" ]; then
		# folder "error$i" istnieje
		echo "."
	    else
		mkdir "error$i"
	    fi		         
	    nazwa_pliku="error$i.txt"
	    touch "error$i"/$nazwa_pliku
	    echo $nazwa_pliku > "error$i"/$nazwa_pliku
	    echo $0 >> "error$i"/$nazwa_pliku
	    echo $(date) >> "error$i"/$nazwa_pliku
	done
	# wywołanie: skrypt.sh --logs 30
    elif [ $# -lt 3 ]; then
	for i in $(seq 1 $2); do
	    if [ -d "error$i" ]; then
		# folder "error$i" istnieje
		echo "."
	    else
		mkdir "error$i"
	    fi		         
	    nazwa_pliku="error$i.txt"
	    touch "error$i"/$nazwa_pliku
	    echo $nazwa_pliku > "error$i"/$nazwa_pliku
	    echo $0 >> "error$i"/$nazwa_pliku
	    echo $(date) >> "error$i"/$nazwa_pliku
	done
    fi
}


function help
{
  echo "Skrypt: $0"
  echo "Opcje:"
  echo "  --date -d   Wyświetla dzisiejszą datę."
  echo "  --logs -l   Skrypt utworzy automatycznie 100 plików logx.txt (x – numer pliku od 1 – 100)"
  echo "              ale 'skrypt.sh -l 30' utworzenie automatycznie 30 plików"
  echo "              w każdym pliku wpisze jego nazwę, nazwę skryptu, który go utworzył i datę."
  echo "  --init      Klonuje całe repozytorium do katalogu w którym został
uruchomiony"
  echo "  --error     Skrypt tworzy errorx/errorx.txt, domyślne tworzy 100 plików logx.txt (x – numer pliku od 1 – 100)"
  echo "              ale 'skrypt.sh -e 30' utworzenie automatycznie 30 plików"
  echo "              w każdym pliku wpisze jego nazwę, nazwę skryptu, który go utworzył i datę."
  echo "  --help  -h  Wyświetla wszystkie dostępne opcje"
  # Dodaj tutaj opcje i ich opisy
  echo "Przykład użycia:"
  echo "  ./skrypt.sh --opcja1 argument1"
}


function menu
{
    #echo $1
    case $1 in
	--date | -d) date ;;
	--logs | -l) logs $@ ;;
	--help | -h) help $@ ;;
	--init) init $@ ;;
	--error) error $@ ;;
	*) help
    esac
}


function main
{
    menu $@
}

main $@
