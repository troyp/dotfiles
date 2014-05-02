function manh {
    firefox -P default "localhost//cgi-bin/man/man2html?query=$1"
}

function grepdict {
    grep $1 /usr/share/dict/words
}

function irm {
    echo $(ls $1)
    n=$(ls $1 | wc -l)
    read -p "Delete $n files?" -n 1 CONFIRM
    if [[ $CONFIRM =~ ^[Yy]$ ]]
    then rm $1
    fi
}

function explode {
    printf $1 | grep -o .
}

function remove-last {
    cp $1 "$1.bk"
    head -n -1 $1 > temp-remove-last
    mv temp-remove-last $1
}
