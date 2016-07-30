# mkdir and enter
function mkcd {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        cd $1
        echo "\`$1' already exists"
    else
        mkdir $1 && cd $1
    fi
}

# Create a ZIP archive of a file or folder.
function makezip() {
    zip -r "${1%%/}.zip" "$1" ;
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() {
    tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

# Make directories and files access rights sane.
function sanitize() {
    chmod -R u=rwX,g=rX,o= "$@" ;
}

# Display weather
function weather {
    curl -s "http://www.wunderground.com/global/stations/10147.html" | grep "og:title" | cut -d\" -f4 | sed 's/&deg;/ degrees C/';
}

# Generate random mac address
function mac {
    hexdump -n6 -e '/1 ":%02X"' /dev/random|sed s/^://g
    echo ""
}

# run ssh-agent and add key
function addssh {
    if [ -z "$SSH_AUTH_SOCK" ] ; then
        eval `ssh-agent -s`
        ssh-add
    fi
}