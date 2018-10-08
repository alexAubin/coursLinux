#!/bin/bash

source utils.sh

function main()
{
    echo -n "Quel utilisateur faut-il vérifier ? "
    read USER
    assert_user_exists $USER

    # On défini une variable globale qui
    # contiendra false ou true si il y a un
    # probleme...
    ISSUE="false"

    check_processes $USER
    check_term $USER
    check_home_space_usage $USER

    if [[ "$ISSUE" == "false" ]]
    then
        success "L'utilisateur ne fait pas n'importe quoi :)" 
    else
        error "L'utilisateur a dépassé les limites !"
    fi
}

function usage()
{
    echo ""
    echo "   check_user.sh"
    echo ""
    echo "Permet de vérifier qu'un utilisateur n'exploite"
    echo "pas n'importe comment les ressources du système"
    echo ""
    echo "Lancer le script avec ./check_user.sh"
    echo "puis entrez le nom d'utilisateur"
    echo ""
    exit 0
}

function assert_user_exists()
{
    local USER=$1
    if ! grep -q "^$USER:" /etc/passwd;
    then
        critical "L'utilisateur $USER n'existe pas !"
    fi
}

function check_processes()
{
    local USER=$1
    NB_PROCESS=$(ps au -u $USER | wc -l)
    MESSAGE="L'utilisateur a $NB_PROCESS processus en cours"

    if [[ "$NB_PROCESS" -lt 10 ]]
    then
        info "$MESSAGE"
    else
        warn "$MESSAGE"
        ISSUE="true"
    fi
}

function check_term()
{
    local USER=$1
    NB_TERM=$(who | grep "^$USER " | wc -l)
    MESSAGE="L'utilisateur a $NB_TERM terminaux ouverts"

    if [[ "$NB_TERM" -lt 5 ]]
    then
        info "$MESSAGE"
    else
        warn "$MESSAGE"
        ISSUE="true"
    fi
}

function check_home_space_usage()
{
    local USER=$1
    SPACE_USED=$(du -hs /home/$USER | awk '{print $1}')
    SPACE_USED_OCTETS=$(du -s /home/$USER | awk '{print $1}')
    MESSAGE="L'utilisateur utilise $SPACE_USED"

    if [[ "$SPACE_USED_OCTETS" -lt 1000000 ]]
    then
        info "$MESSAGE"
    else
        warn "$MESSAGE"
        ISSUE="true"
    fi
}


# Afficher la documentation (et quitter) si --help/-h
if [[ "$1" =~ "--help" ]] || [[ "$1" == "-h" ]]
then
    usage
else
    main
fi
