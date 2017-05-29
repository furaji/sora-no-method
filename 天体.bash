#!/bin/bash

function 天体() {
    printf '天体'
    if [[ ! -p /dev/stdout ]]; then
        echo 
    fi
}

function メソッド() {
    if [[ -p /dev/stdin ]]; then
        cat -
        printf 'の'
    fi
    echo 'メソッド'
}

天体 | メソッド
