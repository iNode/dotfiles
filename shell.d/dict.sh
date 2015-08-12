###### define "whatever"
dic() { curl dict://dict.org/d:"$@" ; }

###### find matches of $1, with optional strat $2 and optional db $3
ref()
{
    if [ -z "$3" ]; then
        curl "dict://dict.org/m:${1}:english:${2}";
    else
        curl "dict://dict.org/m:${1}:${3}:${2}";
    fi
}

###### look in Webster
webster() { curl "dict://dict.org/d:${1}:web1913"; }

###### look in WordNet
wordnet() { curl "dict://dict.org/d:${1}:wn"; }

##################################################
# Elements database				 #
##################################################

ele() {
    dict -d elements "$@"
}

##################################################
# Query Wikipedia via console over DNS		 #
##################################################

mwiki() { blah=$(echo "$@" | tr ' ' '_'); dig +short txt "$blah.wp.dg.cx"; }

##################################################
# Thesaurus					 #
##################################################
###### requires dict: sudo apt-get install dict
ths() {
    dict -d moby-thes "$@"
}

