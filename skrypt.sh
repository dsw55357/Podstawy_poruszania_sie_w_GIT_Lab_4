#!/bin/bash



function menu2
{
    #echo $1
    case $1 in
	--date) date ;;
	*) help
    esac
}


function main
{
    menu2 $@
}

main $@
