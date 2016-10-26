function cw {

    MYCD=~/dotfiles/mycd.txt
    touch ${MYCD}

    typeset -i x
    typeset -i ITEM_NO
    typeset -i i
    x=0

    if [[ -n "${1}" ]]; then
        if [[ -d "${1}" ]]; then
            printf "${1}" >> ${MYCD}
            sort -u ${MYCD} > ${MYCD}.tmp
            mv ${MYCD}.tmp ${MYCD}
            FOLDER=${1}
        else
         i=${1}
         FOLDER=$(sed -n "${i}p" ${MYCD})
        fi
    fi

    if [[ -z "${1}" ]]; then
        printf ""
        cat ${MYCD} | while read f; do
            x=$(expr ${x} + 1)
            printf "[${x}] ${f}"
        done
        printf ""
        printf "\nSelect "
        read ITEM_NO
        FOLDER=$(sed -n "${ITEM_NO}p" ${MYCD})
    fi

    if [[ -d "${FOLDER}" ]]; then
        cd ${FOLDER}
    fi
}
